import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "dk.jyllandsposten.jp"
private const val VERSION = "2026.10.15"
private const val SNOWPLOW_ENDPOINT = "https://c.jyllands-posten.dk"
private const val WEBVIEW = "Landroid/webkit/WebView;"
private const val AD_BLOCK = "Lapp/template/extension/webviewads/AdBlock;"
private const val BLOCKING_CLIENT = "Lapp/template/extension/webviewads/AdBlock\$BlockingClient;"

private val GEMIUS_EVENTS = listOf(
    "Lcom/gemius/sdk/audience/BaseEvent;",
    "Lcom/gemius/sdk/audience/NetpanelEvent;",
    "Lcom/gemius/sdk/audience/AudienceEvent;",
)

class JyllandspostenSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun List<ClassDef>.type(type: String): ClassDef =
        firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

    private fun List<ClassDef>.appWebViewWrapper(): ClassDef {
        // The WebView is the framework class or an app subclass of it (a subclass since 2026.10.15).
        val webViewTypes = mutableSetOf(WEBVIEW)
        forEach { if (it.superclass == WEBVIEW) webViewTypes += it.type }
        return singleOrNull { cls ->
            cls.type.startsWith("L") && !cls.type.startsWith("Lcom/") &&
                !cls.type.startsWith("Landroid") && !cls.type.startsWith("Lkotlin") &&
                cls.methods.any { method ->
                    val insns = method.implementation?.instructions?.toList().orEmpty()
                    insns.any { it.opcode == Opcode.NEW_INSTANCE && (it as? ReferenceInstruction)?.reference.let { ref -> (ref as? TypeReference)?.type in webViewTypes } } &&
                        insns.any { insn ->
                            val call = (insn as? ReferenceInstruction)?.reference as? MethodReference
                            call?.definingClass == WEBVIEW && call.name == "addJavascriptInterface"
                        }
                }
        } ?: error("expected one app WebView wrapper")
    }

    @Test
    fun `Disable telemetry stops Gemius, Snowplow and the Firebase switches`() {
        val root = repoRoot()
        val apk = File(root, "apks/jyllandsposten/base.apk")

        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // 1. Gemius audience: all three sendEvent overrides return at once.
        for (type in GEMIUS_EVENTS) {
            val send = classes.type(type).methods.single {
                it.name == "sendEvent" && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
            assertReturnsEarlyVoid(send, "$type.sendEvent")
        }

        // 2. Snowplow: the tracker's only emit method returns at once.
        val wrapper = classes.singleOrNull { cls ->
            cls.methods.any { method ->
                method.implementation?.instructions?.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string == SNOWPLOW_ENDPOINT
                } == true
            }
        } ?: error("Snowplow wrapper ($SNOWPLOW_ENDPOINT) not found")
        val instantiated = wrapper.methods.asSequence()
            .flatMap { method -> method.implementation?.instructions?.asSequence() ?: emptySequence() }
            .filter { it.opcode == Opcode.NEW_INSTANCE }
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type }
            .toSet()
        val trackerType = wrapper.fields.single { field ->
            !AccessFlags.STATIC.isSet(field.accessFlags) && classes.any { it.type == field.type } &&
                field.type in instantiated
        }.type
        val trackCall = wrapper.methods.asSequence()
            .flatMap { method -> method.implementation?.instructions?.asSequence() ?: emptySequence() }
            .mapNotNull { insn -> (insn as? ReferenceInstruction)?.reference as? MethodReference }
            .first { call ->
                call.definingClass == trackerType && call.returnType == "V" && call.parameterTypes.size == 1
            }
        val emit = classes.type(trackerType).methods.single {
            it.name == trackCall.name && it.returnType == "V" && it.parameterTypes.size == 1
        }
        assertReturnsEarlyVoid(emit, "$trackerType.${trackCall.name}")

        // 3. The Crashlytics and Sessions switches are forced in the bytecode (no Firebase
        // Analytics or Performance in this app).
        assertFirebaseSwitchesForced(classes, analytics = false, crashlytics = true, sessions = true, performance = false)
    }

    @Test
    fun `Disable ads installs the blocking client on the article WebView`() {
        val root = repoRoot()
        val apk = File(root, "apks/jyllandsposten/base.apk")

        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // The extension is merged into the emitted dex, and install() keeps the app's own client: it
        // reads it back and wraps it in the delegating blocking client instead of replacing it.
        // D8 outlines the API 26 getWebViewClient call into a synthetic AdBlock$$ExternalSynthetic...
        // helper (minSdk 23), so follow one level of calls into the extension's own classes.
        fun MethodReference.callsIn(): List<MethodReference> =
            classes.firstOrNull { it.type == definingClass }?.methods
                ?.firstOrNull { m -> m.name == name && m.parameterTypes.map(CharSequence::toString) == parameterTypes.map(CharSequence::toString) }
                ?.implementation?.instructions
                ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                ?.toList().orEmpty()
        val installMethod = classes.type(AD_BLOCK).methods.single { it.name == "install" }
        val direct = installMethod.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .toList()
        val installCalls = (direct + direct.filter { it.definingClass.startsWith(AD_BLOCK.removeSuffix(";")) }.flatMap { it.callsIn() })
            .map { "${it.definingClass}->${it.name}" }
        check("$WEBVIEW->getWebViewClient" in installCalls) { "AdBlock.install does not read the existing client" }
        check("$BLOCKING_CLIENT-><init>" in installCalls) { "AdBlock.install does not build the blocking client" }
        val blockingClient = classes.type(BLOCKING_CLIENT)
        check(blockingClient.fields.any { it.type == "Landroid/webkit/WebViewClient;" }) {
            "$BLOCKING_CLIENT has no delegate field"
        }
        for (callback in listOf("shouldOverrideUrlLoading", "onPageStarted", "onPageFinished", "onRenderProcessGone", "onReceivedHttpError")) {
            check(blockingClient.methods.any { it.name == callback }) { "$BLOCKING_CLIENT does not forward $callback" }
        }

        // The app's WebView wrapper still creates the WebView and now installs the blocking client.
        val wrapper = classes.appWebViewWrapper()
        val install = wrapper.methods.asSequence()
            .flatMap { it.implementation?.instructions?.asSequence() ?: emptySequence() }
            .mapNotNull { insn -> (insn as? ReferenceInstruction)?.reference as? MethodReference }
            .any { it.definingClass == AD_BLOCK && it.name == "install" }
        check(install) { "${wrapper.type} does not call ${AD_BLOCK}.install" }
    }
}

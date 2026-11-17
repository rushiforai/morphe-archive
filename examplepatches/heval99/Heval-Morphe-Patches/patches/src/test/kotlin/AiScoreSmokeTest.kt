import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import app.template.patches.shared.misc.ads.MAX_LOAD_SHOW_HOOKS
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile

private const val PKG = "com.onesports.score"
private const val USER_PREFERENCE = "Lcom/onesports/score/base/preference/UserPreference;"
private const val PACKAGE_MANAGER = "Landroid/content/pm/PackageManager;"
private const val SIGNATURE_EXTENSION = "Lapp/template/extension/signature/SignatureSpoof;"
private const val SIGNATURE_SHA1 = "d34738b4cf2d39aad6e63e032323d78b0af5a84c"
private const val TIKTOK_SDK = "Lcom/tiktok/TikTokBusinessSdk;"
private const val TIKTOK_CALLBACK = "Lcom/tiktok/TikTokBusinessSdk${"$"}TTInitCallback;"

private val TELEMETRY_META = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
    "com.facebook.sdk.CodelessDebugLogEnabled" to "false",
)

class AiScoreSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.sameClassNoArgCalls(returnType: String) = instructions()
        .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter { it.definingClass == USER_PREFERENCE && it.parameterTypes.isEmpty() && it.returnType == returnType }

    private fun Method.calls() = instructions().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }

    @Test
    fun `Enable Premium, Spoof signature, Disable ads and Disable telemetry change the real code`() {
        val root = repoRoot()
        val apk = File(root, "apks/aiscore/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        // Locate the targets in the unpatched dex the same way the patches do.
        val originalClasses: List<ClassDef> = ZipFile(apk).use { zip ->
            zip.entries().asSequence()
                .filter { Regex("classes\\d*\\.dex").matches(it.name) }
                .flatMap { entry ->
                    val bytes = zip.getInputStream(entry).use { it.readBytes() }
                    DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.asSequence()
                }
                .toList()
        }
        val original = originalClasses.single { it.type == USER_PREFERENCE }
        val gate = original.methods.single {
            it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                it.sameClassNoArgCalls("Z").isNotEmpty() && it.sameClassNoArgCalls("I").isNotEmpty()
        }
        val levelName = gate.sameClassNoArgCalls("I").single().name

        // Firebase's PackageManagerWrapper (R8-renamed, its (String, int) parameters may be
        // reordered): returns PackageInfo, takes a String and an int, and calls
        // Context.getPackageManager() then PackageManager.getPackageInfo(String, int).
        // AndroidUtilsLight reads the X-Android-Cert hash through it.
        val wrappers = originalClasses.flatMap { cls ->
            cls.methods.filter { m ->
                m.returnType == "Landroid/content/pm/PackageInfo;" &&
                    m.parameterTypes.map(CharSequence::toString).sorted() == listOf("I", "Ljava/lang/String;") &&
                    m.calls().any { it.definingClass == "Landroid/content/Context;" && it.name == "getPackageManager" } &&
                    m.calls().any {
                        it.definingClass == PACKAGE_MANAGER && it.name == "getPackageInfo" &&
                            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I")
                    }
            }.map { cls.type to it }
        }
        check(wrappers.size == 1) { "expected one PackageManagerWrapper.getPackageInfo, found ${wrappers.map { (t, m) -> "$t.${m.name}" }}" }
        val (wrapperType, wrapper) = wrappers.single()
        val wrapperParameters = wrapper.parameterTypes.map(CharSequence::toString)

        // Disable ads / Disable telemetry targets, found in the unpatched dex the way the patches do.
        fun Method.strings() = instructions().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
        val adManager = originalClasses.single { cls -> cls.methods.any { "mDisplayAds" in it.strings() } }
        val adGate = adManager.methods.single { m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() && m.instructions().any {
                (it is WideLiteralInstruction && it.wideLiteral == 86_400_000L) ||
                    (it is NarrowLiteralInstruction && it.narrowLiteral == 86_400_000)
            }
        }
        val houseAdFactory = adManager.methods.single { m ->
            val p = m.parameterTypes.map(CharSequence::toString)
            p.size == 4 && p[0] == "J" && p[2] == "Ljava/lang/Boolean;" && p[3] == "I" && m.returnType.startsWith("L")
        }
        val funnelClass = originalClasses.single { cls -> cls.methods.any { "FirebaseLogEvent" in it.strings() } }
        val funnel = funnelClass.methods.single { "FirebaseLogEvent" in it.strings() }

        val patched = applyPatches(
            apk = apk, workDir = workDir, pkg = PKG, version = "4.3.3",
            patchNames = setOf("Enable Premium", "Spoof signature", "Disable ads", "Disable telemetry"), allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = patched.associateBy { it.type }

        // Enable Premium.
        val userPreference = byType[USER_PREFERENCE] ?: error("$USER_PREFERENCE not found")
        assertForcedBoolean(userPreference.method(gate.name, emptyList()), expected = true, label = "UserPreference.${gate.name}() (VIP gate)")
        assertReturnsInt(userPreference.method(levelName, emptyList()), expected = 1, label = "UserPreference.$levelName() (VIP level)")

        // Disable ads: the gate answers false, the house-ad factory returns null, the MAX hooks are
        // neutered and MaxAdView stays GONE. The VIP gate above is still forced true.
        val patchedManager = byType[adManager.type] ?: error("${adManager.type} not found")
        assertForcedBoolean(patchedManager.method(adGate.name, emptyList()), expected = false, label = "${adManager.type}.${adGate.name}() (ads allowed)")
        val factoryInsns = patchedManager.method(houseAdFactory.name, houseAdFactory.parameterTypes.map(CharSequence::toString)).instructions()
        check(
            factoryInsns.size >= 2 && factoryInsns[0] is NarrowLiteralInstruction && (factoryInsns[0] as NarrowLiteralInstruction).narrowLiteral == 0 &&
                factoryInsns[1].opcode == Opcode.RETURN_OBJECT
        ) { "${adManager.type}.${houseAdFactory.name} (house-ad factory) does not return null first: ${factoryInsns.take(2).map { it.opcode }}" }
        for ((type, names) in MAX_LOAD_SHOW_HOOKS) assertAllReturnEarly(patched, type, *names.toTypedArray())
        assertMaxAdViewHidden(patched)

        // Disable telemetry: the event funnel returns at once; TikTok init fails its callback.
        assertReturnsEarlyVoid(byType[funnelClass.type]!!.method(funnel.name, funnel.parameterTypes.map(CharSequence::toString)), "${funnelClass.type}.${funnel.name} (event funnel)")
        val initialize = (byType[TIKTOK_SDK] ?: error("$TIKTOK_SDK not found")).methods.single {
            it.name == "initializeSdk" && it.parameterTypes.size == 2
        }
        val initInsns = initialize.instructions()
        check(initInsns[0].opcode == Opcode.IF_EQZ) { "TikTokBusinessSdk.initializeSdk does not start with the callback null check" }
        val failAt = initInsns.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
                r.definingClass == TIKTOK_CALLBACK && r.name == "fail" && r.parameterTypes.map(CharSequence::toString) == listOf("I", "Ljava/lang/String;")
            } == true
        }
        check(failAt in 1..4 && initInsns[failAt + 1].opcode == Opcode.RETURN_VOID) { "TikTokBusinessSdk.initializeSdk does not call fail then return" }
        val minusOne = initInsns[1]
        check(minusOne is NarrowLiteralInstruction && minusOne.narrowLiteral == -1) { "TikTok fail code is not -1" }

        // Manifest meta-data, exactly once each on <application>.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("firebase_crashlytics_collection_enabled") }
            .firstOrNull() ?: error("no decoded AndroidManifest.xml with the telemetry meta-data under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        fun Element.children(tag: String) =
            getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
        val application = manifest.children("application").single()
        val metaData = application.children("meta-data")
            .filter { it.parentNode == application }
            .groupBy({ it.getAttribute("android:name") }, { it.getAttribute("android:value") })
        for ((name, value) in TELEMETRY_META) {
            check(metaData[name] == listOf(value)) { "meta-data $name is ${metaData[name]}, expected [$value]" }
        }
        check(metaData["firebase_messaging_auto_init_enabled"].orEmpty().all { it != "false" }) { "firebase_messaging_auto_init_enabled was disabled" }

        // Spoof signature: the extension carries com.onesports.score and the onescore certificate,
        // and no direct PackageManager.getPackageInfo(String, ...) call is left.
        assertSpoofSignature(patched, PKG, SIGNATURE_SHA1)

        // The wrapper Firebase Installations uses for X-Android-Cert now calls the extension.
        val patchedWrapper = (byType[wrapperType] ?: error("$wrapperType not found")).method(wrapper.name, wrapperParameters)
        check(
            patchedWrapper.calls().any {
                it.definingClass == SIGNATURE_EXTENSION && it.name == "getPackageInfo" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf(PACKAGE_MANAGER, "Ljava/lang/String;", "I")
            }
        ) { "$wrapperType.${wrapper.name} (PackageManagerWrapper.getPackageInfo) does not call $SIGNATURE_EXTENSION.getPackageInfo" }
        check(patchedWrapper.calls().none { it.definingClass == PACKAGE_MANAGER && it.name == "getPackageInfo" }) {
            "$wrapperType.${wrapper.name} still calls PackageManager.getPackageInfo directly"
        }
    }
}

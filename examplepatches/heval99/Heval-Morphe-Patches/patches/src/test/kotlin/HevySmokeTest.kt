import app.template.patches.hevy.pro.HEVY_BUNDLE
import app.template.patches.hevy.pro.HermesBytecode
import app.template.patches.hevy.pro.RETURN_TRUE
import app.template.patches.hevy.pro.findIsProGetter
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "com.hevy"
private const val PROMISE = "Lcom/facebook/react/bridge/Promise;"

private val HEVY_PATCHES = setOf(
    "Unlock Pro",
    "Block telemetry & trackers",
)

class HevySmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)

    @Test
    fun `all Hevy patches apply and mutate the expected bytecode`() {
        val root = repoRoot()
        val apk = File(root, "apks/hevy/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        // Locate the isPro getter in the stock bundle the same way the patch does.
        val stock = ZipFile(apk).use { zip ->
            val entry = zip.getEntry(HEVY_BUNDLE) ?: error("$HEVY_BUNDLE missing from ${apk.path}")
            zip.getInputStream(entry).use { it.readBytes() }
        }
        val stockHbc = HermesBytecode(stock)
        val getter = stockHbc.findIsProGetter()
        check(stockHbc.string(getter.nameId) == "get") {
            "isPro getter #${getter.id} is named '${stockHbc.string(getter.nameId)}', expected 'get'"
        }

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "3.2.2",
            patchNames = HEVY_PATCHES,
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        val diagnostics = "emitted classes=${classes.size}"

        fun klass(type: String) = byType[type] ?: error("$type not found in emitted dexes\n$diagnostics")
        fun method(type: String, name: String, params: List<String>? = null) =
            klass(type).methods.single { it.name == name && (params == null || it.params() == params) }
        // The renamed SDK methods, found the way the patch's fingerprints find them: by return type,
        // parameter count and the strings they reference (the patch only prepends instructions).
        fun byStrings(returnType: String, paramCount: Int, vararg strings: String): Method {
            val found = classes.flatMap { it.methods }.filter { m ->
                m.returnType == returnType && m.parameterTypes.size == paramCount &&
                    m.instructions().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                        .toSet().containsAll(strings.toList())
            }
            return found.singleOrNull()
                ?: error("expected one $returnType method with $paramCount params referencing ${strings.toList()}, found ${found.size}\n$diagnostics")
        }

        // Unlock Pro: the patched bundle has the same length and differs from the stock one only
        // in the getter's first 4 bytes, which are now LoadConstTrue r0; Ret r0.
        val patchedFile = workDir.walkTopDown()
            .filter { it.isFile && it.invariantSeparatorsPath.endsWith(HEVY_BUNDLE) }
            .singleOrNull() ?: error("no single patched $HEVY_BUNDLE under $workDir")
        val patched = patchedFile.readBytes()
        check(patched.size == stock.size) { "bundle length changed: ${stock.size} -> ${patched.size}" }
        val head = patched.copyOfRange(getter.offset, getter.offset + RETURN_TRUE.size)
        check(head.contentEquals(RETURN_TRUE)) {
            "isPro getter #${getter.id} at 0x${getter.offset.toString(16)} starts with " +
                head.joinToString(" ") { "%02x".format(it) } + ", expected 78 00 5c 00"
        }
        // Outside the getter only the 20-byte SHA-1 footer may differ, and it must be the SHA-1 of
        // the patched body.
        val footer = patched.size - 20
        val changed = patched.indices.filter { patched[it] != stock[it] && it < footer }
        check(changed.all { it in getter.offset until getter.offset + RETURN_TRUE.size }) {
            "bundle changed outside the isPro getter: ${changed.take(10).map { "0x" + it.toString(16) }}"
        }
        val expectedFooter = java.security.MessageDigest.getInstance("SHA-1").digest(patched.copyOfRange(0, footer))
        check(patched.copyOfRange(footer, patched.size).contentEquals(expectedFooter)) { "bundle footer SHA-1 not recomputed" }
        check(HermesBytecode(patched).functions.size == stockHbc.functions.size) { "patched bundle no longer parses" }

        // 1. Sentry: the initNativeSdk bridge method resolves Boolean.TRUE and returns.
        val sentryInit = method(
            "Lio/sentry/react/RNSentryModule;", "initNativeSdk",
            listOf("Lcom/facebook/react/bridge/ReadableMap;", PROMISE),
        ).instructions()
        val trueField = (sentryInit.getOrNull(0) as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            sentryInit.getOrNull(0)?.opcode == Opcode.SGET_OBJECT &&
                trueField?.definingClass == "Ljava/lang/Boolean;" && trueField.name == "TRUE",
            "RNSentryModule.initNativeSdk does not load Boolean.TRUE first; got ${sentryInit.getOrNull(0)?.opcode}\n$diagnostics"
        )
        assertResolvesThenReturns(sentryInit, 1, "RNSentryModule.initNativeSdk", diagnostics)

        // 2-3. Adjust queueing/sending and the Facebook app event flushAndWait return at once.
        assertReturnsEarlyVoid(method("Lcom/adjust/sdk/PackageHandler;", "addPackage"), "PackageHandler.addPackage", diagnostics)
        assertReturnsEarlyVoid(method("Lcom/adjust/sdk/PackageHandler;", "sendFirstPackage"), "PackageHandler.sendFirstPackage", diagnostics)
        val flushAndWait = byStrings(
            "V", 1, "com.facebook.sdk.APP_EVENTS_FLUSHED", "com.facebook.sdk.APP_EVENTS_NUM_EVENTS_FLUSHED",
        )
        assertReturnsEarlyVoid(flushAndWait, "AppEventQueue.flushAndWait", diagnostics)

        // 4. Amplitude: both ad-ID readers return null at once, no legacy events.
        for ((label, adId) in listOf(
            "CachedInfo.fetchAdvertisingId" to byStrings("Ljava/lang/String;", 0, "getAdvertisingIdInfo", "isLimitAdTrackingEnabled"),
            "CachedInfo.fetchAndCacheAmazonAdvertisingId" to byStrings("Ljava/lang/String;", 0, "limit_ad_tracking", "advertising_id"),
        )) {
            val insns = adId.instructions()
            assertTrue(
                insns.getOrNull(0)?.opcode == Opcode.CONST_4 && (insns[0] as NarrowLiteralInstruction).narrowLiteral == 0 &&
                    insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
                    (insns[1] as OneRegisterInstruction).registerA == (insns[0] as OneRegisterInstruction).registerA,
                "$label does not return null first; got ${insns.take(2).map { it.opcode }}\n$diagnostics"
            )
        }
        val legacy = method(
            "Lcom/amplitude/reactnative/AmplitudeReactNativeModule;", "getLegacyEvents",
            listOf("Ljava/lang/String;", "Ljava/lang/String;", PROMISE),
        ).instructions()
        val arrayType = (legacy.getOrNull(0) as? ReferenceInstruction)?.reference as? TypeReference
        assertTrue(
            legacy.getOrNull(0)?.opcode == Opcode.NEW_INSTANCE &&
                arrayType?.type == "Lcom/facebook/react/bridge/WritableNativeArray;" &&
                legacy.getOrNull(1)?.opcode == Opcode.INVOKE_DIRECT,
            "AmplitudeReactNativeModule.getLegacyEvents does not build an empty WritableNativeArray first\n$diagnostics"
        )
        assertResolvesThenReturns(legacy, 2, "AmplitudeReactNativeModule.getLegacyEvents", diagnostics)

        // 5. Branch: tracking reads as disabled. Branch is renamed; take the ()Z method the
        // RNBranchModule.isTrackingDisabled bridge method calls, as the patch does.
        val branchCall = method("Lio/branch/rnbranch/RNBranchModule;", "isTrackingDisabled", listOf(PROMISE)).instructions()
            .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
            .single { it.returnType == "Z" && it.parameterTypes.isEmpty() }
        assertForcedBoolean(
            method(branchCall.definingClass, branchCall.name, emptyList()),
            true,
            "Branch.isTrackingDisabled (${branchCall.definingClass}->${branchCall.name})",
            diagnostics,
        )

        // Sentry's content providers are disabled in the manifest.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("io.sentry.android.core.SentryInitProvider") }
            .firstOrNull() ?: error("no decoded AndroidManifest.xml with the Sentry providers under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        val providers = manifest.getElementsByTagName("provider").let { list ->
            (0 until list.length).map { list.item(it) as Element }
        }.associateBy { it.getAttribute("android:name") }
        for (name in listOf("io.sentry.android.core.SentryInitProvider", "io.sentry.android.core.SentryPerformanceProvider")) {
            val enabled = providers[name]?.getAttribute("android:enabled")
            check(enabled == "false") { "$name android:enabled is '$enabled', expected 'false'" }
        }
    }

    /** Asserts insns[[at]] is Promise.resolve(Object) and insns[[at] + 1] is return-void. */
    private fun assertResolvesThenReturns(
        insns: List<Instruction>,
        at: Int,
        label: String,
        diagnostics: String,
    ) {
        val resolve = (insns.getOrNull(at) as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            insns.getOrNull(at)?.opcode == Opcode.INVOKE_INTERFACE &&
                resolve?.definingClass == PROMISE && resolve.name == "resolve",
            "$label does not call Promise.resolve at instruction $at; got ${insns.getOrNull(at)?.opcode} $resolve\n$diagnostics"
        )
        assertTrue(
            insns.getOrNull(at + 1)?.opcode == Opcode.RETURN_VOID,
            "$label does not return after resolving; got ${insns.getOrNull(at + 1)?.opcode}\n$diagnostics"
        )
    }
}

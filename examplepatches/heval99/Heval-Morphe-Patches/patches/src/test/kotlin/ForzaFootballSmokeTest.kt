import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "se.footballaddicts.livescore"
private const val ANALYTICS_DEACTIVATED_KEY = "firebase_analytics_collection_deactivated"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private const val CUSTOMER_INFO = "Lcom/revenuecat/purchases/CustomerInfo;"
private const val FORZA_LEGEND = "Forza Legend"
private const val SIGNATURE_SHA1 = "6e1189e8e56ef029d11b8b16f584330cf3226529"

class ForzaFootballSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
    private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
    private fun Method.strings(): List<String> = instructions().mapNotNull { it.string() }
    private fun Method.label() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    /** The one class whose toString starts with [prefix] (found like the patch). */
    private fun List<ClassDef>.byToStringPrefix(prefix: String): Pair<ClassDef, Method> {
        val found = flatMap { cls ->
            cls.methods.filter { it.name == "toString" && it.strings().any { s -> s.startsWith(prefix) } }.map { cls to it }
        }
        assertEquals(1, found.size, "classes with a \"$prefix\" toString: ${found.map { it.first.type }}")
        return found.single()
    }

    /** The boolean field read right after [label] in the toString (as the patch maps it). */
    private fun booleanAfter(cls: ClassDef, toString: Method, label: String): FieldReference {
        val insns = toString.instructions()
        val at = insns.indexOfFirst { it.string() == label }
        assertTrue(at >= 0, "${cls.type} toString has no \"$label\"")
        return insns.drop(at + 1).first { it.opcode == Opcode.IGET_BOOLEAN && it.field()?.definingClass == cls.type }.field()!!
    }

    /** The method starts with `sget-object vX, Lkotlin/Unit;->?` + `return-object vX`. */
    private fun assertReturnsUnitFirst(method: Method, diagnostics: String) {
        val insns = method.instructions()
        val read = insns.getOrNull(0)
        val ret = insns.getOrNull(1)
        assertTrue(
            read?.opcode == Opcode.SGET_OBJECT && read.field()?.definingClass == "Lkotlin/Unit;" &&
                read.field()?.type == "Lkotlin/Unit;" && ret?.opcode == Opcode.RETURN_OBJECT &&
                (ret as OneRegisterInstruction).registerA == (read as OneRegisterInstruction).registerA,
            "${method.label()} does not return kotlin.Unit first; got ${insns.take(2).map { it.opcode }}\n$diagnostics"
        )
    }

    /**
     * Every constructor of [field]'s class that stores it ends each return-void with
     * `move-object/from16 v0, p0`, `const/4 v1, value`, `iput-boolean v1, v0, field`.
     */
    private fun assertForcedInConstructors(cls: ClassDef, field: FieldReference, value: Boolean, what: String) {
        val smali = "${field.definingClass}->${field.name}:${field.type}"
        val stores = cls.methods.filter { ctor ->
            ctor.name == "<init>" && ctor.instructions().any {
                it.opcode == Opcode.IPUT_BOOLEAN && it.field()?.let { f -> "${f.definingClass}->${f.name}:${f.type}" } == smali
            }
        }
        assertTrue(stores.isNotEmpty(), "$what: no ${cls.type} constructor stores ${field.name}")
        for (ctor in stores) {
            val insns = ctor.instructions()
            val p0 = ctor.implementation!!.registerCount - 1 -
                ctor.parameterTypes.map(CharSequence::toString).sumOf { if (it == "J" || it == "D") 2 else 1 }
            val returns = insns.indices.filter { insns[it].opcode == Opcode.RETURN_VOID }
            assertTrue(returns.isNotEmpty(), "$what: ${ctor.label()} has no return-void")
            for (r in returns) {
                val move = insns.getOrNull(r - 3)
                val const = insns.getOrNull(r - 2)
                val put = insns.getOrNull(r - 1)
                val ok = move?.opcode == Opcode.MOVE_OBJECT_FROM16 &&
                    (move as TwoRegisterInstruction).registerA == 0 && move.registerB == p0 &&
                    const?.opcode == Opcode.CONST_4 && (const as OneRegisterInstruction).registerA == 1 &&
                    (const as NarrowLiteralInstruction).narrowLiteral == (if (value) 1 else 0) &&
                    put?.opcode == Opcode.IPUT_BOOLEAN && (put as TwoRegisterInstruction).registerA == 1 &&
                    put.registerB == 0 && put.field()?.let { "${it.definingClass}->${it.name}:${it.type}" } == smali
                assertTrue(
                    ok,
                    "$what: ${ctor.label()} does not store ${field.name} = $value before return-void $r; " +
                        "got ${insns.subList(maxOf(0, r - 3), r).map { it.opcode }}"
                )
            }
        }
    }

    @Test
    fun `Forza patches unlock Legend, fix push, stop ads and telemetry, hide betting`() {
        val root = repoRoot()
        val apk = File(root, "apks/forzafootball/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "6.15.10",
            patchNames = setOf(
                "Disable ads", "Disable telemetry", "Hide betting content", "Enable Premium", "Spoof signature",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"
        val allMethods = classes.flatMap { it.methods }

        // Disable ads 1: the ad slot load (the only method with the "AdOpportunity" event) returns
        // Unit first.
        val loads = allMethods.filter { "AdOpportunity" in it.strings() && "ads/opportunity" in it.strings() }
        assertEquals(1, loads.size, "ad slot loads: ${loads.map { it.label() }}")
        assertReturnsUnitFirst(loads.single(), diagnostics)

        // Disable ads 2: AdsSettings stores prebidEnabled = false in every storing constructor.
        val (adsSettings, adsToString) = classes.byToStringPrefix("AdsSettings(appVersionName=")
        val prebid = booleanAfter(adsSettings, adsToString, ", prebidEnabled=")
        assertForcedInConstructors(adsSettings, prebid, value = false, what = "Disable ads prebidEnabled")

        // Disable telemetry 1: the single "firebase_analytics_collection_deactivated" read is
        // overwritten with Boolean.TRUE after its move-result.
        val readers = allMethods.filter { ANALYTICS_DEACTIVATED_KEY in it.strings() }
        assertEquals(1, readers.size, "$ANALYTICS_DEACTIVATED_KEY readers: ${readers.map { it.label() }}")
        val readInsns = readers.single().instructions()
        val keyIndex = readInsns.indexOfFirst { it.string() == ANALYTICS_DEACTIVATED_KEY }
        val keyRegister = (readInsns[keyIndex] as OneRegisterInstruction).registerA
        val read = readInsns[keyIndex + 1]
        val readRef = (read as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            read is FiveRegisterInstruction && read.registerCount == 2 && read.registerD == keyRegister &&
                readRef?.returnType == "Ljava/lang/Boolean;",
            "the $ANALYTICS_DEACTIVATED_KEY key is not read through a Boolean get(String); got ${read.opcode} $readRef"
        )
        val move = readInsns[keyIndex + 2]
        val forced = readInsns[keyIndex + 3]
        assertTrue(
            move.opcode == Opcode.MOVE_RESULT_OBJECT && forced.opcode == Opcode.SGET_OBJECT &&
                forced.field()?.definingClass == "Ljava/lang/Boolean;" && forced.field()?.name == "TRUE" &&
                (forced as OneRegisterInstruction).registerA == (move as OneRegisterInstruction).registerA,
            "the $ANALYTICS_DEACTIVATED_KEY read is not overwritten with Boolean.TRUE; " +
                "got ${readInsns.drop(keyIndex).take(4).map { it.opcode }}"
        )

        // Disable telemetry 2: the kept Sentry startup initializer returns Unit first.
        val sentry = classes.single { it.type == "Lcom/forzafootball/SentryInitializer;" }
            .method("create", listOf("Landroid/content/Context;"))
        assertReturnsUnitFirst(sentry, diagnostics)

        // Disable telemetry 3: every concrete AppsFlyerLib start / logEvent (and logSession /
        // logAdRevenue) returns at once.
        val appsFlyer = classes.filter { it.superclass == APPSFLYER_LIB }.flatMap { cls ->
            cls.methods.filter {
                it.name in setOf("start", "logEvent", "logSession", "logAdRevenue") && it.returnType == "V" && it.implementation != null
            }
        }
        assertTrue(appsFlyer.any { it.name == "start" }, "no concrete AppsFlyerLib start()")
        assertTrue(appsFlyer.any { it.name == "logEvent" }, "no concrete AppsFlyerLib logEvent()")
        appsFlyer.forEach { assertReturnsEarlyVoid(it, it.label(), diagnostics) }

        // Disable telemetry 4: the Crashlytics arbiter (the synchronized ()Z in the class of the
        // "firebase_crashlytics_collection_enabled manifest flag" logger, calling it) answers false.
        val loggers = allMethods.filter { m ->
            m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                m.strings().any { it.startsWith("firebase_crashlytics_collection_enabled manifest flag") }
        }
        assertEquals(1, loggers.size, "Crashlytics arbiter loggers: ${loggers.map { it.label() }}")
        val logger = loggers.single()
        val arbiters = classes.single { it.type == logger.definingClass }.methods.filter { m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() && AccessFlags.DECLARED_SYNCHRONIZED.isSet(m.accessFlags) &&
                m.instructions().any {
                    val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                    call?.definingClass == logger.definingClass && call.name == logger.name
                }
        }
        // The patched getter returns before it reaches the logger call, but the call stays in the body.
        assertEquals(1, arbiters.size, "Crashlytics arbiters: ${arbiters.map { it.label() }}")
        assertForcedBoolean(arbiters.single(), false, "Crashlytics ${arbiters.single().label()}", diagnostics)

        // Hide betting content: Betting stores optedOut = true in every storing constructor.
        val (betting, bettingToString) = classes.byToStringPrefix("Betting(country=")
        val optedOut = booleanAfter(betting, bettingToString, ", optedOut=")
        assertForcedInConstructors(betting, optedOut, value = true, what = "Hide betting content optedOut")

        // Enable Premium: the app's only (CustomerInfo)Z with the "Forza Legend" entitlement id
        // (RevenueCat's active entitlements walk) returns true.
        val legendGates = allMethods.filter {
            it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(CUSTOMER_INFO) &&
                FORZA_LEGEND in it.strings()
        }
        assertEquals(1, legendGates.size, "Forza Legend gates: ${legendGates.map { it.label() }}")
        assertForcedBoolean(legendGates.single(), expected = true, label = "Forza Legend gate", diagnostics = diagnostics)

        // Spoof signature: the extension carries the package and the original certificate, and no
        // PackageManager.getPackageInfo(String, ...) call is left outside it (Firebase
        // Installations reads the SHA-1 through one).
        assertSpoofSignature(classes, PKG, SIGNATURE_SHA1)
    }
}

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.template.patches.shared.Constants.COMPATIBILITY_BEEPER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.beeper.android"
private const val VERSION = "4.64.0"
private const val SIGNER_SHA256 = "786f42f5e93e8a7c111fde4eab018ab490666dedcda7cce4bc7006f52a6f31f8"
private const val SENTRY_INIT_PROVIDER = "Lio/sentry/android/core/SentryInitProvider;"
private const val MAIN_ACTIVITY = "Lcom/beeper/chat/booper/MainActivity;"
private const val SIGNATURE_SHA1 = "d6ef1da902f51ff60deb84e4bf80ef71cc00c090"

class BeeperSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium lifts the account caps and freebie limits and telemetry is off`() {
        val root = repoRoot()
        val apk = File(root, "apks/beeper/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Enable Premium", "Disable telemetry", "GmsCore support"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // 0. The pinned signer is the developer's certificate (apks/beeper/provenance.json).
        check(COMPATIBILITY_BEEPER.signatures == setOf(SIGNER_SHA256)) {
            "COMPATIBILITY_BEEPER signatures: ${COMPATIBILITY_BEEPER.signatures}"
        }

        // 1. The server caps are forced to -1: the SDK config's total and per-bridge values just before
        //    they are boxed into the cap flows (so the built-in defaults are -1 too), and the repo's
        //    "max-accounts" parse right after it. Methods are found by their JSON keys, like the patch.
        fun assertCapForced(key: String, method: Method, atBoxing: Boolean) {
            val insns = method.instructions().toList()
            val keyIndex = insns.indexOfFirst {
                it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == key
            }
            check(keyIndex >= 0) { "\"$key\" missing in ${method.definingClass}->${method.name}" }
            val callIndex = (keyIndex + 1 until insns.size).first { i ->
                val ref = (insns[i] as? ReferenceInstruction)?.reference as? MethodReference
                insns[i].opcode == Opcode.INVOKE_STATIC && ref?.returnType == "Ljava/lang/Integer;" && ref.parameterTypes.size == 1
            }
            fun isValueOf(i: Int) = (insns[i] as? ReferenceInstruction)?.reference.let {
                insns[i].opcode == Opcode.INVOKE_STATIC && it is MethodReference && it.name == "valueOf" &&
                    it.definingClass == "Ljava/lang/Integer;"
            }
            val forcedIndex = if (atBoxing) {
                (callIndex + 2 until insns.size).first { isValueOf(it) } - 1
            } else {
                check(insns[callIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT) { "no move-result-object after the \"$key\" parse" }
                check(isValueOf(callIndex + 3) && insns[callIndex + 4].opcode == Opcode.MOVE_RESULT_OBJECT) {
                    "the forced -1 after the \"$key\" parse is not boxed and moved back"
                }
                callIndex + 2
            }
            val forced = insns[forcedIndex] as? NarrowLiteralInstruction
            check(forced != null && forced.opcode == Opcode.CONST_4 && forced.narrowLiteral == -1) {
                "the \"$key\" cap is not forced to -1; got ${insns[forcedIndex].opcode}"
            }
        }
        fun methodsWithString(key: String) = classes.flatMap { it.methods }.filter { m ->
            m.name != "<clinit>" && m.implementation != null && m.instructions().any {
                it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == key
            }
        }
        val sdk = methodsWithString("max-accounts-per-bridge").singleOrNull() ?: error("SDK config method with the per-bridge key not found")
        assertCapForced("max-accounts-per-bridge", sdk, atBoxing = true)
        assertCapForced("max-accounts", sdk, atBoxing = true)
        val maxAccounts = methodsWithString("max-accounts")
        check(maxAccounts.size == 2) { "methods with \"max-accounts\": ${maxAccounts.map { "${it.definingClass}->${it.name}" }}" }
        val repo = maxAccounts.single { it !== sdk && it.definingClass == "Lcom/beeper/bridge/ChatAccountsRepo\$chatAccountsState\$1;" }
        assertCapForced("max-accounts", repo, atBoxing = false)

        // 2. The single freebie consumer returns the Unit instance (its own sget-object/return-object) at once.
        val consumers = classes.flatMap { it.methods }.filter { method ->
            method.returnType == "Ljava/lang/Object;" &&
                method.implementation != null &&
                method.parameterTypes.map(CharSequence::toString) == listOf(
                    "Lcom/beeper/freebies/FreebiesRepository\$Freebie;",
                    "Lcom/beeper/freebies/FreebiePromptSurface;",
                    "Ljava/lang/String;",
                    "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
                )
        }
        check(consumers.size == 1) { "freebie consumers: ${consumers.map { "${it.definingClass}->${it.name}" }}" }
        val freebieInsns = consumers.single().instructions().toList()
        check(
            freebieInsns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT &&
                freebieInsns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
        ) { "the freebie consumer does not return at once; got ${freebieInsns.take(3).map { it.opcode }}" }

        // 3. The Sentry init both start paths share returns at once.
        val provider = classes.singleOrNull { it.type == SENTRY_INIT_PROVIDER }
            ?: error("$SENTRY_INIT_PROVIDER not found in the emitted dexes")
        val onCreate = provider.methods.single {
            it.name == "onCreate" && it.returnType == "Z" && it.parameterTypes.isEmpty()
        }
        val init = onCreate.instructions()
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
            .singleOrNull { ref ->
                ref.returnType == "V" &&
                    ref.parameterTypes.firstOrNull()?.toString() == "Landroid/content/Context;" &&
                    ref.parameterTypes.drop(1).all { it.toString().startsWith("Lio/sentry/") }
            } ?: error("no Sentry init call in $SENTRY_INIT_PROVIDER->onCreate")
        val target = classes.singleOrNull { it.type == init.definingClass }
            ?: error("${init.definingClass} not found in the emitted dexes")
        val initMethod = target.methods.single {
            it.name == init.name && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == init.parameterTypes.map(CharSequence::toString)
        }
        check(initMethod.instructions().firstOrNull()?.opcode == Opcode.RETURN_VOID) {
            "${init.definingClass}->${init.name} does not return at once"
        }

        // 4. GmsCore support: the spoofing metadata and the MicroG RE check are in place.
        assertGmsCoreSupport(
            classes, workDir, PKG, MAIN_ACTIVITY, SIGNATURE_SHA1,
            expectAdsClasses = false,
            expectServiceCheck = false,
        )
    }
}

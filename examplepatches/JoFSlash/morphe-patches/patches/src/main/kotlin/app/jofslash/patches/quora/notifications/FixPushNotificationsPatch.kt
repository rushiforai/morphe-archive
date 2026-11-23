package app.jofslash.patches.quora.notifications

import app.jofslash.patches.quora.clone.QUORA_PACKAGE
import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.shared.Constants.QUORA_SIGNATURE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FIS_CLIENT = "Lcom/google/firebase/installations/remote/FirebaseInstallationServiceClient;"

// Firebase Installations sends the app's package name and certificate with Quora's API key.
// The key only accepts Quora's own, so a re-signed or renamed app gets 403 and no push token.
internal object FisOpenConnectionFingerprint : Fingerprint(
    definingClass = FIS_CLIENT,
    filters = listOf(string("X-Android-Package")),
)

internal object FisCertificateFingerprint : Fingerprint(
    definingClass = FIS_CLIENT,
    name = "getFingerprintHashForPackage",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

@Suppress("unused")
val fixPushNotificationsPatch = bytecodePatch(
    name = "Fix push notifications",
    description = "Makes push notifications work in the patched app. Quora's Firebase key only " +
            "accepts the official app's package and signature, so a patched app never gets a push token.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_QUORA)

    execute {
        FisOpenConnectionFingerprint.let { match ->
            match.method.apply {
                val instructions = implementation!!.instructions.toList()
                val start = match.instructionMatches.first().index
                // The package name is read just before the header name is loaded.
                val callIndex = (start downTo 0).first { i ->
                    val insn = instructions[i]
                    insn.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((insn as ReferenceInstruction).reference as MethodReference).name == "getPackageName"
                }
                val moveResult = instructions[callIndex + 1]
                if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("No package name result")
                val register = (moveResult as OneRegisterInstruction).registerA
                addInstruction(callIndex + 2, "const-string v$register, \"$QUORA_PACKAGE\"")
            }
        }
        FisCertificateFingerprint.method.returnEarly(QUORA_SIGNATURE.uppercase())
    }
}

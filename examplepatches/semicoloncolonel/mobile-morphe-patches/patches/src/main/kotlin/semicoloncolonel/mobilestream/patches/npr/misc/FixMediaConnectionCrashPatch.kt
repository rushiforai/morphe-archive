package semicoloncolonel.mobilestream.patches.npr.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.npr.shared.Constants

// NPR 7.10.0. The audio service checks each app that connects to it, such as
// Android Auto, Wear OS, the Google app, and Waze, against a list of their
// signing certificates. When a listed app connects with a certificate that is
// not on the list, the check throws instead of refusing it, and the whole app
// closes. Here a mismatch counts as "not on the list", and the method goes on
// to its other checks (the app itself, the system, and media-control apps),
// so the connection is refused or allowed without a crash.

internal object KnownCallerFingerprint : Fingerprint(
    definingClass = "Lorg/npr/util/PackageValidator;",
    name = "isKnownCaller",
    returnType = "Z",
    parameters = listOf("I", "Ljava/lang/String;"),
)

@Suppress("unused")
val fixMediaConnectionCrashPatch = bytecodePatch(
    name = "Fix media connection crash",
    description = "Stops the app from closing when Android Auto, the Google app, or another player connects to it.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        KnownCallerFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val newException = instructions.indexOfFirst {
                it.opcode == Opcode.NEW_INSTANCE &&
                    ((it as ReferenceInstruction).reference as TypeReference).type == "Ljava/util/NoSuchElementException;"
            }
            if (newException == -1 || instructions.getOrNull(newException + 3)?.opcode != Opcode.THROW) {
                throw PatchException("Signature-mismatch throw not found in isKnownCaller")
            }
            // The instruction after the throw tests the matched signature.
            val check = instructions[newException + 4]
            if (check.opcode != Opcode.IF_EQZ) throw PatchException("Matched-signature check not found")
            val matched = (check as OneRegisterInstruction).registerA

            // new-instance, const-string, invoke-direct, throw  ->  matched = null
            replaceInstruction(newException, "const/16 v$matched, 0x0")
            removeInstructions(newException + 1, 3)
        }
    }
}

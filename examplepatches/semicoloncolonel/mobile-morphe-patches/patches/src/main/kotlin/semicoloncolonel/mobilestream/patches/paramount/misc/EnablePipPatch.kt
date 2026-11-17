package semicoloncolonel.mobilestream.patches.paramount.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.paramount.shared.Constants

// Paramount+ 17.3.0. One obfuscated gate decides whether PiP is offered: the
// device must have the picture_in_picture system feature, and a server flag
// must be on (one flag for on-demand, one for live TV). Each flag is read as
// Boolean.booleanValue(). The result of every such read is now overwritten
// with true, so the server flags no longer matter and the device check stays.

internal object PipGateFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("android.software.picture_in_picture"),
    custom = { method, _ -> method.parameterTypes.size == 1 }
)

@Suppress("unused")
val enablePipPatch = bytecodePatch(
    name = "Enable picture-in-picture",
    description = "Offers picture-in-picture for on-demand and live content on devices that support it.",
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val method = PipGateFingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        val flagResults = instructions.indices.filter { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            instructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
                reference?.definingClass == "Ljava/lang/Boolean;" && reference.name == "booleanValue" &&
                instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT
        }.map { it + 1 }
        if (flagResults.size != 2) throw PatchException("Expected 2 PiP flag reads, found ${flagResults.size}")

        flagResults.asReversed().forEach { index ->
            val register = (instructions[index] as OneRegisterInstruction).registerA
            method.addInstruction(index + 1, "const/4 v$register, 0x1")
        }
    }
}

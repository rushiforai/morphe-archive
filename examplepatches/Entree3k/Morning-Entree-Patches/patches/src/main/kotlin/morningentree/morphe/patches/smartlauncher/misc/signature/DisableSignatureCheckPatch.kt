package morningentree.morphe.patches.smartlauncher.misc.signature

import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableSignatureCheckPatch = bytecodePatch {
    execute {
        SignatureCheckFingerprint.apply {
            val exitIndex = instructionMatches.first().index
            method.removeInstruction(exitIndex)
        }
    }
}

package morningentree.morphe.patches.mlmanager.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import morningentree.morphe.patches.mlmanager.shared.Constants
import morningentree.morphe.util.returnEarly

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks Pro Features",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        ProPackageCheckFingerprint.method.returnEarly(true)
        LicenseDontAllowFingerprint.methodOrNull?.addInstruction(0, "return-void")
        ServerValidationCallbackFingerprint.methodOrNull?.addInstruction(0, "return-void")
    }
}

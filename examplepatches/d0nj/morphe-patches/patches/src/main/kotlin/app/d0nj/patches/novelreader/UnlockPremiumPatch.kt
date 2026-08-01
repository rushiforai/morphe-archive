package app.template.patches.novelreader

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.clearBody

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Makes isPremium() always return true in AI Audio Novel Reader. " +
        "Unlocks all premium features and disables the 10-hour trial countdown.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            packageName = "com.thien.novelreader",
            name = "AI Audio Novel Reader",
            appIconColor = 0x006200EE,
            targets = listOf(AppTarget(version = "3.3.23")),
        ),
    )

    execute {
        IsPremiumFingerprint.method.apply {
            clearBody()
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }
    }
}

package app.morphe.patches.googlephotos.misc.flags

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities

@Suppress("unused")
val phenotypeFlagManagerPatch = bytecodePatch(
    name = "Enable Phenotype flag manager",
    description = "Enables an in-app flag manager in Photos Settings to customize experimental UI redesigns and feature flags.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    execute {
        SettingsActivityV2OnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static {p0}, Lapp/morphe/extension/shared/patches/PhenotypeFlagManager;->injectSettingsCard(Landroid/app/Activity;)V"
        )
    }
}

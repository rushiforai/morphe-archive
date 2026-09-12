/*
 * Copyright 2026 BlueIT contributors
 */
package app.morphe.patches.tiktok.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint

@Suppress("unused")
val advancedDownloadsPatch = bytecodePatch(
    name = "Download quality selector",
    description = "Selects automatic, highest, or target video quality and lets BlueIT choose the preferred TikTok download stream.",
    default = true,
) {
    dependsOn(downloadsPatch)
    compatibleWith(*AppCompatibilities.tiktok4643())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableAdvancedDownloads()V",
        )
    }
}

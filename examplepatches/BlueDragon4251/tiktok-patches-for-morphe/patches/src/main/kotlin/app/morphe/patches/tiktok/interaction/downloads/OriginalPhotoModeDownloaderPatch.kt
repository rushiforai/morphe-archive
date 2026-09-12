package app.morphe.patches.tiktok.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint

@Suppress("unused")
val originalPhotoModeDownloaderPatch = bytecodePatch(
    name = "Original Photo Mode downloader",
    description = "Downloads the original Photo Mode CDN assets instead of keeping TikTok's rendered copies when enabled.",
    default = true,
) {
    dependsOn(downloadsPatch)
    compatibleWith(*AppCompatibilities.tiktok4643())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableOriginalPhotoModeDownloader()V",
        )
    }
}

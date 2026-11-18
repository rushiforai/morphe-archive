package app.afterglow.patches.tweaks

import app.afterglow.patches.settings.afterglowSettingsPatch
import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.markTweakInstalled
import app.afterglow.patches.theme.seekBarThemePatch
import app.afterglow.patches.video.installAtStartup
import app.afterglow.patches.video.videoStatePatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val sponsorBlockTweakPatch = bytecodePatch(
    name = "SponsorBlock",
    description = "Skips selected SponsorBlock categories with undo and colored timeline markers, including Shorts.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowSettingsPatch, videoStatePatch, seekBarThemePatch)
    execute {
        markTweakInstalled("sponsorblock")
        installAtStartup("$EXTENSION_PACKAGE/sponsorblock/SponsorBlock;")
    }
}

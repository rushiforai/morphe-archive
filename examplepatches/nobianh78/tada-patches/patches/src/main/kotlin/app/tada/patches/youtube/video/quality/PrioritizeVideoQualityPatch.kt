package app.tada.patches.youtube.video.quality

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.video.format.hookAdaptiveFormat
import app.tada.patches.youtube.video.format.videoFormatPatch

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/playback/quality/PrioritizeVideoQualityPatch;"

internal val prioritizeVideoQualityPatch = bytecodePatch {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        videoFormatPatch,
    )

    execute {
        settingsMenuVideoQualityGroup.add(
            SwitchPreference("tada_video_quality_prioritize", summary = true)
        )

        hookAdaptiveFormat("$EXTENSION_CLASS->prioritizeVideoQuality")
    }
}

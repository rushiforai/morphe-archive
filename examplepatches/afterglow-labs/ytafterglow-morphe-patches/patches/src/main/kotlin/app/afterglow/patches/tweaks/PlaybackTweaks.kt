package app.afterglow.patches.tweaks

import app.afterglow.patches.playback.autoplayHookPatch
import app.afterglow.patches.playback.backgroundPlaybackHookPatch
import app.afterglow.patches.playback.captionsHookPatch
import app.afterglow.patches.playback.contentWarningHookPatch
import app.afterglow.patches.playback.playbackSpeedHookPatch
import app.afterglow.patches.playback.rememberLoopHookPatch
import app.afterglow.patches.playback.videoQualityHookPatch
import app.afterglow.patches.settings.afterglowSettingsPatch
import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.markTweakInstalled
import app.morphe.patcher.patch.bytecodePatch

/*
 * The playback tweaks of tools/tweaks.json that have no named patch in TweakPatches.kt.
 * Each marks its id in InstalledTweaks; the extension then follows the tweak's iOS settings
 * at runtime. The hooks are unnamed patches in app.afterglow.patches.playback, on top of the
 * video state patch (app.afterglow.patches.video). The watch page and video ad hooks belong
 * to the "Watch page" and "Remove ads" patches of TweakPatches.kt.
 */

@Suppress("unused")
val backgroundPlaybackTweakPatch = bytecodePatch(
    name = "Background playback",
    description = "Lets videos, Shorts and videos made for kids keep playing in the background.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, afterglowSettingsPatch, backgroundPlaybackHookPatch)
    execute { markTweakInstalled("background-playback") }
}

@Suppress("unused")
val playbackSpeedTweakPatch = bytecodePatch(
    name = "Playback speed",
    description = "Lets you set the hold-to-speed rate and a default playback rate, up to 5x.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, afterglowSettingsPatch, playbackSpeedHookPatch)
    execute { markTweakInstalled("playback-speed") }
}

@Suppress("unused")
val contentWarningTweakPatch = bytecodePatch(
    name = "Skip content warning",
    description = "Lets you skip YouTube's viewer discretion dialog on sensitive videos.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, afterglowSettingsPatch, contentWarningHookPatch)
    execute { markTweakInstalled("content-warning") }
}

@Suppress("unused")
val videoQualityTweakPatch = bytecodePatch(
    name = "Video quality",
    description = "Sets default Wi-Fi and mobile-data quality and restores the classic resolution menu.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, afterglowSettingsPatch, videoQualityHookPatch)
    execute { markTweakInstalled("video-quality") }
}

@Suppress("unused")
val captionsTweakPatch = bytecodePatch(
    name = "Captions",
    description = "Remembers your caption choice and lets you prevent server and muted-device captions from turning on automatically.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, afterglowSettingsPatch, captionsHookPatch)
    execute { markTweakInstalled("captions") }
}

@Suppress("unused")
val autoplayTweakPatch = bytecodePatch(
    name = "Autoplay",
    description = "Lets you start newly opened videos paused and optionally hide the native Autoplay switch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, afterglowSettingsPatch, autoplayHookPatch)
    execute { markTweakInstalled("autoplay") }
}

@Suppress("unused")
val rememberLoopTweakPatch = bytecodePatch(
    name = "Remember loop mode",
    description = "Remembers your native loop choice and restores it when a video opens.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, afterglowSettingsPatch, rememberLoopHookPatch)
    execute { markTweakInstalled("loop") }
}

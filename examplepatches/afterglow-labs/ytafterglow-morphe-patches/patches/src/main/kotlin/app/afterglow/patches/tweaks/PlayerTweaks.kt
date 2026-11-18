package app.afterglow.patches.tweaks

import app.afterglow.patches.playback.ambientModeHookPatch
import app.afterglow.patches.playback.tapToSeekHookPatch
import app.afterglow.patches.playback.playerOverlayHookPatch
import app.afterglow.patches.playback.hudMessagesHookPatch
import app.afterglow.patches.playback.doubleTapGestureHookPatch
import app.afterglow.patches.playback.freeZoomHookPatch
import app.afterglow.patches.playback.fullscreenHookPatch
import app.afterglow.patches.playback.portraitFullscreenHookPatch
import app.afterglow.patches.playback.endTimeHookPatch
import app.afterglow.patches.playback.chapterSnapHookPatch
import app.afterglow.patches.playback.overlayButtonsHookPatch
import app.afterglow.patches.litho.afterglowLithoFilterPatch
import app.afterglow.patches.settings.afterglowSettingsPatch
import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.markTweakInstalled
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val overlayButtonsTweakPatch = bytecodePatch(
    name = "Overlay buttons",
    description = "Adds Afterglow's player controls sheet, download entry, mute, lock, settings and shared eye modes for player overlays.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowSettingsPatch, overlayButtonsHookPatch,
        app.afterglow.patches.playback.premiumControlsHookPatch)
    execute { markTweakInstalled("overlay-buttons") }
}

@Suppress("unused")
val endTimeTweakPatch = bytecodePatch(
    name = "Playback end time",
    description = "Adds the expected playback finish time to the native player bar, accounting for playback speed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowSettingsPatch, endTimeHookPatch)
    execute { markTweakInstalled("video-end-time") }
}

@Suppress("unused")
val fullscreenTweakPatch = bytecodePatch(
    name = "Fullscreen",
    description = "Controls automatic fullscreen, exit on finish, and fullscreen playback in portrait orientation.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowSettingsPatch, fullscreenHookPatch, portraitFullscreenHookPatch)
    execute { markTweakInstalled("fullscreen") }
}

@Suppress("unused")
val ambientModeTweakPatch = bytecodePatch(
    name = "Disable ambient mode",
    description = "Lets you disable the video's ambient lighting while preserving YouTube's own behavior when off.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowSettingsPatch, ambientModeHookPatch)
    execute { markTweakInstalled("ambient-mode") }
}

@Suppress("unused")
val playerGesturesTweakPatch = bytecodePatch(
    name = "Player gestures",
    description = "Controls tap-to-seek, chapter snapping, independent double-tap gestures, and free zoom while keeping pinch-to-fill.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowSettingsPatch, tapToSeekHookPatch, chapterSnapHookPatch, doubleTapGestureHookPatch, freeZoomHookPatch)
    execute { markTweakInstalled("player-gestures") }
}

@Suppress("unused")
val playerOverlayTweakPatch = bytecodePatch(
    name = "Player overlay",
    description = "Lets you hide native controls, replace transport paddles with rewind and fast forward on standalone videos, and pause playback while the controls appear.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowSettingsPatch, playerOverlayHookPatch, hudMessagesHookPatch, afterglowLithoFilterPatch)
    execute { markTweakInstalled("player-overlay") }
}

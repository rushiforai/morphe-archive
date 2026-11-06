package io.github.jordanwoodson.patches.rumble.refresh

import app.morphe.patcher.Fingerprint
import io.github.jordanwoodson.patches.rumble.shared.composableFingerprint

// The player's quality switch, x4(videoSource): plays the source, reports it as the picked quality, and
// re-prepares and seeks to the current position. Its catch logs with the "RumblePlayer" tag.
internal object QualitySwitchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("videoSource", "RumblePlayer"),
)

// The panel the player shows when playback fails: (modifier, video, screen, onBack, onSettings, ...).
internal val MobileErrorViewFingerprint =
    composableFingerprint("com.rumble.videoplayer.presentation.internal.controlViews.MobileErrorView")

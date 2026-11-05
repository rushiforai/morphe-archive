package io.github.jordanwoodson.patches.rumble.refresh

import io.github.jordanwoodson.patches.rumble.shared.composableFingerprint

// The panel the player shows when playback fails: (modifier, video, screen, onBack, onSettings, ...).
internal val MobileErrorViewFingerprint =
    composableFingerprint("com.rumble.videoplayer.presentation.internal.controlViews.MobileErrorView")

package duskdream

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val VRCORE = Compatibility(
    name = "Google VR Services",
    packageName = "com.google.vr.vrcore",
    targets = listOf(AppTarget("1.23.265693388")),
    appIconColor = 0x4285F4
)

internal val VR_HOME = Compatibility(
    name = "Daydream",
    packageName = "com.google.android.vr.home",
    targets = listOf(AppTarget("1.23.190812026")),
    appIconColor = 0x4285F4
)

internal val VR_KEYBOARD = Compatibility(
    name = "Daydream Keyboard",
    packageName = "com.google.android.vr.inputmethod",
    targets = listOf(AppTarget("1.23.190812016")),
    appIconColor = 0x4285F4
)

internal val YOUTUBE_VR = Compatibility(
    name = "YouTube VR",
    packageName = "com.google.android.apps.youtube.vr",
    targets = listOf(AppTarget("1.28.63")),
    appIconColor = 0xFF0000
)

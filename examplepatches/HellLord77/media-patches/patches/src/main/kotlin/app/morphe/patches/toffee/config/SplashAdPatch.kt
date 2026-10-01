package app.morphe.patches.toffee.config

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.toffee.shared.Constants.COMPATIBILITY_TOFFEE
import app.morphe.util.matchSingle
import app.morphe.util.returnBoxedBooleanEarly

@Suppress("unused")
val splashAdPatch = bytecodePatch(
    name = "Splash ad",
    description = "Conceal splash ad.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TOFFEE)

    execute {
        SplashAdVisibilityGetterFingerprint.matchSingle().method.returnBoxedBooleanEarly(false)
    }
}
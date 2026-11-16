package app.onlynazril.patches.tiktok.refreshrate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK
import app.onlynazril.patches.tiktok.shared.ApplicationOnCreateFingerprint

private const val REFRESH_RATE = "Lapp/onlynazril/extension/tiktok/refreshrate/RefreshRate;"

/**
 * Asks the app for a fixed display refresh rate.
 *
 * The hook installs one activity lifecycle callback at process start, and every resumed activity
 * gets the saved rate on its window. The setting lives in Tweaks: Default lets Android and TikTok
 * decide, while 60, 90 and 120 ask for that many frames per second where the panel supports it.
 *
 * Patched on by default, but the default option changes nothing: the rate is only requested once
 * the user picks a number.
 */
@Suppress("unused")
val tiktokRefreshRatePatch = bytecodePatch(
    name = "App refresh rate",
    description = "Sets the app's preferred display refresh rate. In Tweaks: Default (system), " +
        "60 fps, 90 fps or 120 fps. On by default; Default leaves the rate to Android.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)

    extendWith("extensions/tiktok.mpe")

    execute {
        ApplicationOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static {p0}, $REFRESH_RATE->install(Landroid/content/Context;)V",
        )
    }
}

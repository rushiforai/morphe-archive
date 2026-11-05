package semicoloncolonel.mobilestream.patches.pluto.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.forceSplashVideoOff

// Pluto TV 17.2.0 is built on Paramount's splash module and plays the same
// ~3-second branded intro video on launch. See
// shared/misc/SkipParamountSplashVideo.kt for the shared mechanism.
@Suppress("unused")
val skipLaunchVideoPatch = bytecodePatch(
    name = "Skip launch video",
    description = "Opens the app with the static logo instead of the branded intro video.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute { forceSplashVideoOff() }
}

package semicoloncolonel.mobilestream.patches.netflix.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.netflix.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Netflix closes the video player after a few minutes of being paused. A
// delayed Runnable is posted when playback pauses, and when it fires it tears
// the player down: its run() logs "pauseTimeout calling cleanupExit", calls the
// exit routine, and logs "pauseTimeout cleanupExit done". The timer is driven
// by the client (a pauseTimeoutMs value), not by the DRM license, so the exit
// is safe to suppress.
//
// This forces that one Runnable's run() to return immediately, so the pause
// timer still fires but does nothing and the player stays open while paused.
// The exit routine itself is untouched, so the ordinary ways out of the player
// (the back button, finishing the activity) still work: they reach it by other
// paths, not through this timeout Runnable.
//
// The Runnable is an anonymous class whose name R8 changes on every build, so
// it is found by the log string it loads, which is unique across the app. This
// matters most for downloaded titles, where there is no "continue watching"
// marker: if the paused player closes on its own, the resume position is lost.
//
// Like the other Netflix patches, it needs Bypass tamper protection to take
// effect, and it is off by default until confirmed on a device.
private const val MARKER = "pauseTimeout calling cleanupExit"

private object PauseTimeoutRunnableFingerprint : Fingerprint(
    strings = listOf(MARKER),
)

@Suppress("unused")
val disablePauseTimeoutPatch = bytecodePatch(
    name = "Do not exit the player when paused (experimental)",
    description = "Stops Netflix from closing the video player after a few minutes of being " +
        "paused, so a paused title stays open until you resume it. This keeps your place in " +
        "downloaded titles, which otherwise have no resume marker once the player closes. " +
        "Experimental and not yet confirmed on a device.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val run = PauseTimeoutRunnableFingerprint.methodOrNull
            ?: throw PatchException("Netflix pause-timeout runnable not found")
        if (run.name != "run" || run.returnType != "V" || run.parameterTypes.isNotEmpty()) {
            throw PatchException("Netflix pause-timeout runnable has an unexpected shape")
        }
        run.returnEarly("return-void")
    }
}

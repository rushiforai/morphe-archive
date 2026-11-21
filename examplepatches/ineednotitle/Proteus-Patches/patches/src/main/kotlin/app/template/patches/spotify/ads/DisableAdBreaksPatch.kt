package app.template.patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SPOTIFY_COMPATIBILITY
import app.template.patches.spotify.shared.CoroutineClientBaseConstructorFingerprint

private const val EXTENSION_CLASS =
    "Lapp/template/extension/extension/SpotifyAdBreakDisabler;"

// Disables the ad slots that play ads between songs. Experimental.
//
// The native player only fills ad slots that are enabled, and the app enables
// them through the ads esperanto service (Settings/updateSlotEnabled). The
// patch observes every esperanto client's transport at construction time; the
// extension recognizes the Cosmos transport and periodically sends its own
// updateSlotEnabled(disabled) requests for the "stream" (ad break) and
// "preroll" slots. The app and the server may re-enable slots, so the update
// repeats on a timer.
//
// Fail-safe: only the two known ad-break slots are touched, the request body is
// built without app internals, and every failure degrades to stock behavior.

@Suppress("unused")
val spotifyDisableAdBreaksPatch = bytecodePatch(
    name = "Disable ad breaks",
    description = "Disables the ad slots that play ads between songs. Experimental.",
    default = false,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // p1 is the CoroutineTransport used by every esperanto client.
        CoroutineClientBaseConstructorFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onTransportCreated(Ljava/lang/Object;)V",
        )
    }
}

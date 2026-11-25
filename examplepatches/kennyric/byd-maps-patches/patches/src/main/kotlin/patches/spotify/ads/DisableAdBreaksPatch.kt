package patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.spotify.COMPATIBILITY_SPOTIFY
import patches.spotify.shared.EXTENSION
import patches.spotify.shared.EXTENSION_PACKAGE
import patches.spotify.CoroutineClientBaseConstructorFingerprint

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/DisableAdBreaksPatch;"

@Suppress("unused")
val disableAdBreaksPatch = bytecodePatch(
    name = "Disable ad breaks",
    description = "Disables the ad slots that play ads between songs. Experimental.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

    execute {
        // p1 is the CoroutineTransport used by every esperanto client.
        CoroutineClientBaseConstructorFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onTransportCreated(Ljava/lang/Object;)V",
        )
    }
}

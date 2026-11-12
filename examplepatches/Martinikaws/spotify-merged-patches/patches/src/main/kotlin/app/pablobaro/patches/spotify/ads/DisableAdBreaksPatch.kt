package app.pablobaro.patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.pablobaro.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.pablobaro.patches.shared.EXTENSION
import app.pablobaro.patches.shared.EXTENSION_PACKAGE
import app.pablobaro.patches.spotify.CoroutineClientBaseConstructorFingerprint

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/DisableAdBreaksPatch;"

@Suppress("unused")
val disableAdBreaksPatch = bytecodePatch(
    name = "Disable ad breaks",
    description = "Disables the ad slots that play ads between songs. Experimental.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

    finalize {
        // Runs in finalize, after every Spicetify patch has executed: those verify Spotify's
        // classes against pinned hashes, which must see the classes before this patch edits them.
        // p1 is the CoroutineTransport used by every esperanto client.
        CoroutineClientBaseConstructorFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onTransportCreated(Ljava/lang/Object;)V",
        )
    }
}

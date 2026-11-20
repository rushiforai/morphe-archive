package app.southstar21.patches.spotify.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.spotify.shared.SpotifyMainActivityWindowFocusFingerprint

internal const val SPOTIFY_HOOKS_CLASS = "Lapp/southstar21/extension/spotify/SpotifyHooks;"

/**
 * Bundles the Spotify extension (extensions/spotify) into the app and calls its shared hook,
 * which starts every included patch. Every Spotify patch depends on this.
 */
val spotifySharedExtensionPatch = bytecodePatch {
    extendWith("extensions/spotify.mpe")

    execute {
        SpotifyMainActivityWindowFocusFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $SPOTIFY_HOOKS_CLASS->onMainActivityWindowFocusChanged(Landroid/app/Activity;)V"
        )
    }
}

/** Makes the extension class's `isIncluded()` return true, so the patch's code runs. */
context(patchContext: BytecodePatchContext)
internal fun markSpotifyPatchIncluded(extensionClass: String) {
    Fingerprint(
        definingClass = extensionClass,
        name = "isIncluded",
        returnType = "Z",
        parameters = listOf(),
    ).method.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """
    )
}

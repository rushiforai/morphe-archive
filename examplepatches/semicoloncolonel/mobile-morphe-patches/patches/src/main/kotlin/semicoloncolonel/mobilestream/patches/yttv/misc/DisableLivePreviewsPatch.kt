package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Disable live previews.
//
// The live tiles in the Live guide and on the home shelves play a muted
// preview of the channel. YouTube TV calls this "10x" or FastZap: each tile
// asks one session manager to start a preview on the tile's surface, and the
// manager fetches low-bitrate segments for it and draws them. The full-screen
// player is a separate player and does not use it.
//
// Every tile goes through the manager's start method, found by its log
// message. It now returns at once, so no preview is fetched or drawn. The
// tile's video layer stays hidden until a first frame arrives, so the tile
// keeps its still thumbnail. Tapping a tile opens the channel as before.
// ─────────────────────────────────────────────────────────────────────────────

internal object StartFastZapFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Calling startFastZap on Surface=%s that already has an active session=%s, new tenxId=%s"),
    custom = { method, _ ->
        method.parameterTypes.size == 3 &&
            method.parameterTypes[0].toString() == "Ljava/lang/String;" &&
            method.parameterTypes[1].toString() == "Landroid/view/Surface;"
    },
)

@Suppress("unused")
val disableLivePreviewsPatch = bytecodePatch(
    name = "Disable live previews",
    description = "Stops the live channel tiles in the guide and on the home screen from playing a preview, so scores are not spoiled. Tiles show their still image.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        StartFastZapFingerprint.method.addInstructions(0, "return-void")
    }
}

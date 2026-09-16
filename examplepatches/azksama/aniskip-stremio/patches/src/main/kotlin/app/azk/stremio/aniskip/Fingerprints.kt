package app.azk.stremio.aniskip

import app.morphe.patcher.Fingerprint

/** Finds Media3 PlayerView.setPlayer(Player) without relying on obfuscated app code. */
object PlayerViewSetPlayerFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/ui/PlayerView;",
    name = "setPlayer",
    parameters = listOf("Landroidx/media3/common/Player;"),
)

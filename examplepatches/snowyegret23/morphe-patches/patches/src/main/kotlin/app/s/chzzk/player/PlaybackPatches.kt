package app.s.chzzk.player

import app.morphe.patcher.patch.bytecodePatch
import app.s.chzzk.common.initializeField
import app.s.chzzk.shared.Constants.COMPATIBILITY_CHZZK

@Suppress("unused")
val cdnPlaybackPatch = bytecodePatch(
    name = "CDN playback",
    description = "Creates player configurations with peer-assisted streaming disabled.",
) {
    compatibleWith(COMPATIBILITY_CHZZK)
    execute {
        val peer = "Lcom/naver/prismplayer/player/PeerNetworkConfiguration;"
        val enabled = classDefBy(peer).fields.single { it.type == "Z" }
        initializeField(peer, enabled.name, false)
    }
}

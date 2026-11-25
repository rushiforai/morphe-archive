package app.aapam.patches.sonyliv.player.upnext

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val NEXT_EPISODE_UI_CLASS =
    "Lcom/sonyliv/mediaplayer/player/playerrevamp/SLNextEpisodeUI;"

/**
 * 6.23.1:
 * com.sonyliv.mediaplayer.player.playerrevamp.SLNextEpisodeUI
 * #updateNextEpisodeAndWatchCreditsUIVisibility(boolean shouldBeVisible)
 */
internal object UpdateNextEpisodeVisibilityFingerprint : Fingerprint(
    name = "updateNextEpisodeAndWatchCreditsUIVisibility",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
    definingClass = NEXT_EPISODE_UI_CLASS,
)

/**
 * 6.29.11+:
 * SLNextEpisodeHelper (com.sonyliv.mediaplayer.player.playerrevamp.b0)
 * Starts the clockwise timer countdown for the next episode.
 */
internal object StartClockwiseTimerFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Start Clock wise Timer Progress"),
)

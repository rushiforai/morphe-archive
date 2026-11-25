package app.aapam.patches.sonyliv.player.skip

import app.morphe.patcher.Fingerprint

/**
 * com.sonyliv.mediaplayer.player.playerrevamp.SLPlayerSkipHelper (6.23.1) /
 * com.sonyliv.mediaplayer.player.playerrevamp.v0 (6.29.11+)
 *
 * setSkipIntroVisibility / c (boolean isVisible, String skipBtnToUpdate, Boolean idlePlayerState)
 * Shows/hides the "Skip Intro" / "Skip Song" / "Skip Recap" button.
 */
internal object SetSkipIntroVisibilityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z", "Ljava/lang/String;", "Ljava/lang/Boolean;"),
    strings = listOf("Skip Intro", "Skip Song"),
)

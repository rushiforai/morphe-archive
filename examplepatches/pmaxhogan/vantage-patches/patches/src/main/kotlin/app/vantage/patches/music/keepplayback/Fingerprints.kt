package app.vantage.patches.music.keepplayback

import app.morphe.patcher.Fingerprint

/**
 * MusicActivity.onDestroy(). The activity class name is NOT obfuscated (it is
 * named in AndroidManifest.xml), so match it directly.
 */
internal val musicActivityOnDestroyFingerprint =
    Fingerprint(
        definingClass = "Lcom/google/android/apps/youtube/music/activities/MusicActivity;",
        name = "onDestroy",
        returnType = "V",
        parameters = emptyList(),
    )

/**
 * MedialibPlayer.stopVideo(int reason) - obfuscated (atzq.K(I)V in 9.15.51), so
 * match on the log format string it emits. That string is the same one that
 * shows up in the reproduction logs as
 * "MedialibPlayer.stopVideo(), STOPPAGE_DIRECTOR_RESET_INTERNALLY".
 */
internal val stopVideoFingerprint =
    Fingerprint(
        returnType = "V",
        parameters = listOf("I"),
        strings = listOf("MedialibPlayer.stopVideo(), %s"),
    )

/**
 * The media-session activate/deactivate method (bazk.j(Z)V in 9.15.51). It
 * carries the "MediaSession setActive(false)" log string; the activate path
 * lives in a different method, so this fingerprint is unambiguous.
 */
internal val setMediaSessionActiveFingerprint =
    Fingerprint(
        returnType = "V",
        parameters = listOf("Z"),
        strings = listOf("MediaSession setActive(false)"),
    )

/**
 * BackgroundPlayerService.onTaskRemoved(Intent) - the swipe-from-recents path
 * that deactivates the media session. The class name is NOT obfuscated (it is
 * named in AndroidManifest.xml).
 */
internal val playerServiceOnTaskRemovedFingerprint =
    Fingerprint(
        definingClass =
            "Lcom/google/android/libraries/youtube/player/background/service/BackgroundPlayerService;",
        name = "onTaskRemoved",
        returnType = "V",
        parameters = listOf("Landroid/content/Intent;"),
    )

/**
 * The static mapper that turns a stoppage-reason ordinal into its name
 * (caor.a(I)Ljava/lang/String; in 9.15.51) - a generated proto-enum helper, so
 * obfuscated, but it carries every reason name as a literal. Matching it lets
 * the patch compare the reason by NAME at runtime instead of hardcoding an
 * ordinal that an app update could renumber.
 */
internal val stoppageReasonNameFingerprint =
    Fingerprint(
        returnType = "Ljava/lang/String;",
        parameters = listOf("I"),
        strings = listOf("STOPPAGE_DIRECTOR_RESET_INTERNALLY"),
    )

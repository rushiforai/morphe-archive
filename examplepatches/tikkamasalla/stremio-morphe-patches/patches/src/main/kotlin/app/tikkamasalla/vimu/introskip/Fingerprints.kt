package app.tikkamasalla.vimu.introskip

import app.morphe.patcher.Fingerprint

/** Starts the skip when playback resumes on the Vimu 12.00 player screen. */
object VimuPlayerFragmentOnResumeFingerprint : Fingerprint(
    definingClass = "Lnet/gtvbox/videoplayer/PlayerFragment;",
    name = "onResume",
    parameters = emptyList(),
)

/** Stops the skip when playback pauses on the Vimu 12.00 player screen. */
object VimuPlayerFragmentOnPauseFingerprint : Fingerprint(
    definingClass = "Lnet/gtvbox/videoplayer/PlayerFragment;",
    name = "onPause",
    parameters = emptyList(),
)

/**
 * Releases the player adapter when the Vimu 12.00 player screen is destroyed.
 * The stock app only releases on its finishing path, without a null check.
 */
object VimuPlayerFragmentOnDestroyFingerprint : Fingerprint(
    definingClass = "Lnet/gtvbox/videoplayer/PlayerFragment;",
    name = "onDestroy",
    parameters = emptyList(),
)

/**
 * Defers prepare() until the audio session id arrives in Vimu 12.00.
 * Fixes the ExoPlayer tunneling crash on cold start ("Exo2 Unexpected: null").
 */
object VimuPlayerPrepareFingerprint : Fingerprint(
    definingClass = "Lnet/gtvbox/videoplayer/i;",
    name = "A1",
    parameters = emptyList(),
)

/** Releases the media session on exit in Vimu 12.00 instead of only deactivating it. */
object VimuMediaSessionReleaseFingerprint : Fingerprint(
    definingClass = "Lnet/gtvbox/videoplayer/m;",
    name = "m",
    parameters = emptyList(),
)

/** Cancels the seek debounce timer before it is replaced in Vimu 12.00. */
object VimuSeekTimerCancelFingerprint : Fingerprint(
    definingClass = "Lnet/gtvbox/videoplayer/n;",
    name = "f",
    parameters = emptyList(),
)

/**
 * Normalizes the start position in Vimu 12.00 (private w1): maps the common
 * "position" / "extra_position" extras to "startfrom" via VimuResult.
 */
object VimuResultStartFingerprint : Fingerprint(
    definingClass = "Lnet/gtvbox/videoplayer/PlayerFragment;",
    name = "w1",
    parameters = emptyList(),
)

/** Opens Vimu's own preferences screen from the player in Vimu 12.00 (public j). */
object VimuOwnScreenFingerprint : Fingerprint(
    definingClass = "Lnet/gtvbox/videoplayer/PlayerFragment;",
    name = "j",
    parameters = emptyList(),
)

/**
 * Returns the MX Player style result in Vimu 12.00 (public j1): position,
 * duration and end_by via VimuResult, with the result code mapping.
 */
object VimuResultFinishFingerprint : Fingerprint(
    definingClass = "Lnet/gtvbox/videoplayer/PlayerFragment;",
    name = "j1",
    parameters = listOf("I"),
)

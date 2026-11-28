package app.whatsapp.patches.status

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for WhatsApp's Status viewer activity and fragments.
 *
 * Targets [com.whatsapp.status.playback.StatusPlaybackActivity] and
 * [StatusPlaybackContactFragment] to attach a native-looking download
 * action for eligible, non-View-Once Status media.
 */
object StatusPlaybackOnResumeFingerprint : Fingerprint(
    definingClass = "/StatusPlaybackActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

object StatusPlaybackOnCreateFingerprint : Fingerprint(
    definingClass = "/StatusPlaybackActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

object StatusPlaybackContactFragmentOnResumeFingerprint : Fingerprint(
    definingClass = "/StatusPlaybackContactFragment;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

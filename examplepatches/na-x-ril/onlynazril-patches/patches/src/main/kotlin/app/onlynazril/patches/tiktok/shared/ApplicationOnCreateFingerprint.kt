package app.onlynazril.patches.tiktok.shared

import app.morphe.patcher.Fingerprint

/**
 * The process's Application. Real-named (`AwemeHostApplication`) and read straight from the
 * manifest, so it is the earliest reliable place to install an extension hook.
 *
 * Shared by the handle patch, which stashes the Context, and the refresh-rate patch, which
 * registers its activity lifecycle callback.
 */
object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/app/host/AwemeHostApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

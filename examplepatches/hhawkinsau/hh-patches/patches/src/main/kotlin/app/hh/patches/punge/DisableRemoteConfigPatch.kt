package app.hh.patches.punge

import app.hh.patches.shared.Constants.COMPATIBILITY_PUNGE
import app.hh.patches.shared.disableRemoteConfig
import app.hh.patches.shared.returnCompletedTask
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val disableRemoteConfigPatch = bytecodePatch(
    name = "Disable remote config for Punge",
    description = "Stops Firebase Remote Config fetches and Play Measurement so " +
        "feature flags cannot be changed after install.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PUNGE)
    dependsOn(
        resourcePatch {
            compatibleWith(COMPATIBILITY_PUNGE)
            execute { disableRemoteConfig() }
        },
    )

    execute {
        var patched = 0

        if (FetchAndActivateFingerprint.returnCompletedTask(booleanFalse = true)) patched++
        if (ActivateFingerprint.returnCompletedTask(booleanFalse = true)) patched++
        if (FetchFingerprint.returnCompletedTask()) patched++
        if (FetchWithTimeoutFingerprint.returnCompletedTask()) patched++

        if (patched == 0) {
            throw PatchException(
                "Could not find Firebase Remote Config fetch methods. " +
                    "The app may have changed; no changes applied.",
            )
        }
    }
}

private object FetchAndActivateFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;",
    name = "fetchAndActivate",
    returnType = "Lcom/google/android/gms/tasks/Task;",
)

private object ActivateFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;",
    name = "activate",
    returnType = "Lcom/google/android/gms/tasks/Task;",
)

private object FetchFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;",
    name = "fetch",
    parameters = listOf(),
    returnType = "Lcom/google/android/gms/tasks/Task;",
)

private object FetchWithTimeoutFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;",
    name = "fetch",
    parameters = listOf("J"),
    returnType = "Lcom/google/android/gms/tasks/Task;",
)

/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/strava/quickedit/Fingerprints.kt
 */
package app.morphe.patches.strava.quickedit

import app.morphe.patcher.Fingerprint

internal object GetHasAccessToQuickEditFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, _ ->
        method.name == "getHasAccessToQuickEdit"
    },
)


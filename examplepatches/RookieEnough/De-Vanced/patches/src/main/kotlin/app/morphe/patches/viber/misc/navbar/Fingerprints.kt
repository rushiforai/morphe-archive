/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/viber/misc/navbar/Fingerprints.kt
 */
package app.morphe.patches.viber.misc.navbar

import app.morphe.patcher.Fingerprint

internal object ShouldShowTabIdMethodFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, _ ->
        // Upstream name is stable, but the owning class / signature can shift between versions.
        method.name == "shouldShowTabId"
    },
)


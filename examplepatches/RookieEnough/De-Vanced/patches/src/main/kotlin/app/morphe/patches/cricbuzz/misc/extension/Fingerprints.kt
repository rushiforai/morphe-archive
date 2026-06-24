/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/cricbuzz/misc/extension/Fingerprints.kt
 */
package app.morphe.patches.cricbuzz.misc.extension

import app.morphe.patcher.Fingerprint

internal object ApplicationInitFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "onCreate" && classDef.endsWith("/NyitoActivity;")
    },
)


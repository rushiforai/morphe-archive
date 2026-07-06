/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/googlenews/misc/gms/Fingerprints.kt
 */
package app.morphe.patches.googlenews.misc.gms

import app.morphe.patcher.Fingerprint

internal object MagazinesActivityOnCreateFingerprint : Fingerprint(
    custom = { methodDef, classDef ->
        methodDef.name == "onCreate" && classDef.endsWith("/StartActivity;")
    },
)


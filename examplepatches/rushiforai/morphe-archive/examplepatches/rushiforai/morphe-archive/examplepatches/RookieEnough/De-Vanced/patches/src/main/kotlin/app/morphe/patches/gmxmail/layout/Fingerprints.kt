/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/gmxmail/layout/Fingerprints.kt
 */
package app.morphe.patches.gmxmail.layout

import app.morphe.patcher.Fingerprint

internal object IsUpsellingPossibleFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "isUpsellingPossible" && classDef.endsWith("/PayMailManager;")
    },
)


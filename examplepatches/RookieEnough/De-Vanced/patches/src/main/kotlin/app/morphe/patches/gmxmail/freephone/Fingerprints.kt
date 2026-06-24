/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/gmxmail/freephone/Fingerprints.kt
 */
package app.morphe.patches.gmxmail.freephone

import app.morphe.patcher.Fingerprint

internal object IsEuiccEnabledFingerprint : Fingerprint(
    custom = { method, _ -> method.name == "isEuiccEnabled" },
)


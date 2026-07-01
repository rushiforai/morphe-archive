/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/iconpackstudio/misc/pro/Fingerprints.kt
 */
package app.morphe.patches.iconpackstudio.misc.pro

import app.morphe.patcher.Fingerprint

internal object CheckProFingerprint : Fingerprint(
    returnType = "Z",
    custom = { _, classDef -> classDef.endsWith("IPSPurchaseRepository;") },
)


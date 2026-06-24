/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/microsoft/officelens/misc/onedrive/Fingerprints.kt
 */
package app.morphe.patches.microsoft.officelens.misc.onedrive

import app.morphe.patcher.Fingerprint

internal object HasMigratedToOneDriveFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("FREManager;") && method.name == "getMigrationStage"
    },
)


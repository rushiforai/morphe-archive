/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/googlephotos/misc/backup/Fingerprints.kt
 */
package app.morphe.patches.googlephotos.misc.backup

import app.morphe.patcher.Fingerprint

internal object IsDCIMFolderBackupControlDisabledFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf(
        "/dcim",
        "/mars_files/",
    ),
)


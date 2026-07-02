/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/patches/src/main/kotlin/app/revanced/patches/googlephotos/misc/gms/Fingerprints.kt
 */

package app.morphe.patches.googlephotos.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patches.googlephotos.misc.gms.Constants.PHOTOS_MAIN_ACTIVITY_CLASS_TYPE

internal object HomeActivityOnCreateFingerprint : Fingerprint(
    definingClass = PHOTOS_MAIN_ACTIVITY_CLASS_TYPE,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)


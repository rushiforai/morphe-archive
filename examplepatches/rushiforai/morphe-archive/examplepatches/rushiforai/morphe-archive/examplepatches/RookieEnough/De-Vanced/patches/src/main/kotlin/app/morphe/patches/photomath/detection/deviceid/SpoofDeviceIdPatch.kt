/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/photomath/detection/deviceid/SpoofDeviceIdPatch.kt
 */
package app.morphe.patches.photomath.detection.deviceid

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.photomath.detection.signature.signatureDetectionPatch
import app.morphe.util.returnEarly
import kotlin.random.Random

@Suppress("unused")
val getDeviceIdPatch = bytecodePatch(
    name = "Spoof device ID",
    description = "Spoofs device ID to mitigate manual bans by developers.",
) {
    dependsOn(signatureDetectionPatch)

    compatibleWith(AppCompatibilities.PHOTOMATH)

    execute {
        GetDeviceIdFingerprint.method.returnEarly(Random.nextLong().toString(16))
    }
}


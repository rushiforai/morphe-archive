/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/angulus/ads/Fingerprints.kt
 */
package app.morphe.patches.angulus.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object GetDailyMeasurementCountFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "I",
    strings = listOf("dailyMeasurementCount"),
)


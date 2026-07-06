/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/soundcloud/analytics/Fingerprints.kt
 */
package app.morphe.patches.soundcloud.analytics

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object CreateTrackingApiFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "L",
    custom = { methodDef, _ ->
        methodDef.name == "create"
    },
    strings = listOf("backend", "boogaloo"),
)


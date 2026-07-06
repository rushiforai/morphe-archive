/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/googlerecorder/restrictions/Fingerprints.kt
 */
package app.morphe.patches.googlerecorder.restrictions

import app.morphe.patcher.Fingerprint

internal object ApplicationOnCreateFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "onCreate" &&
            method.returnType == "V" &&
            method.parameterTypes.isEmpty() &&
            classDef.endsWith("/RecorderApplication;")
    },
)

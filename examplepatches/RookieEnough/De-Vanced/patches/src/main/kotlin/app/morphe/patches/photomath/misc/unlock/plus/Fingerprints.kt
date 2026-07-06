/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/photomath/misc/unlock/plus/Fingerprints.kt
 */
package app.morphe.patches.photomath.misc.unlock.plus

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object IsPlusUnlockedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    strings = listOf("genius"),
    custom = { _, classDef ->
        classDef.endsWith("/User;")
    },
)


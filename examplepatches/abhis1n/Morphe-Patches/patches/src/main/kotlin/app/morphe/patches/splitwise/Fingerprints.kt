/*
 * Forked from:
 * https://github.com/burgers1312/revanced-patches/tree/main/patches/src/main/kotlin/com/burgers1312/revanced/patches/splitwise
 */
package app.morphe.patches.splitwise

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object adFeatureStatusGetEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    custom = { method, classDef ->
        classDef.type.contains("AdFeatureStatus") &&
        method.name == "getEnabled"
    },
)

internal object adFeatureStatusGetVisibleFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    custom = { method, classDef ->
        classDef.type.contains("AdFeatureStatus") &&
        method.name == "getVisible"
    },
)
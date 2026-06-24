/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/debug/Fingerprints.kt
 */
package app.morphe.patches.twitch.debug

import app.morphe.patcher.Fingerprint

internal object IsDebugConfigEnabledMethodFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        method.name == "isDebugConfigEnabled" && classDef.type.endsWith("/BuildConfigUtil;")
    },
)

internal object IsOmVerificationEnabledMethodFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        method.name == "isOmVerificationEnabled" && classDef.type.endsWith("/BuildConfigUtil;")
    },
)

internal object ShouldShowDebugOptionsMethodFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        method.name == "shouldShowDebugOptions" && classDef.type.endsWith("/BuildConfigUtil;")
    },
)


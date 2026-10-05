/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/debug/Fingerprints.kt
 */
package app.morphe.patches.twitch.debug

import app.morphe.patcher.Fingerprint

internal object IsDebugConfigEnabledMethodFingerprint : Fingerprint(
    definingClass = "/BuildConfigUtil;",
    name = "isDebugConfigEnabled",
    returnType = "Z"
)

internal object IsOmVerificationEnabledMethodFingerprint : Fingerprint(
    definingClass = "/BuildConfigUtil;",
    name = "isOmVerificationEnabled",
    returnType = "Z"
)

internal object ShouldShowDebugOptionsMethodFingerprint : Fingerprint(
    definingClass = "/BuildConfigUtil;",
    name = "shouldShowDebugOptions",
    returnType = "Z"
)


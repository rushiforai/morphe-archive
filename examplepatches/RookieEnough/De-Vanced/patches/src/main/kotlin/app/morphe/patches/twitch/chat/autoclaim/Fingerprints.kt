/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/chat/autoclaim/Fingerprints.kt
 */
package app.morphe.patches.twitch.chat.autoclaim

import app.morphe.patcher.Fingerprint

internal object CommunityPointsButtonViewDelegateMethodFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        method.name == "showClaimAvailable" &&
            classDef.type.endsWith("CommunityPointsButtonViewDelegate;")
    },
)


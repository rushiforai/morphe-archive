/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/disneyplus/ads/Fingerprints.kt
 */
package app.morphe.patches.disneyplus.ads

import app.morphe.patcher.Fingerprint

internal object InsertionGetPointsFingerprint : Fingerprint(
    returnType = "Ljava/util/List",
    custom = { method, _ ->
        method.name == "getPoints" &&
            method.definingClass == "Lcom/dss/sdk/internal/media/Insertion;"
    },
)

internal object InsertionGetRangesFingerprint : Fingerprint(
    returnType = "Ljava/util/List",
    custom = { method, _ ->
        method.name == "getRanges" &&
            method.definingClass == "Lcom/dss/sdk/internal/media/Insertion;"
    },
)


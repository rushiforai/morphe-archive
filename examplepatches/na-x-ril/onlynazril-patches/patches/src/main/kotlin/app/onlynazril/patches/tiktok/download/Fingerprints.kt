package app.onlynazril.patches.tiktok.download

import app.morphe.patcher.Fingerprint

private const val VIDEO = "Lcom/ss/android/ugc/aweme/feed/model/Video;"
private const val URL_MODEL = "Lcom/ss/android/ugc/aweme/base/model/UrlModel;"
private const val ACL = "Lcom/ss/android/ugc/aweme/feed/model/ACLCommonShare;"

/**
 * Anchors for the download patch, on 47.1.4.
 *
 * The download restriction and the watermark are both carried by the app's own ACL object, whose
 * class and getters are real-named, so all four anchors here are matched by name.
 *
 * The three ACL answers are the ones ReVanced's TikTok download patch uses:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/interaction/downloads/DownloadsPatch.kt
 * (GPLv3, the licence this bundle carries). It was checked against 47.1.4 before being adopted.
 */

/**
 * The restriction on downloading. The app refuses the download entry when this is set; the patch
 * answers 0 instead.
 */
object AclCodeFingerprint : Fingerprint(
    definingClass = ACL,
    name = "getCode",
    returnType = "I",
    parameters = emptyList(),
)

/** How the download entry is offered. The patch answers 2, which is the unrestricted case. */
object AclShowTypeFingerprint : Fingerprint(
    definingClass = ACL,
    name = "getShowType",
    returnType = "I",
    parameters = emptyList(),
)

/**
 * Whether the file is watermarked on its way out. The patch answers 1, which is the flag the app
 * reads as "leave the file alone".
 */
object AclTranscodeFingerprint : Fingerprint(
    definingClass = ACL,
    name = "getTranscode",
    returnType = "I",
    parameters = emptyList(),
)

/**
 * The video's own download address, redirected to the best playback variant the item carries. A
 * real-named getter on a real-named model, so it is matched by name.
 */
object VideoDownloadAddressFingerprint : Fingerprint(
    definingClass = VIDEO,
    name = "getDownloadAddr",
    returnType = URL_MODEL,
    parameters = emptyList(),
)

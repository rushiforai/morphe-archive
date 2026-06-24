/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/interaction/downloads/Fingerprints.kt
 */
package app.morphe.patches.tiktok.interaction.downloads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object AclCommonShareFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    custom = { method, classDef ->
        classDef.endsWith("/ACLCommonShare;") && method.name == "getCode"
    },
)

internal object AclCommonShare2Fingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    custom = { method, classDef ->
        classDef.endsWith("/ACLCommonShare;") && method.name == "getShowType"
    },
)

internal object AclCommonShare3Fingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    custom = { method, classDef ->
        classDef.endsWith("/ACLCommonShare;") && method.name == "getTranscode"
    },
)

internal object DownloadUriFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/net/Uri;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    strings = listOf("/", "/Camera", "/Camera/", "video/mp4"),
)

internal object AwemeGetVideoFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Lcom/ss/android/ugc/aweme/feed/model/Video;",
    custom = { method, classDef ->
        classDef.endsWith("/Aweme;") &&
            method.name == "getVideo" &&
            method.parameterTypes.isEmpty()
    },
)

internal object CommentImageWatermarkFingerprint : Fingerprint(
    strings = listOf("[tiktok_logo]", "image/jpeg", "is_pending"),
    parameters = listOf("Landroid/graphics/Bitmap;"),
    returnType = "V",
)


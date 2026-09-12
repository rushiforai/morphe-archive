/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/interaction/downloads/Fingerprints.kt
 */
package app.morphe.patches.tiktok.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object AclCommonShareFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    definingClass = "/ACLCommonShare;",
    name = "getCode",
)

internal object AclCommonShare2Fingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    definingClass = "/ACLCommonShare;",
    name = "getShowType",
)

internal object AclCommonShare3Fingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    definingClass = "/ACLCommonShare;",
    name = "getTranscode",
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

internal object StickerPreviewBinderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "L",
        "Z",
        "Ljava/lang/String;",
        "Ljava/util/Map;",
    ),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions
        if (instructions == null) {
            false
        } else {
            var readsUrlModel = false
            var ownsSmartImageView = false
            var readsViewLayout = false
            var resolvesViewIds = false

            instructions.forEach { instruction ->
                instruction.getReference<FieldReference>()?.let { field ->
                    when (field.type) {
                        "Lcom/ss/android/ugc/aweme/base/model/UrlModel;" -> readsUrlModel = true
                        "Lcom/bytedance/lighten/loader/SmartImageView;" -> ownsSmartImageView = true
                    }
                }

                instruction.getReference<MethodReference>()?.let { reference ->
                    if (reference.definingClass == "Landroid/view/View;" &&
                        reference.name == "getLayoutParams"
                    ) {
                        readsViewLayout = true
                    }
                    if (reference.definingClass == "Landroid/view/View;" &&
                        reference.name == "findViewById"
                    ) {
                        resolvesViewIds = true
                    }
                }
            }

            readsUrlModel && ownsSmartImageView && readsViewLayout && resolvesViewIds
        }
    },
)

internal object StickerPreviewSourceFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/ss/android/ugc/aweme/im/common/model/StickerItem;",
        "Landroid/view/View;",
        "Z",
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function0;",
    ),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()

        references.any {
            it.definingClass == "Lcom/ss/android/ugc/aweme/im/common/model/SetSticker;" &&
                it.name == "getSetId" &&
                it.returnType == "Ljava/lang/Long;"
        } && references.any {
            it.definingClass == "Lcom/ss/android/ugc/aweme/im/common/model/SetSticker;" &&
                it.name == "getStaticUrl"
        }
    },
)

internal object DownloadSuccessCoroutineFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf(
        "DownloadAction@71a5.startDownload\$globalListener\$1\$onSuccess\$1",
        "filePath",
        "fileExist",
    ),
    custom = { method, _ -> method.name == "invokeSuspend" },
)

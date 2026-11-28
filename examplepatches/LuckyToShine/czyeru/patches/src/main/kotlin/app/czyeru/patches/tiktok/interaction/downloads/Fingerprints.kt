/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/interaction/downloads/Fingerprints.kt
 */
package app.czyeru.patches.tiktok.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.czyeru.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal object AclCommonShareFingerprint : Fingerprint(
    definingClass = "/ACLCommonShare;",
    name = "getCode",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
)

internal object AclCommonShare2Fingerprint : Fingerprint(
    definingClass = "/ACLCommonShare;",
    name = "getShowType",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
)

internal object AclCommonShare3Fingerprint : Fingerprint(
    definingClass = "/ACLCommonShare;",
    name = "getTranscode",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
)

internal object VideoDownloadUriFingerprint : Fingerprint(
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
    strings = listOf("[tiktok_logo]"),
    parameters = listOf("Landroid/graphics/Bitmap;"),
    returnType = "V",
)

/**
 * The comment sticker preview view's bind method (`X.0I8Y.LIZ` on 47.2.41, `X.17WZ.LIZ` on 47.4.3):
 * a LinearLayout that reads its model's UrlModel, hands it to the static image loader and binds
 * its action buttons through a two-argument method of its own.
 */
internal object StickerPreviewBinderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "L",
        "Z",
        "Ljava/lang/String;",
        "Ljava/util/Map;",
    ),
    custom = custom@{ method, classDef ->
        if (classDef.superclass != "Landroid/widget/LinearLayout;") return@custom false
        val instructions = method.implementation?.instructions ?: return@custom false
        var readsUrlModel = false
        var bindsActionButton = false
        var loadsStickerImage = false

        instructions.forEach { instruction ->
            instruction.getReference<FieldReference>()?.let { field ->
                if (field.type == "Lcom/ss/android/ugc/aweme/base/model/UrlModel;") {
                    readsUrlModel = true
                }
            }

            instruction.getReference<MethodReference>()?.let { methodReference ->
                if (methodReference.definingClass == classDef.type &&
                    methodReference.parameterTypes.size == 2 &&
                    methodReference.returnType == "V"
                ) {
                    bindsActionButton = true
                }

                if (methodReference.parameterTypes.getOrNull(1) == "Lcom/ss/android/ugc/aweme/base/model/UrlModel;" &&
                    methodReference.parameterTypes.size > 10
                ) {
                    loadsStickerImage = true
                }
            }
        }

        readsUrlModel && bindsActionButton && loadsStickerImage
    },
)

/**
 * TikTok's MediaStore helper (`X.0V4z` on 47.2.41, `X.01BZ` on 47.4.3). Its method names are the
 * same on both builds; only the class is renamed, so it is found by the photo lookup's query.
 */
internal object MediaStoreHelperFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/net/Uri;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("image/*", "(relative_path=? OR relative_path=?) AND _display_name=?"),
)

internal object PhotoDownloadUriFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/net/Uri;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("/", "/Camera", "/Camera/"),
    custom = { method, _ ->
        method.implementation?.instructions?.none { instruction ->
            val string = instruction.getReference<StringReference>()?.string ?: return@none false
            string == "image/*" || string.contains("relative_path=?")
        } == true
    },
)

internal object VideoLookupUriFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/net/Uri;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    strings = listOf("/Camera/", "video/*", "(relative_path=? OR relative_path=?) AND _display_name=?"),
)

internal object PhotoLookupUriFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/net/Uri;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("/Camera/", "image/*", "(relative_path=? OR relative_path=?) AND _display_name=?"),
)

internal object VideoMediaStoreInsertFingerprint : Fingerprint(
    classFingerprint = MediaStoreHelperFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/net/Uri;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == "Landroid/provider/MediaStore\$Video\$Media;" &&
                    reference.name == "getContentUri"
            } == true
        } == true
    },
)

internal object PhotoMediaStoreInsertFingerprint : Fingerprint(
    classFingerprint = MediaStoreHelperFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/net/Uri;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == "Landroid/provider/MediaStore\$Images\$Media;" &&
                    reference.name == "getContentUri"
            } == true
        } == true
    },
)

/** `X.0VPx.LJJIJIIJIL` on 47.2.41, `X.03rb.LJJIJIIJIL` on 47.4.3. */
// Found by shape: renamed per build (LJJIJIIJIL on 47.4.3, LJJIJIL on 47.6.3).
internal object ImagePostMediaCopyFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/net/Uri;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
        "Ljava/lang/String;",
        "I",
    ),
    strings = listOf("/Camera/", "video/mp4", "image/jpeg"),
    custom = { method, _ ->
        val calls = method.implementation?.instructions?.mapNotNull { instruction ->
            instruction.getReference<MethodReference>()
        } ?: emptyList()
        // The MediaStore helper's video and photo inserts: two different (Context, 3 strings) -> Uri calls.
        calls.filter { it.returnType == "Landroid/net/Uri;" && it.parameterTypes.size == 4 }
            .map { it.name }.distinct().size >= 2
    },
)

private const val PREVIEW_STICKER_ITEM = "Lcom/ss/android/ugc/aweme/im/common/model/StickerItem;"
private const val PREVIEW_COMMENT_STICKER = "Lcom/ss/android/ugc/aweme/comment/model/CommentStickerStruct;"

internal data class StickerPreviewSource(val struct: FieldReference, val convert: MethodReference)

internal fun Method.stickerPreviewSource(): StickerPreviewSource? {
    val instructions = implementation?.instructions?.toList() ?: return null
    return instructions.indices.mapNotNull { index ->
        val call = instructions[index].takeIf { it.opcode == Opcode.INVOKE_STATIC } as? FiveRegisterInstruction
            ?: return@mapNotNull null
        val convert = call.getReference<MethodReference>()?.takeIf {
            it.returnType == PREVIEW_STICKER_ITEM && it.parameterTypes.map(CharSequence::toString) == listOf(PREVIEW_COMMENT_STICKER)
        } ?: return@mapNotNull null
        val read = instructions.getOrNull(index - 1)?.takeIf { it.opcode == Opcode.IGET_OBJECT } as? TwoRegisterInstruction
            ?: return@mapNotNull null
        val struct = read.getReference<FieldReference>()?.takeIf {
            it.definingClass == definingClass && it.type == PREVIEW_COMMENT_STICKER && read.registerA == call.registerC
        } ?: return@mapNotNull null
        StickerPreviewSource(struct, convert)
    }.distinct().singleOrNull()
}

/**
 * TikTok 47.8.3+ (including 48.0.2) inlined the comment sticker preview into the tap coroutine
 * (`invokeSuspend`) and builds the StickerItem from its `CommentStickerStruct` field.
 */
internal object StickerPreviewCoroutineSourceFingerprint : Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(fieldAccess(definingClass = PREVIEW_STICKER_ITEM, name = "stickerBase")),
    custom = { method, _ ->
        AccessFlags.STATIC.value and method.accessFlags == 0 &&
            method.implementation?.instructions?.any { instruction ->
                instruction.getReference<MethodReference>()?.let(::isStickerPreviewBindCall) == true
            } == true &&
            method.stickerPreviewSource() != null
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
    // `X.0IKC.LJ` on 47.2.41, `X.17WX.LJ` on 47.4.3; it hands the preview model to the binder.
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.getReference<MethodReference>()?.let(::isStickerPreviewBindCall) == true
        } == true
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


/** A call shaped like [StickerPreviewBinderFingerprint]: `(model, boolean, String, Map)V`. */
internal fun isStickerPreviewBindCall(reference: MethodReference) =
    reference.returnType == "V" &&
        reference.parameterTypes.size == 4 &&
        reference.parameterTypes[0].startsWith("L") &&
        reference.parameterTypes.drop(1).map(CharSequence::toString) == listOf("Z", "Ljava/lang/String;", "Ljava/util/Map;")

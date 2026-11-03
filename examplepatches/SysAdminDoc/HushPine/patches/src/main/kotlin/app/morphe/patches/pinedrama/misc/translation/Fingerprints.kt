/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.patches.pinedrama.misc.translation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal object MultiCommentTranslationStartFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "L", "Z"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/ss/android/ugc/aweme/comment/translation/MultiTranslationBody;",
        )
    )
)

internal object BaseCommentCellBindFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/commentv2/commentlist/powercell/BaseCommentCell;",
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("comment_panel"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/ss/android/ugc/aweme/commentv2/commentlist/powercell/BaseCommentCell;",
            returnType = "Lcom/ss/android/ugc/aweme/comment/model/Comment;",
        ),
    ),
)

internal object CommentListLoadedFingerprint : Fingerprint(
    returnType = "V",
    // The filter repeats a reference the custom block requires, so the patcher reads only the
    // classes that make it (#54).
    filters = listOf(
        fieldAccess(definingClass = "Lcom/ss/android/ugc/aweme/comment/model/CommentItemList;", name = "lazySplitItemsParseTask"),
    ),
    custom = { method, _ ->
        val fields = method.implementation?.instructions?.mapNotNull { instruction ->
            instruction.getReference<FieldReference>()
        } ?: emptyList()
        fields.any { reference ->
            reference.definingClass == "Lcom/ss/android/ugc/aweme/comment/model/CommentItemList;" &&
                reference.name == "items" &&
                reference.type == "Ljava/util/List;"
        } && fields.any { reference ->
            reference.definingClass == "Lcom/ss/android/ugc/aweme/comment/model/CommentItemList;" &&
                reference.name == "lazySplitItemsParseTask"
        }
    },
)

/** TikTok's one read of feed_translation_reverse, the lazy that keeps it for the process (#143). */
internal object FeedTranslationReverseFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    strings = listOf(FEED_TRANSLATION_REVERSE),
    custom = { method, _ -> method.feedTranslationReverseRead() != null },
)

/** TikTok's Always translate state, the getter that reads the user's own choice first (#194). */
internal object MasterTranslationStateFingerprint : Fingerprint(
    parameters = listOf(),
    strings = listOf(MASTER_TRANSLATION_KEY),
    custom = { method, _ -> method.isMasterTranslationState() },
)


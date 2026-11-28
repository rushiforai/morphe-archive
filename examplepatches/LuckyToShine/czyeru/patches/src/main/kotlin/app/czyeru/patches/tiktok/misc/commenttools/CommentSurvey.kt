/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.czyeru.patches.tiktok.misc.commenttools

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.PatchException
import app.czyeru.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val COMMENT_SURVEY_ITEM = "Lcom/ss/android/ugc/aweme/comment/experiment/CommentSurveyDataItem;"
internal const val COMMENT_SURVEY_CLASS_DESCRIPTOR = "Lapp/czyeru/extension/tiktok/comment/CommentSurvey;"
internal const val COMMENT_LIST_SURVEY = "Lcom/ss/android/ugc/aweme/comment/model/CommentListSurvey;"
internal const val AWEME_COMMENT_CONFIG = "Lcom/ss/android/ugc/aweme/feed/model/AwemeCommentConfig;"
private const val SURVEY_AWEME = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"

/**
 * TikTok's comment survey config up to 47.9.3: static, parameterless, returning
 * [COMMENT_SURVEY_ITEM] or null.
 */
internal object CommentSurveyConfigFingerprint : Fingerprint(
    returnType = COMMENT_SURVEY_ITEM,
    parameters = emptyList(),
    // It reads its cached survey array, which lets the type index find it without a full walk.
    filters = listOf(fieldAccess(type = "[$COMMENT_SURVEY_ITEM")),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

/**
 * TikTok's comment survey resolver from 48.0.2: reads the video's commentListSurvey on
 * [AWEME_COMMENT_CONFIG] and returns a holder of the survey item, or an empty holder instance.
 */
internal object CommentSurveyResolverFingerprint : Fingerprint(
    parameters = listOf(SURVEY_AWEME),
    filters = listOf(
        fieldAccess(definingClass = AWEME_COMMENT_CONFIG, name = "hasCommentListSurveyResponse", type = "Z"),
        fieldAccess(definingClass = AWEME_COMMENT_CONFIG, name = "commentListSurvey", type = COMMENT_LIST_SURVEY),
    ),
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType.startsWith("L") &&
            method.returnType != COMMENT_SURVEY_ITEM
    },
)

/**
 * The resolver's own no-survey answer: the one static field of its holder type, of that same type,
 * that the resolver loads. It's what the resolver answers for a video without a survey.
 */
internal fun Method.noCommentSurveyAnswer(): FieldReference {
    val holder = returnType
    val loads = implementation?.instructions?.toList().orEmpty()
        .filter { it.opcode == Opcode.SGET_OBJECT }
        .mapNotNull { it.getReference<FieldReference>() }
        .filter { it.definingClass == holder && it.type == holder }
        .distinctBy { "${it.definingClass}->${it.name}:${it.type}" }
    return loads.singleOrNull() ?: throw PatchException(
        "Comment tools: expected the survey resolver $definingClass->$name to load one empty " +
            "$holder, found ${loads.size}",
    )
}

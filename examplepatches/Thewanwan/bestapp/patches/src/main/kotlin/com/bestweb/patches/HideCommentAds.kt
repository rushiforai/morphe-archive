package com.bestweb.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch

val hideCommentAds = bytecodePatch(
    name = "Hide comment ads",
    description = "Blocks ad items in comment sections (TAG_AT_AD, TAG_COMMENT_AD, TAG_LIKE_AD)",
    default = true
) {
    compatibleWith(WEIBO_COMPATIBILITY)

    execute {
        val commentViewFingerprint = Fingerprint(
            definingClass = "Lcom/sina/weibo/weiyou/feed/view/CommentMessageListItemView;",
            strings = listOf("TAG_AT_AD", "TAG_COMMENT_AD", "TAG_LIKE_AD")
        )

        commentViewFingerprint.matchAllOrNull()?.forEach { match ->
            match.method.addInstructions(0, "return-void")
        }
    }
}

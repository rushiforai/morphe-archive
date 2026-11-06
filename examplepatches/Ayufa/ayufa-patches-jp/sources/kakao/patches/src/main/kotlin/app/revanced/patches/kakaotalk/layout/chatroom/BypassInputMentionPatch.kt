package app.revanced.patches.kakaotalk.layout.chatroom

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.revanced.patches.kakaotalk.layout.chatroom.fingerprints.MentionComponentIsMultiChatFingerprint
import app.revanced.patches.kakaotalk.shared.Constants.COMPATIBILITY_KAKAO

@Suppress("unused")
val bypassInputMentionPatch = bytecodePatch(
    name = "Bypass input mention limit in non-multichat",
    description = "複数人チャット以外のルームでのメンション入力数制限を回避します",
) {
    compatibleWith(COMPATIBILITY_KAKAO)

    execute {
        MentionComponentIsMultiChatFingerprint.method.returnEarly(true)
    }
}
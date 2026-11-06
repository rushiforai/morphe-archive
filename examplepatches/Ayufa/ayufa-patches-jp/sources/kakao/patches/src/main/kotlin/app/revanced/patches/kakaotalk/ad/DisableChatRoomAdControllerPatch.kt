package app.revanced.patches.kakaotalk.ad

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.revanced.patches.kakaotalk.ad.fingerprints.OpenLinkChatAdControllerLoadFingerprint
import app.revanced.patches.kakaotalk.shared.Constants.COMPATIBILITY_KAKAO

@Suppress("unused")
val disableChatRoomAdControllerPatch = bytecodePatch(
    name = "Disable ChatRoomAdController",
    description = "オープンリンクチャットルームのBizBoard広告コントローラーを無効化します。",
) {
    compatibleWith(COMPATIBILITY_KAKAO)

    execute {
        OpenLinkChatAdControllerLoadFingerprint.method.returnEarly()
    }
}
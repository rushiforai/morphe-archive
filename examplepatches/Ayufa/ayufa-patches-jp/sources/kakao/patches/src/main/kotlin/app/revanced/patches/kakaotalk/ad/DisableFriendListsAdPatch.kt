package app.revanced.patches.kakaotalk.ad

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.revanced.patches.kakaotalk.ad.fingerprints.BirthdayFriendsBizBoardBindFingerprint
import app.revanced.patches.kakaotalk.ad.fingerprints.FriendListChipBizBoardBindFingerprint
import app.revanced.patches.kakaotalk.ad.fingerprints.FriendTabGlobalAdModelFingerprint
import app.revanced.patches.kakaotalk.shared.Constants.COMPATIBILITY_KAKAO

@Suppress("unused")
val disableFriendListsAdPatch = bytecodePatch(
    name = "Disable Friend Lists ad",
    description = "KakaoTalkの友だちタブのBizBoard広告とグローバル地域広告を無効化します。",
) {
    compatibleWith(COMPATIBILITY_KAKAO)

    execute {
        FriendListChipBizBoardBindFingerprint.method.returnEarly()
        BirthdayFriendsBizBoardBindFingerprint.method.returnEarly()
        FriendTabGlobalAdModelFingerprint.method.returnEarly(null)
    }
}

package app.revanced.patches.kakaotalk.ad

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.revanced.patches.kakaotalk.ad.fingerprints.LoadFocusAdFingerprint
import app.revanced.patches.kakaotalk.shared.Constants.COMPATIBILITY_KAKAO

@Suppress("unused")
val removeFocusAdPatch = bytecodePatch(
    name = "Remove focus ad",
    description = "アプリからフォーカス広告を除去します。",
) {
    compatibleWith(COMPATIBILITY_KAKAO)

    execute {
        LoadFocusAdFingerprint.method.returnEarly(true)
    }
}
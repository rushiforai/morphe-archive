package app.ayufa.patches.transit.promotion

import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.transit.shared.Constants.COMPATIBILITY_YAHOO_TRANSIT
import app.ayufa.patches.transit.shared.finishImmediatelyAfterSuperOnCreate

@Suppress("unused")
val hideTransitPromotionsPatch = bytecodePatch(
    name = "プロモーションを非表示",
    description = "Yahoo!乗換案内のLY連携プロモーションモーダルを" +
        "表示しません。",
    default = true
) {
    compatibleWith(COMPATIBILITY_YAHOO_TRANSIT)

    execute {
        // The modal activity closes itself before it can render.
        LyLinkagePromotionModalOnCreateFingerprint.method
            .finishImmediatelyAfterSuperOnCreate()
    }
}

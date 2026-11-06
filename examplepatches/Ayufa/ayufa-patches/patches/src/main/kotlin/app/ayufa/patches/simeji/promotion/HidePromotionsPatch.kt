package app.ayufa.patches.simeji.promotion

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.finishIfEnabledAfterSuperOnCreate

/**
 * The full-screen promotion activity (campaign / upsell pages).
 * Verified against Simeji 20.7.
 */
internal object PromotionActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/home/promotion/PromotionActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

@Suppress("unused")
val hidePromotionsPatch = bytecodePatch(
    name = "プロモーションを非表示",
    description = "全画面のプロモーション画面（キャンペーンやアップセルの" +
        "ページ）を開かないようにします。有効・無効はアプリ内設定" +
        "（Ayufaパッチ設定）でいつでも切り替えられます。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    execute {
        PromotionActivityOnCreateFingerprint.method
            .finishIfEnabledAfterSuperOnCreate("hidePromotions", "ayufa_hide_promotions")
    }
}

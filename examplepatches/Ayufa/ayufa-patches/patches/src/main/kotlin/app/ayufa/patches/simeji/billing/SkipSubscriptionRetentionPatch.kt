package app.ayufa.patches.simeji.billing

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.finishIfEnabledAfterSuperOnCreate

/**
 * The retention ("please stay") screen shown when cancelling a VIP
 * subscription. Verified against Simeji 20.7.
 */
internal object SubscriptionKeepActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/billing/subscription/SubscriptionKeepAct;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

@Suppress("unused")
val skipSubscriptionRetentionPatch = bytecodePatch(
    name = "解約時の引き止め画面をスキップ",
    description = "VIPサブスクリプション解約時に表示される引き止め画面を" +
        "スキップし、そのまま解約フローへ進みます。有効・無効はアプリ内" +
        "設定（Ayufaパッチ設定）でいつでも切り替えられます。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    execute {
        SubscriptionKeepActivityOnCreateFingerprint.method
            .finishIfEnabledAfterSuperOnCreate(
                "skipSubscriptionRetention", "ayufa_skip_retention"
            )
    }
}

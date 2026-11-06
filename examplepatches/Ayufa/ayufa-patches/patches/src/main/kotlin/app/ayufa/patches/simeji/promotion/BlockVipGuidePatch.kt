package app.ayufa.patches.simeji.promotion

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.finishIfEnabledAfterSuperOnCreate

/**
 * The VIP guide / plan screen. It doubles as the in-app subscription
 * purchase screen. Verified against Simeji 20.7.
 */
internal object VipLevelGuideActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/home/vip/VipLevelGuideActivityNew;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

@Suppress("unused")
val blockVipGuidePatch = bytecodePatch(
    name = "VIP案内画面をブロック",
    description = "VIPの案内画面を開かないようにします。注意: この画面は" +
        "アプリ内のサブスクリプション購入画面も兼ねているため、ブロック中は" +
        "アプリ内から契約できなくなります。有効・無効はアプリ内設定" +
        "（Ayufaパッチ設定）でいつでも切り替えられます。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    execute {
        VipLevelGuideActivityOnCreateFingerprint.method
            .finishIfEnabledAfterSuperOnCreate("blockVipGuide", "ayufa_block_vip_guide")
    }
}

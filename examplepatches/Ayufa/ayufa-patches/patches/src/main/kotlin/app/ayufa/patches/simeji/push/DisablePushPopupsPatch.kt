package app.ayufa.patches.simeji.push

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.finishIfEnabledAfterSuperOnCreate

/**
 * The dialog-style activity shown for push campaign messages.
 * Verified against Simeji 20.7.
 */
internal object PopupMsgDialogActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/push/PopupMsgDialogActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

@Suppress("unused")
val disablePushPopupsPatch = bytecodePatch(
    name = "プッシュポップアップを無効化",
    description = "プッシュキャンペーンのポップアップダイアログを表示しなく" +
        "します。通常の通知には影響しません。有効・無効はアプリ内設定" +
        "（Ayufaパッチ設定）でいつでも切り替えられます。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    execute {
        PopupMsgDialogActivityOnCreateFingerprint.method
            .finishIfEnabledAfterSuperOnCreate(
                "disablePushPopups", "ayufa_disable_push_popups"
            )
    }
}

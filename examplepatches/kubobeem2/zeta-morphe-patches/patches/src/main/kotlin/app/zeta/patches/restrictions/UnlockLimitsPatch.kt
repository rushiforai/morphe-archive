package app.zeta.patches.restrictions

import app.morphe.patcher.patch.patch
import app.zeta.patches.shared.Constants.ZETA

@Suppress("unused")
val unlockLimitsPatch = patch(
    name = "Unlock Client Restrictions",
    description = "メッセージ入力文字数制限（maxLength）の緩和およびクライアント側の送信クールダウン待機時間を解除します。",
    default = true
) {
    compatibleWith(ZETA)

    extendWith("extensions/extension.mpe")

    execute {
        // クライアント側の文字数制限緩和フック
    }
}

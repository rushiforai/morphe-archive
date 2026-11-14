package app.zeta.patches.tps

import app.morphe.patcher.patch.patch
import app.zeta.patches.shared.Constants.ZETA

@Suppress("unused")
val tpsPatch = patch(
    name = "LLM Tokens Per Second Monitor",
    description = "チャット生成時の t/s (Tokens Per Second) をリアルタイム計測し、画面上部にフローティングHUDバッジで表示します。",
    default = true
) {
    compatibleWith(ZETA)

    extendWith("extensions/extension.mpe")

    execute {
        // ストリーミング受信時の計測フック
    }
}

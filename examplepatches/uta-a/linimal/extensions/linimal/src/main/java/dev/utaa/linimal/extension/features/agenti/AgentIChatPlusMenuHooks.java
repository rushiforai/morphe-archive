package dev.utaa.linimal.extension.features.agenti;

import dev.utaa.linimal.extension.config.LinimalConfig;

/** トークの ＋ メニュー上部にある「トークルームのAgent iを表示」の切り替えを fail-open で調整します。 */
public final class AgentIChatPlusMenuHooks {
    private AgentIChatPlusMenuHooks() {
    }

    /**
     * LINE が切り替えの ComposeView を表示するかどうかの値を受け取り、抑制時だけ false にします。
     * false のとき LINE 自身の経路で View は GONE になり、中身の Compose も組み立てられません。
     * 設定が OFF、未初期化、または読取時の例外では必ず元の値を返します。
     */
    public static boolean adjustToggleVisibility(boolean originalVisibility) {
        try {
            return adjustToggleVisibilityForSuppression(
                    originalVisibility,
                    LinimalConfig.get().isAgentIChatPlusMenuSuppressionEnabled());
        } catch (Throwable ignored) {
            return originalVisibility;
        }
    }

    static boolean adjustToggleVisibilityForSuppression(boolean originalVisibility, boolean suppressionEnabled) {
        return suppressionEnabled ? false : originalVisibility;
    }
}

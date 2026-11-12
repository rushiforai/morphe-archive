package dev.utaa.linimal.extension.features;

import dev.utaa.linimal.extension.config.LinimalConfig;

/** ホームのフィードにあるライブ配信のカードを Compose 前に抑制するための runtime gate です。 */
public final class HomeFeedLiveHooks {
    private HomeFeedLiveHooks() {
    }

    /**
     * 「ライブ配信を表示しない」が ON の場合だけ、ライブ配信のカードの描画を省きます。
     * 設定 OFF、未初期化、または設定読み取り時の例外では false を返し、LINE の元の描画を実行します。
     */
    public static boolean shouldSuppress() {
        return HomeSuppressionGate.shouldSuppress(new HomeSuppressionGate.SuppressionState() {
            @Override
            public boolean isSuppressionEnabled() {
                return LinimalConfig.get().isHomeFeedLiveSuppressionEnabled();
            }
        });
    }
}

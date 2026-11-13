package dev.utaa.linimal.extension.features;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.config.LinimalConfigHealth;

/**
 * オープンチャットの広告枠を作るかどうかの判定に割り込みます。true を返すと LINE は広告の種類を
 * NONE として扱い、埋め込み広告の枠も作りません。設定を読めない場合は false を返し、公式の判定を使います。
 */
public final class SquareAdsHooks {
    private SquareAdsHooks() {
    }

    public static boolean shouldSuppressAds() {
        try {
            LinimalConfig config = LinimalConfig.get();
            return config.getRuntimeHealth() == LinimalConfigHealth.OK && config.isSquareAdsSuppressionEnabled();
        } catch (Throwable ignored) {
            return false;
        }
    }
}

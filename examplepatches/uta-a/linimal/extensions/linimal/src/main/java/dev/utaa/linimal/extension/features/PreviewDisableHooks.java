package dev.utaa.linimal.extension.features;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.config.LinimalConfigHealth;

/**
 * トーク一覧の長押しでプレビューを開くかどうかの判定に割り込みます。true を返すと LINE は
 * プレビューではなく従来の長押しメニューを開きます。設定を読めない場合は false を返し、公式の判定を使います。
 */
public final class PreviewDisableHooks {
    private PreviewDisableHooks() {
    }

    public static boolean shouldDisablePreview() {
        try {
            LinimalConfig config = LinimalConfig.get();
            return config.getRuntimeHealth() == LinimalConfigHealth.OK && config.isPreviewDisableEnabled();
        } catch (Throwable ignored) {
            return false;
        }
    }
}

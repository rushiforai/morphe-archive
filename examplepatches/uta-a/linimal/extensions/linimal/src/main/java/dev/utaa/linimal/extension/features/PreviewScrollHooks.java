package dev.utaa.linimal.extension.features;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.config.LinimalConfigHealth;

/** プレビューのスクロール可否だけを調整し、設定を読めない場合は元の値を保ちます。 */
public final class PreviewScrollHooks {
    private PreviewScrollHooks() {
    }

    public static boolean allowScroll(boolean original) {
        try {
            LinimalConfig config = LinimalConfig.get();
            return original || (config.getRuntimeHealth() == LinimalConfigHealth.OK
                    && config.isPreviewScrollEnabled());
        } catch (Throwable ignored) {
            return original;
        }
    }
}

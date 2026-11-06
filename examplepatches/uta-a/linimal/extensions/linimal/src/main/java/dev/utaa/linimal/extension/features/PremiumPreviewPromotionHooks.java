package dev.utaa.linimal.extension.features;

import dev.utaa.linimal.extension.config.LinimalConfig;

/**
 * スクロールプレビュー画面で LINE Premium へ誘導する UI の model を、表示前に差し替えます。
 *
 * <p>LINE 自身も条件を満たさないときは null を渡すため、null を返すとその UI は描かれません。
 * 設定 OFF、未初期化、または読み取り失敗時は受け取った model をそのまま返します。プレビューを
 * スクロールできるかどうかや、課金・購読の判定には触れません。</p>
 */
public final class PremiumPreviewPromotionHooks {
    private PremiumPreviewPromotionHooks() {
    }

    /**
     * プレビューのバナー。{@code leadsToPremium} はタップ先が Premium 特典の画面であるかどうかで、
     * タップ先のない「画面をスクロールできます」の案内は抑制時も残します。
     */
    public static Object previewBanner(Object banner, boolean leadsToPremium) {
        try {
            return adjustPreviewBanner(banner, leadsToPremium, isSuppressionEnabled());
        } catch (Throwable ignored) {
            return banner;
        }
    }

    /** プレビューのメニューにある Premium 誘導行。この行は常に Premium へ誘導します。 */
    public static Object promotionMenuItem(Object menuItem) {
        try {
            return adjustPromotionMenuItem(menuItem, isSuppressionEnabled());
        } catch (Throwable ignored) {
            return menuItem;
        }
    }

    static Object adjustPreviewBanner(Object banner, boolean leadsToPremium, boolean suppressionEnabled) {
        return suppressionEnabled && leadsToPremium ? null : banner;
    }

    static Object adjustPromotionMenuItem(Object menuItem, boolean suppressionEnabled) {
        return suppressionEnabled ? null : menuItem;
    }

    private static boolean isSuppressionEnabled() {
        return LinimalConfig.get().isPremiumPreviewPromotionSuppressionEnabled();
    }
}

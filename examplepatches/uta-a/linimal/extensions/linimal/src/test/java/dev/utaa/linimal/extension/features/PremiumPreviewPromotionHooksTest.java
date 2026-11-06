package dev.utaa.linimal.extension.features;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import org.junit.Test;

/** スクロールプレビューの Premium 案内 hook の判定と fail-open 契約を検証します。 */
public final class PremiumPreviewPromotionHooksTest {
    private final Object banner = new Object();
    private final Object menuItem = new Object();

    @Test
    public void disabledSuppressionKeepsEveryModel() {
        assertSame(banner, PremiumPreviewPromotionHooks.adjustPreviewBanner(banner, true, false));
        assertSame(banner, PremiumPreviewPromotionHooks.adjustPreviewBanner(banner, false, false));
        assertSame(menuItem, PremiumPreviewPromotionHooks.adjustPromotionMenuItem(menuItem, false));
    }

    @Test
    public void enabledSuppressionHidesOnlyThePremiumBanner() {
        assertNull(PremiumPreviewPromotionHooks.adjustPreviewBanner(banner, true, true));
        // タップ先のない「画面をスクロールできます」の案内は Premium への誘導ではないため残します。
        assertSame(banner, PremiumPreviewPromotionHooks.adjustPreviewBanner(banner, false, true));
    }

    @Test
    public void enabledSuppressionHidesThePromotionMenuItem() {
        assertNull(PremiumPreviewPromotionHooks.adjustPromotionMenuItem(menuItem, true));
    }

    @Test
    public void absentModelsStayAbsent() {
        assertNull(PremiumPreviewPromotionHooks.adjustPreviewBanner(null, false, true));
        assertNull(PremiumPreviewPromotionHooks.adjustPreviewBanner(null, false, false));
        assertNull(PremiumPreviewPromotionHooks.adjustPromotionMenuItem(null, false));
    }

    @Test
    public void unavailableConfigurationPreservesLineRendering() {
        // この単体テストでは LinimalConfig を初期化しないため、runtime の初期値は fail-open です。
        assertSame(banner, PremiumPreviewPromotionHooks.previewBanner(banner, true));
        assertSame(menuItem, PremiumPreviewPromotionHooks.promotionMenuItem(menuItem));
    }
}

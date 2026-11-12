package dev.utaa.linimal.extension.features.agenti;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** ＋ メニューの Agent i 切り替えの runtime gate を Android framework なしで検証します。 */
public final class AgentIChatPlusMenuHooksTest {
    @Test
    public void offPreservesTheOriginalVisibility() {
        assertTrue(AgentIChatPlusMenuHooks.adjustToggleVisibilityForSuppression(true, false));
        assertFalse(AgentIChatPlusMenuHooks.adjustToggleVisibilityForSuppression(false, false));
    }

    @Test
    public void onHidesTheToggle() {
        assertFalse(AgentIChatPlusMenuHooks.adjustToggleVisibilityForSuppression(true, true));
        assertFalse(AgentIChatPlusMenuHooks.adjustToggleVisibilityForSuppression(false, true));
    }

    @Test
    public void uninitializedConfigKeepsTheOriginalVisibility() {
        // 初期化前の LinimalConfig は fail-open で、元の値をそのまま返します。
        assertTrue(AgentIChatPlusMenuHooks.adjustToggleVisibility(true));
        assertFalse(AgentIChatPlusMenuHooks.adjustToggleVisibility(false));
    }
}

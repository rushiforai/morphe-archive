package dev.utaa.linimal.extension.features;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public final class MainTabRestoreHooksTest {
    private enum Tab {
        HOME, TIMELINE, NEWS, WALLET, CHAT
    }

    private static MainTabHooks.HiddenTabs hiding(boolean news, boolean wallet) {
        return new MainTabHooks.HiddenTabs(news, wallet, false, false);
    }

    @Test
    public void hiddenTabAtNonZeroPositionIsReset() {
        assertTrue(MainTabHooks.resetsHiddenPageForState(Tab.NEWS, 3, hiding(true, false)));
        assertTrue(MainTabHooks.resetsHiddenPageForState(Tab.WALLET, 2, hiding(false, true)));
    }

    @Test
    public void voomIsAlwaysReset() {
        assertTrue(MainTabHooks.resetsHiddenPageForState(Tab.TIMELINE, 1, hiding(false, false)));
    }

    @Test
    public void visibleTabIsNotReset() {
        assertFalse(MainTabHooks.resetsHiddenPageForState(Tab.CHAT, 1, hiding(true, true)));
        assertFalse(MainTabHooks.resetsHiddenPageForState(Tab.NEWS, 3, hiding(false, false)));
    }

    @Test
    public void positionZeroIsNeverResetSoTheResetCannotLoop() {
        assertFalse(MainTabHooks.resetsHiddenPageForState(Tab.TIMELINE, 0, hiding(true, true)));
    }

    @Test
    public void nullTabAndNegativePositionAreNotReset() {
        assertFalse(MainTabHooks.resetsHiddenPageForState(null, 2, hiding(true, true)));
        assertFalse(MainTabHooks.resetsHiddenPageForState(Tab.NEWS, -1, hiding(true, true)));
    }

    @Test
    public void unconfiguredPublicHookFailsOpen() {
        assertFalse(MainTabHooks.resetsHiddenPage(Tab.CHAT, 1));
    }
}

/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import com.facebook.friending.tab.FriendRequestsTab;

public final class HiddenTabsForTests {
    private HiddenTabsForTests() {
    }

    /**
     * Asks the hook about the Friends tab, which Facebook's own settings don't hide, with the patch
     * in the build. True when it takes the tab off, which is a switch changing what Facebook would
     * have done.
     */
    public static boolean hidesTheTab() {
        Boolean before = HiddenTabs.inBuildForTests;
        HiddenTabs.inBuildForTests = Boolean.TRUE;
        try {
            return HiddenTabs.hidesTab(false, new FriendRequestsTab());
        } finally {
            HiddenTabs.inBuildForTests = before;
            HiddenTabs.clearForTests();
        }
    }
}

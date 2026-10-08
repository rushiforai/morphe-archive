/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import com.facebook.friending.tab.FriendRequestsTab;

public final class TabBadgesForTests {
    private TabBadgesForTests() {
    }

    /**
     * Asks the tab bar's count hook about the Friends tab, with Hide tab badges in the build. True
     * when it answers none for it, which is a switch changing what Facebook would have shown.
     */
    public static boolean clearsTheFriendsTab() {
        Boolean before = TabBadges.inBuildForTests;
        TabBadges.inBuildForTests = Boolean.TRUE;
        try {
            return ReelsTabDot.clear(new FriendRequestsTab());
        } finally {
            TabBadges.inBuildForTests = before;
        }
    }

    /** Hands a launcher writer's count of 4 to the icon hook. True when it's written as 0. */
    public static boolean clearsTheIcon() {
        return TabBadges.iconCount(4) == 0;
    }
}

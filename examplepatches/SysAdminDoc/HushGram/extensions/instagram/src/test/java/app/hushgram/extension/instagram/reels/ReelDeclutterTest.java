/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.reels;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;

/** Which parts of the Reels viewer each of the three switches leaves out. */
@RunWith(RobolectricTestRunner.class)
public class ReelDeclutterTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Test
    public void withTheSwitchesOnEveryPartIsHidden() {
        assertTrue(ReelDeclutter.hideFollowButton());
        assertTrue(ReelDeclutter.hideChips());
        assertTrue(ReelDeclutter.hideSocialFooter());
        assertTrue(ReelDeclutter.hideSocialContext(LineType.FOLLOWED_BY));
    }

    /** Each switch answers for its own parts only. */
    @Test
    public void eachSwitchTurnsOffOnlyItsOwnParts() {
        Settings.HIDE_REEL_CHIPS.save(false);
        try {
            assertFalse(ReelDeclutter.hideChips());
            assertTrue(ReelDeclutter.hideFollowButton());
            assertTrue(ReelDeclutter.hideSocialFooter());
            assertTrue(ReelDeclutter.hideSocialContext(LineType.LIKED_BY));
        } finally {
            Settings.HIDE_REEL_CHIPS.save(true);
        }
        Settings.HIDE_REEL_FOLLOW_BUTTON.save(false);
        Settings.HIDE_REEL_SOCIAL_FOOTER.save(false);
        try {
            assertFalse(ReelDeclutter.hideFollowButton());
            assertFalse(ReelDeclutter.hideSocialFooter());
            assertTrue(ReelDeclutter.hideChips());
        } finally {
            Settings.HIDE_REEL_FOLLOW_BUTTON.save(true);
            Settings.HIDE_REEL_SOCIAL_FOOTER.save(true);
        }
    }

    /** Named like the enum Instagram 449 hands its social context check, a few of its types. */
    private enum LineType { FOLLOWED_BY, LIKED_BY, VIEWED_BY_FRIENDS, FOLLOWER_COUNT, SELLER_RNR, EFFECT_USED_BY_PEOPLE }

    /** Lines about people you know go; a follower count, a rating or what strangers did stays. */
    @Test
    public void onlyFriendsActivityLinesAreLeftOut() {
        assertTrue(ReelDeclutter.hideSocialContext(LineType.FOLLOWED_BY));
        assertTrue(ReelDeclutter.hideSocialContext(LineType.LIKED_BY));
        assertTrue(ReelDeclutter.hideSocialContext(LineType.VIEWED_BY_FRIENDS));
        assertFalse(ReelDeclutter.hideSocialContext(LineType.FOLLOWER_COUNT));
        assertFalse(ReelDeclutter.hideSocialContext(LineType.SELLER_RNR));
        assertFalse(ReelDeclutter.hideSocialContext(LineType.EFFECT_USED_BY_PEOPLE));
    }

    @Test
    public void withItsSwitchOffEveryLineStays() {
        Settings.HIDE_REEL_SOCIAL_FOOTER.save(false);
        try {
            assertFalse(ReelDeclutter.hideSocialContext(LineType.FOLLOWED_BY));
            assertFalse(ReelDeclutter.hideSocialContext(LineType.LIKED_BY));
        } finally {
            Settings.HIDE_REEL_SOCIAL_FOOTER.save(true);
        }
    }

    /** Something that isn't a type, or a type's name as a string, is never taken for one. */
    @Test
    public void anythingButTheTypeStays() {
        assertFalse(ReelDeclutter.hideSocialContext(null));
        assertFalse(ReelDeclutter.hideSocialContext("FOLLOWED_BY"));
        assertFalse(ReelDeclutter.hideSocialContext(new Object()));
    }
}

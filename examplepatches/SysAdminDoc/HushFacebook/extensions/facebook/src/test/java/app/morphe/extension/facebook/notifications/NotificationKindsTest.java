/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.notifications;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.PatchFamily;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.navigation.MarketplaceOnlyForTests;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The hook before Facebook posts a push notification: every switch starts off, each one blocks
 * only its own kinds, the kinds people rely on (messages, friend requests, comments, mentions,
 * calls, login alerts) and any kind it doesn't know always post, and so does everything while
 * paused or before the settings are ready.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class NotificationKindsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /**
     * Kinds that must never be blocked, by the constant names Facebook gives them on 577 and 580:
     * messages, friend requests, comments, replies and mentions on your content, calls, events,
     * payments and every login or security alert, and the kind Facebook falls back to for a type
     * it doesn't know.
     */
    static final List<String> ALWAYS_POST = Arrays.asList(
            "MSG", "ORCA_MESSAGE", "ORCA_FRIEND_MSG", "MESSAGE_REQUEST", "MESSAGING_IN_BLUE_DIRECT_MESSAGE",
            "MESSAGING_IN_BLUE_SUBSEQUENT_MESSAGE", "FRIEND", "FRIEND_CONFIRMED", "FEED_COMMENT",
            "COMMENT_MENTION", "MENTION", "MENTIONS_COMMENT", "GROUP_COMMENT", "GROUP_COMMENT_REPLY",
            "GROUP_COMMENT_MENTION", "GROUP_POST_MENTION", "PHOTO_COMMENT", "VIDEO_COMMENT", "WALL", "LIKE",
            "EVENT_INVITE", "P2P_PAYMENT", "VOIP", "WEBRTC_VOIP_CALL", "LOGIN_APPROVALS_PUSH_AUTH",
            "HOTP_LOGIN_APPROVALS", "PLATFORM_LOGIN_APPROVAL", "LA_PUSH_AUTHENTICATE", "AUTHENTICATION_FAILED",
            "DEVICE_REQUEST", "GROUP_ACTIVITY", "LIVE_VIDEO_EXPLICIT", "DEFAULT_PUSH_OF_JEWEL_NOTIF", "UNKNOWN");

    /** The six switches, in the order the settings screen shows them. Settings loads with the context, so not static. */
    private static List<BooleanSetting> switches() {
        return Arrays.asList(
                Settings.BLOCK_TRENDING_VIDEO_NOTIFICATIONS, Settings.BLOCK_MEMORY_NOTIFICATIONS,
                Settings.BLOCK_BIRTHDAY_NOTIFICATIONS, Settings.BLOCK_HIGHLIGHT_NOTIFICATIONS,
                Settings.BLOCK_PEOPLE_YOU_MAY_KNOW_NOTIFICATIONS, Settings.BLOCK_NEARBY_NOTIFICATIONS);
    }

    @Before
    public void startClean() {
        NotificationKindsForTests.newProcess();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        MarketplaceOnlyForTests.inBuild(null);
        Settings.MARKETPLACE_ONLY.resetToDefault();
        Settings.MARKETPLACE_QUIET_NOTIFICATIONS.resetToDefault();
        for (BooleanSetting setting : switches()) setting.resetToDefault();
        NotificationKindsForTests.newProcess();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static void allOn() {
        for (BooleanSetting setting : switches()) setting.save(true);
    }

    private static String line(List<String> report, String prefix) {
        for (String line : report) {
            if (line.startsWith(prefix + ":")) return line;
        }
        return null;
    }

    /** Each switch drops a whole kind of notification, so nothing is blocked until you say so. */
    @Test
    public void everySwitchStartsOffAndNothingIsBlocked() {
        for (BooleanSetting setting : switches()) assertFalse(setting.key + " starts on", setting.get());
        for (String kind : NotificationKinds.KINDS.keySet()) {
            assertFalse(kind + " was blocked with every switch off", NotificationKinds.block(kind.toLowerCase()));
        }
    }

    /** The family's switches are exactly the ones the kinds map to, and each has kinds of its own. */
    @Test
    public void everySwitchHasItsKindsAndEveryKindItsSwitch() {
        Set<BooleanSetting> reached = new HashSet<>();
        for (String kind : NotificationKinds.KINDS.keySet()) reached.add(NotificationKinds.switchFor(kind));
        assertEquals(new HashSet<>(switches()), reached);
        assertEquals(switches(), PatchFamily.PROMO_NOTIFICATIONS.switches);
    }

    /** Each switch blocks its own kinds and nothing else. */
    @Test
    public void eachKindGoesByItsOwnSwitch() {
        for (BooleanSetting on : switches()) {
            for (BooleanSetting setting : switches()) setting.save(setting == on);
            for (Map.Entry<String, NotificationKinds.Group> kind : NotificationKinds.KINDS.entrySet()) {
                boolean mine = kind.getValue().setting() == on;
                assertEquals(kind.getKey() + " with only " + on.key + " on", mine,
                        NotificationKinds.block(kind.getKey().toLowerCase()));
            }
        }
        Settings.BLOCK_BIRTHDAY_NOTIFICATIONS.save(true);
        Settings.BLOCK_MEMORY_NOTIFICATIONS.save(false);
        assertTrue(NotificationKindsForTests.blocksBirthday());
        assertFalse(NotificationKindsForTests.blocksMemory());
    }

    @Test
    public void marketplaceQuietIsOptionalAndNeverRewritesTheIndividualChoices() {
        MarketplaceOnlyForTests.inBuild(true);
        Settings.MARKETPLACE_ONLY.save(true);
        assertFalse(NotificationKinds.block("TOP_TRENDING_VIDEO"));
        Settings.MARKETPLACE_QUIET_NOTIFICATIONS.save(true);
        for (String kind : Arrays.asList("TOP_TRENDING_VIDEO", "PERSONALIZED_REELS", "ONTHISDAY",
                "BIRTHDAY_REMINDER", "PYMK_EMAIL")) {
            assertTrue(kind, NotificationKinds.block(kind));
        }
        for (String kind : ALWAYS_POST) assertFalse(kind, NotificationKinds.block(kind));
        for (String kind : Arrays.asList("GROUP_HIGHLIGHTS", "PAGE_HIGHLIGHTS", "NEAR_SAVED_PLACE",
                "MARKETPLACE_MESSAGE", "MARKETPLACE_ORDER_UPDATE", "SOME_FUTURE_KIND")) {
            assertFalse(kind, NotificationKinds.block(kind));
        }
        for (BooleanSetting setting : switches()) assertFalse(setting.key, setting.savedValue());

        Settings.BLOCK_MEMORY_NOTIFICATIONS.save(true);
        Settings.MARKETPLACE_ONLY.save(false);
        assertFalse(NotificationKinds.block("TOP_TRENDING_VIDEO"));
        assertTrue(NotificationKinds.block("ONTHISDAY"));
        assertTrue(Settings.MARKETPLACE_QUIET_NOTIFICATIONS.savedValue());
        Settings.MARKETPLACE_ONLY.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(NotificationKinds.block("ONTHISDAY"));
        assertFalse(NotificationKinds.block("TOP_TRENDING_VIDEO"));
        PauseForTests.resume();
        MarketplaceOnlyForTests.inBuild(false);
        assertFalse(NotificationKinds.block("TOP_TRENDING_VIDEO"));
    }

    /** With every switch on, what people rely on still posts, and none of it is a kind with a switch. */
    @Test
    public void messagesFriendRequestsCommentsAndLoginAlertsAlwaysPost() {
        allOn();
        for (String kind : ALWAYS_POST) {
            assertFalse(kind + " has a switch", NotificationKinds.KINDS.containsKey(kind));
            assertNull(kind + " has a switch", NotificationKinds.switchFor(kind));
            assertFalse(kind + " was blocked", NotificationKinds.block(kind.toLowerCase()));
            assertFalse(kind + " was blocked", NotificationKinds.block(kind));
        }
        // Positive control: the same run does block a kind that has its switch on.
        assertTrue(NotificationKindsForTests.blocksTrendingVideo());
    }

    /**
     * The type is read the way Facebook reads it: the part before the first colon, ignoring case.
     * A longer name isn't a prefix match, and a type that isn't made of a constant name's
     * characters, or none at all, posts.
     */
    @Test
    public void typesAreReadAsFacebookReadsThemAndUnknownOnesPost() {
        allOn();
        assertTrue(NotificationKinds.block("top_trending_video"));
        assertTrue(NotificationKinds.block("TOP_TRENDING_VIDEO"));
        assertTrue(NotificationKinds.block("Top_Trending_Video"));
        assertTrue(NotificationKinds.block("top_trending_video:1234567890"));
        assertTrue(NotificationKinds.block("onthisday:"));
        assertFalse(NotificationKinds.block("top_trending_video_v2"));
        assertFalse(NotificationKinds.block("trending"));
        assertFalse(NotificationKinds.block("some_new_kind"));
        assertFalse(NotificationKinds.block("top trending video"));
        assertFalse(NotificationKinds.block("top_trending_video\n"));
        // A dotless i upper-cases to I, which would turn this into BIRTHDAY_REMINDER.
        assertFalse(NotificationKinds.block("b" + (char) 0x131 + "rthday_reminder"));
        assertFalse(NotificationKinds.block(":onthisday"));
        assertFalse(NotificationKinds.block(""));
        assertFalse(NotificationKinds.block(null));
        assertEquals("ONTHISDAY", NotificationKinds.kindOf("onthisday:x:y"));
        assertNull(NotificationKinds.kindOf("birthday reminder"));
        assertNull(NotificationKinds.kindOf(null));
    }

    @Test
    public void pausedEveryNotificationPosts() {
        allOn();
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(NotificationKindsForTests.blocksTrendingVideo());
        assertFalse(NotificationKindsForTests.blocksBirthday());
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        assertFalse(NotificationKindsForTests.blocksHighlights());
        assertFalse(NotificationKindsForTests.blocksNearby());
        PauseForTests.resume();
        assertTrue(NotificationKindsForTests.blocksTrendingVideo());
        assertTrue(NotificationKindsForTests.blocksNearby());
    }

    /** A push can start Facebook; until the settings are ready, it posts as Facebook would. */
    @Test
    public void untilTheSettingsAreReadyEveryNotificationPosts() {
        allOn();
        boolean[] blocked = {true, true};
        SettingsContextRule.withoutContext(() -> {
            blocked[0] = NotificationKindsForTests.blocksMemory();
            blocked[1] = NotificationKindsForTests.blocksPeopleYouMayKnow();
        });
        assertFalse(blocked[0]);
        assertFalse(blocked[1]);
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            blocked[0] = NotificationKindsForTests.blocksBirthday();
            blocked[1] = NotificationKindsForTests.blocksHighlights();
        });
        assertFalse(blocked[0]);
        assertFalse(blocked[1]);
        assertTrue(NotificationKindsForTests.blocksMemory());
    }

    /**
     * Every push the hook is asked about is counted by its kind, never by its text, and the blocked
     * ones under their switch's group. The hook counts as invoked each time.
     */
    @Test
    public void theReportSaysWhatArrivedAndWhatWasBlocked() {
        Settings.BLOCK_BIRTHDAY_NOTIFICATIONS.save(true);
        NotificationKinds.block("msg");
        NotificationKinds.block("friend:98765");
        NotificationKinds.block("birthday_reminder");
        NotificationKinds.block("birthday_reminder");
        NotificationKinds.block("onthisday");
        NotificationKinds.block("a type with words in it");
        NotificationKinds.block(null);

        assertEquals(NotificationKinds.ROUTE + ": 7 lists, 7 items, 2 removed. Last reason: Birthdays. "
                        + "Removed: Birthdays 2. Kinds: BIRTHDAY_REMINDER 2, FRIEND 1, MSG 1, ONTHISDAY 1, none 1, "
                        + "unreadable 1",
                line(FeedFilterCounters.report(), NotificationKinds.ROUTE));
        assertEquals(FamilyNames.PROMO_NOTIFICATIONS + ": invoked 7, 1 found, 0 missing",
                line(HookStatus.report(), FamilyNames.PROMO_NOTIFICATIONS));
        assertEquals("Block promotional notifications", FamilyNames.PROMO_NOTIFICATIONS);
    }

    /** Every kind with a switch is a constant name, so the fixture test can hold it to both builds. */
    @Test
    public void everyKindIsAConstantName() {
        List<String> odd = new ArrayList<>();
        for (String kind : NotificationKinds.KINDS.keySet()) {
            if (!kind.equals(NotificationKinds.kindOf(kind))) odd.add(kind);
        }
        assertEquals(new ArrayList<String>(), odd);
        assertEquals(12, NotificationKinds.KINDS.size());
    }
}

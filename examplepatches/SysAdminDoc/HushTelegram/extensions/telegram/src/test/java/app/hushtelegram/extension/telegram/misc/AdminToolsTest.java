/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static app.hushtelegram.extension.telegram.misc.AdminTools.ADMIN;
import static app.hushtelegram.extension.telegram.misc.AdminTools.BAN_USERS;
import static app.hushtelegram.extension.telegram.misc.AdminTools.BROADCAST;
import static app.hushtelegram.extension.telegram.misc.AdminTools.CREATOR;
import static app.hushtelegram.extension.telegram.misc.AdminTools.INVITE_USERS;
import static app.hushtelegram.extension.telegram.misc.AdminTools.KNOWN;
import static app.hushtelegram.extension.telegram.misc.AdminTools.MEGAGROUP;
import static app.hushtelegram.extension.telegram.misc.AdminTools.Tool.ADMINISTRATORS;
import static app.hushtelegram.extension.telegram.misc.AdminTools.Tool.INVITE_LINKS;
import static app.hushtelegram.extension.telegram.misc.AdminTools.Tool.MEMBERS;
import static app.hushtelegram.extension.telegram.misc.AdminTools.Tool.PERMISSIONS;
import static app.hushtelegram.extension.telegram.misc.AdminTools.Tool.RECENT_ACTIONS;
import static app.hushtelegram.extension.telegram.misc.AdminTools.Tool.REMOVED_USERS;
import static app.hushtelegram.extension.telegram.misc.AdminTools.Tool.SUBSCRIBERS;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {AdminToolsTest.Menu.class, AdminToolsTest.Screens.class})
public class AdminToolsTest {
    private static final String COULDNT = "Couldn't open admin tools here.";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        restore();
        PatchFamilyForTests.inBuild(PatchFamily.MY_MESSAGES);
    }

    @After public void restore() {
        PauseForTests.resume();
        PatchFamilyForTests.reset();
        Settings.ADMIN_TOOLS.resetToDefault();
        Settings.MY_MESSAGES.resetToDefault();
        AdminTools.resetForTests();
        MyMessages.resetForTests();
        HookStatus.clear();
        ShadowToast.reset();
    }

    private static Chat chat(int rights) {
        Chat chat = new Chat();
        chat.rights = rights;
        chat.activity = Robolectric.buildActivity(Activity.class).setup().get();
        return chat;
    }

    /** Chooses the item in the chat's menu, as Telegram's menu hands the choice to My messages' hook. */
    private static AlertDialog choose(Chat chat) {
        assertTrue("the item is ours, so Telegram never gets its number", MyMessages.headerClick(chat, AdminTools.ITEM));
        ShadowLooper.idleMainLooper();
        return ShadowAlertDialog.getLatestAlertDialog();
    }

    private static List<String> rows(AlertDialog dialog) {
        List<String> rows = new ArrayList<>();
        for (CharSequence row : shadowOf(dialog).getItems()) rows.add(row.toString());
        return rows;
    }

    @Test public void theListFollowsYourRightsAsTelegramsManageScreenDoes() {
        assertEquals("not a chat Telegram has", Collections.emptyList(), AdminTools.tools(CREATOR | BROADCAST, true));
        assertEquals("a channel you only read", Collections.emptyList(), AdminTools.tools(KNOWN | BROADCAST, true));
        assertEquals(Arrays.asList(RECENT_ACTIONS, ADMINISTRATORS, SUBSCRIBERS, REMOVED_USERS, INVITE_LINKS),
                AdminTools.tools(KNOWN | CREATOR | BROADCAST, true));
        assertEquals("an admin who can't remove or invite", Arrays.asList(RECENT_ACTIONS, ADMINISTRATORS, MEMBERS),
                AdminTools.tools(KNOWN | ADMIN | MEGAGROUP, true));
        assertEquals(Arrays.asList(RECENT_ACTIONS, ADMINISTRATORS, MEMBERS, PERMISSIONS, INVITE_LINKS),
                AdminTools.tools(KNOWN | ADMIN | MEGAGROUP | BAN_USERS | INVITE_USERS, true));
        assertEquals("Invite Links needs the chat's details", Arrays.asList(RECENT_ACTIONS, ADMINISTRATORS, MEMBERS, PERMISSIONS),
                AdminTools.tools(KNOWN | ADMIN | MEGAGROUP | BAN_USERS | INVITE_USERS, false));
        assertEquals("a basic group lists its members from its details", Collections.emptyList(),
                AdminTools.tools(KNOWN | CREATOR, false));
        assertEquals(Arrays.asList(ADMINISTRATORS, MEMBERS, PERMISSIONS, INVITE_LINKS), AdminTools.tools(KNOWN | CREATOR, true));
    }

    @Test public void offByDefaultAddsNothing() {
        assertFalse(Settings.ADMIN_TOOLS.get());
        Chat owner = chat(KNOWN | CREATOR | MEGAGROUP);
        MyMessages.headerMenu(owner);
        assertTrue(owner.items.isEmpty());
    }

    @Test public void aChatYouManageGetsTheItemOnceWithMyMessagesOff() {
        Settings.ADMIN_TOOLS.save(true);
        assertFalse(Settings.MY_MESSAGES.get());
        Chat owner = chat(KNOWN | CREATOR | BROADCAST);
        MyMessages.headerMenu(owner);
        MyMessages.headerMenu(owner);
        assertEquals(Collections.singletonList(AdminTools.ITEM + " Admin tools"), owner.items);

        Chat reader = chat(KNOWN | MEGAGROUP);
        MyMessages.headerMenu(reader);
        assertTrue("a group you only belong to", reader.items.isEmpty());
        Chat bare = chat(KNOWN | CREATOR | MEGAGROUP);
        bare.hasHeader = false;
        MyMessages.headerMenu(bare);
        assertTrue("a chat that built no menu", bare.items.isEmpty());
        MyMessages.headerMenu(null);
    }

    @Test public void eachRowOpensItsScreenWithTheChatsDetails() {
        Settings.ADMIN_TOOLS.save(true);
        Chat group = chat(KNOWN | ADMIN | MEGAGROUP | BAN_USERS | INVITE_USERS);
        group.details = new Object();
        AlertDialog dialog = choose(group);
        assertNotNull(dialog);
        assertEquals("Admin tools", String.valueOf(shadowOf(dialog).getTitle()));
        assertEquals(Arrays.asList("Recent Actions", "Administrators", "Members", "Permissions", "Invite Links"), rows(dialog));
        for (int row = 0; row < 5; row++) shadowOf(dialog).clickOnItem(row);
        assertEquals(Arrays.asList("recent actions", "members " + AdminTools.TYPE_ADMIN + " with details",
                "members " + AdminTools.TYPE_USERS + " with details", "members " + AdminTools.TYPE_KICKED + " with details",
                "invite links"), group.opened);
        assertNull(ShadowToast.getLatestToast());
        assertTrue(String.join("\n", HookStatus.report()).contains("admin tools opened"));
    }

    @Test public void aChannelGetsSubscribersAndRemovedUsers() {
        Settings.ADMIN_TOOLS.save(true);
        Chat channel = chat(KNOWN | CREATOR | BROADCAST);
        AlertDialog dialog = choose(channel);
        assertEquals("without details, Invite Links stays out", Arrays.asList("Recent Actions", "Administrators", "Subscribers",
                "Removed Users"), rows(dialog));
        shadowOf(dialog).clickOnItem(2);
        shadowOf(dialog).clickOnItem(3);
        assertEquals(Arrays.asList("members " + AdminTools.TYPE_USERS, "members " + AdminTools.TYPE_BANNED), channel.opened);
    }

    @Test public void aScreenThatDoesntOpenSaysSo() {
        Settings.ADMIN_TOOLS.save(true);
        Chat group = chat(KNOWN | CREATOR | MEGAGROUP);
        group.refuse = true;
        shadowOf(choose(group)).clickOnItem(0);
        ShadowLooper.idleMainLooper();
        assertEquals(COULDNT, ShadowToast.getTextOfLatestToast());

        ShadowToast.reset();
        Chat broken = chat(KNOWN | CREATOR | MEGAGROUP);
        broken.fail = true;
        shadowOf(choose(broken)).clickOnItem(0);
        ShadowLooper.idleMainLooper();
        assertEquals("a screen that threw keeps Telegram running", COULDNT, ShadowToast.getTextOfLatestToast());
    }

    @Test public void nothingToOpenOrNoScreenSaysSoWithoutAList() {
        Settings.ADMIN_TOOLS.save(true);
        Chat reader = chat(KNOWN | MEGAGROUP);
        assertNull(choose(reader));
        assertEquals(COULDNT, ShadowToast.getTextOfLatestToast());

        ShadowToast.reset();
        Chat closed = chat(KNOWN | CREATOR | MEGAGROUP);
        closed.activity = null;
        assertNull("a chat screen that left has nowhere to show the list", choose(closed));
        assertEquals(COULDNT, ShadowToast.getTextOfLatestToast());
    }

    @Test public void anItemLeftOpenAfterTheSwitchWentOffDoesNothing() {
        Chat owner = chat(KNOWN | CREATOR | MEGAGROUP);
        assertNull(choose(owner));
        assertNull(ShadowToast.getLatestToast());
        assertTrue(owner.opened.isEmpty());
        assertFalse("Telegram's own choices pass through", AdminTools.headerClick(owner, 5));
    }

    @Test public void pausedOrNotInTheBuildLeavesTelegramAlone() {
        Settings.ADMIN_TOOLS.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        Chat owner = chat(KNOWN | CREATOR | MEGAGROUP);
        MyMessages.headerMenu(owner);
        assertTrue(owner.items.isEmpty());
        assertNull(choose(owner));
        PauseForTests.resume();

        PatchFamilyForTests.reset();
        PatchFamilyForTests.inBuild(PatchFamily.CHAT_TYPE_FOLDERS);
        MyMessages.headerMenu(owner);
        assertTrue("a build whose My messages didn't fit Admin tools", owner.items.isEmpty());
    }

    /** A chat screen as the stubs see it: your rights there, its details and screen, and what was opened. */
    static final class Chat {
        int rights;
        Object details;
        Activity activity;
        boolean hasHeader = true;
        boolean refuse;
        boolean fail;
        final List<String> items = new ArrayList<>();
        final List<String> opened = new ArrayList<>();

        boolean open(String screen) {
            if (fail) throw new IllegalStateException("screen unavailable");
            if (refuse) return false;
            opened.add(screen);
            return true;
        }
    }

    @Implements(value = MyMessages.class, isInAndroidSdk = false)
    public static class Menu {
        @Implementation protected static boolean hasHeader(Object chat) { return ((Chat) chat).hasHeader; }
        @Implementation protected static boolean group(Object chat) { return false; }
        @Implementation protected static Object chatOf(Object delegate) { return delegate; }
        @Implementation protected static Object addHeaderItem(Object chat, int id, int icon, String text) {
            ((Chat) chat).items.add(id + " " + text);
            return text;
        }
    }

    @Implements(value = AdminTools.class, isInAndroidSdk = false)
    public static class Screens {
        @Implementation protected static int rights(Object chat) { return ((Chat) chat).rights; }
        @Implementation protected static Object chatFull(Object chat) { return ((Chat) chat).details; }
        @Implementation protected static Activity activity(Object chat) { return ((Chat) chat).activity; }
        @Implementation protected static boolean recentActions(Object chat) { return ((Chat) chat).open("recent actions"); }
        @Implementation protected static boolean members(Object chat, int type, Object details) {
            return ((Chat) chat).open("members " + type + (details == null ? "" : " with details"));
        }
        @Implementation protected static boolean inviteLinks(Object chat, Object details) { return ((Chat) chat).open("invite links"); }
    }
}

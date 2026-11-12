/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = MyMessagesTest.Host.class)
public class MyMessagesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.MY_MESSAGES);
        Settings.MY_MESSAGES.resetToDefault();
        HookStatus.clear();
        MyMessages.resetForTests();
        ShadowToast.reset();
    }

    @Test public void offByDefaultAddsNothing() {
        assertFalse(Settings.MY_MESSAGES.get());
        Chat group = new Chat();
        MyMessages.headerMenu(group);
        assertTrue(group.items.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.MY_MESSAGES));
    }

    @Test public void aGroupGetsTheItemOnce() {
        Settings.MY_MESSAGES.save(true);
        Chat group = new Chat();
        MyMessages.headerMenu(group);
        MyMessages.headerMenu(group);
        assertEquals("every later update of the Translate item leaves it alone", 1, group.items.size());
        assertEquals(MyMessages.ITEM, group.items.get(0).id);
        assertEquals("My messages", group.items.get(0).text);
    }

    @Test public void onlyGroupsWithAMenuGetIt() {
        Settings.MY_MESSAGES.save(true);
        Chat channel = new Chat();
        channel.group = false;
        MyMessages.headerMenu(channel);
        assertTrue("channels, private chats and a channel's direct messages", channel.items.isEmpty());
        Chat bare = new Chat();
        bare.hasHeader = false;
        MyMessages.headerMenu(bare);
        assertTrue("a chat that built no menu", bare.items.isEmpty());
        MyMessages.headerMenu(null);
    }

    @Test public void choosingTheItemSearchesYourMessages() {
        Settings.MY_MESSAGES.save(true);
        Chat group = new Chat();
        assertTrue(MyMessages.headerClick(group, MyMessages.ITEM));
        assertEquals(1, group.searches);
        assertNull(ShadowToast.getLatestToast());
        assertTrue(String.join("\n", HookStatus.report()).contains("my messages opened"));
    }

    @Test public void telegramsOwnChoicesPassThrough() {
        Settings.MY_MESSAGES.save(true);
        Chat group = new Chat();
        for (int id : new int[] {0, 1, 13, 0x48545405, 0x48545407}) {
            assertFalse(MyMessages.headerClick(group, id));
        }
        assertEquals(0, group.searches);
    }

    @Test public void anItemLeftOpenAfterTheSwitchWentOffDoesNothing() {
        Chat group = new Chat();
        assertTrue("it's still ours, so Telegram doesn't get a number it never made", MyMessages.headerClick(group, MyMessages.ITEM));
        assertEquals(0, group.searches);
    }

    @Test public void anUnknownAccountSaysSo() {
        Settings.MY_MESSAGES.save(true);
        Chat group = new Chat();
        group.userKnown = false;
        assertTrue(MyMessages.headerClick(group, MyMessages.ITEM));
        ShadowLooper.idleMainLooper();
        assertEquals("Couldn't open your messages here.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aFailingSearchSaysSoAndKeepsTelegramRunning() {
        Settings.MY_MESSAGES.save(true);
        Chat group = new Chat();
        group.failSearch = true;
        assertTrue(MyMessages.headerClick(group, MyMessages.ITEM));
        ShadowLooper.idleMainLooper();
        assertEquals("Couldn't open your messages here.", ShadowToast.getTextOfLatestToast());
        Chat broken = new Chat();
        broken.failAdd = true;
        MyMessages.headerMenu(broken);
        assertTrue(broken.items.isEmpty());
        MyMessages.headerMenu(broken);
        assertTrue("a menu that refused the item is asked again later", broken.addTries == 2);
    }

    @Test public void pausedOrNotReadyLeavesTelegramAlone() {
        Settings.MY_MESSAGES.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            Chat group = new Chat();
            MyMessages.headerMenu(group);
            assertTrue(reason.name(), group.items.isEmpty());
            assertTrue(MyMessages.headerClick(group, MyMessages.ITEM));
            assertEquals(reason.name(), 0, group.searches);
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(MyMessages.active()));
        SettingReadsForTests.breakReads(Settings.MY_MESSAGES);
        Chat group = new Chat();
        MyMessages.headerMenu(group);
        assertTrue(group.items.isEmpty());
        assertFalse(HookStatus.missing(FamilyNames.MY_MESSAGES).isEmpty());
    }

    static final class Chat {
        boolean hasHeader = true;
        boolean group = true;
        boolean userKnown = true;
        boolean failSearch;
        boolean failAdd;
        int addTries;
        int searches;
        final List<Item> items = new ArrayList<>();
    }

    static final class Item {
        final int id;
        final String text;
        Item(int id, String text) { this.id = id; this.text = text; }
    }

    @Implements(value = MyMessages.class, isInAndroidSdk = false)
    public static class Host {
        @Implementation protected static boolean hasHeader(Object chat) { return ((Chat) chat).hasHeader; }
        @Implementation protected static boolean group(Object chat) { return ((Chat) chat).group; }
        @Implementation protected static Object chatOf(Object delegate) { return delegate; }
        @Implementation protected static Object addHeaderItem(Object chat, int id, int icon, String text) {
            Chat owner = (Chat) chat;
            owner.addTries++;
            if (owner.failAdd) throw new IllegalStateException("native menu unavailable");
            Item item = new Item(id, text);
            owner.items.add(item);
            return item;
        }
        @Implementation protected static boolean search(Object chat) {
            Chat owner = (Chat) chat;
            if (owner.failSearch) throw new IllegalStateException("search field unavailable");
            if (!owner.userKnown) return false;
            owner.searches++;
            return true;
        }
    }
}

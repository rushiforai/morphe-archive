/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.os.Looper;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowToast;

/** Fast forward in the long-press menu (#53): when it shows, the choices it offers and what it sends. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {MessageMenuToolsTest.Menu.class, MessageMenuToolsTest.Tools.class},
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class MessageMenuToolsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int FORWARD = 7;

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Menu {
        static Activity host;
        static Object message;
        static boolean photo;
        static String documentName;
        static boolean premium;
        static int type;
        static long chat = 1L;
        static boolean reachable = true;

        @Implementation protected static Object selected(Object chat) { return message; }
        @Implementation protected static ArrayList<?> grouped(Object chat) { return null; }
        @Implementation protected static int forwardOption() { return FORWARD; }
        @Implementation protected static int article() { return 99; }
        @Implementation protected static boolean premium(Object message) { return premium; }
        @Implementation protected static int type(Object message) { return type; }
        @Implementation protected static boolean photo(Object message) { return photo; }
        @Implementation protected static String documentName(Object message) { return documentName; }
        @Implementation protected static boolean blocked(Object message) { return false; }
        @Implementation protected static boolean secret(long dialog) { return false; }
        @Implementation protected static long dialog(Object message) { return chat; }
        @Implementation protected static long selfId(int account) { return 5L; }
        @Implementation protected static boolean reachable(int account, long dialog) { return reachable; }
        @Implementation protected static int account(Object message) { return 0; }
    }

    @Implements(value = MessageMenuTools.class, isInAndroidSdk = false)
    public static class Tools {
        static final List<String> sent = new ArrayList<>();
        static int result;

        @Implementation protected static int forwardWith(int account, ArrayList<Object> messages, long dialog, boolean hideSender, boolean hideCaption) {
            sent.add(dialog + " sender=" + hideSender + " caption=" + hideCaption + " n=" + messages.size());
            return result;
        }
    }

    @Before public void setUp() {
        restore();
        Menu.host = Robolectric.buildActivity(Activity.class).setup().get();
        Menu.message = new Object();
        Menu.photo = false;
        Menu.documentName = null;
        Menu.premium = false;
        Menu.type = 0;
        Menu.chat = 1L;
        Menu.reachable = true;
        Tools.result = 0;
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_FAST_FORWARD);
        Settings.MESSAGE_MENU_FAST_FORWARD.resetToDefault();
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_FORWARD_SAVED);
        Settings.MESSAGE_MENU_FORWARD_SAVED.resetToDefault();
        Tools.sent.clear();
        HookStatus.clear();
        ShadowToast.reset();
    }

    private static ArrayList<ArrayList<Object>> menu(Object... options) {
        ArrayList<ArrayList<Object>> lists = new ArrayList<>();
        for (int i = 0; i < 3; i++) lists.add(new ArrayList<>());
        for (Object option : options) {
            lists.get(0).add(0);
            lists.get(1).add("item " + option);
            lists.get(2).add(option);
        }
        return lists;
    }

    private static ArrayList<ArrayList<Object>> filled(Object... options) {
        ArrayList<ArrayList<Object>> menu = menu(options);
        MessageMenu.fill(new Object(), null, menu.get(0), menu.get(1), menu.get(2));
        return menu;
    }

    private static List<MessageMenuTools.Way> ways() {
        return MessageMenuTools.fastWays(Menu.message, MessageMenu.batch(null, Menu.message));
    }

    @Test public void theSwitchStartsOffAndAddsNothing() {
        assertFalse(Settings.MESSAGE_MENU_FAST_FORWARD.get());
        assertEquals(Arrays.<Object>asList(FORWARD), filled(FORWARD).get(2));
    }

    @Test public void itShowsNextToForwardAndKeepsTheListsInStep() {
        Settings.MESSAGE_MENU_FAST_FORWARD.save(true);
        ArrayList<ArrayList<Object>> menu = filled(FORWARD, MessageMenu.DETAILS);
        assertEquals(Arrays.<Object>asList(FORWARD, MessageMenuTools.FAST_FORWARD, MessageMenu.DETAILS), menu.get(2));
        assertEquals("Fast forward", menu.get(1).get(1));
        assertEquals(3, menu.get(0).size());
    }

    @Test public void noItemWhereTelegramOffersNoForward() {
        Settings.MESSAGE_MENU_FAST_FORWARD.save(true);
        assertEquals(Arrays.<Object>asList(1), filled(1).get(2));
    }

    @Test public void aTextMessageOffersOnlyTheSenderChoice() {
        List<MessageMenuTools.Way> ways = ways();
        assertEquals(1, ways.size());
        assertEquals("Without sender name", ways.get(0).label);
        assertTrue(ways.get(0).hideSender);
        assertFalse(ways.get(0).hideCaption);
    }

    @Test public void aPhotoOffersTheCaptionChoicesToo() {
        Menu.photo = true;
        List<MessageMenuTools.Way> ways = ways();
        assertEquals(3, ways.size());
        assertFalse(ways.get(1).hideSender);
        assertTrue(ways.get(1).hideCaption);
        assertTrue(ways.get(2).hideSender && ways.get(2).hideCaption);
    }

    @Test public void anArticleWithoutPremiumCanOnlyDropTheCaption() {
        Menu.type = 99;
        Menu.photo = true;
        List<MessageMenuTools.Way> ways = ways();
        assertEquals(1, ways.size());
        assertEquals("Without caption", ways.get(0).label);
        Menu.photo = false;
        Settings.MESSAGE_MENU_FAST_FORWARD.save(true);
        assertEquals(Arrays.<Object>asList(FORWARD), filled(FORWARD).get(2));
    }

    @Test public void theChosenWayGoesToTheChatWithItsFlags() {
        Settings.MESSAGE_MENU_FAST_FORWARD.save(true);
        MessageMenuTools.forward(Menu.host, 0, new MessageMenu.Destination(42L, "Saved Messages"),
                MessageMenu.batch(null, Menu.message), new MessageMenuTools.Way("x", true, false), Settings.MESSAGE_MENU_FAST_FORWARD);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(Arrays.asList("42 sender=true caption=false n=1"), Tools.sent);
        assertEquals("Forwarding to Saved Messages", ShadowToast.getTextOfLatestToast().replaceAll("[\\u2068\\u2069]", ""));
    }

    @Test public void aRefusedSendSaysSoAndNothingSendsWhenOff() {
        Settings.MESSAGE_MENU_FAST_FORWARD.save(true);
        Tools.result = 1;
        MessageMenuTools.forward(Menu.host, 0, new MessageMenu.Destination(42L, "Chat"),
                MessageMenu.batch(null, Menu.message), new MessageMenuTools.Way("x", false, true), Settings.MESSAGE_MENU_FAST_FORWARD);
        assertEquals("Can't forward there", ShadowToast.getTextOfLatestToast());
        Settings.MESSAGE_MENU_FAST_FORWARD.save(false);
        Tools.sent.clear();
        MessageMenuTools.forward(Menu.host, 0, new MessageMenu.Destination(42L, "Chat"),
                MessageMenu.batch(null, Menu.message), new MessageMenuTools.Way("x", false, true), Settings.MESSAGE_MENU_FAST_FORWARD);
        assertTrue(Tools.sent.isEmpty());
    }

    @Test public void forwardToSavedStartsOffAndShowsOnlyWhenOnAndForwardable() {
        assertFalse(Settings.MESSAGE_MENU_FORWARD_SAVED.get());
        assertEquals(Arrays.<Object>asList(FORWARD), filled(FORWARD).get(2));
        Settings.MESSAGE_MENU_FORWARD_SAVED.save(true);
        ArrayList<ArrayList<Object>> menu = filled(FORWARD, MessageMenu.DETAILS);
        assertEquals(Arrays.<Object>asList(FORWARD, MessageMenuTools.FORWARD_SAVED, MessageMenu.DETAILS), menu.get(2));
        assertEquals("Forward to Saved Messages", menu.get(1).get(1));
        assertEquals(Arrays.<Object>asList(1), filled(1).get(2));
    }

    @Test public void forwardToSavedIsLeftOutInSavedMessagesItself() {
        Settings.MESSAGE_MENU_FORWARD_SAVED.save(true);
        Menu.chat = 5L;
        assertEquals(Arrays.<Object>asList(FORWARD), filled(FORWARD).get(2));
        Menu.chat = 1L;
        Menu.reachable = false;
        assertEquals(Arrays.<Object>asList(FORWARD), filled(FORWARD).get(2));
    }

    @Test public void bothItemsCanShowTogether() {
        Settings.MESSAGE_MENU_FAST_FORWARD.save(true);
        Settings.MESSAGE_MENU_FORWARD_SAVED.save(true);
        assertEquals(Arrays.<Object>asList(FORWARD, MessageMenuTools.FAST_FORWARD, MessageMenuTools.FORWARD_SAVED), filled(FORWARD).get(2));
    }

    @Test public void savedWaysStartWithAsIsThenTheFastChoices() {
        Menu.photo = true;
        List<MessageMenuTools.Way> ways = MessageMenuTools.savedWays(Menu.message, MessageMenu.batch(null, Menu.message));
        assertEquals(4, ways.size());
        assertEquals("Forward as is", ways.get(0).label);
        assertFalse(ways.get(0).hideSender || ways.get(0).hideCaption);
    }

    @Test public void theSavedChatGetsTheForwardAndItsSettingGuardsIt() {
        Settings.MESSAGE_MENU_FORWARD_SAVED.save(true);
        MessageMenuTools.forward(Menu.host, 0, new MessageMenu.Destination(5L, "Saved Messages"),
                MessageMenu.batch(null, Menu.message), new MessageMenuTools.Way("x", false, true), Settings.MESSAGE_MENU_FORWARD_SAVED);
        assertEquals(Arrays.asList("5 sender=false caption=true n=1"), Tools.sent);
        Settings.MESSAGE_MENU_FORWARD_SAVED.save(false);
        Tools.sent.clear();
        MessageMenuTools.forward(Menu.host, 0, new MessageMenu.Destination(5L, "Saved Messages"),
                MessageMenu.batch(null, Menu.message), new MessageMenuTools.Way("x", false, true), Settings.MESSAGE_MENU_FORWARD_SAVED);
        assertTrue(Tools.sent.isEmpty());
    }
}

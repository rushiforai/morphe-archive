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
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

/** Forward as plain text in the long-press menu (#71): where it shows and what it sends. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {MessageMenuPlainForwardTest.Native.class}, instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class MessageMenuPlainForwardTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int FORWARD = 7;
    private static final String ISOLATES = "[" + (char) 0x2068 + (char) 0x2069 + "]";

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Native {
        static Activity host;
        static Object message;
        static ArrayList<Object> album;
        static final Map<Object, String> texts = new HashMap<>();
        static boolean sending;
        static boolean accept;
        static final List<String> sent = new ArrayList<>();

        @Implementation protected static Object selected(Object chat) { return message; }
        @Implementation protected static Activity activity(Object chat) { return host; }
        @Implementation protected static ArrayList<?> grouped(Object chat) { return album; }
        @Implementation protected static int forwardOption() { return FORWARD; }
        @Implementation protected static String text(Object message) { return texts.get(message); }
        @Implementation protected static boolean sending() { return sending; }
        @Implementation protected static boolean sendText(int account, long dialog, String text) {
            sent.add(dialog + " " + text);
            return accept;
        }
    }

    @Before public void setUp() {
        restore();
        Native.host = Robolectric.buildActivity(Activity.class).setup().get();
        Native.message = new Object();
        Native.texts.put(Native.message, "hello **there**");
        Native.sending = true;
        Native.accept = true;
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_PLAIN_FORWARD);
        Settings.MESSAGE_MENU_PLAIN_FORWARD.resetToDefault();
        Native.album = null;
        Native.texts.clear();
        Native.sent.clear();
        HookStatus.clear();
        ShadowToast.reset();
    }

    private static ArrayList<ArrayList<Object>> filled(Object... options) {
        ArrayList<ArrayList<Object>> lists = new ArrayList<>();
        for (int i = 0; i < 3; i++) lists.add(new ArrayList<>());
        for (Object option : options) {
            lists.get(0).add(0);
            lists.get(1).add("item " + option);
            lists.get(2).add(option);
        }
        MessageMenu.fill(new Object(), null, lists.get(0), lists.get(1), lists.get(2));
        return lists;
    }

    private static void send(String text) {
        MessageMenuTools.sendPlain(Native.host, 0, new MessageMenu.Destination(42L, "Saved Messages"), text);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    @Test public void theSwitchStartsOffAndAddsNothing() {
        assertFalse(Settings.MESSAGE_MENU_PLAIN_FORWARD.get());
        assertEquals(Arrays.<Object>asList(FORWARD, MessageMenu.DETAILS), filled(FORWARD, MessageMenu.DETAILS).get(2));
    }

    @Test public void itShowsNextToForwardBeforeMessageDetails() {
        Settings.MESSAGE_MENU_PLAIN_FORWARD.save(true);
        ArrayList<ArrayList<Object>> menu = filled(FORWARD, MessageMenu.DETAILS);
        assertEquals(Arrays.<Object>asList(FORWARD, MessageMenuTools.PLAIN, MessageMenu.DETAILS), menu.get(2));
        assertEquals("Forward as plain text", menu.get(1).get(1));
        assertEquals(3, menu.get(0).size());
    }

    @Test public void noItemWithoutForwardWordsOrATextSend() {
        Settings.MESSAGE_MENU_PLAIN_FORWARD.save(true);
        assertEquals("a chat that doesn't allow forwarding", Arrays.<Object>asList(1), filled(1).get(2));
        Native.sending = false;
        assertEquals("a build without Telegram's text send", Arrays.<Object>asList(FORWARD), filled(FORWARD).get(2));
        Native.sending = true;
        Native.texts.put(Native.message, "  ");
        assertEquals("a photo with no caption", Arrays.<Object>asList(FORWARD), filled(FORWARD).get(2));
    }

    @Test public void anAlbumOffersItsCaption() {
        Settings.MESSAGE_MENU_PLAIN_FORWARD.save(true);
        Object captioned = new Object();
        Native.texts.put(Native.message, "");
        Native.texts.put(captioned, "the caption");
        Native.album = new ArrayList<>(Arrays.asList(captioned, Native.message));
        assertEquals(Arrays.<Object>asList(FORWARD, MessageMenuTools.PLAIN), filled(FORWARD).get(2));
    }

    @Test public void theWordsGoToThePickedChatAsANewMessage() {
        Settings.MESSAGE_MENU_PLAIN_FORWARD.save(true);
        send("hello **there**");
        assertEquals(Collections.singletonList("42 hello **there**"), Native.sent);
        assertEquals("Forwarding to Saved Messages", ShadowToast.getTextOfLatestToast().replaceAll(ISOLATES, ""));
    }

    @Test public void aRefusedSendSaysSo() {
        Settings.MESSAGE_MENU_PLAIN_FORWARD.save(true);
        Native.accept = false;
        send("hi");
        assertEquals("Can't forward there", ShadowToast.getTextOfLatestToast());
        ShadowToast.reset();
        send("");
        assertEquals("nothing to send", "Can't forward there", ShadowToast.getTextOfLatestToast());
        assertEquals(Collections.singletonList("42 hi"), Native.sent);
    }

    @Test public void nothingGoesWhenOffOrPaused() {
        Settings.MESSAGE_MENU_PLAIN_FORWARD.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        send("hi");
        PauseForTests.resume();
        Settings.MESSAGE_MENU_PLAIN_FORWARD.save(false);
        send("hi");
        MessageMenu.chosen(new Object(), MessageMenuTools.PLAIN);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertTrue(Native.sent.isEmpty());
        assertNull(ShadowToast.getTextOfLatestToast());
    }
}

/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Looper;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Arrays;
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

/** Copy text in a chat or message that doesn't allow saving (#43). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {MessageMenuProtectedTest.Native.class}, instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class MessageMenuProtectedTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Native {
        static Activity host;
        static Object message;
        static ArrayList<Object> album;
        static boolean restricted;
        static String firstText, secondText;
        static final Object SECOND = new Object();

        @Implementation protected static Object selected(Object chat) { return message; }
        @Implementation protected static Activity activity(Object chat) { return host; }
        @Implementation protected static ArrayList<?> grouped(Object chat) { return album; }
        @Implementation protected static boolean restricted(Object message) { return restricted; }
        @Implementation protected static String text(Object each) { return each == SECOND ? secondText : firstText; }
    }

    @Before public void setUp() {
        restore();
        Native.host = Robolectric.buildActivity(Activity.class).setup().get();
        Native.message = new Object();
        Native.album = null;
        Native.restricted = true;
        Native.firstText = "Quarterly numbers";
        Native.secondText = null;
        ShadowToast.reset();
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_COPY_PROTECTED);
        Settings.MESSAGE_MENU_COPY_PROTECTED.resetToDefault();
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

    private static void fill(ArrayList<ArrayList<Object>> menu) {
        MessageMenu.fill(new Object(), null, menu.get(0), menu.get(1), menu.get(2));
    }

    @Test public void theSwitchStartsOffAndAddsNothing() {
        assertFalse(Settings.MESSAGE_MENU_COPY_PROTECTED.get());
        ArrayList<ArrayList<Object>> menu = menu(1, 4);
        fill(menu);
        assertEquals(Arrays.<Object>asList(1, 4), menu.get(2));
        assertFalse(MessageMenu.selectionCopy());
    }

    @Test public void aProtectedMessageWithTextGetsCopyAfterTheStockItems() {
        Settings.MESSAGE_MENU_COPY_PROTECTED.save(true);
        ArrayList<ArrayList<Object>> menu = menu(1, 4);
        fill(menu);
        assertEquals(Arrays.<Object>asList(1, 4, MessageMenu.COPY_TEXT), menu.get(2));
        assertEquals("Copy", menu.get(1).get(2));
        assertEquals(3, menu.get(0).size());
    }

    @Test public void copyGoesBeforeMessageDetails() {
        ArrayList<ArrayList<Object>> menu = menu(1);
        MessageMenu.offer(menu.get(0), menu.get(1), menu.get(2), false, false, true, false, true, 2);
        assertEquals(Arrays.<Object>asList(1, MessageMenu.COPY_TEXT, MessageMenu.DETAILS), menu.get(2));
    }

    @Test public void anUnrestrictedMessageKeepsTelegramsOwnCopy() {
        Settings.MESSAGE_MENU_COPY_PROTECTED.save(true);
        Native.restricted = false;
        ArrayList<ArrayList<Object>> menu = menu(1, 4);
        fill(menu);
        assertEquals(Arrays.<Object>asList(1, 4), menu.get(2));
    }

    @Test public void aMessageWithoutTextGetsNoCopy() {
        Settings.MESSAGE_MENU_COPY_PROTECTED.save(true);
        for (String text : new String[]{null, "", "  \n"}) {
            Native.firstText = text;
            ArrayList<ArrayList<Object>> menu = menu(1);
            fill(menu);
            assertEquals(Arrays.<Object>asList(1), menu.get(2));
        }
    }

    @Test public void anAlbumCopiesItsCaptionFromWhicheverPhotoHasIt() {
        Settings.MESSAGE_MENU_COPY_PROTECTED.save(true);
        Native.firstText = null;
        Native.secondText = "Caption on the second photo";
        Native.album = new ArrayList<>(Arrays.asList(Native.message, Native.SECOND));
        ArrayList<ArrayList<Object>> menu = menu(1);
        fill(menu);
        assertEquals(MessageMenu.COPY_TEXT, menu.get(2).get(1));
        MessageMenu.chosen(new Object(), MessageMenu.COPY_TEXT);
        idle();
        ClipboardManager clipboard = (ClipboardManager) Native.host.getSystemService(Context.CLIPBOARD_SERVICE);
        assertEquals("Caption on the second photo", clipboard.getPrimaryClip().getItemAt(0).getText().toString());
    }

    @Test public void choosingCopyPutsTheTextOnTheClipboardAndSaysSo() {
        Settings.MESSAGE_MENU_COPY_PROTECTED.save(true);
        MessageMenu.chosen(new Object(), MessageMenu.COPY_TEXT);
        idle();
        ClipboardManager clipboard = (ClipboardManager) Native.host.getSystemService(Context.CLIPBOARD_SERVICE);
        assertEquals("Quarterly numbers", clipboard.getPrimaryClip().getItemAt(0).getText().toString());
        assertEquals("Text copied", ShadowToast.getTextOfLatestToast());
        assertTrue(HookStatus.report().toString().contains("text copied"));
    }

    @Test public void choosingCopyDoesNothingWhenOffPausedOrEmpty() {
        MessageMenu.chosen(new Object(), MessageMenu.COPY_TEXT);
        idle();
        assertNull(ShadowToast.getTextOfLatestToast());
        Settings.MESSAGE_MENU_COPY_PROTECTED.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        MessageMenu.chosen(new Object(), MessageMenu.COPY_TEXT);
        idle();
        assertNull(ShadowToast.getTextOfLatestToast());
        PauseForTests.resume();
        Native.firstText = null;
        MessageMenu.chosen(new Object(), MessageMenu.COPY_TEXT);
        idle();
        assertEquals("Couldn't copy that. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void textSelectionFollowsTheSwitchAndStaysStockWhenPausedOrBroken() {
        Settings.MESSAGE_MENU_COPY_PROTECTED.save(true);
        assertTrue(MessageMenu.selectionCopy());
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(MessageMenu.selectionCopy());
        PauseForTests.resume();
        SettingReadsForTests.breakReads(Settings.MESSAGE_MENU_COPY_PROTECTED);
        assertFalse(MessageMenu.selectionCopy());
        assertFalse(HookStatus.missing(FamilyNames.MESSAGE_MENU_REPEAT).isEmpty());
    }

    private static void idle() { Shadows.shadowOf(Looper.getMainLooper()).idle(); }
}

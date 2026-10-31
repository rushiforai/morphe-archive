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
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.Executor;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowToast;

/** Save to Downloads in the long-press menu of a downloaded file in a chat that doesn't allow saving (#29). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {MessageMenuSaveTest.Native.class}, instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class MessageMenuSaveTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    private final Executor realWork = SaveDownloads.work;

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Native {
        static Activity host;
        static Object message;
        static boolean restricted;
        static String attachPath;
        static String documentName;

        @Implementation protected static Object selected(Object chat) { return message; }
        @Implementation protected static Activity activity(Object chat) { return host; }
        @Implementation protected static ArrayList<?> grouped(Object chat) { return null; }
        @Implementation protected static boolean restricted(Object message) { return restricted; }
        @Implementation protected static String attachPath(Object message) { return attachPath; }
        @Implementation protected static File photoFile(Object message) { return null; }
        @Implementation protected static String documentName(Object message) { return documentName; }
    }

    @Before public void setUp() throws IOException {
        restore();
        Native.host = Robolectric.buildActivity(Activity.class).setup().get();
        Native.message = new Object();
        Native.restricted = true;
        File file = folder.newFile("2_51.pdf");
        Native.attachPath = file.getPath();
        Native.documentName = "report.pdf";
        SaveDownloads.work = Runnable::run;
    }

    @After public void restore() {
        SaveDownloads.work = realWork;
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_SAVE_PROTECTED);
        Settings.MESSAGE_MENU_SAVE_PROTECTED.resetToDefault();
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
        assertFalse(Settings.MESSAGE_MENU_SAVE_PROTECTED.get());
        ArrayList<ArrayList<Object>> menu = menu(1);
        fill(menu);
        assertEquals(Arrays.<Object>asList(1), menu.get(2));
    }

    @Test public void aDownloadedFileInAProtectedChatGetsTheItemBeforeDetails() {
        Settings.MESSAGE_MENU_SAVE_PROTECTED.save(true);
        ArrayList<ArrayList<Object>> menu = menu(1);
        fill(menu);
        assertEquals(Arrays.<Object>asList(1, MessageMenu.SAVE_DOWNLOAD), menu.get(2));
        assertEquals("Save to Downloads", menu.get(1).get(1));

        ArrayList<ArrayList<Object>> both = menu(1);
        MessageMenu.offer(both.get(0), both.get(1), both.get(2), false, false, true, false, false, true, 2);
        assertEquals(Arrays.<Object>asList(1, MessageMenu.SAVE_DOWNLOAD, MessageMenu.DETAILS), both.get(2));
    }

    @Test public void anUnrestrictedChatOrAFileNotDownloadedYetGetsNoItem() {
        Settings.MESSAGE_MENU_SAVE_PROTECTED.save(true);
        Native.restricted = false;
        ArrayList<ArrayList<Object>> menu = menu(1);
        fill(menu);
        assertEquals(Arrays.<Object>asList(1), menu.get(2));

        Native.restricted = true;
        Native.attachPath = new File(folder.getRoot(), "missing.pdf").getPath();
        menu = menu(1);
        fill(menu);
        assertEquals(Arrays.<Object>asList(1), menu.get(2));
    }

    @Test public void choosingItCopiesOnlyThenAndSaysSo() {
        // The test folder isn't inside Telegram's own storage, so the file counts as already shared.
        Settings.MESSAGE_MENU_SAVE_PROTECTED.save(true);
        assertNull(ShadowToast.getTextOfLatestToast());
        MessageMenu.chosen(new Object(), MessageMenu.SAVE_DOWNLOAD);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Already in Downloads", ShadowToast.getTextOfLatestToast());
    }

    @Test public void choosingItDoesNothingWhenOffOrPaused() {
        MessageMenu.chosen(new Object(), MessageMenu.SAVE_DOWNLOAD);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertNull(ShadowToast.getTextOfLatestToast());
        Settings.MESSAGE_MENU_SAVE_PROTECTED.save(true);
        PauseForTests.pause(app.hushtelegram.extension.shared.settings.HushTelegramPause.Reason.SWITCH);
        MessageMenu.chosen(new Object(), MessageMenu.SAVE_DOWNLOAD);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void aFileThatVanishedBeforeTheTapSaysItCouldntSave() {
        Settings.MESSAGE_MENU_SAVE_PROTECTED.save(true);
        Native.attachPath = new File(folder.getRoot(), "gone.pdf").getPath();
        MessageMenu.chosen(new Object(), MessageMenu.SAVE_DOWNLOAD);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Couldn't save that. Try again.", ShadowToast.getTextOfLatestToast());
    }
}

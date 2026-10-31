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
import java.nio.file.Files;
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

/** Forward as copy in the long-press menu of a message in a chat that doesn't allow forwarding (#46, #47). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {MessageMenuForwardCopyTest.Native.class}, instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class MessageMenuForwardCopyTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    private final Executor realWork = SaveDownloads.work;

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Native {
        static Activity host;
        static Object message;
        static boolean restricted;
        static boolean sending;
        static String text;
        static String attachPath;
        static String documentName;
        static boolean photo;
        static final ArrayList<String> sent = new ArrayList<>();
        static boolean accept;

        @Implementation protected static Object selected(Object chat) { return message; }
        @Implementation protected static Activity activity(Object chat) { return host; }
        @Implementation protected static ArrayList<?> grouped(Object chat) { return null; }
        @Implementation protected static boolean restricted(Object message) { return restricted; }
        @Implementation protected static boolean sending() { return sending; }
        @Implementation protected static String text(Object message) { return text; }
        @Implementation protected static String attachPath(Object message) { return attachPath; }
        @Implementation protected static File photoFile(Object message) { return null; }
        @Implementation protected static String documentName(Object message) { return documentName; }
        @Implementation protected static boolean photo(Object message) { return photo; }
        @Implementation protected static boolean sendText(int account, long dialog, String text) {
            sent.add("text " + dialog + " " + text);
            return accept;
        }
        @Implementation protected static boolean sendPhoto(int account, long dialog, String path, String caption) {
            sent.add("photo " + dialog + " " + new File(path).getName() + " [" + caption + "] " + new File(path).length());
            return accept;
        }
        @Implementation protected static boolean sendFile(int account, long dialog, String path, String mime, String caption) {
            sent.add("file " + dialog + " " + new File(path).getName() + " " + mime + " [" + caption + "] " + new File(path).length());
            return accept;
        }
    }

    @Before public void setUp() throws IOException {
        restore();
        Native.host = Robolectric.buildActivity(Activity.class).setup().get();
        Native.message = new Object();
        Native.restricted = true;
        Native.sending = true;
        Native.accept = true;
        Native.text = "hello there";
        Native.photo = false;
        Native.documentName = null;
        Native.attachPath = null;
        SaveDownloads.work = Runnable::run;
    }

    @After public void restore() {
        SaveDownloads.work = realWork;
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_FORWARD_COPY);
        Settings.MESSAGE_MENU_FORWARD_COPY.resetToDefault();
        Native.sent.clear();
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

    private static ArrayList<ArrayList<Object>> filled() {
        ArrayList<ArrayList<Object>> menu = menu(1);
        MessageMenu.fill(new Object(), null, menu.get(0), menu.get(1), menu.get(2));
        return menu;
    }

    @Test public void theSwitchStartsOffAndAddsNothing() {
        assertFalse(Settings.MESSAGE_MENU_FORWARD_COPY.get());
        assertEquals(Arrays.<Object>asList(1), filled().get(2));
    }

    @Test public void aProtectedMessageWithTextGetsTheItem() {
        Settings.MESSAGE_MENU_FORWARD_COPY.save(true);
        ArrayList<ArrayList<Object>> menu = filled();
        assertEquals(Arrays.<Object>asList(1, MessageMenu.FORWARD_COPY), menu.get(2));
        assertEquals("Forward as copy", menu.get(1).get(1));
    }

    @Test public void noItemWithoutASendOrOutsideAProtectedChatOrWithNothingToSend() {
        Settings.MESSAGE_MENU_FORWARD_COPY.save(true);
        Native.sending = false;
        assertEquals(Arrays.<Object>asList(1), filled().get(2));
        Native.sending = true;
        Native.restricted = false;
        assertEquals(Arrays.<Object>asList(1), filled().get(2));
        Native.restricted = true;
        Native.text = "";
        assertEquals(Arrays.<Object>asList(1), filled().get(2));
        Native.documentName = "a.pdf";
        assertEquals(Arrays.<Object>asList(1, MessageMenu.FORWARD_COPY), filled().get(2));
    }

    @Test public void mediaThatIsNotDownloadedAsksToOpenItFirst() {
        Settings.MESSAGE_MENU_FORWARD_COPY.save(true);
        Native.documentName = "a.pdf";
        Native.attachPath = new File(folder.getRoot(), "missing.pdf").getPath();
        MessageMenu.chosen(new Object(), MessageMenu.FORWARD_COPY);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Open it first to download it", ShadowToast.getTextOfLatestToast());
        assertTrue(Native.sent.isEmpty());
    }

    @Test public void choosingItDoesNothingWhenOff() {
        MessageMenu.chosen(new Object(), MessageMenu.FORWARD_COPY);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void textGoesToTheChosenChatAsANewMessage() {
        Settings.MESSAGE_MENU_FORWARD_COPY.save(true);
        MessageMenu.sendCopy(Native.host, 0, new MessageMenu.Destination(42L, "Saved Messages"), "hello there", null, null, false);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(Arrays.asList("text 42 hello there"), Native.sent);
        assertEquals("Forwarding to Saved Messages", ShadowToast.getTextOfLatestToast().replaceAll("[\\u2068\\u2069]", ""));
    }

    @Test public void aFileIsSentUnderItsOwnNameWithItsCaption() throws IOException {
        Settings.MESSAGE_MENU_FORWARD_COPY.save(true);
        File file = folder.newFile("2_51.pdf");
        Files.write(file.toPath(), new byte[]{1, 2, 3, 4});
        MessageMenu.sendCopy(Native.host, 0, new MessageMenu.Destination(7L, "Chat"), "cap", file, "report.pdf", false);
        assertEquals(Arrays.asList("file 7 report.pdf application/pdf [cap] 4"), Native.sent);
        Native.sent.clear();
        MessageMenu.sendCopy(Native.host, 0, new MessageMenu.Destination(7L, "Chat"), "", file, "pic.jpg", true);
        assertEquals(Arrays.asList("photo 7 pic.jpg [] 4"), Native.sent);
    }

    @Test public void aRefusedSendSaysSoAndNothingIsSentWhenOff() throws IOException {
        Settings.MESSAGE_MENU_FORWARD_COPY.save(true);
        Native.accept = false;
        MessageMenu.sendCopy(Native.host, 0, new MessageMenu.Destination(42L, "Chat"), "hi", null, null, false);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Can't forward there", ShadowToast.getTextOfLatestToast());
        Settings.MESSAGE_MENU_FORWARD_COPY.save(false);
        Native.sent.clear();
        MessageMenu.sendCopy(Native.host, 0, new MessageMenu.Destination(42L, "Chat"), "hi", null, null, false);
        assertTrue(Native.sent.isEmpty());
    }
}

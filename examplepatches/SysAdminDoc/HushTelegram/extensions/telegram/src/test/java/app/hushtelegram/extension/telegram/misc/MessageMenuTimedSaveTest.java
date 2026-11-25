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
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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

/** Save to Downloads on view-once and timed media, whose file Telegram may only keep encrypted (#82). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {MessageMenuSaveTest.Native.class, MessageMenuTimedSaveTest.Hand.class}, instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class MessageMenuTimedSaveTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    private final Executor realWork = SaveDownloads.work;

    /** Takes what Save to Downloads hands over: the file, the name it shows and the downloader's name. */
    @Implements(value = SaveDownloads.class, isInAndroidSdk = false)
    public static class Hand {
        static boolean timed;
        static final List<List<String>> saved = new ArrayList<>();

        @Implementation protected static boolean timedMedia(Object message) { return timed; }

        @Implementation protected static String saveByHand(File file, String name, String document) {
            saved.add(Arrays.asList(file.getName(), name, document));
            return SaveDownloads.SAVED;
        }
    }

    @Before public void setUp() {
        restore();
        MessageMenuSaveTest.Native.host = Robolectric.buildActivity(Activity.class).setup().get();
        MessageMenuSaveTest.Native.message = new Object();
        SaveDownloads.work = Runnable::run;
        Hand.timed = true;
        Settings.MESSAGE_MENU_SAVE_PROTECTED.save(true);
    }

    @After public void restore() {
        SaveDownloads.work = realWork;
        MessageMenuSaveTest.Native.restricted = false;
        MessageMenuSaveTest.Native.secret = false;
        MessageMenuSaveTest.Native.attachPath = null;
        MessageMenuSaveTest.Native.documentName = null;
        MessageMenuSaveTest.Native.photo = null;
        MessageMenuSaveTest.Native.album = null;
        MessageMenuSaveTest.Native.paths.clear();
        Hand.timed = false;
        Hand.saved.clear();
        for (var setting : Arrays.asList(Settings.MESSAGE_MENU_SAVE_PROTECTED, Settings.SAVE_TIMED_MEDIA, Settings.SAVE_SECRET_CHATS)) {
            SettingReadsForTests.mend(setting);
            setting.resetToDefault();
        }
        HookStatus.clear();
        ShadowToast.reset();
    }

    /** Whether the long-press menu offers Save to Downloads right now. */
    private static boolean offered() {
        ArrayList<Object> icons = new ArrayList<>(Arrays.asList(0));
        ArrayList<Object> items = new ArrayList<>(Arrays.asList("item"));
        ArrayList<Object> options = new ArrayList<>(Arrays.asList(1));
        MessageMenu.fill(new Object(), null, icons, items, options);
        return options.contains(MessageMenu.SAVE_DOWNLOAD);
    }

    private static void choose() {
        MessageMenu.chosen(new Object(), MessageMenu.SAVE_DOWNLOAD);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    /** Timed media Telegram keeps only as [name].enc, beside where the plain file would be. */
    private void sealed(String name) throws IOException {
        folder.newFile(name + SaveDownloads.ENCRYPTED);
        MessageMenuSaveTest.Native.photo = new File(folder.getRoot(), name);
    }

    @Test public void timedMediaGetsTheItemOnlyWithItsSwitchOn() throws IOException {
        MessageMenuSaveTest.Native.attachPath = folder.newFile("2_51.jpg").getPath();
        assertFalse(offered());
        Settings.SAVE_TIMED_MEDIA.save(true);
        assertTrue(offered());
    }

    @Test public void itsSwitchLeavesOtherMediaAlone() throws IOException {
        MessageMenuSaveTest.Native.attachPath = folder.newFile("2_51.jpg").getPath();
        Settings.SAVE_TIMED_MEDIA.save(true);
        Hand.timed = false;
        assertFalse("an ordinary chat that allows saving gets no item", offered());
    }

    @Test public void aSecretChatsTimedMediaNeedsBothSwitches() throws IOException {
        MessageMenuSaveTest.Native.attachPath = folder.newFile("2_51.jpg").getPath();
        MessageMenuSaveTest.Native.secret = true;
        Settings.SAVE_TIMED_MEDIA.save(true);
        assertFalse(offered());
        Settings.SAVE_TIMED_MEDIA.save(false);
        Settings.SAVE_SECRET_CHATS.save(true);
        assertFalse(offered());
        Settings.SAVE_TIMED_MEDIA.save(true);
        assertTrue(offered());
    }

    @Test public void theMenuItemsOwnSwitchStillDecides() throws IOException {
        MessageMenuSaveTest.Native.attachPath = folder.newFile("2_51.jpg").getPath();
        Settings.SAVE_TIMED_MEDIA.save(true);
        Settings.MESSAGE_MENU_SAVE_PROTECTED.save(false);
        assertFalse(offered());
    }

    @Test public void anEncryptedFileCountsAndIsSavedUnderThePlainName() throws IOException {
        // The copy decrypts a file only when it's the downloader's name plus .enc, so that's what it must get.
        sealed("2_77.jpg");
        Settings.SAVE_TIMED_MEDIA.save(true);
        assertTrue(offered());
        choose();
        assertEquals(List.of(Arrays.asList("2_77.jpg.enc", "2_77.jpg", "2_77.jpg")), Hand.saved);
        assertEquals("Saved to Downloads", ShadowToast.getTextOfLatestToast());
    }

    @Test public void anEncryptedFileIsLeftAloneWithTheSwitchOff() throws IOException {
        sealed("2_77.jpg");
        MessageMenuSaveTest.Native.restricted = true;
        assertFalse("nothing readable and nothing allowed", offered());
        choose();
        assertTrue(Hand.saved.isEmpty());
        assertEquals("Couldn't save that. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void timedMediaWithNoFileAtAllGetsNoItem() {
        MessageMenuSaveTest.Native.photo = new File(folder.getRoot(), "2_78.jpg");
        Settings.SAVE_TIMED_MEDIA.save(true);
        assertFalse(offered());
    }

    @Test public void aFileReallyNamedEncKeepsItsNameSoItIsNotDecrypted() throws IOException {
        // A protected chat's document called notes.enc is no encrypted media.
        Hand.timed = false;
        MessageMenuSaveTest.Native.restricted = true;
        MessageMenuSaveTest.Native.attachPath = folder.newFile("2_51.enc").getPath();
        MessageMenuSaveTest.Native.documentName = "notes.enc";
        assertTrue(offered());
        choose();
        assertEquals(List.of(Arrays.asList("2_51.enc", "notes.enc", "2_51.enc")), Hand.saved);
    }
}

/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.Looper;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowToast;

/** Edit a copy (#79): when the menu offers it, and how a photo reaches Telegram's photo editor. */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = 30, shadows = {PhotoEditTest.Menu.class, PhotoEditTest.Editor.class},
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class PhotoEditTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int EDITOR_ICON = 0x7f010003;

    /** A message as the open chat holds it. */
    static final class Message {
        boolean photo = true;
        boolean canSend = true;
        File file;
    }

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Menu {
        static Object selected;

        @Implementation protected static Object selected(Object chat) { return selected; }
        @Implementation protected static boolean photo(Object message) { return ((Message) message).photo; }
        @Implementation protected static boolean canSend(Object message) { return ((Message) message).canSend; }
        @Implementation protected static String attachPath(Object message) {
            File file = ((Message) message).file;
            return file == null ? null : file.getAbsolutePath();
        }
    }

    @Implements(value = PhotoEdit.class, isInAndroidSdk = false)
    public static class Editor {
        static boolean opens = true;
        static final List<Object[]> opened = new ArrayList<>();

        @Implementation protected static boolean open(Object chat, String path, Bitmap preview) {
            opened.add(new Object[] {chat, path, preview});
            return opens;
        }
        @Implementation protected static int icon() { return EDITOR_ICON; }
    }

    private File photo;

    @Before public void setUp() throws Exception {
        restore();
        PatchFamilyForTests.installed(PatchFamily.Capability.PHOTO_EDIT);
        Settings.MESSAGE_MENU_EDIT_COPY.save(true);
        photo = File.createTempFile("edit-photo-", ".png", RuntimeEnvironment.getApplication().getCacheDir());
        Bitmap source = Bitmap.createBitmap(1600, 1200, Bitmap.Config.ARGB_8888);
        source.eraseColor(Color.RED);
        try (OutputStream out = new FileOutputStream(photo)) {
            assertTrue(source.compress(Bitmap.CompressFormat.PNG, 100, out));
        }
    }

    @After public void restore() throws Exception {
        settle();
        PauseForTests.resume();
        Settings.MESSAGE_MENU_EDIT_COPY.resetToDefault();
        PatchFamilyForTests.resetCapabilities();
        Menu.selected = null;
        Editor.opens = true;
        Editor.opened.clear();
        HookStatus.clear();
        ShadowToast.reset();
        if (photo != null) photo.delete();
    }

    private static void settle() throws Exception {
        for (int round = 0; round < 3; round++) {
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }

    private Message message() {
        Message message = new Message();
        message.file = photo;
        return message;
    }

    // ---- The menu's item ----------------------------------------------------------------------

    @Test public void theSwitchStartsOffAndNothingIsOffered() {
        Settings.MESSAGE_MENU_EDIT_COPY.resetToDefault();
        assertFalse(Settings.MESSAGE_MENU_EDIT_COPY.get());
        assertFalse(PhotoEdit.offered(message(), true));
        List<Object> options = new ArrayList<>(Collections.singletonList(MessageMenu.DETAILS));
        MessageMenuTools.offer(new Object(), message(), new ArrayList<>(Collections.singletonList(0)),
                new ArrayList<>(Collections.singletonList("Message details")), options, true);
        assertEquals(Collections.singletonList(MessageMenu.DETAILS), options);
    }

    @Test public void offeredOnlyOnADownloadedPhotoInAChatThatAllowsForwardingAndSending() {
        assertTrue(PhotoEdit.offered(message(), true));
        assertFalse("a chat that doesn't allow saving", PhotoEdit.offered(message(), false));
        Message video = message();
        video.photo = false;
        assertFalse("not a photo", PhotoEdit.offered(video, true));
        Message readOnly = message();
        readOnly.canSend = false;
        assertFalse("a channel you can't post in", PhotoEdit.offered(readOnly, true));
        Message notDownloaded = message();
        notDownloaded.file = new File(photo.getParentFile(), "not-downloaded.jpg");
        assertFalse("not on the phone yet", PhotoEdit.offered(notDownloaded, true));
        PatchFamilyForTests.installed();
        assertFalse("a build without the patch's part", PhotoEdit.offered(message(), true));
        PatchFamilyForTests.installed(PatchFamily.Capability.PHOTO_EDIT);
        PauseForTests.pause(HushTelegramPause.Reason.CRASH_LOOP);
        assertFalse("paused", PhotoEdit.offered(message(), true));
    }

    @Test public void theMenuOffersEditACopyWithTheEditorIconBeforeDetails() {
        assertTrue(MessageMenuTools.any());
        List<Object> icons = new ArrayList<>(Collections.singletonList(0));
        List<Object> items = new ArrayList<>(Collections.singletonList("Message details"));
        List<Object> options = new ArrayList<>(Collections.singletonList(MessageMenu.DETAILS));
        MessageMenuTools.offer(new Object(), message(), icons, items, options, true);
        assertEquals(Arrays.asList(MessageMenuTools.EDIT_COPY, MessageMenu.DETAILS), options);
        assertEquals("Edit a copy", items.get(0));
        assertEquals(EDITOR_ICON, icons.get(0));
        assertEquals(Settings.MESSAGE_MENU_EDIT_COPY, MessageMenuTools.setting(MessageMenuTools.EDIT_COPY));
    }

    // ---- Opening the editor -------------------------------------------------------------------

    @Test public void choosingItOpensTheEditorOnThePhotoWithASmallPreview() throws Exception {
        Object chat = new Object();
        Menu.selected = message();
        MessageMenu.chosen(chat, MessageMenuTools.EDIT_COPY);
        settle();
        assertEquals(1, Editor.opened.size());
        assertSame(chat, Editor.opened.get(0)[0]);
        assertEquals(photo.getAbsolutePath(), Editor.opened.get(0)[1]);
        Bitmap preview = (Bitmap) Editor.opened.get(0)[2];
        assertEquals("1600 shrunk by 4 to fit 512", 400, preview.getWidth());
        assertEquals(300, preview.getHeight());
        assertNull("no toast when it opens", ShadowToast.getTextOfLatestToast());
        assertTrue(HookStatus.report().toString(), String.join("\n", HookStatus.report()).contains("photo editor opened 1"));
    }

    @Test public void aSmallPhotoKeepsItsSize() throws Exception {
        Bitmap small = Bitmap.createBitmap(300, 500, Bitmap.Config.ARGB_8888);
        try (OutputStream out = new FileOutputStream(photo)) {
            assertTrue(small.compress(Bitmap.CompressFormat.PNG, 100, out));
        }
        Bitmap preview = PhotoEdit.preview(photo);
        assertEquals(300, preview.getWidth());
        assertEquals(500, preview.getHeight());
    }

    @Test public void anEditorThatDoesntOpenSaysSo() throws Exception {
        Editor.opens = false;
        Menu.selected = message();
        MessageMenu.chosen(new Object(), MessageMenuTools.EDIT_COPY);
        settle();
        assertEquals(1, Editor.opened.size());
        assertEquals("Couldn't open that. Try again.", ShadowToast.getTextOfLatestToast());
        assertFalse(String.join("\n", HookStatus.report()).contains("photo editor opened"));
    }

    @Test public void aPhotoGoneFromThePhoneSaysSoAndOpensNothing() throws Exception {
        Message message = message();
        Menu.selected = message;
        assertTrue(photo.delete());
        MessageMenu.chosen(new Object(), MessageMenuTools.EDIT_COPY);
        settle();
        assertTrue(Editor.opened.isEmpty());
        assertEquals("Couldn't open that. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aFileThatIsntAPictureSaysSoAndOpensNothing() throws Exception {
        Files.write(photo.toPath(), "not a picture".getBytes(StandardCharsets.UTF_8));
        Menu.selected = message();
        MessageMenu.chosen(new Object(), MessageMenuTools.EDIT_COPY);
        settle();
        assertTrue(Editor.opened.isEmpty());
        assertEquals("Couldn't open that. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void theSwitchOffIgnoresTheChoice() throws Exception {
        Settings.MESSAGE_MENU_EDIT_COPY.save(false);
        Menu.selected = message();
        MessageMenu.chosen(new Object(), MessageMenuTools.EDIT_COPY);
        settle();
        assertTrue(Editor.opened.isEmpty());
        assertNull(ShadowToast.getTextOfLatestToast());
    }
}

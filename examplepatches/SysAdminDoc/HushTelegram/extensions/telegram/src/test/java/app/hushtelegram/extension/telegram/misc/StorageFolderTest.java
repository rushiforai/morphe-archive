/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.AppOpsManager;
import android.content.Context;
import android.os.Environment;

import java.io.File;
import java.io.IOException;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.shadows.ShadowMediaScannerConnection;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Where Telegram's own folder goes when the storage folder switch is on (#7). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class StorageFolderTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();
    private long savedWait;

    @Before public void setUp() {
        HookStatus.clear();
        PauseForTests.resume();
        Settings.STORAGE_FOLDER.resetToDefault();
        Settings.STORAGE_FOLDER_NAME.resetToDefault();
        earlierFolders().edit().clear().commit();
        savedWait = StorageFolder.startupWaitMillis;
        StorageFolder.moved = null;
        allFilesAccess(false);
    }

    @After public void restore() {
        StorageFolder.startupWaitMillis = savedWait;
        StorageFolder.moved = null;
        allFilesAccess(false);
        Settings.STORAGE_FOLDER.resetToDefault();
        Settings.STORAGE_FOLDER_NAME.resetToDefault();
        earlierFolders().edit().clear().commit();
        PauseForTests.resume();
        HookStatus.clear();
    }

    /**
     * All files access the way Android keeps it, as Telegram's app op, which is what
     * StorageFolder.allFilesAccess() reads. Robolectric has no shadow setter for it, and its
     * Environment.isExternalStorageManager() throws, since the sandbox has no storage volumes.
     */
    public static void allFilesAccess(boolean on) {
        Context context = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(context.getSystemService(AppOpsManager.class)).setMode("android:manage_external_storage",
                context.getApplicationInfo().uid, context.getPackageName(), on ? AppOpsManager.MODE_ALLOWED : AppOpsManager.MODE_ERRORED);
    }

    @Test public void theFolderMovesOnlyWithEverythingInPlace() throws IOException {
        File folder = temporary.newFolder("Android", "data", "Telegram");
        File storage = temporary.newFolder("storage");
        assertSame(folder, StorageFolder.folderFor(folder, 29, true, true, storage, "Telegram"));
        assertSame(folder, StorageFolder.folderFor(folder, 30, false, true, storage, "Telegram"));
        assertSame(folder, StorageFolder.folderFor(folder, 30, true, false, storage, "Telegram"));
        assertSame(folder, StorageFolder.folderFor(folder, 30, true, true, null, "Telegram"));
        assertEquals(null, StorageFolder.folderFor(null, 30, true, true, storage, "Telegram"));
        assertFalse(new File(storage, "Telegram").exists());

        File moved = StorageFolder.folderFor(folder, 30, true, true, storage, "Telegram");
        assertEquals(new File(storage, "Telegram"), moved);
        assertTrue(moved.isDirectory());
        // A second start finds the folder already there.
        assertEquals(moved, StorageFolder.folderFor(folder, 31, true, true, storage, "Telegram"));
    }

    private static android.content.SharedPreferences earlierFolders() {
        return StorageFolder.store.apply(app.hushtelegram.extension.shared.Utils.getContext());
    }

    /** What the reporter asked for: Internal storage/Plus rather than Internal storage/Telegram (#7). */
    @Test public void theRowsNameSaysWhichFolderInInternalStorage() throws IOException {
        File folder = temporary.newFolder("data");
        Settings.STORAGE_FOLDER.save(true);
        allFilesAccess(true);
        assertEquals(new File(Environment.getExternalStorageDirectory(), "Telegram"), StorageFolder.telegramFolder(folder));

        Settings.STORAGE_FOLDER_NAME.save("Plus");
        File plus = new File(Environment.getExternalStorageDirectory(), "Plus");
        assertEquals(plus, StorageFolder.telegramFolder(folder));
        assertTrue(plus.isDirectory());

        Settings.STORAGE_FOLDER_NAME.save("Documents/Chats");
        File nested = new File(Environment.getExternalStorageDirectory(), "Documents/Chats");
        assertEquals(nested, StorageFolder.telegramFolder(folder));
        assertTrue(nested.isDirectory());

        // A name edited by hand in a settings file never gets past the check.
        Settings.STORAGE_FOLDER_NAME.save("../../data");
        assertEquals(new File(Environment.getExternalStorageDirectory(), "Telegram"), StorageFolder.telegramFolder(folder));
    }

    @Test public void aNewNameStillFindsFilesInEveryFolderBeforeIt() throws IOException {
        File folder = temporary.newFolder("data");
        File inData = new File(folder, "Telegram Documents/first.pdf");
        assertTrue(inData.getParentFile().mkdirs() && inData.createNewFile());
        Settings.STORAGE_FOLDER.save(true);
        allFilesAccess(true);

        File first = StorageFolder.telegramFolder(folder);
        File inFirst = new File(first, "Telegram Documents/second.pdf");
        assertTrue(inFirst.getParentFile().mkdirs() && inFirst.createNewFile());

        // After a restart under the new name, as a restart is what Telegram reads the folder on.
        Settings.STORAGE_FOLDER_NAME.save("Plus");
        File plus = StorageFolder.telegramFolder(folder);
        assertEquals(inData, StorageFolder.olderFile(new File(plus, "Telegram Documents/first.pdf")));
        assertEquals(inFirst, StorageFolder.olderFile(new File(plus, "Telegram Documents/second.pdf")));
        File fresh = new File(plus, "Telegram Documents/third.pdf");
        assertSame("a new download goes in the new folder", fresh, StorageFolder.olderFile(fresh));

        // Back to the first name, Plus's files count as older ones and the first folder as its own.
        File inPlus = new File(plus, "Telegram Documents/fourth.pdf");
        assertTrue(inPlus.getParentFile().mkdirs() && inPlus.createNewFile());
        Settings.STORAGE_FOLDER_NAME.save("");
        assertEquals(first, StorageFolder.telegramFolder(folder));
        assertEquals(inPlus, StorageFolder.olderFile(new File(first, "Telegram Documents/fourth.pdf")));
        File own = new File(first, "Telegram Documents/second.pdf");
        assertSame("a file in the folder in use is its own", own, StorageFolder.olderFile(own));
    }

    @Test public void onlyAFolderUnderInternalStorageIsAName() {
        for (String good : new String[] {"", "Plus", "Telegram", "My Files", "Documents/Chats", ".hidden", "Android2", "Телеграм"}) {
            assertTrue(good, StorageFolder.allowedName(good));
        }
        StringBuilder tooLong = new StringBuilder();
        for (int i = 0; i <= StorageFolder.MAX_NAME_CHARS; i++) tooLong.append('a');
        for (String bad : new String[] {"..", "../x", "a/../b", "a/.", "a//b", "Android", "android/data", "ANDROID", "a:b", "a*", "a?", "a|b", "a\"b",
                "a<b", "a>b", "a\\b", "dots.", " a", "a ", "a/ b", "a" + (char) 0x0a + "b", "a" + (char) 0x200f + "b", tooLong.toString()}) {
            assertFalse(bad, StorageFolder.allowedName(bad));
        }
        assertFalse(StorageFolder.allowedName(null));
    }

    @Test public void aWholePathIsCutDownToThePartUnderInternalStorage() {
        assertEquals("Plus", StorageFolder.cleanName("/storage/emulated/0/Plus"));
        assertEquals("Plus", StorageFolder.cleanName("storage/emulated/0/Plus"));
        assertEquals("Plus", StorageFolder.cleanName("  /sdcard/Plus/ "));
        assertEquals("Plus/Chats", StorageFolder.cleanName("SDCARD/Plus/Chats"));
        assertEquals("Plus", StorageFolder.cleanName("/Plus/"));
        assertEquals("", StorageFolder.cleanName(null));
        assertEquals("", StorageFolder.cleanName(" / "));
        assertFalse("a climb is still a climb", StorageFolder.allowedName(StorageFolder.cleanName("/storage/emulated/0/../..")));
    }

    @Test public void aFileInTheWayKeepsAndroidData() throws IOException {
        File folder = temporary.newFolder("data");
        File storage = temporary.newFolder("storage");
        assertTrue(new File(storage, "Telegram").createNewFile());
        assertSame(folder, StorageFolder.folderFor(folder, 30, true, true, storage, "Telegram"));
    }

    @Test public void theSwitchAndAllFilesAccessMoveTheFolder() throws IOException {
        File folder = temporary.newFolder("data");
        Settings.STORAGE_FOLDER.save(true);
        assertSame(folder, StorageFolder.telegramFolder(folder));
        assertFalse(HookStatus.report().get(0).contains("storage folder"));

        allFilesAccess(true);
        assertTrue(StorageFolder.allFilesAccess());
        File moved = StorageFolder.telegramFolder(folder);
        assertEquals(new File(Environment.getExternalStorageDirectory(), "Telegram"), moved);
        assertTrue(moved.isDirectory());
        assertTrue(HookStatus.report().get(0), HookStatus.report().get(0).contains("storage folder 1"));

        Settings.STORAGE_FOLDER.save(false);
        assertSame(folder, StorageFolder.telegramFolder(folder));
    }

    /** The reporter's case: Save to Gallery off, yet every downloaded photo showed in the gallery (#60). */
    @Test public void theMovedFolderStaysOutOfTheGallery() throws IOException {
        File folder = temporary.newFolder("data");
        Settings.STORAGE_FOLDER.save(true);
        allFilesAccess(true);
        File moved = StorageFolder.telegramFolder(folder);
        assertEquals(new File(Environment.getExternalStorageDirectory(), "Telegram"), moved);
        assertTrue(new File(moved, StorageFolder.NO_MEDIA).isFile());
        assertTrue("what the gallery found already goes too",
                ShadowMediaScannerConnection.getSavedPaths().contains(moved.getPath()));
        assertTrue(HookStatus.report().get(0), HookStatus.report().get(0).contains("kept out of the gallery 1"));

        // Telegram deletes the .nomedia in its Images and Video folders at every start; the one at the top stays.
        File images = new File(moved, "Telegram Images");
        assertTrue(images.mkdirs());
        new File(images, StorageFolder.NO_MEDIA).delete();
        assertEquals(moved, StorageFolder.telegramFolder(folder));
        assertTrue(new File(moved, StorageFolder.NO_MEDIA).isFile());
        assertTrue("a .nomedia already there isn't scanned again",
                HookStatus.report().get(0).contains("kept out of the gallery 1"));
    }

    @Test public void aFolderInsideAnAndroidFolderHidesOnlyTelegramsFolders() throws IOException {
        File folder = temporary.newFolder("data");
        Settings.STORAGE_FOLDER.save(true);
        Settings.STORAGE_FOLDER_NAME.save("Pictures/TG");
        allFilesAccess(true);
        File pictures = new File(Environment.getExternalStorageDirectory(), "Pictures");
        File moved = StorageFolder.telegramFolder(folder);
        assertEquals(new File(pictures, "TG"), moved);
        // Save to Gallery's copies and the user's own photos there still show.
        assertFalse(new File(moved, StorageFolder.NO_MEDIA).exists());
        assertFalse(new File(pictures, StorageFolder.NO_MEDIA).exists());
        for (String inside : StorageFolder.TELEGRAM_FOLDERS) {
            assertTrue(inside, new File(new File(moved, inside), StorageFolder.NO_MEDIA).isFile());
        }

        // Any case of the shared folder's name counts, and a file in the way of one folder leaves the rest.
        File download = temporary.newFolder("download", "Telegram");
        assertTrue(new File(download, "Telegram Images").createNewFile());
        assertTrue(StorageFolder.hideFromGallery(download, "download/Telegram"));
        assertFalse(new File(download, StorageFolder.NO_MEDIA).exists());
        assertTrue(new File(new File(download, "Telegram Video"), StorageFolder.NO_MEDIA).isFile());
        assertFalse(StorageFolder.hideFromGallery(download, "download/Telegram"));
    }

    @Test public void aStartBeforeSettingsKeepsAndroidData() throws Exception {
        File folder = temporary.newFolder("data");
        Settings.STORAGE_FOLDER.save(true);
        allFilesAccess(true);
        StorageFolder.startupWaitMillis = 50L;
        File[] answer = new File[1];
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            Thread worker = new Thread(() -> answer[0] = StorageFolder.telegramFolder(folder));
            worker.start();
            try {
                worker.join(5_000L);
            } catch (InterruptedException interrupted) {
                throw new AssertionError(interrupted);
            }
        });
        assertSame(folder, answer[0]);
        assertFalse(HookStatus.report().get(0).contains("storage folder"));
    }

    @Test public void aPauseKeepsAndroidData() throws IOException {
        File folder = temporary.newFolder("data");
        Settings.STORAGE_FOLDER.save(true);
        allFilesAccess(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertSame(reason.name(), folder, StorageFolder.telegramFolder(folder));
            PauseForTests.resume();
        }
        assertTrue(Settings.STORAGE_FOLDER.savedValue());
        assertFalse(HookStatus.report().get(0).contains("storage folder"));
    }

    @Test public void aFileFromBeforeTheMoveOpensWhereItWas() throws IOException {
        File from = temporary.newFolder("Android", "data", "files", "Telegram");
        File to = temporary.newFolder("storage", "Telegram");
        File older = new File(new File(from, "Telegram Audio"), "voice.ogg");
        assertTrue(older.getParentFile().mkdirs() && older.createNewFile());
        File asked = new File(new File(to, "Telegram Audio"), "voice.ogg");
        assertEquals(older, StorageFolder.olderFor(asked, from, to));

        // A copy in the moved folder wins, and a file that's nowhere yet downloads to the moved folder.
        assertTrue(asked.getParentFile().mkdirs() && asked.createNewFile());
        assertSame(asked, StorageFolder.olderFor(asked, from, to));
        File fresh = new File(new File(to, "Telegram Audio"), "new.ogg");
        assertSame(fresh, StorageFolder.olderFor(fresh, from, to));

        // Telegram's cache, a folder that only starts with the same name, and a folder in the old place stay as asked.
        File cache = new File(temporary.getRoot(), "cache/voice.ogg");
        assertSame(cache, StorageFolder.olderFor(cache, from, to));
        File sibling = new File(to.getPath() + "2", "Telegram Audio/voice.ogg");
        // Where a match without the separator would look for it.
        File unrelated = new File(from, "2/Telegram Audio/voice.ogg");
        assertTrue(unrelated.getParentFile().mkdirs() && unrelated.createNewFile());
        assertSame(sibling, StorageFolder.olderFor(sibling, from, to));
        assertTrue(new File(from, "Telegram Video/clip.mp4").mkdirs());
        File clip = new File(to, "Telegram Video/clip.mp4");
        assertSame(clip, StorageFolder.olderFor(clip, from, to));
    }

    @Test public void olderFilesFollowTheMove() throws IOException {
        File folder = temporary.newFolder("data");
        File older = new File(folder, "Telegram Documents/report.pdf");
        assertTrue(older.getParentFile().mkdirs() && older.createNewFile());
        File asked = new File(new File(Environment.getExternalStorageDirectory(), "Telegram"), "Telegram Documents/report.pdf");
        assertSame(asked, StorageFolder.olderFile(asked));
        assertEquals(null, StorageFolder.olderFile(null));

        Settings.STORAGE_FOLDER.save(true);
        allFilesAccess(true);
        assertEquals(asked.getParentFile().getParentFile(), StorageFolder.telegramFolder(folder));
        assertEquals(older, StorageFolder.olderFile(asked));
        assertTrue(HookStatus.report().get(0), HookStatus.report().get(0).contains("older file 1"));

        // Back in Android/data, the moved folder's paths are Telegram's own again.
        Settings.STORAGE_FOLDER.save(false);
        assertSame(folder, StorageFolder.telegramFolder(folder));
        assertSame(asked, StorageFolder.olderFile(asked));
    }
}

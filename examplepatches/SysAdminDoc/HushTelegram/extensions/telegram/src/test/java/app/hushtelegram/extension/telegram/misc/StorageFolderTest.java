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
        savedWait = StorageFolder.startupWaitMillis;
        StorageFolder.moved = null;
        allFilesAccess(false);
    }

    @After public void restore() {
        StorageFolder.startupWaitMillis = savedWait;
        StorageFolder.moved = null;
        allFilesAccess(false);
        Settings.STORAGE_FOLDER.resetToDefault();
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
        assertSame(folder, StorageFolder.folderFor(folder, 29, true, true, storage));
        assertSame(folder, StorageFolder.folderFor(folder, 30, false, true, storage));
        assertSame(folder, StorageFolder.folderFor(folder, 30, true, false, storage));
        assertSame(folder, StorageFolder.folderFor(folder, 30, true, true, null));
        assertEquals(null, StorageFolder.folderFor(null, 30, true, true, storage));
        assertFalse(new File(storage, "Telegram").exists());

        File moved = StorageFolder.folderFor(folder, 30, true, true, storage);
        assertEquals(new File(storage, "Telegram"), moved);
        assertTrue(moved.isDirectory());
        // A second start finds the folder already there.
        assertEquals(moved, StorageFolder.folderFor(folder, 31, true, true, storage));
    }

    @Test public void aFileInTheWayKeepsAndroidData() throws IOException {
        File folder = temporary.newFolder("data");
        File storage = temporary.newFolder("storage");
        assertTrue(new File(storage, "Telegram").createNewFile());
        assertSame(folder, StorageFolder.folderFor(folder, 30, true, true, storage));
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

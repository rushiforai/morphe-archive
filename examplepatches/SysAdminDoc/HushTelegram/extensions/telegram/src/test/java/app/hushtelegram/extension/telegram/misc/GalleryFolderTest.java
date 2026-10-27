/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.ContentValues;

import java.io.File;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class GalleryFolderTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.GALLERY_FOLDER);
        Settings.GALLERY_FOLDER.resetToDefault();
        HookStatus.clear();
    }

    /** What Telegram's saveFileInternal puts for a photo, with its folder as Telegram writes it. */
    private static ContentValues saved(String folder) {
        ContentValues values = new ContentValues();
        GalleryFolder.put(values, "relative_path", folder);
        GalleryFolder.put(values, "_display_name", "IMG_20261026_120000_001.jpg");
        GalleryFolder.put(values, "mime_type", "image/jpeg");
        return values;
    }

    private static void assertTelegramFolders(String why) {
        assertEquals(why, "Pictures/Telegram/", saved("Pictures/Telegram/").getAsString("relative_path"));
        assertEquals(why, "Movies/Telegram/", saved("Movies/Telegram/").getAsString("relative_path"));
    }

    @Test public void telegramsFoldersAreTheDefault() {
        assertEquals("", Settings.GALLERY_FOLDER.defaultValue);
        assertTelegramFolders("default");
    }

    @Test public void dcimTakesPhotosAndVideosTogether() {
        Settings.GALLERY_FOLDER.save(GalleryFolder.DCIM);
        assertEquals("DCIM/Telegram/", saved("Pictures/Telegram/").getAsString("relative_path"));
        assertEquals("DCIM/Telegram/", saved("Movies/Telegram/").getAsString("relative_path"));
    }

    @Test public void dcimApartKeepsPhotosAndVideosInTheirOwnFolders() {
        Settings.GALLERY_FOLDER.save(GalleryFolder.DCIM_APART);
        assertEquals("DCIM/Telegram/Photos/", saved("Pictures/Telegram/").getAsString("relative_path"));
        assertEquals("DCIM/Telegram/Videos/", saved("Movies/Telegram/").getAsString("relative_path"));
    }

    @Test public void everythingElseTelegramPutsGoesInAsItCame() {
        Settings.GALLERY_FOLDER.save(GalleryFolder.DCIM);
        ContentValues values = saved("Pictures/Telegram/");
        assertEquals("IMG_20261026_120000_001.jpg", values.getAsString("_display_name"));
        assertEquals("image/jpeg", values.getAsString("mime_type"));
        // Document and song copies keep their folders, and a name that happens to match a folder isn't one.
        for (String other : new String[]{"Download/Telegram/", "Music/Telegram/", "Pictures/Telegram", "pictures/telegram/", null}) {
            assertEquals(String.valueOf(other), other, saved(other).getAsString("relative_path"));
        }
        ContentValues named = new ContentValues();
        GalleryFolder.put(named, "_display_name", "Pictures/Telegram/");
        assertEquals("Pictures/Telegram/", named.getAsString("_display_name"));
    }

    @Test public void androidNineSavesMoveTheirFolderUnderTheSameStorage() {
        File storage = new File("/storage/emulated/0");
        File pictures = new File(new File(storage, "Pictures"), "Telegram");
        File movies = new File(new File(storage, "Movies"), "Telegram");
        assertSame("default", pictures, GalleryFolder.older(pictures));
        Settings.GALLERY_FOLDER.save(GalleryFolder.DCIM);
        assertEquals(new File(storage, "DCIM/Telegram"), GalleryFolder.older(pictures));
        assertEquals(new File(storage, "DCIM/Telegram"), GalleryFolder.older(movies));
        Settings.GALLERY_FOLDER.save(GalleryFolder.DCIM_APART);
        assertEquals(new File(storage, "DCIM/Telegram/Photos"), GalleryFolder.older(pictures));
        assertEquals(new File(storage, "DCIM/Telegram/Videos"), GalleryFolder.older(movies));
        // Documents, songs, other names and a folder with nothing above it come back as they were.
        for (File other : new File[]{new File(new File(storage, "Download"), "Telegram"), new File(new File(storage, "Music"), "Telegram"),
                new File(new File(storage, "Pictures"), "Other"), new File("Pictures/Telegram"), new File("Telegram")}) {
            assertSame(other.getPath(), other, GalleryFolder.older(other));
        }
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertSame(reason.name(), pictures, GalleryFolder.older(pictures));
            PauseForTests.resume();
        }
    }

    @Test public void onlyTheChoicesAreAllowedAndAnyOtherValueReadsAsTelegrams() {
        for (String choice : GalleryFolder.CHOICES) assertTrue(choice, GalleryFolder.allowed(choice));
        for (String bad : new String[]{null, "DCIM/Telegram/", "/sdcard/DCIM", "../Android/data", "DCIM", " dcim", "Download"}) {
            assertFalse(String.valueOf(bad), GalleryFolder.allowed(bad));
        }
        Settings.GALLERY_FOLDER.save("../../Android/data/org.telegram.messenger/");
        assertTelegramFolders("a path saved by hand");
        Settings.GALLERY_FOLDER.save("/storage/emulated/0/DCIM/");
        assertTelegramFolders("an absolute path");
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSettingKeepsTelegramsFolders() {
        Settings.GALLERY_FOLDER.save(GalleryFolder.DCIM);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertTelegramFolders(reason.name());
            // What the person picked is kept for after the pause.
            assertEquals(GalleryFolder.DCIM, Settings.GALLERY_FOLDER.savedValue());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertTelegramFolders("before the settings are ready"));
        SettingReadsForTests.breakReads(Settings.GALLERY_FOLDER);
        assertTelegramFolders("unreadable");
        SettingReadsForTests.mend(Settings.GALLERY_FOLDER);
        assertEquals("DCIM/Telegram/", saved("Movies/Telegram/").getAsString("relative_path"));
    }
}

/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.os.Environment;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

import app.morphe.extension.hushthreads.download.DownloadQuality;
import app.morphe.extension.hushthreads.download.FileNameTemplate;
import app.morphe.extension.hushthreads.download.SaveFolder;
import app.morphe.extension.hushthreads.download.SaveSettings;
import app.morphe.extension.hushthreads.download.SavesForTests;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BaseSettings;

/**
 * The Downloads section: drawn only in a build with the save patch, with its switches and the
 * quality, folder and file name rows above Pause, and a row with Cancel for each save running now.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SaveSettingsRowsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        SavesForTests.endAll();
        SavesForTests.resetCarouselOutcome();
        SaveSettings.SAVE_FOLDER.resetToDefault();
        SaveSettings.DOWNLOAD_QUALITY.resetToDefault();
    }

    @Test
    public void aBuildWithoutTheSavePatchHasNoDownloadsSection() {
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment page = pageOf(controller);
            assertNull(page.findPreference(Settings.SAVE_MEDIA.key));
            assertNull(page.findPreference(SaveSettings.SAVE_FOLDER.key));
            assertFalse(sections(page).contains("Downloads"));
            assertNull(page.saves);
        }
    }

    @Test
    public void aBuildWithTheSavePatchShowsEveryRowAbovePause() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.SAVE_MEDIA);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment page = pageOf(controller);
            assertTrue(sections(page).toString(), sections(page).contains("Downloads"));
            List<Preference> rows = new ArrayList<>();
            collect(page.getPreferenceScreen(), rows);
            int pause = indexOfKey(rows, BaseSettings.PAUSED.key);
            String[] keys = {Settings.SAVE_MEDIA.key, Settings.DOWNLOAD_COMPATIBLE.key, SaveSettings.DOWNLOAD_QUALITY.key,
                    SaveSettings.SAVE_FOLDER.key, SaveSettings.FILENAME_TEMPLATE.key};
            int last = -1;
            for (String key : keys) {
                int at = indexOfKey(rows, key);
                assertTrue(key + " is missing", at >= 0);
                assertTrue(key + " is out of order", at > last);
                assertTrue(key + " is drawn below the Pause row", at < pause);
                last = at;
            }
            Preference save = page.findPreference(Settings.SAVE_MEDIA.key);
            assertTrue(save instanceof SwitchPreference);
            assertEquals("Save photos and videos", String.valueOf(save.getTitle()));
            assertTrue(((SwitchPreference) save).isChecked());
            assertEquals("Download quality", String.valueOf(page.findPreference(SaveSettings.DOWNLOAD_QUALITY.key).getTitle()));
            assertEquals("Each video saves at the best quality the player streams.",
                    String.valueOf(page.findPreference(SaveSettings.DOWNLOAD_QUALITY.key).getSummary()));
            assertEquals("Videos go to " + Environment.DIRECTORY_MOVIES + "/Threads and photos to "
                            + Environment.DIRECTORY_PICTURES + "/Threads.",
                    plain(page.findPreference(SaveSettings.SAVE_FOLDER.key).getSummary()));
            assertEquals("Videos are named " + FileNameTemplate.DEFAULT + ". Photos are always named "
                            + FileNameTemplate.PHOTO_PREFIX + " followed by the date and time.",
                    plain(page.findPreference(SaveSettings.FILENAME_TEMPLATE.key).getSummary()));
            assertNotNull(page.saves);
        }
    }

    @Test
    public void aFolderNameIsCleanedBeforeItsKept() {
        SaveSettingsRows.FolderRow row = SaveSettingsRows.folderRow(RuntimeEnvironment.getApplication());
        assertTrue(row.getOnPreferenceChangeListener().onPreferenceChange(row, "Threads saves"));
        assertFalse(row.getOnPreferenceChangeListener().onPreferenceChange(row, "a/b"));
        assertEquals(SaveFolder.sanitize("a/b"), row.getText());
        assertEquals(SaveSettingsRows.folderSummary(SaveFolder.sanitize("a/b")), String.valueOf(row.getSummary()));
    }

    @Test
    public void theQualityRowSaysWhatEachChoiceDoes() {
        SaveSettingsRows.QualityRow row = SaveSettingsRows.qualityRow(RuntimeEnvironment.getApplication());
        assertEquals(DownloadQuality.values().length, row.getEntries().length);
        assertEquals("Best", String.valueOf(row.getEntries()[0]));
        row.setValue(DownloadQuality.SMALLEST.name());
        assertEquals("Each video saves at its lowest quality, for the smallest file.", String.valueOf(row.getSummary()));
    }

    @Test
    public void aRunningSaveIsListedWithCancelUntilItEnds() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.SAVE_MEDIA);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment page = pageOf(controller);
            int id = SavesForTests.begin(controller.get(), true);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            Preference row = page.findPreference("running_save_" + id);
            assertNotNull("the running save isn't listed", row);
            assertEquals("Saving a video", String.valueOf(row.getTitle()));

            SavesForTests.finishCarousel(SavesForTests.beginCarousel(controller.get(), 2), 2, 0, 0, 0, false);
            SavesForTests.end(id);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertNull("an ended save is still listed", page.findPreference("running_save_" + id));
            Preference outcome = page.findPreference("hushthreads_last_carousel_save");
            assertNotNull(outcome);
            assertEquals("Saved 2. Failed 0. Skipped 0.", String.valueOf(outcome.getSummary()));

            // A hidden page stops following the saves.
            controller.pause();
            int later = SavesForTests.begin(controller.get(), false);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertNull(page.findPreference("running_save_" + later));
            controller.resume();
            assertNotNull(page.findPreference("running_save_" + later));
        }
    }

    /** What a row shows, without the marks that keep a name in place in a right-to-left sentence. */
    private static String plain(CharSequence text) {
        return String.valueOf(text).replaceAll("[\\u2066-\\u2069]", "");
    }

    private static HushThreadsPreferenceFragment pageOf(ActivityController<Activity> controller) {
        HushThreadsPreferenceFragment fragment = new HushThreadsPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction()
                .add(android.R.id.content, fragment)
                .commitNow();
        return fragment;
    }

    private static List<String> sections(HushThreadsPreferenceFragment page) {
        List<String> titles = new ArrayList<>();
        PreferenceGroup screen = page.getPreferenceScreen();
        for (int i = 0; i < screen.getPreferenceCount(); i++) {
            if (screen.getPreference(i) instanceof PreferenceCategory) {
                titles.add(String.valueOf(screen.getPreference(i).getTitle()));
            }
        }
        return titles;
    }

    private static int indexOfKey(List<Preference> rows, String key) {
        for (int i = 0; i < rows.size(); i++) {
            if (key.equals(rows.get(i).getKey())) return i;
        }
        return -1;
    }

    private static void collect(PreferenceGroup group, List<Preference> rows) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference preference = group.getPreference(i);
            if (preference instanceof PreferenceGroup) {
                collect((PreferenceGroup) preference, rows);
            } else {
                rows.add(preference);
            }
        }
    }
}

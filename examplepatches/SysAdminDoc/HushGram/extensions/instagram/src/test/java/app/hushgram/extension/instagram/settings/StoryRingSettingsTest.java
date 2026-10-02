/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;

import app.hushgram.extension.instagram.stories.StoryRingSize;
import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.SettingsContextRule;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

/**
 * With Story ring size in the build, the Stories section has its switch and the list of sizes right
 * below it, which says what the chosen size does. A share such as 130% shows as it is: the list's
 * summary isn't run through String.format, which a percent sign breaks. Without the patch there's
 * neither row.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class StoryRingSettingsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        Settings.STORY_RING.resetToDefault();
        Settings.STORY_RING_SCALE.resetToDefault();
    }

    @Test
    public void theRingSizeRowOffersEachSizeAndSaysWhatItDoes() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.STORY_RING, PatchFamily.STORIES_TRAY);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushgramPreferenceFragment page = DownloadSettingsTest.pageIn(controller);
            List<Preference> rows = rowsOf(page);
            int toggle = indexOfKey(rows, Settings.STORY_RING.key);
            assertTrue("no Story ring size switch", toggle >= 0);
            Preference sw = rows.get(toggle);
            assertTrue(sw instanceof SwitchPreference);
            assertTrue("picking the patch is the choice to use it", ((SwitchPreference) sw).isChecked());
            assertEquals("Story ring size", String.valueOf(sw.getTitle()));
            assertTrue("the switch comes after the tray's two", toggle > indexOfKey(rows, Settings.HIDE_STORIES_TRAY.key));

            assertTrue(rows.get(toggle + 1) instanceof HushgramPreferenceFragment.StoryRingRow);
            HushgramPreferenceFragment.StoryRingRow size = (HushgramPreferenceFragment.StoryRingRow) rows.get(toggle + 1);
            assertEquals(Settings.STORY_RING_SCALE.key, size.getKey());
            assertEquals("Ring size", String.valueOf(size.getTitle()));
            List<String> entries = new ArrayList<>();
            for (CharSequence entry : size.getEntries()) entries.add(String.valueOf(entry));
            assertEquals(Arrays.asList("Much smaller", "Smaller", "Instagram's size", "Larger", "Much larger"), entries);

            assertEquals("INSTAGRAM", size.getValue());
            assertEquals("The rings are the size Instagram picks for your screen.", String.valueOf(size.getSummary()));

            // Every pick, the way the list's dialog sends one, is saved and read back as its share.
            for (StoryRingSize each : StoryRingSize.values()) {
                if (each == StoryRingSize.INSTAGRAM) continue;
                size.setValue(each.name());
                ShadowLooper.idleMainLooper();
                assertEquals(each, Settings.STORY_RING_SCALE.savedValue());
                String share = NumberFormat.getPercentInstance().format(each.percent() / 100.0);
                assertEquals("The rings are " + L10n.isolate(share) + " of the size Instagram picks for your screen.",
                        String.valueOf(size.getSummary()));
            }
        }

        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.STORIES_TRAY);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            for (Preference row : rowsOf(DownloadSettingsTest.pageIn(controller))) {
                assertFalse("a ring size row with no Story ring size in the build",
                        row instanceof HushgramPreferenceFragment.StoryRingRow);
                assertFalse(Settings.STORY_RING.key.equals(row.getKey()));
            }
        }
    }

    private static List<Preference> rowsOf(HushgramPreferenceFragment page) {
        List<Preference> rows = new ArrayList<>();
        collect(page.getPreferenceScreen(), rows);
        assertNotNull(page.getPreferenceScreen());
        assertFalse("the screen has no rows", rows.isEmpty());
        return rows;
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

    private static int indexOfKey(List<Preference> rows, String key) {
        for (int i = 0; i < rows.size(); i++) {
            if (key.equals(rows.get(i).getKey())) return i;
        }
        return -1;
    }
}

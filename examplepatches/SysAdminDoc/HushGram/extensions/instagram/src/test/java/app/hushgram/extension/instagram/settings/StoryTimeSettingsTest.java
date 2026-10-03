/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

import static org.junit.Assert.*;
import android.app.Activity;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;
import java.util.Collections;
import java.util.EnumSet;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/** Show a story's exact time's switch: under Stories, on to start, off while paused. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
@SuppressWarnings("deprecation")
public class StoryTimeSettingsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private HushgramPreferenceFragment page;

    @Before public void prepare() {
        RuntimeEnvironment.getApplication().getApplicationInfo().targetSdkVersion = 36;
        Settings.SHOW_STORY_TIME.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        BaseSettings.SAFE_MODE.save(false);
        Settings.SIGN_IN_NOTICE_HIDDEN.save(true);
    }
    @After public void close() throws Exception {
        if (controller != null) controller.close();
        Utils.awaitBackgroundTasksForTests();
        PatchFamily.inBuildForTests = null;
        Settings.SHOW_STORY_TIME.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.SIGN_IN_NOTICE_HIDDEN.resetToDefault();
    }
    private void open(boolean installed) throws Exception {
        PatchFamily.inBuildForTests = installed ? EnumSet.of(PatchFamily.STORY_TIME) : EnumSet.noneOf(PatchFamily.class);
        controller = Robolectric.buildActivity(Activity.class).setup();
        page = new HushgramPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
        Utils.awaitBackgroundTasksForTests();
    }
    @Test public void missingPatchHasNoStoryTimeSwitch() throws Exception {
        open(false);
        assertNull(page.getPreferenceScreen().findPreference(Settings.SHOW_STORY_TIME.key));
    }
    @Test public void storyTimeSwitchStartsOnUnderStoriesPersistsAndHonorsPause() throws Exception {
        open(true);
        SwitchPreference row = (SwitchPreference) page.getPreferenceScreen().findPreference(Settings.SHOW_STORY_TIME.key);
        assertNotNull(row);
        assertEquals("Show a story's exact time", row.getTitle().toString());
        assertEquals("Stories", String.valueOf(sectionOf(page.getPreferenceScreen(), row).getTitle()));
        assertTrue(row.isChecked());
        assertTrue(Settings.SHOW_STORY_TIME.get());
        assertEquals(Collections.singletonList(Settings.SHOW_STORY_TIME), PatchFamily.STORY_TIME.switches);
        assertEquals("Show a story's exact time", PatchFamily.STORY_TIME.patchName);
        assertTrue(ConfigurationBackup.eligible().containsKey(Settings.SHOW_STORY_TIME.key));

        Settings.SHOW_STORY_TIME.save(false);
        assertFalse(Settings.SHOW_STORY_TIME.savedValue());
        Settings.SHOW_STORY_TIME.save(true);
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertFalse(Settings.SHOW_STORY_TIME.get());
        assertTrue(Settings.SHOW_STORY_TIME.savedValue());
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        assertTrue(Settings.SHOW_STORY_TIME.get());
        assertEquals(36, RuntimeEnvironment.getApplication().getApplicationInfo().targetSdkVersion);
    }

    /** The section a row sits in, found from the screen down, which works on API 28 too. */
    static PreferenceGroup sectionOf(PreferenceGroup screen, Preference row) {
        for (int i = 0; i < screen.getPreferenceCount(); i++) {
            Preference child = screen.getPreference(i);
            if (child instanceof PreferenceGroup && contains((PreferenceGroup) child, row)) return (PreferenceGroup) child;
        }
        throw new AssertionError("no section holds " + row.getKey());
    }

    private static boolean contains(PreferenceGroup group, Preference row) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference child = group.getPreference(i);
            if (child == row) return true;
            if (child instanceof PreferenceGroup && contains((PreferenceGroup) child, row)) return true;
        }
        return false;
    }
}

/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

import static org.junit.Assert.*;
import android.app.Activity;
import android.content.Intent;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;
import java.util.Arrays;
import java.util.EnumSet;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.PauseForTests;

/** Story text fonts: a Stories switch after Upload quality that starts off, with the row listing the picked files and the emoji switch under it. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
@SuppressWarnings("deprecation")
public class StoryFontsSettingsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private HushgramPreferenceFragment page;

    @Before public void prepare() {
        RuntimeEnvironment.getApplication().getApplicationInfo().targetSdkVersion = 36;
        Settings.STORY_FONTS.resetToDefault();
        Settings.STORY_EMOJI.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        BaseSettings.SAFE_MODE.save(false);
        Settings.SIGN_IN_NOTICE_HIDDEN.save(true);
    }
    @After public void close() throws Exception {
        if (controller != null) controller.close();
        Utils.awaitBackgroundTasksForTests();
        PatchFamily.inBuildForTests = null;
        Settings.STORY_FONTS.resetToDefault();
        Settings.STORY_EMOJI.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.SIGN_IN_NOTICE_HIDDEN.resetToDefault();
    }
    private void open(EnumSet<PatchFamily> build) throws Exception {
        PatchFamily.inBuildForTests = build;
        controller = Robolectric.buildActivity(Activity.class).setup();
        page = new HushgramPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
        Utils.awaitBackgroundTasksForTests();
    }
    @Test public void theSwitchIsUnderStoriesAfterUploadQualityAndStartsOff() throws Exception {
        open(EnumSet.of(PatchFamily.STORY_UPLOAD_QUALITY, PatchFamily.STORY_FONTS));
        SwitchPreference row = (SwitchPreference) page.getPreferenceScreen().findPreference(Settings.STORY_FONTS.key);
        assertNotNull(row);
        assertEquals("Your fonts in story text", row.getTitle().toString());
        assertEquals("Stories", ((PreferenceGroup) row.getParent()).getTitle().toString());
        assertFalse(row.isChecked());
        assertFalse(Settings.STORY_FONTS.get());
        PreferenceGroup stories = row.getParent();
        String[] keys = new String[stories.getPreferenceCount()];
        for (int i = 0; i < keys.length; i++) keys[i] = stories.getPreference(i).getKey();
        int at = Arrays.asList(keys).indexOf(Settings.STORY_FONTS.key);
        assertEquals(Arrays.toString(keys), Settings.UPLOAD_STORIES_AT_FULL_QUALITY.key, keys[at - 1]);
        assertEquals(Arrays.toString(keys), HushgramPreferenceFragment.STORY_FONTS_ROW, keys[at + 1]);
        Preference list = stories.getPreference(at + 1);
        assertEquals("Your story fonts", list.getTitle().toString());
        assertEquals("Story text fonts", PatchFamily.STORY_FONTS.patchName);
        assertEquals(Arrays.asList(Settings.STORY_FONTS, Settings.STORY_EMOJI), PatchFamily.STORY_FONTS.switches);
        assertTrue(ConfigurationBackup.eligible().containsKey(Settings.STORY_FONTS.key));
    }
    @Test public void theEmojiSwitchFollowsTheFontsAndAsksForAFileFirst() throws Exception {
        open(EnumSet.of(PatchFamily.STORY_UPLOAD_QUALITY, PatchFamily.STORY_FONTS));
        SwitchPreference row = (SwitchPreference) page.getPreferenceScreen().findPreference(Settings.STORY_EMOJI.key);
        assertNotNull(row);
        assertEquals("Emoji font in story text", row.getTitle().toString());
        assertFalse(row.isChecked());
        PreferenceGroup stories = row.getParent();
        String[] keys = new String[stories.getPreferenceCount()];
        for (int i = 0; i < keys.length; i++) keys[i] = stories.getPreference(i).getKey();
        int at = Arrays.asList(keys).indexOf(Settings.STORY_EMOJI.key);
        assertEquals(Arrays.toString(keys), HushgramPreferenceFragment.STORY_FONTS_ROW, keys[at - 1]);
        assertFalse("turning it on waits for a file", row.getOnPreferenceChangeListener().onPreferenceChange(row, true));
        assertFalse(Settings.STORY_EMOJI.get());
        Intent picker = Shadows.shadowOf(controller.get()).getNextStartedActivityForResult().intent;
        assertEquals(Intent.ACTION_OPEN_DOCUMENT, picker.getAction());
        assertTrue("turning it off needs nothing", row.getOnPreferenceChangeListener().onPreferenceChange(row, false));
        assertTrue(ConfigurationBackup.eligible().containsKey(Settings.STORY_EMOJI.key));
    }
    @Test public void missingPatchHasNoRows() throws Exception {
        open(EnumSet.of(PatchFamily.STORY_UPLOAD_QUALITY));
        assertNull(page.getPreferenceScreen().findPreference(Settings.STORY_FONTS.key));
        assertNull(page.getPreferenceScreen().findPreference(HushgramPreferenceFragment.STORY_FONTS_ROW));
        assertNull(page.getPreferenceScreen().findPreference(Settings.STORY_EMOJI.key));
        assertNotNull(page.getPreferenceScreen().findPreference(Settings.UPLOAD_STORIES_AT_FULL_QUALITY.key));
    }
}

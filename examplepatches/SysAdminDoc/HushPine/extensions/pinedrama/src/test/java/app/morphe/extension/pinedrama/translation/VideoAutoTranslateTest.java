/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.translation;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.preference.Preference;
import android.preference.PreferenceScreen;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import app.morphe.extension.pinedrama.settings.preference.TogglePreference;
import app.morphe.extension.pinedrama.settings.preference.categories.CommentsPreferenceCategory;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * Don't auto translate videos (#194). The patch asks {@link VideoAutoTranslate#keepOriginal} in
 * front of PineDrama's Always translate read and builds every published state through {@link
 * VideoAutoTranslate#publishedState}, so both answer off on a yes, while PineDrama's comment switch
 * defaults through {@link VideoAutoTranslate#commentDefault} to the state as PineDrama published it.
 * The switch starts off, asks for a restart because PineDrama builds the state at launch, and leaves
 * PineDrama's answer alone while HushPine is paused or before the settings context exists.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class VideoAutoTranslateTest {
    private static final String TITLE = "Don't auto translate videos";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void tearDown() {
        PausedProcess.set(false);
        Utils.setContext(RuntimeEnvironment.getApplication());
        Settings.NO_VIDEO_AUTO_TRANSLATE.resetToDefault();
        VideoAutoTranslate.forgetPublished();
        HookStatus.clear();
    }

    @Test
    public void theSwitchStartsOffAndAsksForARestart() {
        assertEquals("no_video_auto_translate", Settings.NO_VIDEO_AUTO_TRANSLATE.key);
        assertEquals(Boolean.FALSE, Settings.NO_VIDEO_AUTO_TRANSLATE.defaultValue);
        assertTrue("PineDrama builds the state at launch", Settings.NO_VIDEO_AUTO_TRANSLATE.rebootApp);

        assertFalse("off, PineDrama's Always translate stands", VideoAutoTranslate.keepOriginal());
        Settings.NO_VIDEO_AUTO_TRANSLATE.save(true);
        assertTrue(VideoAutoTranslate.keepOriginal());
        Settings.NO_VIDEO_AUTO_TRANSLATE.save(false);
        assertFalse("turned back off, the next read is PineDrama's", VideoAutoTranslate.keepOriginal());

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("video auto translate"));
    }

    @Test
    public void thePublishedStateIsOffOnlyWhileVideosStayOriginal() {
        assertTrue("off, PineDrama's on stands", VideoAutoTranslate.publishedState(true));
        assertFalse("off, PineDrama's off stands", VideoAutoTranslate.publishedState(false));

        Settings.NO_VIDEO_AUTO_TRANSLATE.save(true);
        assertFalse("on, Always translate is published off", VideoAutoTranslate.publishedState(true));
        assertFalse("never turns Always translate on", VideoAutoTranslate.publishedState(false));
    }

    /** Comments default to Always translate as PineDrama published it, whatever the videos get. */
    @Test
    public void theCommentDefaultIsTheUnfilteredState() {
        assertTrue("nothing published yet, the stored switch", VideoAutoTranslate.commentDefault(true));
        assertFalse(VideoAutoTranslate.commentDefault(false));

        Settings.NO_VIDEO_AUTO_TRANSLATE.save(true);
        assertFalse("videos get Always translate off", VideoAutoTranslate.publishedState(true));
        assertTrue("comments still get it on", VideoAutoTranslate.commentDefault(true));
        assertFalse("PineDrama's off is published off", VideoAutoTranslate.publishedState(false));
        assertFalse("and comments get it off", VideoAutoTranslate.commentDefault(true));
    }

    /**
     * Flipping Always translate: PineDrama publishes the new state, rebuilds the comment default, and
     * only then stores the switch, so the default has to come from the published state.
     */
    @Test
    public void aFlipReachesTheCommentDefaultBeforeItIsStored() {
        for (boolean keep : new boolean[] {false, true}) {
            Settings.NO_VIDEO_AUTO_TRANSLATE.save(keep);
            VideoAutoTranslate.publishedState(false); // launch, Always translate off and stored off
            VideoAutoTranslate.publishedState(true); // turned on, still stored off
            assertTrue("setting " + keep + ": on reaches comments", VideoAutoTranslate.commentDefault(false));
            VideoAutoTranslate.publishedState(false); // turned off, still stored on
            assertFalse("setting " + keep + ": off reaches comments", VideoAutoTranslate.commentDefault(true));
            VideoAutoTranslate.forgetPublished();
        }
    }

    @Test
    public void aPausedHushPineLeavesTikTokAlone() {
        Settings.NO_VIDEO_AUTO_TRANSLATE.save(true);
        PausedProcess.set(true);
        assertFalse(VideoAutoTranslate.keepOriginal());
        assertTrue(VideoAutoTranslate.publishedState(true));
        PausedProcess.set(false);
        assertTrue(VideoAutoTranslate.keepOriginal());
        assertFalse(VideoAutoTranslate.publishedState(true));
    }

    @Test
    public void withoutAContextTheReadIsTikToks() {
        Settings.NO_VIDEO_AUTO_TRANSLATE.save(true);
        Utils.setContext(null);
        try {
            assertFalse(VideoAutoTranslate.keepOriginal());
            assertTrue("a state built before the context is PineDrama's", VideoAutoTranslate.publishedState(true));
        } finally {
            Utils.setContext(RuntimeEnvironment.getApplication());
        }
        assertTrue(VideoAutoTranslate.keepOriginal());
    }

    /** A build where only this patch landed still opens the Comments page. */
    @Test
    public void thisRowAloneOpensTheCommentsPage() throws IllegalAccessException {
        Map<Field, Boolean> saved = new HashMap<>();
        for (Field flag : SettingsStatus.class.getFields()) {
            int modifiers = flag.getModifiers();
            if (flag.getType() != boolean.class || !Modifier.isStatic(modifiers) || Modifier.isFinal(modifiers)) continue;
            saved.put(flag, flag.getBoolean(null));
            flag.setBoolean(null, false);
        }
        try {
            assertFalse("every flag off, nothing to show", CommentsPreferenceCategory.isAvailable());
            SettingsStatus.videoAutoTranslateEnabled = true;
            assertTrue(CommentsPreferenceCategory.isAvailable());
        } finally {
            for (Map.Entry<Field, Boolean> flag : saved.entrySet()) flag.getKey().setBoolean(null, flag.getValue());
        }
    }

    /** The row shows on the Comments page only where the patch hooked the read. */
    @Test
    public void theRowShowsOnlyWhereTheReadWasHooked() {
        boolean hooked = SettingsStatus.videoAutoTranslateEnabled;
        try (var controller = Robolectric.buildActivity(DoNotAutoTranslateTest.TestActivity.class).setup()) {
            var activity = controller.get();
            Utils.setContext(activity);

            SettingsStatus.videoAutoTranslateEnabled = false;
            PreferenceScreen without = activity.getPreferenceManager().createPreferenceScreen(activity);
            new CommentsPreferenceCategory(activity, without);
            assertNull("the row showed on a build where nothing was hooked",
                    without.findPreference(Settings.NO_VIDEO_AUTO_TRANSLATE.key));

            SettingsStatus.videoAutoTranslateEnabled = true;
            assertTrue("the Comments page opens for this row alone", CommentsPreferenceCategory.isAvailable());
            PreferenceScreen with = activity.getPreferenceManager().createPreferenceScreen(activity);
            new CommentsPreferenceCategory(activity, with);
            Preference row = with.findPreference(Settings.NO_VIDEO_AUTO_TRANSLATE.key);
            assertNotNull(row);
            assertEquals(TITLE, String.valueOf(row.getTitle()));
            String summary = String.valueOf(row.getSummary());
            assertTrue(summary, summary.contains("Always translate") && summary.contains("See translation"));
            assertTrue(summary, summary.endsWith(TogglePreference.RESTART_SENTENCE));
        } finally {
            SettingsStatus.videoAutoTranslateEnabled = hooked;
        }
    }
}

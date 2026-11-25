/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.List;
import java.util.function.BooleanSupplier;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostButtonsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final List<BooleanSetting> SWITCHES = Arrays.asList(Settings.HIDE_LIKE_BUTTON,
            Settings.HIDE_REPLY_BUTTON, Settings.HIDE_REPOST_BUTTON, Settings.HIDE_SHARE_BUTTON, Settings.HIDE_SAVE_BUTTON);
    private static final List<BooleanSupplier> SHOWS = Arrays.asList(PostButtons::showLike, PostButtons::showReply,
            PostButtons::showRepost, PostButtons::showShare, PostButtons::showSave);
    private static final List<String> NAMES = Arrays.asList(PostButtons.LIKE, PostButtons.REPLY, PostButtons.REPOST,
            PostButtons.SHARE, PostButtons.SAVE);

    /** Cleared first as well, so a test that stopped half way, or another class, leaves nothing behind. */
    @Before public void clear() {
        restore();
    }

    @After public void restore() {
        PauseForTests.resume();
        for (BooleanSetting setting : SWITCHES) setting.resetToDefault();
        HookStatus.clear();
    }

    /** Every switch starts off, so a default build draws every button until one is turned on. */
    @Test public void everyButtonStartsShowing() {
        for (int i = 0; i < SWITCHES.size(); i++) {
            assertFalse(SWITCHES.get(i).key + " starts on", SWITCHES.get(i).defaultValue);
            assertTrue(NAMES.get(i), SHOWS.get(i).getAsBoolean());
        }
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.HIDE_POST_BUTTONS + ": invoked 5"));
        assertTrue(report, report.contains(PostButtons.LEFT_TO_THREADS + "switch off 5"));
    }

    /** Each switch hides its own button and no other. */
    @Test public void eachSwitchHidesOnlyItsOwnButton() {
        for (int on = 0; on < SWITCHES.size(); on++) {
            for (BooleanSetting setting : SWITCHES) setting.resetToDefault();
            SWITCHES.get(on).save(true);
            for (int i = 0; i < SHOWS.size(); i++) {
                assertEquals(SWITCHES.get(on).key + " on, " + NAMES.get(i), i != on, SHOWS.get(i).getAsBoolean());
            }
        }
        String report = String.join("\n", HookStatus.report());
        for (String name : NAMES) assertTrue(report, report.contains(PostButtons.HIDDEN + name + " 1"));
    }

    /** Paused or in safe mode, the saved switches stay on and Threads draws every button. */
    @Test public void pauseAndSafeModeLeaveTheButtonsToThreads() {
        for (BooleanSetting setting : SWITCHES) setting.save(true);
        for (BooleanSupplier show : SHOWS) assertFalse(show.getAsBoolean());

        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        for (BooleanSupplier show : SHOWS) assertTrue(show.getAsBoolean());
        for (BooleanSetting setting : SWITCHES) assertTrue(setting.key, setting.savedValue());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(PostButtons.LEFT_TO_THREADS + "HushThreads paused 5"));
        PauseForTests.resume();

        // Safe mode is the pause a crash loop starts.
        PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
        for (BooleanSupplier show : SHOWS) assertTrue(show.getAsBoolean());
        for (BooleanSetting setting : SWITCHES) assertTrue(setting.key, setting.savedValue());
    }

    /** Threads keeps a row it has drawn, so each switch asks for a restart when it changes. */
    @Test public void aChangeWaitsForARestart() {
        for (BooleanSetting setting : SWITCHES) assertTrue(setting.key, setting.rebootApp);
    }
}

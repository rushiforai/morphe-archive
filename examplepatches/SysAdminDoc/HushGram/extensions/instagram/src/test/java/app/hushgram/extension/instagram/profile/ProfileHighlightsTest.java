/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.profile;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.function.BooleanSupplier;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/** What the highlights hook answers, and that it keeps the row whenever it can't decide. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class ProfileHighlightsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private static final BooleanSupplier THROWS = () -> {
        throw new IllegalStateException("settings went away");
    };

    @Before
    public void enable() {
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.HIDE_HIGHLIGHTS.save(true);
        HookStatus.clear();
        FeedFilterCounters.clear();
    }

    @After
    public void restore() {
        Settings.HIDE_HIGHLIGHTS.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
        FeedFilterCounters.clear();
    }

    /** On, the row is left out and counted. */
    @Test
    public void withTheSwitchOnTheRowIsLeftOut() {
        assertEquals(0, ProfileHighlights.keepTray());

        String report = FeedFilterCounters.report().toString();
        assertTrue(report, report.contains(ProfileHighlights.ROUTE));
        assertTrue(report, report.contains("1 removed"));
        assertTrue(report, report.contains(ProfileHighlights.TRAY));
    }

    /** The switch starts off, and off the row stays, while the hook still counts that it ran. */
    @Test
    public void offToStartAndOffKeepsTheRow() {
        Settings.HIDE_HIGHLIGHTS.resetToDefault();
        assertEquals(Boolean.FALSE, Settings.HIDE_HIGHLIGHTS.defaultValue);
        assertEquals(1, ProfileHighlights.keepTray());

        Settings.HIDE_HIGHLIGHTS.save(false);
        assertEquals(1, ProfileHighlights.keepTray());

        String report = FeedFilterCounters.report().toString();
        assertTrue(report, report.contains("0 removed"));
        assertTrue(String.join("\n", HookStatus.report()), HookStatus.report().toString().contains(FamilyNames.PROFILE_HIGHLIGHTS));
    }

    /** Paused, or asked before the settings are read, the row stays. */
    @Test
    public void offPausedAndUnreadyKeepTheRow() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertEquals(1, ProfileHighlights.keepTray());
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();

        SettingsContextRule.withoutContext(() -> assertEquals(1, ProfileHighlights.keepTray()));

        assertEquals(0, ProfileHighlights.keepTray());
    }

    /** A switch that throws keeps the row and says the hook threw. */
    @Test
    public void aThrowingSwitchKeepsTheRowAndIsReported() {
        assertEquals(1, ProfileHighlights.keepTray(THROWS));

        String missing = HookStatus.missing(FamilyNames.PROFILE_HIGHLIGHTS).toString();
        assertTrue(missing, missing.contains("'" + ProfileHighlights.TRAY + "'"));
        assertTrue(missing, missing.contains(IllegalStateException.class.getName()));
    }
}

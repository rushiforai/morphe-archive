/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.profile;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/**
 * What Hide Notes on profile pictures answers where Instagram reads the flag that turns Notes off on
 * profiles, and the one that keeps the prompt to post a Note off your own picture.
 */
@RunWith(RobolectricTestRunner.class)
public class ProfileNotesTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    @Before
    public void start() {
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.HIDE_PROFILE_NOTES.resetToDefault();
        HookStatus.clear();
    }

    @After
    public void restore() {
        Settings.HIDE_PROFILE_NOTES.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    /** The switch starts off, and then Instagram's own answer goes through whichever it is. */
    @Test
    public void theSwitchStartsOffAndInstagramsAnswerStands() {
        assertFalse(Settings.HIDE_PROFILE_NOTES.get());
        assertTrue(ProfileNotes.consumptionDisabled(1));
        assertFalse(ProfileNotes.consumptionDisabled(0));
        assertTrue(ProfileNotes.creationDisabled(1));
        assertFalse(ProfileNotes.creationDisabled(0));
        assertTrue(HookStatus.missing(FamilyNames.PROFILE_NOTES).toString(), HookStatus.missing(FamilyNames.PROFILE_NOTES).isEmpty());
        assertFalse(HookStatus.report().toString(), HookStatus.report().toString().contains("Counted"));
    }

    /** On, a no becomes a yes and is counted, and a yes stays a yes. */
    @Test
    public void onNotesAreTurnedOff() {
        Settings.HIDE_PROFILE_NOTES.save(true);
        assertTrue("the server said no", ProfileNotes.consumptionDisabled(0));
        assertTrue("the server said yes", ProfileNotes.consumptionDisabled(1));
        assertTrue(HookStatus.missing(FamilyNames.PROFILE_NOTES).toString(), HookStatus.missing(FamilyNames.PROFILE_NOTES).isEmpty());
    }

    /** On, the prompt to post a Note is held back too, and each time is counted on its own line. */
    @Test
    public void onThePromptIsLeftOff() {
        Settings.HIDE_PROFILE_NOTES.save(true);
        assertTrue("a Note dropped", ProfileNotes.consumptionDisabled(0));
        assertTrue("the server said no", ProfileNotes.creationDisabled(0));
        assertTrue("the server said yes", ProfileNotes.creationDisabled(1));
        assertTrue("the server said no again", ProfileNotes.creationDisabled(0));

        String report = HookStatus.report().toString();
        assertTrue(report, report.contains("Counted: " + ProfileNotes.LEFT_OFF + " 1, " + ProfileNotes.PROMPT_LEFT_OFF + " 2"));
        assertTrue(HookStatus.missing(FamilyNames.PROFILE_NOTES).toString(), HookStatus.missing(FamilyNames.PROFILE_NOTES).isEmpty());
    }

    /** Paused, or before the settings are read, both flags keep Instagram's answer. */
    @Test
    public void pausedAndUnreadyKeepInstagramsAnswer() {
        Settings.HIDE_PROFILE_NOTES.save(true);

        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertFalse("paused", ProfileNotes.consumptionDisabled(0));
        assertFalse("paused prompt", ProfileNotes.creationDisabled(0));
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();

        SettingsContextRule.withoutContext(() -> {
            assertFalse("no context", ProfileNotes.consumptionDisabled(0));
            assertFalse("no context prompt", ProfileNotes.creationDisabled(0));
        });
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            assertFalse("pause undecided", ProfileNotes.consumptionDisabled(0));
            assertFalse("pause undecided prompt", ProfileNotes.creationDisabled(0));
        });

        assertTrue("back on", ProfileNotes.consumptionDisabled(0));
        assertTrue("back on prompt", ProfileNotes.creationDisabled(0));
    }
}

/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.reels;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/**
 * Hide the Save button on reels: the two hooks the patch puts first in the clips UFI's Save button
 * and save count builders answer yes only with the switch on, and count each one they take off.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class ReelSaveButtonTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void prepare() {
        Settings.HIDE_REEL_SAVE_BUTTON.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    @After
    public void restore() {
        Settings.HIDE_REEL_SAVE_BUTTON.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    private static boolean counted(String count, int times) {
        return HookStatus.report().toString().contains(count + " " + times);
    }

    private static boolean countedAnything() {
        String report = HookStatus.report().toString();
        return report.contains(ReelDeclutter.COUNT_SAVE_HIDDEN) || report.contains(ReelDeclutter.COUNT_SAVE_COUNT_HIDDEN);
    }

    @Test
    public void withTheSwitchOnTheButtonAndItsCountAreLeftOutAndCounted() {
        assertFalse("starts off", Settings.HIDE_REEL_SAVE_BUTTON.defaultValue);
        Settings.HIDE_REEL_SAVE_BUTTON.save(true);

        assertTrue(ReelDeclutter.hideSaveButton());
        assertTrue(ReelDeclutter.hideSaveButton());
        assertTrue(ReelDeclutter.hideSaveCount());

        assertTrue(HookStatus.report().toString(), counted(ReelDeclutter.COUNT_SAVE_HIDDEN, 2));
        assertTrue(HookStatus.report().toString(), counted(ReelDeclutter.COUNT_SAVE_COUNT_HIDDEN, 1));
        assertEquals("reel Save buttons hidden", ReelDeclutter.COUNT_SAVE_HIDDEN);
    }

    /** The switch answers for the Save button alone, and the other Clean up Reels parts keep their own switches. */
    @Test
    public void onlyTheSaveSwitchTurnsItOnAndItTurnsNothingElseOn() {
        assertFalse(ReelDeclutter.hideFollowButton());
        assertFalse(ReelDeclutter.hideChips());
        assertFalse(ReelDeclutter.hideEveryCommentBar());
        Settings.HIDE_REEL_SAVE_BUTTON.save(true);
        assertFalse(ReelDeclutter.hideFollowButton());
        assertFalse(ReelDeclutter.hideChips());
        assertFalse(ReelDeclutter.hideSocialFooter());
        assertFalse(ReelDeclutter.hideEveryCommentBar());

        Settings.HIDE_REEL_FOLLOW_BUTTON.save(true);
        try {
            Settings.HIDE_REEL_SAVE_BUTTON.save(false);
            assertFalse("the Follow switch doesn't hide the Save button", ReelDeclutter.hideSaveButton());
            assertFalse(ReelDeclutter.hideSaveCount());
        } finally {
            Settings.HIDE_REEL_FOLLOW_BUTTON.resetToDefault();
        }
    }

    /** Off to start, paused and before the settings are read, Instagram builds the button and nothing is counted. */
    @Test
    public void offPausedAndUnreadyKeepTheButtonAndCountNothing() {
        assertFalse("off to start", ReelDeclutter.hideSaveButton());
        assertFalse("off to start", ReelDeclutter.hideSaveCount());
        assertFalse("off counts nothing", countedAnything());

        Settings.HIDE_REEL_SAVE_BUTTON.save(true);
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertFalse("paused", ReelDeclutter.hideSaveButton());
        assertFalse("paused", ReelDeclutter.hideSaveCount());
        assertFalse("paused counts nothing", countedAnything());
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();

        SettingsContextRule.withoutContext(() -> {
            assertFalse("unready", ReelDeclutter.hideSaveButton());
            assertFalse("unready", ReelDeclutter.hideSaveCount());
        });
        assertFalse("unready counts nothing", countedAnything());

        assertTrue("and on again once resumed and ready", ReelDeclutter.hideSaveButton());
        assertTrue(counted(ReelDeclutter.COUNT_SAVE_HIDDEN, 1));
    }
}

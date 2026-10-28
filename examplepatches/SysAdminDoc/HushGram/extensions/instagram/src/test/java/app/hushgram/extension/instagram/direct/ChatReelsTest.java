/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/** What the chat reels hook answers (#350). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class ChatReelsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    @Before
    public void enable() {
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.SWIPE_CHAT_REELS.save(true);
        HookStatus.clear();
    }

    @After
    public void restore() {
        Settings.SWIPE_CHAT_REELS.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    /** The patch is in Manager's default selection, so its switch starts off. */
    @Test
    public void theSwitchStartsOff() {
        Settings.SWIPE_CHAT_REELS.resetToDefault();
        assertFalse(Settings.SWIPE_CHAT_REELS.get());
        assertFalse("off to start, Instagram's no stands", ChatReels.chain(0));
    }

    /** With the switch on, the chat reels test says yes whatever Instagram's server said. */
    @Test
    public void onEveryChatChainsItsReels() {
        assertTrue("the server said no", ChatReels.chain(0));
        assertTrue("the server said yes", ChatReels.chain(1));
        assertTrue(HookStatus.missing(FamilyNames.CHAT_REELS).toString(), HookStatus.missing(FamilyNames.CHAT_REELS).isEmpty());
    }

    /** Off, paused or before the settings are read, the test keeps Instagram's answer. */
    @Test
    public void offPausedAndUnreadyKeepInstagramsAnswer() {
        Settings.SWIPE_CHAT_REELS.save(false);
        assertFalse("off", ChatReels.chain(0));
        assertTrue("off, Instagram's own yes", ChatReels.chain(1));
        Settings.SWIPE_CHAT_REELS.save(true);

        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertFalse("paused", ChatReels.chain(0));
        assertTrue("paused, Instagram's own yes", ChatReels.chain(1));
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();

        SettingsContextRule.withoutContext(() -> {
            assertFalse("no context", ChatReels.chain(0));
            assertTrue("no context, Instagram's own yes", ChatReels.chain(1));
        });
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            assertFalse("pause undecided", ChatReels.chain(0));
            assertTrue("pause undecided, Instagram's own yes", ChatReels.chain(1));
        });

        assertTrue("back on", ChatReels.chain(0));
    }
}

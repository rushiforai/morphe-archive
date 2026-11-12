/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Collections;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ForwardSenderTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.FORWARD_HIDE_SENDER);
        Settings.FORWARD_HIDE_SENDER.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTheSenderShows() {
        assertFalse(Settings.FORWARD_HIDE_SENDER.get());
        assertFalse(ForwardSender.on());
        ForwardSender.starts(new Object(), new ArrayList<>(Collections.singletonList(new Object())));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.FORWARD_HIDE_SENDER));
    }

    @Test public void onTheSenderIsHiddenUnlessTelegramWantsPremiumForIt() {
        Settings.FORWARD_HIDE_SENDER.save(true);
        assertTrue(ForwardSender.on());
        assertTrue(ForwardSender.hides(false, 36, 0, 1, 9));
        assertFalse(ForwardSender.hides(false, 36, 0, 36));
        assertTrue(ForwardSender.hides(true, 36, 0, 36));
        assertTrue(ForwardSender.hides(false, 36));
    }

    @Test public void thePickersOwnForwardsGoWithoutTheSenderExceptToSavedMessages() {
        ArrayList<Object> messages = new ArrayList<>(Collections.singletonList(new Object()));
        // Off, a send keeps Telegram's own flag.
        assertFalse(ForwardSender.picked(messages, 5L, 0));
        assertTrue(ForwardSender.picked(messages, 5L, 1));
        Settings.FORWARD_HIDE_SENDER.save(true);
        assertTrue(ForwardSender.picked(messages, 5L, 0));
        assertTrue(ForwardSender.picked(messages, 5L, 1));
        // The unpatched stub gives account ID 0, so chat 0 stands for Saved Messages here.
        assertFalse(ForwardSender.picked(messages, 0L, 0));
        assertFalse(ForwardSender.picked(new ArrayList<>(), 5L, 0));
        assertFalse(ForwardSender.picked(null, 5L, 0));
        assertTrue(String.join("\n", HookStatus.report()).contains("sender hidden 1"));
    }

    @Test public void theShareSheetKeepsTheSenderOnlyForSavedMessages() {
        ArrayList<Object> messages = new ArrayList<>(Collections.singletonList(new Object()));
        // Off, every chat goes with the sheet's own flag.
        assertTrue(ForwardSender.shared(messages, 0L, 1));
        assertFalse(ForwardSender.shared(messages, 5L, 0));
        Settings.FORWARD_HIDE_SENDER.save(true);
        assertTrue(ForwardSender.shared(messages, 5L, 1));
        // The unpatched stub gives account ID 0, so chat 0 stands for Saved Messages here.
        assertFalse(ForwardSender.shared(messages, 0L, 1));
        // Show sender's name picked in the send menu stays for every chat.
        assertFalse(ForwardSender.shared(messages, 5L, 0));
        assertFalse(ForwardSender.shared(messages, 0L, 0));
        assertTrue(ForwardSender.shared(new ArrayList<>(), 0L, 1));
        assertTrue(ForwardSender.shared(null, 0L, 1));
        assertTrue(String.join("\n", HookStatus.report()).contains("sender kept for Saved Messages 1"));
    }

    @Test public void aShareSheetWithNothingForwardedIsLeftAlone() {
        Settings.FORWARD_HIDE_SENDER.save(true);
        // The unpatched stub holds no messages, the way a sheet sharing a link does.
        ForwardSender.shares(new Object());
        ForwardSender.sharePopup(new Object(), new Object());
        String report = String.join("\n", HookStatus.report());
        assertFalse(report, report.contains("threw"));
        assertFalse(report, report.contains("sender hidden"));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheSender() {
        Settings.FORWARD_HIDE_SENDER.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ForwardSender.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(ForwardSender.on()));
        SettingReadsForTests.breakReads(Settings.FORWARD_HIDE_SENDER);
        assertFalse(ForwardSender.on());
        assertFalse(HookStatus.missing(FamilyNames.FORWARD_HIDE_SENDER).isEmpty());
    }
}

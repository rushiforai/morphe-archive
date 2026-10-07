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

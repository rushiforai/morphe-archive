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
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReactionEffectsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.REACTION_EFFECTS_OFF);
        Settings.REACTION_EFFECTS_OFF.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultEffectsPlay() {
        assertFalse(Settings.REACTION_EFFECTS_OFF.get());
        assertFalse(ReactionEffects.skipped());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.REACTION_EFFECTS_OFF));
    }

    @Test public void onEffectsAreSkipped() {
        Settings.REACTION_EFFECTS_OFF.save(true);
        assertTrue(ReactionEffects.skipped());
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchLetsEffectsPlay() {
        Settings.REACTION_EFFECTS_OFF.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ReactionEffects.skipped());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(ReactionEffects.skipped()));
        SettingReadsForTests.breakReads(Settings.REACTION_EFFECTS_OFF);
        assertFalse(ReactionEffects.skipped());
        assertFalse(HookStatus.missing(FamilyNames.REACTION_EFFECTS_OFF).isEmpty());
    }
}

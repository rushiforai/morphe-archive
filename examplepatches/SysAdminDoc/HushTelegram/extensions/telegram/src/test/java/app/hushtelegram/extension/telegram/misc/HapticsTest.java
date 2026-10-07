/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.os.Vibrator;
import android.view.HapticFeedbackConstants;
import android.view.View;
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
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HapticsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private Vibrator vibrator;

    @Before public void reset() {
        restore();
        vibrator = (Vibrator) RuntimeEnvironment.getApplication().getSystemService(Context.VIBRATOR_SERVICE);
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.NO_HAPTICS);
        Settings.NO_HAPTICS.resetToDefault();
        HookStatus.clear();
        if (vibrator != null) vibrator.cancel();
    }

    @Test public void offByDefaultThePhoneStillVibrates() {
        assertFalse(Settings.NO_HAPTICS.get());
        Haptics.buzz(vibrator, 200);
        assertTrue(shadowOf(vibrator).isVibrating());
        assertEquals(200, shadowOf(vibrator).getMilliseconds());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.NO_HAPTICS));
    }

    @Test public void onNothingVibrates() {
        Settings.NO_HAPTICS.save(true);
        Haptics.buzz(vibrator, 200);
        Haptics.buzzPattern(vibrator, new long[] {0, 100}, -1);
        assertFalse(shadowOf(vibrator).isVibrating());
        View view = new View(RuntimeEnvironment.getApplication());
        assertFalse(Haptics.tap(view, HapticFeedbackConstants.LONG_PRESS));
        assertFalse(Haptics.tapWithFlags(view, HapticFeedbackConstants.KEYBOARD_TAP, HapticFeedbackConstants.FLAG_IGNORE_GLOBAL_SETTING));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheVibration() {
        Settings.NO_HAPTICS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), Haptics.quiet());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(Haptics.quiet()));
        SettingReadsForTests.breakReads(Settings.NO_HAPTICS);
        Haptics.buzz(vibrator, 50);
        assertTrue(shadowOf(vibrator).isVibrating());
        assertFalse(HookStatus.missing(FamilyNames.NO_HAPTICS).isEmpty());
    }
}

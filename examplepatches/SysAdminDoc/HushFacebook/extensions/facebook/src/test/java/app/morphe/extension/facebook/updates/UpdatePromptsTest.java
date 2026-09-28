/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.updates;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class UpdatePromptsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After public void restore() {
        PauseForTests.resume();
        Settings.STOP_UPDATE_PROMPTS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void theSwitchStopsEveryPromptAndOffLeavesFacebookAlone() {
        assertTrue(UpdatePrompts.blockPromotion());
        assertTrue(UpdatePrompts.blockForceSync());
        assertTrue(UpdatePrompts.blockVersionCeiling(UpdatePrompts.VERSION_CEILING_FILTER));

        Settings.STOP_UPDATE_PROMPTS.save(false);
        assertFalse(UpdatePrompts.blockPromotion());
        assertFalse(UpdatePrompts.blockForceSync());
        assertFalse(UpdatePrompts.blockVersionCeiling(UpdatePrompts.VERSION_CEILING_FILTER));
    }

    @Test public void pausedEveryPromptIsFacebooksOwn() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(UpdatePrompts.blockPromotion());
        assertFalse(UpdatePrompts.blockForceSync());
        assertFalse(UpdatePrompts.blockVersionCeiling(UpdatePrompts.VERSION_CEILING_FILTER));
    }

    /** Only the ceiling filter is an update prompt's. A floor filter gates a feature, not a version. */
    @Test public void onlyTheVersionCeilingFilterIsFailed() {
        assertFalse(UpdatePrompts.blockVersionCeiling("app_min_version"));
        assertFalse(UpdatePrompts.blockVersionCeiling("push_enabled"));
        assertFalse(UpdatePrompts.blockVersionCeiling(null));
        assertTrue(UpdatePrompts.blockVersionCeiling("app_max_version"));
    }

    /** Every stop is counted under the patch's name, and a filter left to Facebook isn't. */
    @Test public void theHooksReportUnderThePatchsName() {
        HookStatus.clear();
        UpdatePrompts.blockPromotion();
        UpdatePrompts.blockForceSync();
        UpdatePrompts.blockVersionCeiling("app_min_version");
        UpdatePrompts.blockVersionCeiling(UpdatePrompts.VERSION_CEILING_FILTER);
        List<String> lines = HookStatus.report("");
        assertTrue(String.join("\n", lines),
                lines.contains(FamilyNames.UPDATE_PROMPTS + ": invoked 3, 0 found, 0 missing"));
        assertEquals("Stop update prompts", FamilyNames.UPDATE_PROMPTS);
    }
}

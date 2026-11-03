package app.morphe.extension.pinedrama.feedfilter;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** The camera's AI Cast button follows Hide the AI Cast button and is named in the export. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class AiCastFilterTest {
    @Before public void setup() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        HookStatus.clear();
        Settings.HIDE_AI_CAST.save(false);
    }

    @After public void tearDown() {
        Settings.HIDE_AI_CAST.resetToDefault();
        HookStatus.clear();
    }

    @Test public void theButtonIsLeftOutOnlyWhenTheSwitchIsOn() {
        assertFalse("the button was left out with the switch off", AiCastFilter.shouldHideRecordEntrance());
        assertTrue(HookStatus.report().toString(), HookStatus.report().toString().contains("AI Cast: 1 found"));
        Settings.HIDE_AI_CAST.save(true);
        assertTrue("the button was built with the switch on", AiCastFilter.shouldHideRecordEntrance());
        assertTrue(HookStatus.report().toString(), HookStatus.report().toString().contains("AI Cast: 2 found"));
    }

    @Test public void theSwitchStartsOff() {
        Settings.HIDE_AI_CAST.resetToDefault();
        assertFalse(Settings.HIDE_AI_CAST.get());
    }
}

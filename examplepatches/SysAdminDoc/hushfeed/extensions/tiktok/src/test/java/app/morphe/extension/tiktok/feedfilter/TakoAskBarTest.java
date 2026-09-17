package app.morphe.extension.tiktok.feedfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.view.View;
import android.widget.FrameLayout;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * Issue #6: the "Ask" strip under a video's caption is a second Tako surface. Hide Tako AI
 * covered the floating button and left the strip standing.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class TakoAskBarTest {
    @Before public void setup() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        HookStatus.clear();
        Settings.HIDE_TAKO_AI.save(false);
    }

    @After public void tearDown() {
        Settings.HIDE_TAKO_AI.resetToDefault();
        HookStatus.clear();
    }

    @Test public void theStripIsHiddenOnlyWhenTheSwitchIsOn() {
        assertFalse("the strip was hidden with the switch off", TakoAiFilter.shouldHideAskBar());
        Settings.HIDE_TAKO_AI.save(true);
        assertTrue("the strip was left with the switch on", TakoAiFilter.shouldHideAskBar());

        View strip = new FrameLayout(RuntimeEnvironment.getApplication());
        TakoAiFilter.hideAskBar(strip);
        assertEquals(View.GONE, strip.getVisibility());
        TakoAiFilter.hideAskBar(null);
    }

    @Test public void theExportNamesTheStripWhicheverWayTheSwitchIsSet() {
        TakoAiFilter.shouldHideAskBar();
        String report = HookStatus.report().toString();
        assertTrue(report, report.contains("tako AI"));
    }
}

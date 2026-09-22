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

    /** Issue #22: the Ask Tako bubble over the search page stayed with Hide Tako AI on. */
    @Test public void theSearchPageEntranceFollowsTheSameSwitchAndIsNamedInTheExport() {
        assertFalse("the entrance was removed with the switch off", TakoAiFilter.shouldHideSearchEntrance());
        assertTrue(HookStatus.report().toString(), HookStatus.report().toString().contains("tako AI: 1 found"));
        Settings.HIDE_TAKO_AI.save(true);
        assertTrue("the entrance was built with the switch on", TakoAiFilter.shouldHideSearchEntrance());
        assertTrue(HookStatus.report().toString(), HookStatus.report().toString().contains("tako AI: 2 found"));
    }

    @Test public void theExportNamesTheStripWhicheverWayTheSwitchIsSet() {
        TakoAiFilter.shouldHideAskBar();
        String report = HookStatus.report().toString();
        assertTrue(report, report.contains("tako AI"));
    }

    /** The Tako bar above the comment list follows the same switch and is named in the export. */
    @Test public void theCommentsBarFollowsTheSameSwitchAndIsNamedInTheExport() {
        assertFalse("the bar was refused with the switch off", TakoAiFilter.shouldHideCommentTopBar());
        assertTrue(HookStatus.report().toString(), HookStatus.report().toString().contains("tako AI: 1 found"));
        Settings.HIDE_TAKO_AI.save(true);
        assertTrue("the bar was allowed with the switch on", TakoAiFilter.shouldHideCommentTopBar());
        assertTrue(HookStatus.report().toString(), HookStatus.report().toString().contains("tako AI: 2 found"));
    }

    /** Stand-ins for the commentv2 bridges, told apart by class name the way the phone's are. */
    private static final class BgTakoTopBarServiceImpl {}
    private static final class BgAdTopBarServiceImpl {}

    /**
     * The bridge base's canShow serves nine bridges. Only the Tako one is refused, and a null
     * service (a build whose guard lost its receiver) is left to TikTok rather than hidden.
     */
    @Test public void onlyTheTakoBridgeIsRefusedFromTheSharedBase() {
        Settings.HIDE_TAKO_AI.save(true);
        assertTrue(TakoAiFilter.shouldHideBridgedCommentTopBar(new BgTakoTopBarServiceImpl()));
        assertFalse("the ad bridge was refused", TakoAiFilter.shouldHideBridgedCommentTopBar(new BgAdTopBarServiceImpl()));
        assertFalse("a null service was refused", TakoAiFilter.shouldHideBridgedCommentTopBar(null));
        Settings.HIDE_TAKO_AI.save(false);
        assertFalse("the Tako bridge was refused with the switch off",
                TakoAiFilter.shouldHideBridgedCommentTopBar(new BgTakoTopBarServiceImpl()));
    }
}

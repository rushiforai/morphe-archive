/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.comments;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.PatchFamily;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Hide Meta AI comment summaries: with the switch on, the comment sheet's two summary plugins and
 * the one under a post's buttons get a no, each counted, while every other plugin the sockets ask
 * about is left to Facebook. Off, paused, or before the settings are ready, nothing is held.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MetaAiSummariesTest {
    /** Another plugin the comment sheet's socket asks about, which always stays. */
    private static final String PINNED_COMMENT =
            "com.facebook.feedback.comments.plugins.flyouttopcontent.pinnedcomment.PinnedCommentPlugin";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_META_AI_SUMMARIES.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.META_AI_SUMMARIES + ":")) return line;
        }
        return null;
    }

    @Test
    public void onTheSummariesAreHeldAndCountedAndOtherPluginsStay() {
        Settings.HIDE_META_AI_SUMMARIES.save(true);
        assertFalse("another plugin was held", MetaAiSummaries.holds(PINNED_COMMENT));
        assertFalse("a plugin with no name was held", MetaAiSummaries.holds(null));
        assertTrue("the sheet's summary stayed", MetaAiSummaries.holds(MetaAiSummaries.SHEET_SUMMARY));
        assertTrue("the sheet's deep dive summary stayed", MetaAiSummaries.holds(MetaAiSummaries.SHEET_DEEP_DIVE));
        assertTrue("the summary under a post stayed", MetaAiSummaries.holds(MetaAiSummaries.POST_SUMMARY));
        assertEquals(FamilyNames.META_AI_SUMMARIES + ": invoked 5, 2 found, 0 missing. Counted: "
                + MetaAiSummaries.SHEET_HIDDEN + " 2, " + MetaAiSummaries.POST_HIDDEN + " 1", statusLine());
    }

    @Test
    public void offOrPausedEverySummaryStays() {
        assertFalse("the switch doesn't start off", Settings.HIDE_META_AI_SUMMARIES.get());
        assertFalse("off, the sheet's summary was held", MetaAiSummaries.holds(MetaAiSummaries.SHEET_SUMMARY));
        assertFalse("off, the summary under a post was held", MetaAiSummaries.holds(MetaAiSummaries.POST_SUMMARY));

        Settings.HIDE_META_AI_SUMMARIES.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " held the sheet's summary",
                    MetaAiSummaries.holds(MetaAiSummaries.SHEET_DEEP_DIVE));
            assertFalse("a Hushfacebook paused by " + reason + " held the summary under a post",
                    MetaAiSummaries.holds(MetaAiSummaries.POST_SUMMARY));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse("a summary was held before the settings were ready",
                MetaAiSummaries.holds(MetaAiSummaries.SHEET_SUMMARY)));

        String line = statusLine();
        assertFalse("a summary left to Facebook was counted: " + line, line != null && line.contains("Counted"));
        assertTrue("on again after the pause, the sheet's summary stayed",
                MetaAiSummaries.holds(MetaAiSummaries.SHEET_SUMMARY));
    }

    @Test
    public void theSwitchNeedsNoRestartAndTravelsWithItsFamily() {
        assertFalse("each socket asks again, so no restart is needed", Settings.HIDE_META_AI_SUMMARIES.rebootApp);
        assertNull("nothing asks before the switch changes", Settings.HIDE_META_AI_SUMMARIES.userDialogMessage);
        assertTrue("Pause and the report don't know the switch",
                PatchFamily.META_AI_SUMMARIES.switches.contains(Settings.HIDE_META_AI_SUMMARIES));
    }
}

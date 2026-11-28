/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.util.EnumSet;
import java.util.List;

import app.hushgram.extension.instagram.download.FeedDownloadButton;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/** The tab icon stroke for Ghost mode: when it shows, its color and where it goes. */
@RunWith(RobolectricTestRunner.class)
public class GhostTabStrokeTest {
    enum Tab { FEED, DIRECT, PROFILE }

    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private Context context;
    private ImageView direct;
    private ImageView feed;

    @Before public void prepare() {
        context = RuntimeEnvironment.getApplication();
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.THREAD_SEEN, PatchFamily.TYPING);
        NavigationSettings.forgetTabsForTests();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        direct = new ImageView(context);
        feed = new ImageView(context);
        Settings.GHOST_TAB_TARGET.save(NavigationTarget.DIRECT);
        Settings.GHOST_INDICATOR_COLOR.save(GhostIndicatorColor.ORANGE);
        HookStatus.clear();
    }

    @After public void restore() {
        NavigationSettings.forgetTabsForTests();
        PatchFamily.inBuildForTests = null;
        Settings.GHOST_TAB_TARGET.resetToDefault();
        Settings.GHOST_INDICATOR_COLOR.resetToDefault();
        Settings.GHOST_MODE_PICKS.resetToDefault();
        Settings.READ_WITHOUT_SEEN_RECEIPT.resetToDefault();
        Settings.HIDE_TYPING.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    private static void ghost(boolean on) {
        Settings.READ_WITHOUT_SEEN_RECEIPT.save(on);
        Settings.HIDE_TYPING.save(on);
    }

    @Test public void theTabChosenForGhostModeShowsItsIconStrokeOnlyWhileGhostModeIsOn() {
        GhostTabStroke.watch(direct, Tab.DIRECT);
        GhostTabStroke.watch(feed, Tab.FEED);

        assertFalse("Ghost mode is off", GhostTabStroke.showingForTests(direct));

        ghost(true);
        GhostTabStroke.refresh();
        assertTrue(GhostTabStroke.showingForTests(direct));
        assertFalse("not the chosen tab", GhostTabStroke.showingForTests(feed));

        Settings.HIDE_TYPING.save(false);
        GhostTabStroke.refresh();
        assertFalse("one of its switches is off, so Ghost mode is", GhostTabStroke.showingForTests(direct));
    }

    @Test public void theIconStrokeTakesThePickedTintOrInstagramColour() {
        ghost(true);
        GhostTabStroke.watch(direct, Tab.DIRECT);

        assertEquals(GhostIndicatorColor.ORANGE.color, GhostTabStroke.colorForTests(direct));

        Settings.GHOST_INDICATOR_COLOR.save(GhostIndicatorColor.CYAN);
        GhostTabStroke.refresh();
        assertEquals(GhostIndicatorColor.CYAN.color, GhostTabStroke.colorForTests(direct));

        Settings.GHOST_INDICATOR_COLOR.save(GhostIndicatorColor.INSTAGRAM);
        GhostTabStroke.refresh();
        assertEquals(FeedDownloadButton.iconColor(context), GhostTabStroke.colorForTests(direct));
    }

    @Test public void pauseRestoresTheIconAndResumeTintsItAgain() {
        ghost(true);
        GhostTabStroke.watch(direct, Tab.DIRECT);
        assertTrue(GhostTabStroke.showingForTests(direct));

        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        GhostTabStroke.refresh();
        assertFalse(GhostTabStroke.showingForTests(direct));

        PauseForTests.resume();
        GhostTabStroke.refresh();
        assertTrue(GhostTabStroke.showingForTests(direct));
    }

    @Test public void withNoGhostPatchOrNoChosenTabTheIconIsUntinted() {
        ghost(true);
        GhostTabStroke.watch(direct, Tab.DIRECT);
        assertTrue(GhostTabStroke.showingForTests(direct));

        Settings.GHOST_TAB_TARGET.save(NavigationTarget.OFF);
        GhostTabStroke.refresh();
        assertFalse(GhostTabStroke.showingForTests(direct));

        Settings.GHOST_TAB_TARGET.save(NavigationTarget.DIRECT);
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        GhostTabStroke.refresh();
        assertFalse(GhostTabStroke.showingForTests(direct));
    }

    /** A tab Instagram bound is watched, and choosing another tab moves the stroke on the next choice. */
    @Test public void aBoundTabIsWatchedAndTheChoiceMovesTheStroke() {
        NavigationSettings.bind(direct, Tab.DIRECT);
        NavigationSettings.bind(feed, Tab.FEED);
        NavigationSettings.bind(new View(context), Tab.PROFILE);
        ghost(true);
        NavigationSettings.applyChoice();
        assertTrue(GhostTabStroke.showingForTests(direct));
        assertFalse(GhostTabStroke.showingForTests(feed));

        Settings.GHOST_TAB_TARGET.save(NavigationTarget.FEED);
        NavigationSettings.applyChoice();
        assertFalse(GhostTabStroke.showingForTests(direct));
        assertTrue(GhostTabStroke.showingForTests(feed));
    }

    /** Turning Ghost mode from its tab tints the icon at once, not at the next draw of the bar. */
    @Test public void turningGhostModeOnFromItsTabTintsTheIconAtOnce() {
        GhostTabStroke.watch(direct, Tab.DIRECT);
        assertFalse(GhostTabStroke.showingForTests(direct));

        GhostMode.flip(GhostMode.picked(GhostMode.switches(PatchFamily.inThisBuild())));

        assertTrue(GhostTabStroke.showingForTests(direct));
        assertTrue(GhostTabStroke.colorForTests(direct) != 0);
    }

    @Test public void aForgottenTabRestoresItsIcon() {
        ghost(true);
        GhostTabStroke.watch(direct, Tab.DIRECT);
        assertTrue(GhostTabStroke.showingForTests(direct));

        GhostTabStroke.forget(direct);

        assertFalse(GhostTabStroke.showingForTests(direct));
        assertEquals(List.of(FamilyNames.REELS_TAB + ": invoked 0, 0 found, 0 missing. Counted: "
                + GhostTabStroke.SHOWN + " 1, " + GhostTabStroke.HIDDEN + " 1"), HookStatus.report());
    }
}

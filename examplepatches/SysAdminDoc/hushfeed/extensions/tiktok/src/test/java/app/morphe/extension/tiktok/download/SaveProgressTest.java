/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.blockauthor.BlockAuthorOverlay;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

/**
 * The running count over a save of several files: the row from three files up and only after
 * the share sheet's settle, its Cancel that stops after the file under way and says so once, a
 * failed file skipped rather than ending the save, a refusal from the disk or the clock ending
 * it with a reason, and the one message that says what came of it all.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class SaveProgressTest {
    private final List<String> said = new ArrayList<>();

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        // No other window: the row falls to the activity's content root.
        SaveNotice.windowRootsForTests = List.of();
        SaveProgress.announcementsForTests = said;
    }

    @After public void tearDown() {
        Utils.setActivity(null);
        SaveNotice.windowRootsForTests = null;
        SaveProgress.announcementsForTests = null;
    }

    /** Lets the row's wait for the share sheet pass, and runs everything posted since. */
    private static void settle() {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(SaveNotice.SHEET_SETTLE_MS + 1, TimeUnit.MILLISECONDS);
    }

    private static void idle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    private static TextView find(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return (TextView) view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            TextView found = find(group.getChildAt(i), text);
            if (found != null) return found;
        }
        return null;
    }

    @Test public void twoFilesAreOverBeforeARowWouldHelp() {
        try (var owner = Robolectric.buildActivity(SaveNoticeTest.HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            SaveProgress progress = SaveProgress.begin(2);
            settle();
            ViewGroup root = activity.findViewById(android.R.id.content);
            assertNull("no row for two files", find(root, "Cancel"));
            SaveProgress.Outcome outcome = progress.run(index -> { });
            assertTrue(outcome.complete());
            assertEquals("all", SaveProgress.message(outcome, "all"));
            assertTrue("nothing said for a save with no row", said.isEmpty());
        }
    }

    @Test public void threeFilesAreEnoughForARow() {
        try (var owner = Robolectric.buildActivity(SaveNoticeTest.HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            ViewGroup root = activity.findViewById(android.R.id.content);
            SaveProgress progress = SaveProgress.begin(3);
            settle();
            assertNotNull("the row names the first of three", find(root, "Saving 1 of 3"));
            progress.run(index -> { });
            idle();
            assertNull("the row came down with the save", find(root, "Cancel"));
        }
    }

    @Test public void aSaveOverInsideTheSheetWaitNeverShowsARow() {
        try (var owner = Robolectric.buildActivity(SaveNoticeTest.HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            SaveProgress progress = SaveProgress.begin(5);
            // Five small files, done before TikTok's sheet has even settled.
            progress.run(index -> { });
            settle();
            ViewGroup root = activity.findViewById(android.R.id.content);
            assertNull("a row for a save already over", find(root, "Cancel"));
            assertTrue(said.isEmpty());
        }
    }

    @Test public void theRowSitsAboveTheBannerAndSpeaksOnceForTheWholeSave() {
        try (var owner = Robolectric.buildActivity(SaveNoticeTest.HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            ViewGroup root = activity.findViewById(android.R.id.content);
            SaveProgress progress = SaveProgress.begin(4);
            settle();
            View row = (View) find(root, "Cancel").getParent();
            int banner = BlockAuthorOverlay.bannerParams(activity, root).bottomMargin;
            assertTrue("the row clears the banner's place",
                    ((FrameLayout.LayoutParams) row.getLayoutParams()).bottomMargin > banner);
            assertEquals(List.of("Saving 1 of 4"), said);
            progress.run(index -> idle());
            idle();
            assertEquals("nothing more is said per file", List.of("Saving 1 of 4"), said);
        }
    }

    @Test public void fiveFilesCountAndCancelStopsAfterTheFileUnderWay() {
        try (var owner = Robolectric.buildActivity(SaveNoticeTest.HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            ViewGroup root = activity.findViewById(android.R.id.content);
            SaveProgress progress = SaveProgress.begin(5);
            settle();
            assertNotNull("the row names the first file", find(root, "Saving 1 of 5"));
            assertNotNull("the row offers Cancel", find(root, "Cancel"));

            List<Integer> ran = new ArrayList<>();
            SaveProgress.Outcome outcome = progress.run(index -> {
                ran.add(index);
                idle();
                assertNotNull("the count follows the file", find(root, "Saving " + (index + 1) + " of 5"));
                if (index == 1) {
                    // Cancel pressed while the second file is under way: it finishes, the rest don't start.
                    find(root, "Cancel").performClick();
                    idle();
                    assertNotNull("the row says it is stopping", find(root, "Stopping after this file"));
                }
            });
            idle();
            assertEquals(List.of(0, 1), ran);
            assertEquals(2, outcome.saved);
            assertEquals(0, outcome.skipped);
            assertEquals(3, outcome.cancelled);
            assertNull("the row came down with the save", find(root, "Cancel"));
            assertEquals("Saved 2 of 5, the rest cancelled", SaveProgress.message(outcome, "all"));
            assertEquals("said once at the start and once for Cancel",
                    List.of("Saving 1 of 5", "Stopping after this file"), said);
        }
    }

    @Test public void aFileThatFailsIsSkippedAndTheRestStillLand() {
        List<Integer> ran = new ArrayList<>();
        SaveProgress.Outcome outcome = SaveProgress.begin(4).run(index -> {
            ran.add(index);
            if (index == 1) throw new IOException("the mirror refused this one");
        });
        assertEquals(List.of(0, 1, 2, 3), ran);
        assertEquals(3, outcome.saved);
        assertEquals(1, outcome.skipped);
        assertEquals(0, outcome.cancelled);
        assertEquals("Saved 3 of 4, 1 skipped", SaveProgress.message(outcome, "all"));
    }

    @Test public void aRefusalFromTheDiskOrTheClockEndsTheSaveAndSaysWhy() {
        List<Integer> ran = new ArrayList<>();
        SaveProgress.Outcome outcome = SaveProgress.begin(5).run(index -> {
            ran.add(index);
            if (index == 2) throw new MediaBudget.StopException("no room", true);
        });
        assertEquals("the files after the refusal are not tried", List.of(0, 1, 2), ran);
        assertEquals(2, outcome.saved);
        assertEquals(0, outcome.skipped);
        assertEquals(3, outcome.cancelled);
        assertEquals(SaveProgress.Stop.NO_SPACE, outcome.stop);
        assertEquals("Saved 2 of 5, the rest need more free space", SaveProgress.message(outcome, "all"));
        assertEquals("Saved 1 of 4, the rest ran out of time",
                SaveProgress.message(new SaveProgress.Outcome(4, 1, 0, 3, SaveProgress.Stop.NO_TIME), "all"));
    }

    @Test public void theMessageNamesSkippedAndCancelledTogether() {
        assertEquals("Saved 2 of 6, 1 skipped and the rest cancelled",
                SaveProgress.message(new SaveProgress.Outcome(6, 2, 1, 3), "all"));
        assertEquals("all", SaveProgress.message(new SaveProgress.Outcome(6, 6, 0, 0), "all"));
    }

    @Test public void cancelBeforeTheFirstFileSavesNothingAndSaysSo() {
        SaveProgress progress = SaveProgress.begin(3);
        progress.cancel();
        List<Integer> ran = new ArrayList<>();
        SaveProgress.Outcome outcome = progress.run(ran::add);
        assertTrue(ran.isEmpty());
        assertEquals(0, outcome.saved);
        assertEquals(3, outcome.cancelled);
        assertEquals("Saved 0 of 3, the rest cancelled", SaveProgress.message(outcome, "all"));
    }
}

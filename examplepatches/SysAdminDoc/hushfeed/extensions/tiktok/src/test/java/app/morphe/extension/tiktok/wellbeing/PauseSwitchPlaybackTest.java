package app.morphe.extension.tiktok.wellbeing;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Dialog;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor;
import app.morphe.extension.tiktok.blockauthor.FeedVisibility;
import app.morphe.extension.tiktok.playback.PausePlayback;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.wellbeing.SessionPlaybackHoldTest.NativeController;

import java.util.concurrent.atomic.AtomicLong;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;
import org.robolectric.util.ReflectionHelpers.ClassParameter;

/**
 * The two pause switches on TikTok's own player. On 47.0.3 the video played on under the
 * comments and under the "Tap to start the feed" cover, because asking for the audio focus does
 * not stop that player; the switches now pause it through the bridge the daily hold uses. These
 * drive the switches through their own entry points with the hold's fake player, and read the
 * player's position the way the device check does.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class PauseSwitchPlaybackTest {
    private final AtomicLong now = new AtomicLong(1_788_800_400_000L);

    public static final class HostActivity extends Activity { }

    @Before public void setUp() throws Exception {
        Utils.setContext(RuntimeEnvironment.getApplication());
        SessionPlaybackHoldTest.installNativeControls();
        SessionBudget.awaitWritesForTests();
        resetSettings();
        SessionBudget.setClockForTests(now::get);
        SessionBudget.resetForTests();
        ReflectionHelpers.callStaticMethod(CurrentVideoAuthor.class, "resetForTests");
        ReflectionHelpers.callStaticMethod(PausePlayback.class, "resetForTests");
    }

    @After public void tearDown() throws Exception {
        ReflectionHelpers.callStaticMethod(PausePlayback.class, "resetForTests");
        Utils.setActivity(null);
        SessionBudget.awaitWritesForTests();
        resetSettings();
        SessionBudget.resetForTests();
        SessionLockOverlay.sync();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        SessionBudget.setClockForTests(null);
        ReflectionHelpers.callStaticMethod(CurrentVideoAuthor.class, "resetForTests");
        SessionPlaybackHold.nativeForTests = null;
        String pkg = RuntimeEnvironment.getApplication().getPackageName();
        FeedVisibility.resolveForTests(pkg, "pvp", 0);
        FeedVisibility.resolveForTests(pkg, "wk7", 0);
    }

    private static void resetSettings() {
        Settings.PAUSE_ON_COMMENTS.resetToDefault();
        Settings.NO_RESUME_ON_FOREGROUND.resetToDefault();
        Settings.SESSION_BUDGET_VIDEOS.resetToDefault();
        Settings.SESSION_BUDGET_MINUTES.resetToDefault();
        Settings.SESSION_BUDGET_LOCK_MINUTES.resetToDefault();
        Settings.SESSION_BUDGET_LOCK.resetToDefault();
        Settings.SESSION_BUDGET_PASSES_PER_DAY.resetToDefault();
        Settings.SESSION_BUDGET_NOTICE_MINUTES.resetToDefault();
        Settings.SESSION_BUDGET_STATE.resetToDefault();
    }

    @Test public void openCommentsStopTheVideoAndClosingThemPlaysItOnFromThere() {
        Settings.PAUSE_ON_COMMENTS.save(true);
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            NativeController player = playing("first");

            Dialog sheet = openSheet(activity);
            PausePlayback.onCommentCellBound(cellIn(sheet));
            idle();
            assertEquals("opening the comments did not pause the video", 1, player.manager.pauses);
            long stoppedAt = player.manager.position;
            player.manager.advance(3_000);
            assertEquals("the video played on under the comments", stoppedAt, player.manager.position);

            sheet.dismiss();
            idle();
            assertEquals("closing the comments did not give the video back", 1, player.manager.resumes);
            player.manager.advance(1_000);
            assertEquals(stoppedAt + 1_000, player.manager.position);
        }
    }

    @Test public void underTheReturnCoverAVideoTikTokStartsAgainStaysStoppedUntilTheTap() {
        Settings.NO_RESUME_ON_FOREGROUND.save(true);
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            NativeController player = playing("first");

            ReflectionHelpers.callStaticMethod(PausePlayback.class, "onBackground");
            idle();
            // TikTok stops its own player as the app goes away.
            player.manager.playing = false;
            player.manager.paused = true;
            ReflectionHelpers.callStaticMethod(PausePlayback.class, "onForeground",
                    ClassParameter.from(Activity.class, activity));
            idle();
            View catcher = ReflectionHelpers.callStaticMethod(PausePlayback.class, "catcherForTests");
            assertNotNull("returning put up no cover", catcher);
            assertEquals("a video TikTok had stopped was paused again", 0, player.manager.pauses);

            // Then TikTok starts it again by itself, under the cover.
            player.manager.nativeResume();
            player.reportProgress();
            idle();
            assertEquals("the video TikTok started again played on under the cover",
                    1, player.manager.pauses);
            long stoppedAt = player.manager.position;
            player.manager.advance(3_000);
            assertEquals(stoppedAt, player.manager.position);

            assertTrue(catcher.performClick());
            idle();
            assertEquals("the tap did not start the video", 1, player.manager.resumes);
            player.manager.advance(1_000);
            assertEquals(stoppedAt + 1_000, player.manager.position);
        }
    }

    @Test public void goingAwayLeavesTheVideoToTikTokAndASheetStillOpenStopsItAgain() {
        Settings.PAUSE_ON_COMMENTS.save(true);
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            NativeController player = playing("first");
            Dialog sheet = openSheet(activity);
            PausePlayback.onCommentCellBound(cellIn(sheet));
            idle();
            assertEquals(1, player.manager.pauses);

            ReflectionHelpers.callStaticMethod(PausePlayback.class, "onBackground");
            idle();
            assertEquals("going away started the video", 0, player.manager.resumes);

            ReflectionHelpers.callStaticMethod(PausePlayback.class, "onForeground",
                    ClassParameter.from(Activity.class, activity));
            player.manager.nativeResume();
            player.reportProgress();
            idle();
            assertEquals("the video played on behind the sheet still open", 2, player.manager.pauses);

            sheet.dismiss();
            idle();
            assertEquals(1, player.manager.resumes);
        }
    }

    /**
     * Turning the switch off while the comments still hold the video stops the feature, and that
     * must not start the sound behind the open sheet: the video is left as it is, and closing the
     * sheet afterwards changes nothing either, since the feature let go when it was switched off.
     */
    @Test public void switchingOffMidHoldLeavesTheVideoPausedBehindTheOpenComments() {
        Settings.PAUSE_ON_COMMENTS.save(true);
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            NativeController player = playing("first");
            FrameLayout sheet = panelIn(activity, true);
            PausePlayback.onCommentCellBound(sheet.getChildAt(1));
            idle();
            assertEquals(1, player.manager.pauses);
            assertTrue(ReflectionHelpers.<Boolean>callStaticMethod(PausePlayback.class, "quietenedForTests"));

            Settings.PAUSE_ON_COMMENTS.save(false);
            idleFor(600);
            assertEquals("switching off started the video behind the open comments",
                    0, player.manager.resumes);
            assertFalse("the sound was kept after the switch went off",
                    ReflectionHelpers.<Boolean>callStaticMethod(PausePlayback.class, "quietenedForTests"));

            park(sheet);
            idleFor(600);
            assertEquals("the sheet closing resumed a video the feature had let go",
                    0, player.manager.resumes);
        }
    }

    @Test public void aVideoTheReaderPausedStaysPausedWhenTheCommentsClose() {
        Settings.PAUSE_ON_COMMENTS.save(true);
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            NativeController player = playing("first");
            player.manager.playing = false;
            player.manager.paused = true;

            Dialog sheet = openSheet(activity);
            PausePlayback.onCommentCellBound(cellIn(sheet));
            idle();
            sheet.dismiss();
            idle();
            assertEquals(0, player.manager.pauses);
            assertEquals("closing the comments started a video the reader had paused",
                    0, player.manager.resumes);
        }
    }

    @Test public void closingTheCommentsOverTheReturnCoverKeepsTheVideoStopped() {
        Settings.PAUSE_ON_COMMENTS.save(true);
        Settings.NO_RESUME_ON_FOREGROUND.save(true);
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            NativeController player = playing("first");
            Dialog sheet = openSheet(activity);
            PausePlayback.onCommentCellBound(cellIn(sheet));
            idle();

            ReflectionHelpers.callStaticMethod(PausePlayback.class, "onBackground");
            idle();
            ReflectionHelpers.callStaticMethod(PausePlayback.class, "onForeground",
                    ClassParameter.from(Activity.class, activity));
            player.manager.nativeResume();
            player.reportProgress();
            idle();
            View catcher = ReflectionHelpers.callStaticMethod(PausePlayback.class, "catcherForTests");
            assertNotNull("returning put up no cover under the sheet", catcher);
            assertFalse(player.manager.isPlaying());

            sheet.dismiss();
            idle();
            assertEquals("closing the comments started the video under the cover",
                    0, player.manager.resumes);
            assertTrue("closing the comments handed the sound back under the cover",
                    ReflectionHelpers.<Boolean>callStaticMethod(PausePlayback.class, "quietenedForTests"));

            assertTrue(catcher.performClick());
            idle();
            assertEquals(1, player.manager.resumes);
        }
    }

    @Test public void aPanelUpWhenTheCommentsCloseKeepsTheVideoStopped() {
        Settings.PAUSE_ON_COMMENTS.save(true);
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            NativeController player = playing("first");
            Dialog sheet = openSheet(activity);
            PausePlayback.onCommentCellBound(cellIn(sheet));
            idle();
            assertEquals(1, player.manager.pauses);

            Settings.SESSION_BUDGET_VIDEOS.save(2);
            Settings.SESSION_BUDGET_LOCK_MINUTES.save(5);
            SessionBudget.noteVideo("one");
            SessionBudget.noteVideo("two");
            assertTrue("the budget was not reached", SessionBudget.claimNotice());
            assertTrue("no hold was placed", SessionBudget.isLocked());

            sheet.dismiss();
            idle();
            assertEquals("the video played under the daily panel", 0, player.manager.resumes);
        }
    }

    /**
     * TikTok 47.0.3 draws the comments into the activity rather than a window of their own, and
     * parks the sheet below the screen when it closes, so nothing detaches. The switch did
     * nothing there at all, not even the sound, until it went by the sheet the feed's controls
     * already know by its id.
     */
    @Test public void aCommentSheetDrawnIntoTheActivityStopsTheVideoUntilItSlidesAway() {
        Settings.PAUSE_ON_COMMENTS.save(true);
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            NativeController player = playing("first");
            FrameLayout sheet = panelIn(activity, true);

            PausePlayback.onCommentCellBound(sheet.getChildAt(1));
            idle();
            assertEquals("opening 47.0.3's comment sheet did not pause the video", 1, player.manager.pauses);
            long stoppedAt = player.manager.position;
            player.manager.advance(3_000);
            assertEquals(stoppedAt, player.manager.position);

            // Scrolling the comments binds more cells into the same sheet, and the sheet stays up
            // past the checks that follow a bind.
            PausePlayback.onCommentCellBound(sheet.getChildAt(1));
            idleFor(2_000);
            assertEquals(1, player.manager.pauses);
            assertEquals("the video came back with the comments still open", 0, player.manager.resumes);

            park(sheet);
            idleFor(300);
            assertEquals("the video stayed paused after the sheet slid away", 1, player.manager.resumes);
            player.manager.advance(1_000);
            assertEquals(stoppedAt + 1_000, player.manager.position);
        }
    }

    @Test public void cellsBoundBeforeTheSheetSlidesUpStillStopTheVideo() {
        Settings.PAUSE_ON_COMMENTS.save(true);
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            NativeController player = playing("first");
            FrameLayout sheet = panelIn(activity, false);

            PausePlayback.onCommentCellBound(sheet.getChildAt(1));
            idle();
            assertEquals("a sheet still below the screen paused the video", 0, player.manager.pauses);

            // The slide up moves the sheet without a layout pass.
            sheet.setTranslationY(0f);
            idleFor(300);
            assertEquals("the sheet came up after its cells bound and the video played on",
                    1, player.manager.pauses);

            park(sheet);
            idleFor(300);
            assertEquals(1, player.manager.resumes);
        }
    }

    @Test public void aSheetFilledWhileParkedIsCaughtWhenItOpensLater() {
        Settings.PAUSE_ON_COMMENTS.save(true);
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            NativeController player = playing("first");
            FrameLayout sheet = panelIn(activity, false);

            PausePlayback.onCommentCellBound(sheet.getChildAt(1));
            idleFor(2_000);
            assertEquals(0, player.manager.pauses);
            assertFalse("a parked sheet took the sound",
                    ReflectionHelpers.<Boolean>callStaticMethod(PausePlayback.class, "quietenedForTests"));

            // Opened later with nothing new to bind: the opening comes with a layout pass.
            sheet.setTranslationY(0f);
            sheet.getViewTreeObserver().dispatchOnGlobalLayout();
            idle();
            assertEquals("an opening that bound nothing new left the video playing",
                    1, player.manager.pauses);

            park(sheet);
            idleFor(300);
            assertEquals(1, player.manager.resumes);
        }
    }

    @Test public void comingBackToCommentsLeftOpenInTheActivityKeepsTheVideoStoppedUntilBothAreGone() {
        Settings.PAUSE_ON_COMMENTS.save(true);
        Settings.NO_RESUME_ON_FOREGROUND.save(true);
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setActivity(activity);
            NativeController player = playing("first");
            FrameLayout sheet = panelIn(activity, true);
            PausePlayback.onCommentCellBound(sheet.getChildAt(1));
            idle();
            assertEquals(1, player.manager.pauses);

            ReflectionHelpers.callStaticMethod(PausePlayback.class, "onBackground");
            idle();
            assertEquals("going away started the video", 0, player.manager.resumes);
            ReflectionHelpers.callStaticMethod(PausePlayback.class, "onForeground",
                    ClassParameter.from(Activity.class, activity));
            player.manager.nativeResume();
            player.reportProgress();
            idle();
            assertEquals("the video played on behind the comments on the way back",
                    2, player.manager.pauses);
            View catcher = ReflectionHelpers.callStaticMethod(PausePlayback.class, "catcherForTests");
            assertNotNull(catcher);

            assertTrue(catcher.performClick());
            idle();
            assertEquals("the tap started the video with the comments still open",
                    0, player.manager.resumes);

            park(sheet);
            idleFor(300);
            assertEquals(1, player.manager.resumes);
        }
    }

    // ------------------------------------------------------------------------------- fixture

    /**
     * 47.0.3's comment sheet: drawn into the activity, known by its ids (pvp, and the wk7 title),
     * with a cell in it, and parked below the screen unless {@code up}.
     */
    private static FrameLayout panelIn(Activity activity, boolean up) {
        FrameLayout content = activity.findViewById(android.R.id.content);
        FrameLayout sheet = new FrameLayout(activity);
        sheet.setId(0x7f0a1001);
        TextView title = new TextView(activity);
        title.setId(0x7f0a1002);
        sheet.addView(title, new FrameLayout.LayoutParams(200, 80));
        sheet.addView(new View(activity), new FrameLayout.LayoutParams(200, 80));
        content.addView(sheet, new FrameLayout.LayoutParams(500, 700));
        FeedVisibility.resolveForTests(activity.getPackageName(), "pvp", sheet.getId());
        FeedVisibility.resolveForTests(activity.getPackageName(), "wk7", title.getId());
        idle();
        if (!up) park(sheet);
        return sheet;
    }

    /** Where TikTok keeps the sheet once it closes: inflated, below the screen. */
    private static void park(View sheet) {
        sheet.setTranslationY(((View) sheet.getParent()).getHeight() + 100f);
    }

    private static void idleFor(long millis) {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(millis));
    }

    /** A player on its video, which has reported progress, so the hold knows it is on screen. */
    private static NativeController playing(String aid) {
        NativeController player = new NativeController();
        player.bind(aid);
        player.reportProgress();
        idle();
        assertTrue(player.manager.isPlaying());
        return player;
    }

    private static void idle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    /** A comment sheet the way TikTok's is: a window of its own over the feed. */
    private static Dialog openSheet(Activity activity) {
        Dialog sheet = new Dialog(activity);
        FrameLayout content = new FrameLayout(activity);
        content.addView(new View(activity));
        sheet.setContentView(content);
        sheet.show();
        idle();
        return sheet;
    }

    private static View cellIn(Dialog sheet) {
        ViewGroup content = sheet.findViewById(android.R.id.content);
        assertNotNull("the sheet has no content", content);
        View cell = content;
        while (cell instanceof ViewGroup && ((ViewGroup) cell).getChildCount() > 0) {
            cell = ((ViewGroup) cell).getChildAt(0);
        }
        return cell;
    }
}

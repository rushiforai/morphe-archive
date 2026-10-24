/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import com.facebook.litho.ComponentHost;
import com.facebook.litho.LithoView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.time.Duration;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * A reel's caption draws its last line whole (#96, #212). The page copies the S22's Reels tab on
 * 584 as dumpsys has it (2026-10-23): the footer row 0,0-1080,978, its column 0,760-945,944 holding
 * one block at 0,-17-945,201, the action buttons beside it, and the scrubber's time label elsewhere
 * in the same LithoView. Only that row is unclipped, and only while it's on screen. The other
 * footer layout (row 0,0-1080,1898, column 0,0-945,1864, block 0,1663-945,1881) gets the same.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "w384dp-h823dp-xxhdpi")
public class CaptionRoomTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Activity activity;
    private LithoView page;
    private ComponentHost overlay;
    private ComponentHost row;
    private ComponentHost column;
    private ComponentHost actions;
    private View label;

    @Before
    public void setUp() {
        CaptionRoom.reset();
        HookStatus.clear();
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        FrameLayout root = new FrameLayout(activity);
        page = new LithoView(activity);
        place(root, page, 0, 0, 1080, 1948);
        overlay = new ComponentHost(activity);
        place(page, overlay, 0, 843, 1080, 1948);
        row = new ComponentHost(activity);
        place(overlay, row, 0, 0, 1080, 978);
        column = new ComponentHost(activity);
        place(row, column, 0, 760, 945, 944);
        actions = new ComponentHost(activity);
        place(row, actions, 945, 0, 1080, 944);
        place(actions, new ComponentHost(activity), 0, 0, 135, 174);
        FrameLayout scrubber = new FrameLayout(activity);
        place(page, scrubber, 0, 893, 1080, 1973);
        label = new FrameLayout(activity);
        place(scrubber, label, 0, 918, 291, 1080);
        activity.setContentView(root);
        layOut();
    }

    @After
    public void tearDown() {
        PauseForTests.resume();
        CaptionRoom.reset();
        HookStatus.clear();
    }

    @Test
    public void unclipsTheRowWhoseCaptionHangsPastItsColumn() {
        block(column, -17, 201);
        layOut();

        CaptionRoom.mounted(label);

        assertFalse(row.getClipChildren());
        assertTrue(column.getClipChildren());
        assertTrue(overlay.getClipChildren());
        assertTrue(actions.getClipChildren());
        assertTrue(page.getClipChildren());
        assertEquals(17, CaptionRoom.hangsBelow(row, column, 36));
        assertTrue(reported(CaptionRoom.UNCLIPPED));
    }

    @Test
    public void unclipsTheFooterLaidOutAsTallAsTheReel() {
        ComponentHost tall = new ComponentHost(activity);
        place(page, tall, 0, 0, 1080, 1898);
        ComponentHost reelColumn = new ComponentHost(activity);
        place(tall, reelColumn, 0, 0, 945, 1864);
        place(reelColumn, new ComponentHost(activity), 0, 0, 945, 1680);
        ComponentHost held = new ComponentHost(activity);
        place(reelColumn, held, 0, 1663, 945, 1881);
        place(held, new ComponentHost(activity), 0, 0, 945, 17);
        place(held, new View(activity), 34, 152, 911, 214);
        place(tall, new ComponentHost(activity), 945, 920, 1080, 1864);
        layOut();

        CaptionRoom.mounted(label);

        assertFalse(tall.getClipChildren());
        assertEquals(17, CaptionRoom.hangsBelow(tall, reelColumn, 36));
    }

    @Test
    public void leavesTheActionButtonsWhoseLabelHangsOntoTheNextButton() {
        block(column, -17, 201);
        ComponentHost first = (ComponentHost) actions.getChildAt(0);
        place(first, new ComponentHost(activity), 0, 0, 135, 113);
        place(first, new ComponentHost(activity), 0, 106, 135, 183);
        place(actions, new ComponentHost(activity), 0, 174, 135, 348);
        layOut();

        CaptionRoom.mounted(label);

        assertFalse(row.getClipChildren());
        assertTrue(actions.getClipChildren());
        assertEquals(0, CaptionRoom.hangsBelow(actions, first, 36));
    }

    @Test
    public void looksAgainOnceTheFooterIsLaidOut() {
        CaptionRoom.mounted(label);
        assertTrue(row.getClipChildren());

        block(column, -17, 201);
        layOut();

        assertFalse(row.getClipChildren());
    }

    @Test
    public void theFirstReelAfterAStartGetsItsRoomFromTheProgressUpdate() {
        block(column, -17, 201);
        layOut();

        CaptionRoom.updated(label);

        assertFalse(row.getClipChildren());
        assertTrue(reported(CaptionRoom.UNCLIPPED));
    }

    @Test
    public void aProgressUpdateLeavesAWatchedPageToItsLayouts() {
        CaptionRoom.updated(label);
        block(column, -17, 201);

        CaptionRoom.updated(label);
        assertTrue(row.getClipChildren());

        layOut();
        assertFalse(row.getClipChildren());
    }

    @Test
    public void aProgressUpdateOffTheWindowWaitsForOneOnIt() {
        block(column, -17, 201);
        layOut();
        FrameLayout scrubber = new FrameLayout(activity);
        View early = new FrameLayout(activity);
        place(scrubber, early, 0, 918, 291, 1080);

        CaptionRoom.updated(early);
        assertTrue(row.getClipChildren());

        place(page, scrubber, 0, 893, 1080, 1973);
        CaptionRoom.updated(early);

        assertFalse(row.getClipChildren());
    }

    @Test
    public void clipsTheRowAgainWhenItLeavesTheScreen() {
        block(column, -17, 201);
        layOut();
        CaptionRoom.mounted(label);
        assertFalse(row.getClipChildren());

        overlay.removeView(row);

        assertTrue(row.getClipChildren());
    }

    @Test
    public void leavesABlockThatFitsItsColumn() {
        block(column, 0, 184);
        layOut();

        CaptionRoom.mounted(label);

        assertTrue(row.getClipChildren());
        assertFalse(reported(CaptionRoom.UNCLIPPED));
    }

    @Test
    public void leavesABlockHangingFurtherThanACaptionLine() {
        block(column, -60, 244);
        layOut();

        CaptionRoom.mounted(label);

        assertTrue(row.getClipChildren());
    }

    @Test
    public void leavesARowWithNoRoomUnderTheColumn() {
        ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) row.getLayoutParams();
        params.height = 950;
        row.setLayoutParams(params);
        block(column, -17, 201);
        layOut();

        CaptionRoom.mounted(label);

        assertTrue(row.getClipChildren());
    }

    @Test
    public void leavesViewsThatArentLithoHosts() {
        FrameLayout plainRow = new FrameLayout(activity);
        place(overlay, plainRow, 0, 0, 1080, 978);
        FrameLayout plainColumn = new FrameLayout(activity);
        place(plainRow, plainColumn, 0, 760, 945, 944);
        place(plainColumn, new ComponentHost(activity), 0, -17, 945, 201);
        layOut();

        CaptionRoom.mounted(label);

        assertTrue(plainRow.getClipChildren());
    }

    @Test
    public void pausedLeavesEveryRowAlone() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        block(column, -17, 201);
        layOut();

        CaptionRoom.mounted(label);
        CaptionRoom.updated(label);
        layOut();

        assertTrue(row.getClipChildren());
    }

    /** Puts the block 584's footer column holds into [into], from [top] to [bottom]. */
    private void block(ComponentHost into, int top, int bottom) {
        ComponentHost held = new ComponentHost(activity);
        place(into, held, 0, top, 945, bottom);
        place(held, new View(activity), 34, 135, 911, 180);
    }

    private boolean reported(String counted) {
        for (String line : HookStatus.report()) {
            if (line.contains(FamilyNames.PROGRESS_BAR) && line.contains(counted)) return true;
        }
        return false;
    }

    private static void place(ViewGroup parent, View child, int left, int top, int right, int bottom) {
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(right - left, bottom - top, Gravity.LEFT | Gravity.TOP);
        params.leftMargin = left;
        params.topMargin = top;
        parent.addView(child, params);
    }

    private void layOut() {
        activity.getWindow().getDecorView().requestLayout();
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(100));
    }
}

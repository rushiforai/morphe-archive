/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.swipecontrols.misc.Rectangle;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
public class OfflineFullscreenSwipeTest {
    private static final Rectangle SAFE_VIEWPORT = new Rectangle(20, 30, 560, 740);
    private static final int CENTER = 300;
    private static final int UPPER = 240;
    private static final int LOWER = 480;

    private OfflineFullscreenSwipe swipe;
    private long downTime;
    private long eventTime;

    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.versionName = "21.45.90";
        info.applicationInfo = app.getApplicationInfo();
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        Utils.setContext(app);
        Settings.DISABLE_SWIPE_TO_ENTER_FULLSCREEN_MODE_IN_THE_PLAYER.save(false);
        Settings.DISABLE_SWIPE_TO_ENTER_FULLSCREEN_MODE_BELOW_THE_PLAYER.save(false);
        Settings.DISABLE_SWIPE_TO_EXIT_FULLSCREEN_MODE.save(false);
        swipe = new OfflineFullscreenSwipe(app);
    }

    @Test
    public void upwardSwipeEntersAndDownwardSwipeExitsOnRelease() {
        begin(CENTER, LOWER, false, false);
        assertTrue(move(CENTER + 5, UPPER));
        assertTrue(finish(MotionEvent.ACTION_UP, CENTER + 5, UPPER));
        assertFalse(finish(MotionEvent.ACTION_UP, CENTER + 5, UPPER));

        begin(CENTER, UPPER, true, false);
        assertTrue(move(CENTER - 5, LOWER));
        assertTrue(finish(MotionEvent.ACTION_UP, CENTER - 5, LOWER));
    }

    @Test
    public void wrongDirectionShortDragAndTapDoNotToggle() {
        assertFalse(drag(CENTER, UPPER, LOWER, false, false));
        assertFalse(drag(CENTER, LOWER, UPPER, true, false));
        assertFalse(drag(CENTER, LOWER, LOWER - 24, false, false));

        begin(CENTER, LOWER, false, false);
        assertFalse(finish(MotionEvent.ACTION_UP, CENTER, LOWER));
    }

    @Test
    public void diagonalAndHorizontalDragsDoNotBecomeFullscreenSwipes() {
        begin(CENTER, LOWER, false, false);
        assertFalse(move(CENTER + 160, UPPER));
        assertFalse(finish(MotionEvent.ACTION_UP, CENTER + 160, UPPER));

        begin(CENTER, LOWER, false, false);
        assertFalse(move(CENTER + 100, LOWER));
        assertFalse(move(CENTER, UPPER));
        assertFalse(finish(MotionEvent.ACTION_UP, CENTER, UPPER));
    }

    @Test
    public void returningToTheStartBeforeReleaseDoesNotToggle() {
        begin(CENTER, LOWER, false, false);
        assertTrue(move(CENTER, UPPER));
        assertFalse(finish(MotionEvent.ACTION_UP, CENTER, LOWER));
    }

    @Test
    public void systemGestureEdgesAndReservedVerticalZonesCannotToggle() {
        assertFalse(drag(SAFE_VIEWPORT.getLeft() - 1, LOWER, UPPER, false, false));
        assertFalse(drag(SAFE_VIEWPORT.getRight(), UPPER, LOWER, true, false));
        assertFalse(drag(CENTER, SAFE_VIEWPORT.getTop() - 1, LOWER, true, false));
        assertFalse(drag(CENTER, SAFE_VIEWPORT.getBottom(), UPPER, false, false));
        assertFalse(drag(100, LOWER, UPPER, false, true));
        assertFalse(drag(500, UPPER, LOWER, true, true));
    }

    @Test
    public void inPlayerDisableSettingsApplyIndependentlyOfEachOtherAndTheBelowPlayerSetting() {
        Settings.DISABLE_SWIPE_TO_ENTER_FULLSCREEN_MODE_BELOW_THE_PLAYER.save(true);
        Settings.DISABLE_SWIPE_TO_ENTER_FULLSCREEN_MODE_IN_THE_PLAYER.save(true);
        assertFalse(drag(CENTER, LOWER, UPPER, false, false));
        assertTrue(drag(CENTER, UPPER, LOWER, true, false));

        Settings.DISABLE_SWIPE_TO_ENTER_FULLSCREEN_MODE_IN_THE_PLAYER.save(false);
        Settings.DISABLE_SWIPE_TO_EXIT_FULLSCREEN_MODE.save(true);
        assertTrue(drag(CENTER, LOWER, UPPER, false, false));
        assertFalse(drag(CENTER, UPPER, LOWER, true, false));
    }

    @Test
    public void cancellationOrLongPressAbortsAnArmedSwipe() {
        begin(CENTER, LOWER, false, false);
        assertTrue(move(CENTER, UPPER));
        assertFalse(finish(MotionEvent.ACTION_CANCEL, CENTER, UPPER));
        assertFalse(finish(MotionEvent.ACTION_UP, CENTER, UPPER));

        begin(CENTER, LOWER, false, false);
        swipe.cancel(); // The screen gives a long press to press-to-engage, not fullscreen.
        assertFalse(move(CENTER, UPPER));
        assertFalse(finish(MotionEvent.ACTION_UP, CENTER, UPPER));
    }

    @Test
    public void secondPointerAbortsTheClaimUntilTheNextDown() {
        begin(CENTER, LOWER, false, false);
        assertTrue(move(CENTER, UPPER));

        var first = new MotionEvent.PointerProperties();
        first.id = 0;
        first.toolType = MotionEvent.TOOL_TYPE_FINGER;
        var second = new MotionEvent.PointerProperties();
        second.id = 1;
        second.toolType = MotionEvent.TOOL_TYPE_FINGER;
        var firstPosition = new MotionEvent.PointerCoords();
        firstPosition.x = CENTER;
        firstPosition.y = UPPER;
        var secondPosition = new MotionEvent.PointerCoords();
        secondPosition.x = CENTER + 40;
        secondPosition.y = UPPER;
        MotionEvent twoFingers = MotionEvent.obtain(downTime, ++eventTime,
                MotionEvent.ACTION_POINTER_DOWN | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT), 2,
                new MotionEvent.PointerProperties[]{first, second},
                new MotionEvent.PointerCoords[]{firstPosition, secondPosition},
                0, 0, 1, 1, 0, 0, InputDevice.SOURCE_TOUCHSCREEN, 0);
        try {
            assertFalse(swipe.finish(twoFingers));
        } finally {
            twoFingers.recycle();
        }

        assertFalse(move(CENTER, UPPER - 30));
        assertFalse(finish(MotionEvent.ACTION_UP, CENTER, UPPER - 30));
        assertTrue(drag(CENTER, LOWER, UPPER, false, false));
    }

    private void begin(int x, int y, boolean fullscreen, boolean reserved) {
        downTime = eventTime = SystemClock.uptimeMillis();
        MotionEvent event = event(MotionEvent.ACTION_DOWN, x, y);
        try {
            swipe.begin(event, SAFE_VIEWPORT, fullscreen, reserved);
        } finally {
            event.recycle();
        }
    }

    private boolean move(int x, int y) {
        MotionEvent event = event(MotionEvent.ACTION_MOVE, x, y);
        try {
            return swipe.move(event);
        } finally {
            event.recycle();
        }
    }

    private boolean finish(int action, int x, int y) {
        MotionEvent event = event(action, x, y);
        try {
            return swipe.finish(event);
        } finally {
            event.recycle();
        }
    }

    private boolean drag(int x, int startY, int endY, boolean fullscreen, boolean reserved) {
        begin(x, startY, fullscreen, reserved);
        boolean claimed = move(x, endY);
        boolean committed = finish(MotionEvent.ACTION_UP, x, endY);
        if (committed) assertTrue(claimed);
        return committed;
    }

    private MotionEvent event(int action, int x, int y) {
        return MotionEvent.obtain(downTime, ++eventTime, action, x, y, 0);
    }
}

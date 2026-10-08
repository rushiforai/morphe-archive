package app.morphe.extension.tiktok.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.util.ReflectionHelpers.ClassParameter.from;

import android.app.Activity;
import android.content.Context;
import android.media.AudioManager;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.Window;
import android.view.WindowManager;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

/** Which drags Swipe for brightness and volume takes, the level math, and giving brightness back. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class EdgeSwipeLevelsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private boolean previousOverlays, previousPaused;
    private Activity activity;
    private int width, height;

    @Before
    public void setUp() {
        previousOverlays = SettingsStatus.videoOverlaysEnabled;
        previousPaused = Setting.isPaused();
        setPaused(false);
        SettingsStatus.videoOverlaysEnabled = true;
        Settings.SWIPE_LEVELS.save(true);
        Settings.SWIPE_LEVELS_STRIP_PERCENT.save(15);
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        Utils.setContext(activity);
        width = activity.getResources().getDisplayMetrics().widthPixels;
        height = activity.getResources().getDisplayMetrics().heightPixels;
    }

    @After
    public void tearDown() {
        SettingsStatus.videoOverlaysEnabled = previousOverlays;
        setPaused(previousPaused);
    }

    private static void setPaused(boolean value) {
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", from(boolean.class, value));
    }

    /** Records the actions that reach the views below, standing in for the activity. */
    private static final class Below {
        final List<Integer> actions = new ArrayList<>();
        final Window.Callback callback = (Window.Callback) Proxy.newProxyInstance(
                Window.Callback.class.getClassLoader(), new Class<?>[]{Window.Callback.class},
                (proxy, method, args) -> {
                    if ("dispatchTouchEvent".equals(method.getName())) {
                        actions.add(((MotionEvent) args[0]).getActionMasked());
                        return true;
                    }
                    return false;
                });
    }

    private static MotionEvent event(int action, float x, float y) {
        long now = SystemClock.uptimeMillis();
        return MotionEvent.obtain(now, now, action, x, y, 0);
    }

    private boolean send(EdgeSwipeLevels.Gesture gesture, Below below, int action, float x, float y) {
        MotionEvent e = event(action, x, y);
        try {
            return gesture.dispatch(e, below.callback);
        } finally {
            e.recycle();
        }
    }

    private float brightness() {
        return activity.getWindow().getAttributes().screenBrightness;
    }

    // ---- the level math --------------------------------------------------------------------

    @Test
    public void stripWidthIsAPercentOfTheWidthKeptInRange() {
        assertEquals(150, EdgeSwipeLevels.stripWidth(1000, 15));
        assertEquals(50, EdgeSwipeLevels.stripWidth(1000, 1));
        assertEquals(300, EdgeSwipeLevels.stripWidth(1000, 90));
    }

    @Test
    public void aPressIsPlacedAgainstTheStrips() {
        assertEquals(EdgeSwipeLevels.Side.BRIGHTNESS, EdgeSwipeLevels.sideAt(0f, 1000, 15));
        assertEquals(EdgeSwipeLevels.Side.BRIGHTNESS, EdgeSwipeLevels.sideAt(149f, 1000, 15));
        assertEquals(EdgeSwipeLevels.Side.NONE, EdgeSwipeLevels.sideAt(150f, 1000, 15));
        assertEquals(EdgeSwipeLevels.Side.NONE, EdgeSwipeLevels.sideAt(849f, 1000, 15));
        assertEquals(EdgeSwipeLevels.Side.VOLUME, EdgeSwipeLevels.sideAt(850f, 1000, 15));
        assertEquals(EdgeSwipeLevels.Side.NONE, EdgeSwipeLevels.sideAt(10f, 0, 15));
    }

    @Test
    public void draggingUpRaisesTheLevelAndAThreeQuarterHeightDragSpansTheRange() {
        assertEquals(0.5f, EdgeSwipeLevels.levelAfter(0.5f, 800f, 800f, 1000, 0f), 0.0001f);
        assertEquals(1f, EdgeSwipeLevels.levelAfter(0f, 800f, 50f, 1000, 0f), 0.0001f);
        assertEquals(0.5f, EdgeSwipeLevels.levelAfter(0f, 800f, 425f, 1000, 0f), 0.0001f);
        assertEquals(0f, EdgeSwipeLevels.levelAfter(1f, 100f, 900f, 1000, 0f), 0.0001f);
        assertEquals(EdgeSwipeLevels.MIN_BRIGHTNESS,
                EdgeSwipeLevels.levelAfter(0.5f, 100f, 900f, 1000, EdgeSwipeLevels.MIN_BRIGHTNESS), 0.0001f);
    }

    @Test
    public void volumeStepsRoundAndStayInsideTheStream() {
        assertEquals(0, EdgeSwipeLevels.volumeStep(0f, 15));
        assertEquals(8, EdgeSwipeLevels.volumeStep(0.5f, 15));
        assertEquals(15, EdgeSwipeLevels.volumeStep(1.4f, 15));
        assertEquals(0, EdgeSwipeLevels.volumeStep(-1f, 15));
    }

    @Test
    public void verticalAndHorizontalMovesAreTold() {
        assertTrue(EdgeSwipeLevels.isVerticalDrag(2f, -30f, 8));
        assertFalse(EdgeSwipeLevels.isVerticalDrag(0f, -5f, 8));
        assertFalse(EdgeSwipeLevels.isVerticalDrag(20f, -30f, 8));
        assertTrue(EdgeSwipeLevels.isHorizontalMove(30f, 4f, 8));
        assertFalse(EdgeSwipeLevels.isHorizontalMove(3f, 40f, 8));
    }

    // ---- which drags are taken -------------------------------------------------------------

    @Test
    public void aVerticalDragInTheLeftStripIsTakenAndChangesBrightness() {
        EdgeSwipeLevels.Gesture gesture = new EdgeSwipeLevels.Gesture(activity);
        Below below = new Below();
        float x = 5f;
        float y = height * 0.8f;

        assertTrue(send(gesture, below, MotionEvent.ACTION_DOWN, x, y));
        // The first move over the slop is not handed down: the views get a cancel instead.
        assertTrue(send(gesture, below, MotionEvent.ACTION_MOVE, x, y - 40f));
        assertEquals(List.of(MotionEvent.ACTION_DOWN, MotionEvent.ACTION_CANCEL), below.actions);
        assertTrue(gesture.taken());

        // The drag has begun but no level was written yet; the window still follows the system.
        float afterFirst = brightness();
        assertEquals(WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE, afterFirst, 0f);
        assertTrue(send(gesture, below, MotionEvent.ACTION_MOVE, x, y - height * 0.3f));
        assertTrue("dragging up raises it", brightness() > afterFirst);
        assertTrue(send(gesture, below, MotionEvent.ACTION_UP, x, y - height * 0.3f));
        assertEquals("the views below saw nothing more", 2, below.actions.size());
        assertFalse(gesture.taken());
        assertTrue(EdgeSwipeLevels.holdsBrightness(activity.getWindow()));
    }

    @Test
    public void aVerticalDragInTheRightStripChangesTheMusicVolume() {
        AudioManager audio = (AudioManager) activity.getSystemService(Context.AUDIO_SERVICE);
        audio.setStreamVolume(AudioManager.STREAM_MUSIC, 0, 0);
        EdgeSwipeLevels.Gesture gesture = new EdgeSwipeLevels.Gesture(activity);
        Below below = new Below();
        float x = width - 5f;
        float y = height * 0.9f;

        send(gesture, below, MotionEvent.ACTION_DOWN, x, y);
        send(gesture, below, MotionEvent.ACTION_MOVE, x, y - 40f);
        send(gesture, below, MotionEvent.ACTION_MOVE, x, y - height * 0.5f);
        send(gesture, below, MotionEvent.ACTION_UP, x, y - height * 0.5f);

        assertTrue(audio.getStreamVolume(AudioManager.STREAM_MUSIC) > 0);
        assertFalse("volume leaves the window's brightness alone", EdgeSwipeLevels.holdsBrightness(activity.getWindow()));
        assertEquals(WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE, brightness(), 0f);
    }

    @Test
    public void aDragFromTheMiddlePassesThroughUntouched() {
        EdgeSwipeLevels.Gesture gesture = new EdgeSwipeLevels.Gesture(activity);
        Below below = new Below();
        float x = width / 2f;
        float y = height * 0.8f;

        send(gesture, below, MotionEvent.ACTION_DOWN, x, y);
        send(gesture, below, MotionEvent.ACTION_MOVE, x, y - 40f);
        send(gesture, below, MotionEvent.ACTION_MOVE, x, y - 300f);
        send(gesture, below, MotionEvent.ACTION_UP, x, y - 300f);

        assertEquals(List.of(MotionEvent.ACTION_DOWN, MotionEvent.ACTION_MOVE, MotionEvent.ACTION_MOVE,
                MotionEvent.ACTION_UP), below.actions);
        assertFalse(EdgeSwipeLevels.holdsBrightness(activity.getWindow()));
    }

    @Test
    public void aTapInAStripPassesThrough() {
        EdgeSwipeLevels.Gesture gesture = new EdgeSwipeLevels.Gesture(activity);
        Below below = new Below();

        send(gesture, below, MotionEvent.ACTION_DOWN, 5f, 200f);
        send(gesture, below, MotionEvent.ACTION_MOVE, 5f, 203f);
        send(gesture, below, MotionEvent.ACTION_UP, 5f, 203f);

        assertEquals(List.of(MotionEvent.ACTION_DOWN, MotionEvent.ACTION_MOVE, MotionEvent.ACTION_UP),
                below.actions);
        assertFalse(EdgeSwipeLevels.holdsBrightness(activity.getWindow()));
    }

    @Test
    public void aHorizontalMoveInAStripPassesThroughAndALaterVerticalOneStaysPassed() {
        EdgeSwipeLevels.Gesture gesture = new EdgeSwipeLevels.Gesture(activity);
        Below below = new Below();

        send(gesture, below, MotionEvent.ACTION_DOWN, 5f, 400f);
        send(gesture, below, MotionEvent.ACTION_MOVE, 60f, 402f);
        send(gesture, below, MotionEvent.ACTION_MOVE, 62f, 100f);
        send(gesture, below, MotionEvent.ACTION_UP, 62f, 100f);

        assertEquals(List.of(MotionEvent.ACTION_DOWN, MotionEvent.ACTION_MOVE, MotionEvent.ACTION_MOVE,
                MotionEvent.ACTION_UP), below.actions);
        assertFalse(EdgeSwipeLevels.holdsBrightness(activity.getWindow()));
    }

    @Test
    public void aSecondFingerHandsTheGestureBack() {
        EdgeSwipeLevels.Gesture gesture = new EdgeSwipeLevels.Gesture(activity);
        Below below = new Below();

        send(gesture, below, MotionEvent.ACTION_DOWN, 5f, 400f);
        send(gesture, below, MotionEvent.ACTION_POINTER_DOWN, 200f, 400f);
        send(gesture, below, MotionEvent.ACTION_MOVE, 5f, 100f);

        assertFalse(gesture.taken());
        assertEquals(3, below.actions.size());
        assertFalse(EdgeSwipeLevels.holdsBrightness(activity.getWindow()));
    }

    @Test
    public void theStripWidthSettingMovesTheEdge() {
        Settings.SWIPE_LEVELS_STRIP_PERCENT.save(5);
        EdgeSwipeLevels.Gesture gesture = new EdgeSwipeLevels.Gesture(activity);
        Below below = new Below();
        float x = width * 0.10f;

        // 10 percent in is outside a 5 percent strip, so the drag is the feed's.
        send(gesture, below, MotionEvent.ACTION_DOWN, x, height * 0.8f);
        send(gesture, below, MotionEvent.ACTION_MOVE, x, height * 0.8f - 60f);
        assertFalse(gesture.taken());

        Settings.SWIPE_LEVELS_STRIP_PERCENT.save(30);
        send(gesture, below, MotionEvent.ACTION_UP, x, height * 0.8f - 60f);
        send(gesture, below, MotionEvent.ACTION_DOWN, x, height * 0.8f);
        send(gesture, below, MotionEvent.ACTION_MOVE, x, height * 0.8f - 60f);
        assertTrue(gesture.taken());
    }

    // ---- the gate, the wrapper and giving brightness back ----------------------------------

    @Test
    public void nothingIsTakenOrWrappedWhileTheSwitchIsOff() {
        Settings.SWIPE_LEVELS.save(false);
        Window.Callback before = activity.getWindow().getCallback();
        EdgeSwipeLevels.sync(activity);
        assertSame(before, activity.getWindow().getCallback());

        EdgeSwipeLevels.Gesture gesture = new EdgeSwipeLevels.Gesture(activity);
        Below below = new Below();
        send(gesture, below, MotionEvent.ACTION_DOWN, 5f, 600f);
        send(gesture, below, MotionEvent.ACTION_MOVE, 5f, 300f);
        assertFalse(gesture.taken());
        assertEquals(2, below.actions.size());
    }

    @Test
    public void aBundleWithoutTheHostPatchNeverTakesADrag() {
        SettingsStatus.videoOverlaysEnabled = false;
        Window.Callback before = activity.getWindow().getCallback();
        EdgeSwipeLevels.sync(activity);
        assertSame(before, activity.getWindow().getCallback());

        EdgeSwipeLevels.Gesture gesture = new EdgeSwipeLevels.Gesture(activity);
        Below below = new Below();
        send(gesture, below, MotionEvent.ACTION_DOWN, 5f, 600f);
        send(gesture, below, MotionEvent.ACTION_MOVE, 5f, 300f);
        assertFalse(gesture.taken());
    }

    @Test
    public void theSwitchOnWrapsTheWindowOnce() {
        Window.Callback before = activity.getWindow().getCallback();
        EdgeSwipeLevels.sync(activity);
        Window.Callback wrapped = activity.getWindow().getCallback();
        assertNotSame(before, wrapped);
        EdgeSwipeLevels.sync(activity);
        assertSame("a second pass leaves the one wrapper", wrapped, activity.getWindow().getCallback());
    }

    private void dragBrightness() {
        EdgeSwipeLevels.Gesture gesture = new EdgeSwipeLevels.Gesture(activity);
        Below below = new Below();
        send(gesture, below, MotionEvent.ACTION_DOWN, 5f, height * 0.8f);
        send(gesture, below, MotionEvent.ACTION_MOVE, 5f, height * 0.8f - 40f);
        send(gesture, below, MotionEvent.ACTION_MOVE, 5f, height * 0.8f - 120f);
        send(gesture, below, MotionEvent.ACTION_UP, 5f, height * 0.8f - 120f);
        assertTrue(brightness() >= 0f);
    }

    @Test
    public void brightnessGoesBackToTheSystemsWhenTheWindowPauses() {
        dragBrightness();
        EdgeSwipeLevels.onPaused(activity);
        assertEquals(WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE, brightness(), 0f);
        assertFalse(EdgeSwipeLevels.holdsBrightness(activity.getWindow()));
    }

    @Test
    public void brightnessGoesBackWhenTheSwitchGoesOff() {
        dragBrightness();
        Settings.SWIPE_LEVELS.save(false);
        EdgeSwipeLevels.sync(activity);
        assertEquals(WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE, brightness(), 0f);
    }

    @Test
    public void brightnessGoesBackWhileHushfeedIsPaused() {
        dragBrightness();
        setPaused(true);
        EdgeSwipeLevels.sync(activity);
        assertEquals(WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE, brightness(), 0f);

        EdgeSwipeLevels.Gesture gesture = new EdgeSwipeLevels.Gesture(activity);
        Below below = new Below();
        send(gesture, below, MotionEvent.ACTION_DOWN, 5f, 600f);
        send(gesture, below, MotionEvent.ACTION_MOVE, 5f, 300f);
        assertFalse("paused Hushfeed takes nothing", gesture.taken());
    }

    @Test
    public void aWindowThatNeverChangedBrightnessIsNotTouchedOnPause() {
        WindowManager.LayoutParams params = activity.getWindow().getAttributes();
        params.screenBrightness = 0.7f;
        activity.getWindow().setAttributes(params);
        EdgeSwipeLevels.onPaused(activity);
        assertEquals("a brightness TikTok set stays", 0.7f, brightness(), 0.0001f);
    }
}

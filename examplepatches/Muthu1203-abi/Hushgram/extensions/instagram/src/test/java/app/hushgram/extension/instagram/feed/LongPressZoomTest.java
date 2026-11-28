/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.os.Looper;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.TextureView;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.ImageView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import java.util.List;
import java.util.function.ToIntFunction;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/**
 * What the feed photo long press hooks do: off, paused, not ready, a video, a finger that moved and a
 * frame with nothing to show are Instagram's own long press; a held photo opens a zoom around the
 * finger that follows it and closes on a lift, a cancel or a second finger. With Keep the zoom open
 * (#149) it stays up after the lift, to drag and pinch, until a tap, Back or Close.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class LongPressZoomTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private static final ToIntFunction<Object> PHOTO = media -> LongPressZoom.PHOTO;
    private static final ToIntFunction<Object> CAROUSEL = media -> LongPressZoom.CAROUSEL;
    private static final ToIntFunction<Object> VIDEO = media -> 2;

    private ActivityController<Activity> controller;
    private Feed feed;
    private FrameLayout frame;
    private ImageView image;
    private Bitmap bitmap;
    private final Object media = new Object();

    /** Where the photo sits on the screen. Every finger below is placed from here. */
    private float x0;
    private float y0;

    /** The list a feed post sits in, which notes whether a child asked it to keep its touches. */
    static final class Feed extends FrameLayout {
        boolean held;

        Feed(Context context) {
            super(context);
        }

        @Override public void requestDisallowInterceptTouchEvent(boolean disallow) {
            held = disallow;
            super.requestDisallowInterceptTouchEvent(disallow);
        }
    }

    @Before
    public void clean() {
        Settings.LONG_PRESS_TO_ZOOM.resetToDefault();
        Settings.LONG_PRESS_ZOOM_STAYS_OPEN.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
        LongPressZoom.resetForTests();
        controller = Robolectric.buildActivity(Activity.class).setup();
        Activity activity = controller.get();
        feed = new Feed(activity);
        frame = new FrameLayout(activity);
        image = new ImageView(activity);
        image.setScaleType(ImageView.ScaleType.FIT_XY);
        bitmap = Bitmap.createBitmap(100, 100, Bitmap.Config.ARGB_8888);
        image.setImageBitmap(bitmap);
        frame.addView(image, new FrameLayout.LayoutParams(200, 200));
        feed.addView(frame, new FrameLayout.LayoutParams(200, 200));
        activity.setContentView(feed);
        idle();
        assertEquals("the photo is laid out", 200, image.getWidth());
        int[] spot = new int[2];
        image.getLocationOnScreen(spot);
        x0 = spot[0];
        y0 = spot[1];
    }

    @After
    public void restore() {
        LongPressZoom.resetForTests();
        if (controller != null) controller.close();
        Settings.LONG_PRESS_TO_ZOOM.resetToDefault();
        Settings.LONG_PRESS_ZOOM_STAYS_OPEN.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    /** A touch ([x], [y]) from the photo's corner. */
    private void touch(int action, float x, float y) {
        MotionEvent event = MotionEvent.obtain(0L, 0L, action, x0 + x, y0 + y, 0);
        try {
            LongPressZoom.touch(event);
        } finally {
            event.recycle();
        }
    }

    private int holdAt(float x, float y, ToIntFunction<Object> type) {
        touch(MotionEvent.ACTION_DOWN, x, y);
        return LongPressZoom.press(frame, media, type);
    }

    private static String report() {
        List<String> lines = HookStatus.report();
        StringBuilder all = new StringBuilder();
        for (String line : lines) all.append(line).append('\n');
        return all.toString();
    }

    /** Off to start: a long press is Instagram's, nothing opens, and only the call itself is counted. */
    @Test
    public void itStartsOffAndLeavesTheLongPressToInstagram() {
        assertFalse(Settings.LONG_PRESS_TO_ZOOM.get());
        assertEquals(0, holdAt(50f, 60f, PHOTO));
        assertFalse(LongPressZoom.isShown());
        assertFalse(feed.held);
        String report = report();
        assertTrue(report, report.contains(FamilyNames.LONG_PRESS_ZOOM + ": invoked 1"));
        assertFalse(report, report.contains(LongPressZoom.ZOOMED));
    }

    /**
     * On, a held photo opens over the window: the same bitmap, twice as big around the finger, and the
     * feed keeps its touches. Sliding moves the zoom with the finger and lifting closes it.
     */
    @Test
    public void aHeldPhotoZoomsAroundTheFingerUntilItLifts() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        assertEquals(1, holdAt(50f, 60f, PHOTO));
        assertTrue(LongPressZoom.isShown());
        LongPressZoom.ZoomView view = (LongPressZoom.ZoomView) LongPressZoom.shownView();
        assertNotNull(view);
        View root = frame.getRootView();
        assertSame("the zoom sits over the whole window", root, view.getParent());
        assertTrue("the feed doesn't scroll under it", feed.held);
        assertSame("the picture is the bitmap the feed shows, nothing fetched", bitmap, ((BitmapDrawable) view.picture()).getBitmap());
        assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_NO, view.getImportantForAccessibility());
        assertTrue(report(), report().contains(LongPressZoom.ZOOMED + " 1"));

        // Twice as big around the finger, 50 and 60 into the photo: its corner moves 50 and 60 further out.
        int[] at = new int[2];
        image.getLocationInWindow(at);
        Rect picture = view.picture().getBounds();
        assertPoint("the picture's corner, pushed away from the finger", at[0] - 50f, at[1] - 60f, view.mapped(0f, 0f));
        assertPoint("the far corner", at[0] + 350f, at[1] + 340f, view.mapped(picture.right, picture.bottom));

        touch(MotionEvent.ACTION_MOVE, 90f, 120f);
        assertPoint("the zoom follows the finger", at[0] - 90f, at[1] - 120f, view.mapped(0f, 0f));
        view.draw(new Canvas(Bitmap.createBitmap(10, 10, Bitmap.Config.ARGB_8888)));
        assertTrue("drawing it is fine", LongPressZoom.isShown());

        touch(MotionEvent.ACTION_UP, 90f, 120f);
        assertFalse(LongPressZoom.isShown());
        assertNull("the zoom is gone from the window", view.getParent());
    }

    /** A carousel is photos too, and the page under the finger is the one that opens, not the one beside it. */
    @Test
    public void aCarouselZoomsThePagePressed() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        Bitmap next = Bitmap.createBitmap(100, 100, Bitmap.Config.ARGB_8888);
        ImageView page = new ImageView(frame.getContext());
        page.setImageBitmap(next);
        FrameLayout.LayoutParams beside = new FrameLayout.LayoutParams(200, 200);
        beside.leftMargin = 200;
        frame.addView(page, beside);
        frame.setLayoutParams(new FrameLayout.LayoutParams(400, 200));
        idle();
        assertEquals("the next page is laid out", 200, page.getWidth());

        assertEquals(1, holdAt(250f, 60f, CAROUSEL));
        assertSame("the page pressed", next, ((BitmapDrawable) ((LongPressZoom.ZoomView) LongPressZoom.shownView()).picture()).getBitmap());
        touch(MotionEvent.ACTION_UP, 250f, 60f);

        assertEquals(1, holdAt(50f, 60f, CAROUSEL));
        assertSame("the control: the first page", bitmap, ((BitmapDrawable) ((LongPressZoom.ZoomView) LongPressZoom.shownView()).picture()).getBitmap());
    }

    /** A finger that moved further than a tap may is a scroll or a drag, and Instagram decides what that is. */
    @Test
    public void aFingerThatMovedPastATapIsNotALongPress() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        float slop = ViewConfiguration.get(frame.getContext()).getScaledTouchSlop();
        touch(MotionEvent.ACTION_DOWN, 50f, 60f);
        touch(MotionEvent.ACTION_MOVE, 50f + slop * 2, 60f);
        touch(MotionEvent.ACTION_MOVE, 50f, 60f);
        assertEquals("it went back, but it went", 0, LongPressZoom.press(frame, media, PHOTO));
        assertFalse(LongPressZoom.isShown());
        assertTrue(report(), report().contains(LongPressZoom.WANDERED + " 1"));

        touch(MotionEvent.ACTION_DOWN, 50f, 60f);
        touch(MotionEvent.ACTION_MOVE, 50f + slop / 2, 60f);
        assertEquals("the control: a little wobble is still a press", 1, LongPressZoom.press(frame, media, PHOTO));
    }

    /** A video keeps Instagram's own long press, and so does a frame playing one. */
    @Test
    public void aVideoKeepsInstagramsLongPress() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        assertEquals(0, holdAt(50f, 60f, VIDEO));
        assertTrue(report(), report().contains(LongPressZoom.NOT_A_PHOTO + " 1"));

        frame.addView(new TextureView(frame.getContext()), new FrameLayout.LayoutParams(200, 200));
        idle();
        assertEquals("a playing video in the frame", 0, holdAt(50f, 60f, PHOTO));
        assertFalse(LongPressZoom.isShown());
        assertTrue(report(), report().contains(LongPressZoom.NO_PICTURE + " 1"));
    }

    /** A frame showing only something small, an icon over nothing, has no photo to zoom. */
    @Test
    public void aFrameWithoutAPictureKeepsInstagramsLongPress() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        image.setLayoutParams(new FrameLayout.LayoutParams(20, 20));
        idle();
        assertEquals(0, holdAt(50f, 60f, PHOTO));
        assertFalse(LongPressZoom.isShown());
        assertTrue(report(), report().contains(LongPressZoom.NO_PICTURE + " 1"));

        image.setLayoutParams(new FrameLayout.LayoutParams(200, 200));
        image.setImageDrawable(null);
        idle();
        assertEquals("the control: no drawable, the view's own snapshot", 1, holdAt(50f, 60f, PHOTO));
        assertTrue(LongPressZoom.isShown());
    }

    /**
     * A photo kept on the GPU can't be copied: Canvas refuses to draw a hardware bitmap with an
     * IllegalArgumentException. That's no picture to zoom, counted as such, not a failed hook.
     */
    @Test
    public void aPictureThatCantBeCopiedKeepsInstagramsLongPressWithoutAFailure() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        ImageView hardware = new ImageView(controller.get()) {
            @Override public void draw(Canvas canvas) {
                throw new IllegalArgumentException("Software rendering doesn't support hardware bitmaps");
            }
        };
        frame.removeView(image);
        frame.addView(hardware, new FrameLayout.LayoutParams(200, 200));
        idle();

        assertEquals(0, holdAt(50f, 60f, PHOTO));
        assertFalse(LongPressZoom.isShown());
        assertTrue(report(), report().contains(LongPressZoom.NO_PICTURE + " 1"));
        assertFalse("reported as a failure: " + report(), report().contains("it threw"));
    }

    /** A second finger is a pinch, Instagram's own zoom: it closes the zoom, and so does a cancel. */
    @Test
    public void aSecondFingerOrACancelClosesTheZoom() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        assertEquals(1, holdAt(50f, 60f, PHOTO));
        touch(MotionEvent.ACTION_POINTER_DOWN, 70f, 60f);
        assertFalse(LongPressZoom.isShown());
        assertEquals("a pinch under way is never a long press", 0, LongPressZoom.press(frame, media, PHOTO));

        assertEquals(1, holdAt(50f, 60f, PHOTO));
        touch(MotionEvent.ACTION_CANCEL, 50f, 60f);
        assertFalse(LongPressZoom.isShown());
        assertEquals("nothing is held after a cancel", 0, LongPressZoom.press(frame, media, PHOTO));
    }

    /** Paused or before the settings are ready, a saved switch leaves the long press to Instagram. */
    @Test
    public void offPausedOrNotReadyKeepsInstagramsLongPress() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertEquals("paused", 0, holdAt(50f, 60f, PHOTO));
        assertTrue("the saved choice is kept", Settings.LONG_PRESS_TO_ZOOM.savedValue());
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        touch(MotionEvent.ACTION_DOWN, 50f, 60f);
        SettingsContextRule.withoutContext(() -> assertEquals("settings not ready", 0, LongPressZoom.press(frame, media, PHOTO)));
        assertFalse(LongPressZoom.isShown());
        assertFalse(report(), report().contains(LongPressZoom.ZOOMED));
        assertEquals("the control: on, the same press zooms", 1, LongPressZoom.press(frame, media, PHOTO));
    }

    /** With no finger seen going down, or no frame or post, it's Instagram's long press. */
    @Test
    public void aPressWithoutAFingerOrAPostIsInstagrams() {
        touch(MotionEvent.ACTION_DOWN, 50f, 60f);
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        assertEquals("the finger went down while it was off", 0, LongPressZoom.press(frame, media, PHOTO));
        touch(MotionEvent.ACTION_DOWN, 50f, 60f);
        assertEquals(0, LongPressZoom.press(null, media, PHOTO));
        assertEquals(0, LongPressZoom.press(frame, null, PHOTO));
        assertFalse(LongPressZoom.isShown());
        assertEquals("as built, the post's type is unknown", 0, LongPressZoom.mediaType(media));
        assertEquals("so the built hook says no", 0, LongPressZoom.press(frame, media));
    }

    /** Anything thrown leaves Instagram's long press and says so. */
    @Test
    public void aCheckThatThrowsKeepsInstagramsLongPressAndSaysSo() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        assertEquals(0, holdAt(50f, 60f, media -> {
            throw new IllegalStateException("no type");
        }));
        assertFalse(LongPressZoom.isShown());
        assertTrue(report(), report().contains("'" + LongPressZoom.PRESS + "' hook"));
    }

    /** When Instagram lets go of the bitmap under an open zoom, the zoom draws its backdrop and closes. */
    @Test
    public void aBitmapLetGoClosesTheZoom() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        assertEquals(1, holdAt(50f, 60f, PHOTO));
        View view = LongPressZoom.shownView();
        // The feed lets go of the bitmap: its own view moves on and the bitmap is recycled.
        image.setImageDrawable(null);
        bitmap.recycle();
        view.draw(new Canvas(Bitmap.createBitmap(10, 10, Bitmap.Config.ARGB_8888)));
        idle();
        assertFalse(LongPressZoom.isShown());
        assertNull(view.getParent());
    }

    /** The zoom leaving the window some other way, the activity closing, forgets it. */
    @Test
    public void aZoomTakenOffTheWindowIsForgotten() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        assertEquals(1, holdAt(50f, 60f, PHOTO));
        View view = LongPressZoom.shownView();
        ((android.view.ViewGroup) view.getParent()).removeView(view);
        assertFalse(LongPressZoom.isShown());
    }

    /** #149: a held photo, then the finger lifts with Keep the zoom open on. */
    private LongPressZoom.ZoomView keptOpen() {
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        Settings.LONG_PRESS_ZOOM_STAYS_OPEN.save(true);
        assertEquals(1, holdAt(50f, 60f, PHOTO));
        touch(MotionEvent.ACTION_UP, 50f, 60f);
        idle();
        assertTrue("the lift left it up, and nothing posted closes it", LongPressZoom.isShown());
        LongPressZoom.ZoomView view = (LongPressZoom.ZoomView) LongPressZoom.shownView();
        assertTrue(view.kept);
        return view;
    }

    /** A touch on the open zoom itself, at a point in it for each finger down. */
    private static boolean onZoom(View view, int action, float... xy) {
        int fingers = xy.length / 2;
        MotionEvent.PointerProperties[] properties = new MotionEvent.PointerProperties[fingers];
        MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[fingers];
        for (int i = 0; i < fingers; i++) {
            properties[i] = new MotionEvent.PointerProperties();
            properties[i].id = i;
            properties[i].toolType = MotionEvent.TOOL_TYPE_FINGER;
            coords[i] = new MotionEvent.PointerCoords();
            coords[i].x = xy[i * 2];
            coords[i].y = xy[i * 2 + 1];
        }
        MotionEvent event = MotionEvent.obtain(0L, 0L, action, fingers, properties, coords, 0, 0, 1f, 1f, 0, 0,
                InputDevice.SOURCE_TOUCHSCREEN, 0);
        try {
            return view.dispatchTouchEvent(event);
        } finally {
            event.recycle();
        }
    }

    private static final int SECOND_DOWN = MotionEvent.ACTION_POINTER_DOWN | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT);
    private static final int SECOND_UP = MotionEvent.ACTION_POINTER_UP | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT);

    /** How wide the photo shows in the zoom. 200 in the feed. */
    private static float shownWidth(LongPressZoom.ZoomView view) {
        Rect picture = view.picture().getBounds();
        return view.mapped(picture.right, 0f)[0] - view.mapped(0f, 0f)[0];
    }

    /**
     * #149: with Keep the zoom open on, a lift and a cancel leave the zoom up. It takes the touches
     * then: one finger drags the photo, two pinch it between 1x and 4x, and a tap closes it.
     */
    @Test
    public void aKeptZoomDragsPinchesAndClosesOnATap() {
        LongPressZoom.ZoomView view = keptOpen();
        assertTrue(report(), report().contains(LongPressZoom.KEPT + " 1"));
        assertEquals("twice as big as in the feed", 400f, shownWidth(view), 0.5f);

        float far = ViewConfiguration.get(frame.getContext()).getScaledTouchSlop() * 3f;
        float[] corner = view.mapped(0f, 0f);
        assertTrue(onZoom(view, MotionEvent.ACTION_DOWN, 100f, 100f));
        onZoom(view, MotionEvent.ACTION_MOVE, 100f + far, 100f + far / 2f);
        onZoom(view, MotionEvent.ACTION_UP, 100f + far, 100f + far / 2f);
        assertTrue("a drag isn't a tap", LongPressZoom.isShown());
        assertPoint("the photo moved with the finger", corner[0] + far, corner[1] + far / 2f, view.mapped(0f, 0f));

        onZoom(view, MotionEvent.ACTION_DOWN, 100f, 100f);
        onZoom(view, SECOND_DOWN, 100f, 100f, 200f, 100f);
        onZoom(view, MotionEvent.ACTION_MOVE, 75f, 100f, 225f, 100f);
        assertEquals("half as far apart again", 3f, view.scale(), 0.01f);
        assertEquals(600f, shownWidth(view), 0.5f);
        onZoom(view, MotionEvent.ACTION_MOVE, 0f, 100f, 300f, 100f);
        assertEquals("no bigger than 4x", LongPressZoom.MOST, view.scale(), 0.01f);
        onZoom(view, MotionEvent.ACTION_MOVE, 145f, 100f, 155f, 100f);
        assertEquals("no smaller than the feed", LongPressZoom.LEAST, view.scale(), 0.01f);
        assertEquals(200f, shownWidth(view), 0.5f);
        onZoom(view, SECOND_UP, 145f, 100f, 155f, 100f);
        onZoom(view, MotionEvent.ACTION_UP, 145f, 100f);
        assertTrue("a pinch isn't a tap", LongPressZoom.isShown());

        onZoom(view, MotionEvent.ACTION_DOWN, 100f, 100f);
        onZoom(view, MotionEvent.ACTION_UP, 100f, 100f);
        assertFalse("a tap closes it", LongPressZoom.isShown());
        assertNull(view.getParent());
        assertFalse(view.kept);

        assertEquals(1, holdAt(50f, 60f, PHOTO));
        touch(MotionEvent.ACTION_CANCEL, 50f, 60f);
        assertTrue("a cancel leaves it up too", LongPressZoom.isShown());
    }

    /**
     * On a phone the tap that closes a kept zoom comes through its parent, so the zoom is the
     * parent's touch target while it's taken off and gets a cancel in the middle of that. The
     * close runs once: nothing throws, and a view the window added after the zoom stays put.
     */
    @Test
    public void aTapThroughItsParentClosesTheZoomOnce() {
        LongPressZoom.ZoomView view = keptOpen();
        android.view.ViewGroup parent = (android.view.ViewGroup) view.getParent();
        View after = new View(controller.get());
        parent.addView(after, new android.view.ViewGroup.LayoutParams(1, 1));
        idle();
        assertTrue("the zoom has a size to tap", view.getWidth() > 100 && view.getHeight() > 100);

        assertTrue(onZoom(parent, MotionEvent.ACTION_DOWN, 100f, 100f));
        onZoom(parent, MotionEvent.ACTION_UP, 100f, 100f);

        assertFalse("a tap closes it", LongPressZoom.isShown());
        assertNull(view.getParent());
        assertSame("the view after the zoom was taken off with it", parent, after.getParent());
        assertFalse(report(), report().contains(LongPressZoom.STEER));
    }

    /** With the choice off, the default, a lift closes the zoom as it always did, and a new touch on it does too. */
    @Test
    public void withoutKeepALiftOrATouchOnTheZoomClosesIt() {
        assertFalse(Settings.LONG_PRESS_ZOOM_STAYS_OPEN.get());
        Settings.LONG_PRESS_TO_ZOOM.save(true);
        assertEquals(1, holdAt(50f, 60f, PHOTO));
        onZoom(LongPressZoom.shownView(), MotionEvent.ACTION_DOWN, 10f, 10f);
        assertFalse(LongPressZoom.isShown());

        Settings.LONG_PRESS_ZOOM_STAYS_OPEN.save(true);
        assertEquals(1, holdAt(50f, 60f, PHOTO));
        LongPressZoom.ZoomView view = (LongPressZoom.ZoomView) LongPressZoom.shownView();
        onZoom(view, MotionEvent.ACTION_DOWN, 10f, 10f);
        assertTrue("the control: a second finger while the first holds keeps it, to drag", view.kept);
        touch(MotionEvent.ACTION_UP, 50f, 60f);
        assertTrue(LongPressZoom.isShown());

        Settings.LONG_PRESS_TO_ZOOM.save(false);
        touch(MotionEvent.ACTION_DOWN, 50f, 60f);
        assertEquals("with Long press to zoom off, Keep alone does nothing", 0, LongPressZoom.press(frame, media, PHOTO));
        assertFalse(LongPressZoom.isShown());
    }

    /** Back closes a kept zoom, not Instagram's page, and the focus it took goes back where it was. */
    @Test
    public void backClosesAKeptZoomAndGivesTheFocusBack() {
        View box = new View(controller.get());
        box.setFocusable(true);
        box.setFocusableInTouchMode(true);
        feed.addView(box, new FrameLayout.LayoutParams(10, 10));
        idle();
        assertTrue(box.requestFocus());

        LongPressZoom.ZoomView view = keptOpen();
        assertTrue("the zoom has the focus, so Back reaches it", view.isFocused());
        Activity activity = controller.get();
        assertTrue(activity.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_BACK)));
        assertTrue(activity.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_BACK)));
        assertFalse(LongPressZoom.isShown());
        assertFalse("Back went to the zoom, not the page", activity.isFinishing());
        assertTrue("the focus went back", box.isFocused());
    }

    /** TalkBack gets a labeled Close action on a kept zoom, and it closes it. */
    @Test
    public void aKeptZoomHasACloseActionForTalkBack() {
        LongPressZoom.ZoomView view = keptOpen();
        assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_YES, view.getImportantForAccessibility());
        assertEquals("Zoomed photo", String.valueOf(view.getContentDescription()));
        AccessibilityNodeInfo info = view.createAccessibilityNodeInfo();
        boolean close = false;
        for (AccessibilityNodeInfo.AccessibilityAction action : info.getActionList()) {
            close |= action.getId() == AccessibilityNodeInfo.ACTION_DISMISS && "Close".contentEquals(action.getLabel());
        }
        assertTrue("a Close action", close);
        assertTrue(info.isDismissable());
        assertTrue(view.performAccessibilityAction(AccessibilityNodeInfo.ACTION_DISMISS, null));
        assertFalse(LongPressZoom.isShown());
        assertNull(view.getParent());
    }

    /**
     * A kept zoom closes when a switch goes off or HushGram pauses, when Instagram goes to the
     * background, on a rotation and when the photo under it is let go of.
     */
    @Test
    public void aKeptZoomClosesWhenItsPhotoOrItsSwitchesGoAway() {
        LongPressZoom.ZoomView view = keptOpen();
        Settings.LONG_PRESS_ZOOM_STAYS_OPEN.save(false);
        assertTrue(onZoom(view, MotionEvent.ACTION_DOWN, 100f, 100f));
        assertFalse("Keep turned off", LongPressZoom.isShown());

        view = keptOpen();
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        view.dispatchWindowFocusChanged(true);
        idle();
        assertFalse("paused from the notification shade", LongPressZoom.isShown());
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();

        view = keptOpen();
        view.dispatchWindowVisibilityChanged(View.GONE);
        idle();
        assertFalse("Instagram went to the background", LongPressZoom.isShown());

        view = keptOpen();
        view.dispatchConfigurationChanged(new Configuration(view.getResources().getConfiguration()));
        idle();
        assertFalse("a rotation", LongPressZoom.isShown());

        view = keptOpen();
        image.setImageDrawable(null);
        bitmap.recycle();
        view.draw(new Canvas(Bitmap.createBitmap(10, 10, Bitmap.Config.ARGB_8888)));
        idle();
        assertFalse("the photo let go of", LongPressZoom.isShown());
        assertNull(view.getParent());
    }

    private static void assertPoint(String what, float x, float y, float[] point) {
        assertEquals(what + " x", x, point[0], 0.5f);
        assertEquals(what + " y", y, point[1], 0.5f);
    }
}

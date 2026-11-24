/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 * Modified by lavinhoque33, 2026-11-23.
 */
package app.morphe.extension.youtube.patches;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.pm.PackageInfo;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.PopupWindow;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoInformation;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 26)
public class SeekbarThumbnailPreviewTest {
    private ActivityController<Activity> activity;
    private FrameLayout player;
    private View seekbar;

    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        var packageInfo = new PackageInfo();
        packageInfo.packageName = app.getPackageName();
        packageInfo.applicationInfo = app.getApplicationInfo();
        packageInfo.versionName = "21.45.90";
        Shadows.shadowOf(app.getPackageManager()).installPackage(packageInfo);
        Utils.setContext(app);

        activity = Robolectric.buildActivity(Activity.class).setup().visible();
        player = new FrameLayout(activity.get());
        seekbar = new View(activity.get());
        player.addView(seekbar, 320, 32);
        activity.get().setContentView(player);
        activity.get().getWindow().getDecorView().layout(0, 0, 800, 480);
        player.layout(0, 0, 800, 480);
        seekbar.layout(40, 320, 360, 352);

        Settings.THUMBNAIL_PREVIEW.save(true);
        PlayerType.setFromString("WATCH_WHILE_MAXIMIZED");
        VideoInformation.setVideoLength(120_000);
    }

    @After
    public void tearDown() {
        activity.close();
        Settings.HIDE_THUMBNAIL_PREVIEW_BORDER.resetToDefault();
        Settings.THUMBNAIL_PREVIEW.save(true);
        PlayerType.setFromString("NONE");
        VideoInformation.setVideoLength(0);
    }

    @Test
    public void skipsTapsSubthresholdMovesAndIneligibleGestures() {
        assertNull(touch(seekbar, MotionEvent.ACTION_DOWN, 20, 20));
        assertNull(touch(seekbar, MotionEvent.ACTION_MOVE, 22, 20));
        assertNull(touch(seekbar, MotionEvent.ACTION_UP, 22, 20));
        assertNull(touch(seekbar, MotionEvent.ACTION_MOVE, 240, 20));

        // Swipe up is native precision seeking, not a request for an RVX thumbnail.
        assertNull(touch(seekbar, MotionEvent.ACTION_DOWN, 20, 180));
        assertNull(touch(seekbar, MotionEvent.ACTION_MOVE, 240, 20));
        assertNull(touch(seekbar, MotionEvent.ACTION_MOVE, 300, 180));

        Settings.THUMBNAIL_PREVIEW.save(false);
        assertNull(touch(seekbar, MotionEvent.ACTION_DOWN, 20, 20));
        assertNull(touch(seekbar, MotionEvent.ACTION_MOVE, 240, 20));

        Settings.THUMBNAIL_PREVIEW.save(true);
        PlayerType.setFromString("WATCH_WHILE_MINIMIZED");
        assertNull(touch(seekbar, MotionEvent.ACTION_DOWN, 20, 20));
        assertNull(touch(seekbar, MotionEvent.ACTION_MOVE, 240, 20));
    }

    @Test
    public void doesNotMixRecipientsSharingTheSameDownTime() {
        assertNull(touch(player, MotionEvent.ACTION_DOWN, 20, 20));
        assertNull(touch(seekbar, MotionEvent.ACTION_DOWN, 200, 20));
        assertNull(touch(player, MotionEvent.ACTION_MOVE, 400, 20));
        assertNull(touch(seekbar, MotionEvent.ACTION_MOVE, 202, 20));
        assertNotNull(touch(seekbar, MotionEvent.ACTION_MOVE, 380, 20));
        assertNull(touch(player, MotionEvent.ACTION_CANCEL, 380, 20));
        assertNotNull(touch(seekbar, MotionEvent.ACTION_MOVE, 400, 20));
        assertNull(touch(seekbar, MotionEvent.ACTION_CANCEL, 400, 20));
    }

    @Test
    public void firstSlidePreviewReadsFreshBoundsFromPointWriter() throws Exception {
        assertNull(touch(player, MotionEvent.ACTION_DOWN, 20, 20));
        seekbar.layout(200, 320, 600, 352);
        Point point = touch(player, MotionEvent.ACTION_MOVE, 300, 20);
        complete(player, seekbar, point, 400, 330);
        assertEquals("01:00 / 02:00", timestamp().getText().toString());
        assertFalse(popup().isShowing());

        // A newly available storyboard can show at the same X, using the updated live bounds.
        seekbar.layout(300, 320, 700, 352);
        supplyBitmap();
        Point next = touch(player, MotionEvent.ACTION_MOVE, 300, 20);
        assertSame(point, next);
        complete(player, seekbar, next, 400, 330);
        assertTrue(popup().isShowing());
        assertEquals("00:30 / 02:00", timestamp().getText().toString());
    }

    @Test
    public void inactiveSlideProxyCannotReusePriorPointOrOwner() throws Exception {
        assertNull(touch(player, MotionEvent.ACTION_DOWN, 20, 20));
        supplyBitmap();
        Point point = touch(player, MotionEvent.ACTION_MOVE, 280, 20);
        complete(player, seekbar, point, 200, 330);
        assertTrue(popup().isShowing());

        Point next = touch(player, MotionEvent.ACTION_MOVE, 300, 20);
        assertSame(point, next);
        assertEquals(0, next.x);
        assertEquals(0, next.y);
        SeekbarThumbnailPreviewPatch.bindThumbnailCoordinates(seekbar, new Point(300, 330));
        SeekbarThumbnailPreviewPatch.updateThumbnailPreview(player, next);
        assertFalse(popup().isShowing());
        assertEquals(View.GONE, timestamp().getVisibility());
        assertNull(touch(player, MotionEvent.ACTION_MOVE, 360, 20));
    }

    @Test
    public void cancelDismissAndDetachRetireGestureOwners() throws Exception {
        showDirectPreview();
        assertNull(touch(seekbar, MotionEvent.ACTION_CANCEL, 240, 20));
        assertFalse(popup().isShowing());
        assertNull(touch(seekbar, MotionEvent.ACTION_MOVE, 260, 20));

        showDirectPreview();
        popup().dismiss();
        assertNull(touch(seekbar, MotionEvent.ACTION_MOVE, 260, 20));

        showDirectPreview();
        player.removeView(seekbar);
        assertFalse(popup().isShowing());
        assertNull(touch(seekbar, MotionEvent.ACTION_MOVE, 260, 20));

        var replacement = new View(activity.get());
        player.addView(replacement, 600, 32);
        replacement.layout(0, 320, 600, 352);
        assertNull(touch(replacement, MotionEvent.ACTION_DOWN, 20, 20));
        supplyBitmap();
        complete(replacement, replacement, touch(replacement, MotionEvent.ACTION_MOVE, 240, 20), 200, 330);
        assertEquals("00:40 / 02:00", timestamp().getText().toString());
        assertNull(touch(replacement, MotionEvent.ACTION_UP, 240, 20));
        assertFalse(popup().isShowing());
    }

    @Test
    public void hidesAndRestoresBorderWithoutMovingThumbnail() throws Exception {
        showDirectPreview();
        var frame = (FrameLayout) previewView("previewFrame");
        var thumbnail = (View) previewView("thumbnailPreview");
        var borderedBounds = thumbnailBounds(frame, thumbnail);
        assertEquals(255, frame.getBackground().getAlpha());
        assertNull(touch(seekbar, MotionEvent.ACTION_UP, 240, 20));

        Settings.HIDE_THUMBNAIL_PREVIEW_BORDER.save(true);
        showDirectPreview();
        assertSame(frame, previewView("previewFrame"));
        assertEquals(0, frame.getBackground().getAlpha());
        assertEquals(borderedBounds, thumbnailBounds(frame, thumbnail));
        assertNull(touch(seekbar, MotionEvent.ACTION_UP, 240, 20));

        Settings.HIDE_THUMBNAIL_PREVIEW_BORDER.save(false);
        showDirectPreview();
        assertEquals(255, frame.getBackground().getAlpha());
        assertEquals(borderedBounds, thumbnailBounds(frame, thumbnail));
    }

    private static Rect thumbnailBounds(FrameLayout frame, View thumbnail) {
        var params = frame.getLayoutParams();
        frame.measure(
                View.MeasureSpec.makeMeasureSpec(params.width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(params.height, View.MeasureSpec.EXACTLY)
        );
        frame.layout(0, 0, params.width, params.height);

        return new Rect(thumbnail.getLeft(), thumbnail.getTop(), thumbnail.getRight(), thumbnail.getBottom());
    }

    private void showDirectPreview() throws Exception {
        assertNull(touch(seekbar, MotionEvent.ACTION_DOWN, 20, 20));
        supplyBitmap();
        complete(seekbar, seekbar, touch(seekbar, MotionEvent.ACTION_MOVE, 240, 20), 200, 330);
        assertTrue(popup().isShowing());
    }

    private static void supplyBitmap() {
        SeekbarThumbnailPreviewPatch.setFineScrubbingPreviewBitmap(Bitmap.createBitmap(160, 90, Bitmap.Config.ARGB_8888));
    }

    private static Point touch(View anchor, int action, float x, float y) {
        MotionEvent event = MotionEvent.obtain(10, 20, action, x, y, 0);
        try {
            return SeekbarThumbnailPreviewPatch.prepareThumbnailPreview(anchor, event);
        } finally {
            event.recycle();
        }
    }

    private static void complete(View anchor, View writer, Point point, int x, int y) {
        assertNotNull(point);
        SeekbarThumbnailPreviewPatch.bindThumbnailCoordinates(writer, point);
        point.set(x, y);
        SeekbarThumbnailPreviewPatch.updateThumbnailPreview(anchor, point);
    }

    private static PopupWindow popup() throws Exception {
        return (PopupWindow) previewView("thumbnailPreviewPopup");
    }

    private static TextView timestamp() throws Exception {
        return (TextView) previewView("timestampPreview");
    }

    private static Object previewView(String accessor) throws Exception {
        var field = SeekbarThumbnailPreviewPatch.class.getDeclaredField("seekbarViews");
        field.setAccessible(true);
        var views = field.get(null);
        assertNotNull(views);
        var method = views.getClass().getDeclaredMethod(accessor);
        method.setAccessible(true);
        return method.invoke(views);
    }
}

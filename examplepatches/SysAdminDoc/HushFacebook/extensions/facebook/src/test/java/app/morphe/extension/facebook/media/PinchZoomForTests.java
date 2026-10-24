/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;

import org.robolectric.Robolectric;

/** Pinches a photo on a profile the way Android hands the hook a second finger. */
public final class PinchZoomForTests {
    private PinchZoomForTests() {
    }

    /** Whether two fingers landing on a profile's photo started a zoom. */
    public static boolean zoomsAPhoto() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        FrameLayout content = new FrameLayout(activity);
        ImageView photo = new ImageView(activity);
        photo.setImageDrawable(new ColorDrawable(Color.RED));
        content.addView(photo, new FrameLayout.LayoutParams(600, 600));
        activity.setContentView(content);
        View decor = activity.getWindow().getDecorView();
        decor.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, 1080, 1920);
        PinchZoom.resetForTests();
        PinchZoom.profile(content);
        PinchZoom.snapshots = (screen, target, area, done) ->
                done.accept(Bitmap.createBitmap(area.width(), area.height(), Bitmap.Config.ARGB_8888));
        try {
            PinchZoom.touch(activity, event(MotionEvent.ACTION_DOWN, new float[][] {{250, 300}}));
            PinchZoom.touch(activity, event(MotionEvent.ACTION_POINTER_DOWN | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT),
                    new float[][] {{250, 300}, {350, 300}}));
            return PinchZoom.zoom() != null;
        } finally {
            PinchZoom.resetForTests();
        }
    }

    private static MotionEvent event(int action, float[][] points) {
        int count = points.length;
        MotionEvent.PointerProperties[] properties = new MotionEvent.PointerProperties[count];
        MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[count];
        for (int i = 0; i < count; i++) {
            properties[i] = new MotionEvent.PointerProperties();
            properties[i].id = i;
            properties[i].toolType = MotionEvent.TOOL_TYPE_FINGER;
            coords[i] = new MotionEvent.PointerCoords();
            coords[i].x = points[i][0];
            coords[i].y = points[i][1];
            coords[i].pressure = 1f;
            coords[i].size = 1f;
        }
        long now = SystemClock.uptimeMillis();
        return MotionEvent.obtain(now, now, action, count, properties, coords, 0, 0, 1f, 1f, 0, 0, 0, 0);
    }
}

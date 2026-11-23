/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-22.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.player;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.VectorDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.TouchDelegate;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;

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
import org.robolectric.annotation.GraphicsMode;

import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34, qualifiers = "mdpi")
public class CenterPlaybackButtonPatchTest {
    private static final int CENTER_BUTTON = 101;
    private static final int CENTER_AREA = 102;
    private static final int PREVIOUS = 103;
    private static final int NEXT = 104;
    private static final int ROUNDED_PLAY = 0x7f080123;
    private static final int STOCK_REPLAY = 0x7f080124;
    private static final int VECTOR_REPLAY = 0x7f080125;
    private static final int ROUNDED_PLAY_BITMAP = 0x7f080126;
    private static final int STOCK_ICON_SIZE = 24;

    private ActivityController<Activity> activity;
    private Context context;
    private RelativeLayout controls;
    private FrameLayout center;
    private ImageView icon;
    private View previous;
    private View next;
    private int controlLookups;
    private final Drawable stockReplay = new ColorDrawable(Color.WHITE);
    private final Drawable vectorReplay = new ColorDrawable(Color.WHITE);

    @SuppressWarnings("deprecation")
    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        var info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.applicationInfo = app.getApplicationInfo();
        info.versionName = "21.45.90";
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);

        var resources = app.getResources();
        var indexed = new Resources(resources.getAssets(), resources.getDisplayMetrics(),
                resources.getConfiguration()) {
            @Override
            public Drawable getDrawable(int id, Theme theme) {
                return switch (id) {
                    case ROUNDED_PLAY -> new RoundedPlayDrawable();
                    case ROUNDED_PLAY_BITMAP -> new BitmapDrawable(this, rasterize(
                            new RoundedPlayDrawable(), STOCK_ICON_SIZE));
                    case STOCK_REPLAY -> stockReplay;
                    case VECTOR_REPLAY -> vectorReplay;
                    default -> super.getDrawable(id, theme);
                };
            }

            @Override
            public String getResourceEntryName(int id) {
                return switch (id) {
                    case ROUNDED_PLAY -> "yt_fill_experimental_play_vd_theme_24";
                    case ROUNDED_PLAY_BITMAP -> "yt_fill_experimental_play_black_24";
                    default -> super.getResourceEntryName(id);
                };
            }

            @Override
            public int getIdentifier(String name, String type, String pkg) {
                if ("morphe_center_replay_selector".equals(name)) return VECTOR_REPLAY;
                if ("yt_fill_experimental_play_vd_theme_24".equals(name)) return ROUNDED_PLAY;
                if ("id".equals(type)) {
                    if ("player_control_play_pause_replay_button".equals(name)) {
                        controlLookups++;
                        return CENTER_BUTTON;
                    }
                    if ("player_control_play_pause_replay_button_touch_area".equals(name)) {
                        controlLookups++;
                        return CENTER_AREA;
                    }
                }
                return super.getIdentifier(name, type, pkg);
            }
        };
        context = new ContextWrapper(app) {
            @Override
            public Resources getResources() {
                return indexed;
            }
        };
        Utils.setContext(context);
        Settings.CENTER_PLAYBACK_BUTTON_SIZE.resetToDefault();

        controls = new RelativeLayout(context);
        activity = Robolectric.buildActivity(Activity.class).setup().visible();
        var host = new FrameLayout(context);
        activity.get().setContentView(host);
        host.addView(controls, new FrameLayout.LayoutParams(-1, 80));
        center = new FrameLayout(context);
        center.setId(CENTER_AREA);
        var centerParams = new RelativeLayout.LayoutParams(80, 80);
        centerParams.addRule(RelativeLayout.CENTER_IN_PARENT);
        controls.addView(center, centerParams);

        icon = new ImageView(context);
        icon.setId(CENTER_BUTTON);
        icon.setImageDrawable(new ColorDrawable(Color.WHITE));
        icon.setContentDescription("Play video");
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
        icon.setPadding(8, 8, 8, 8);
        center.addView(icon, new FrameLayout.LayoutParams(56, 56, Gravity.CENTER));

        // Native wrappers use the center wrapper as the anchor on both sides.
        var back = addNeighbor(105, RelativeLayout.LEFT_OF, CENTER_AREA);
        var forward = addNeighbor(106, RelativeLayout.RIGHT_OF, CENTER_AREA);
        previous = addNeighbor(PREVIOUS, RelativeLayout.LEFT_OF, back.getId());
        next = addNeighbor(NEXT, RelativeLayout.RIGHT_OF, forward.getId());
    }

    @After
    public void tearDown() {
        activity.close();
    }

    @Test
    public void stockMakesNoLookupsAndChangesNoNativeProperties() {
        var nativeDelegate = new TouchDelegate(new Rect(0, 0, 80, 80), icon);
        center.setTouchDelegate(nativeDelegate);
        var drawable = icon.getDrawable();
        icon.setVisibility(View.INVISIBLE);

        CenterPlaybackButtonPatch.resize(controls);
        layout(320);

        assertEquals(0, controlLookups);
        assertEquals(56, icon.getWidth());
        assertEquals(80, center.getWidth());
        assertEquals(80, controls.getHeight());
        assertEquals(8, icon.getPaddingLeft());
        assertEquals(View.INVISIBLE, icon.getVisibility());
        assertSame(drawable, icon.getDrawable());
        assertSame(nativeDelegate, center.getTouchDelegate());
    }

    @Test
    public void growthResizesTheRealHitAreaAndKeepsNeighborsClickableAfterRotation() {
        var centerClicks = new AtomicInteger();
        var nextClicks = new AtomicInteger();
        icon.setOnClickListener(view -> centerClicks.incrementAndGet());
        next.setOnClickListener(view -> nextClicks.incrementAndGet());
        var nativeDelegate = new TouchDelegate(new Rect(-80, -80, 160, 160), icon);
        center.setTouchDelegate(nativeDelegate);
        var drawable = icon.getDrawable();

        Settings.CENTER_PLAYBACK_BUTTON_SIZE.save(500); // Imported values cannot exceed the slider cap.
        CenterPlaybackButtonPatch.resize(controls);
        for (int width : new int[] {320, 720}) {
            layout(width);
            assertEquals(width / 2, midpoint(center));
            assertEquals(96, center.getWidth());
            assertEquals(96, center.getHeight());
            assertEquals(67, icon.getWidth());
            assertEquals(10, icon.getPaddingLeft());
            assertEquals(48, previous.getWidth());
            assertEquals(48, next.getWidth());
            assertTrue(previous.getLeft() >= 0);
            assertTrue(next.getRight() <= width);
            tap(center.getLeft() + 2, center.getHeight() / 2); // Outside the icon but inside the wrapper.
            tap(midpoint(next), center.getHeight() / 2);
        }
        assertEquals(2, centerClicks.get());
        assertEquals(2, nextClicks.get());
        assertEquals("Play video", icon.getContentDescription());
        assertEquals(ImageView.ScaleType.FIT_CENTER, icon.getScaleType());
        assertSame(drawable, icon.getDrawable());
        assertSame(nativeDelegate, center.getTouchDelegate());
    }

    @Test
    public void shrinkKeepsA48DpTouchAreaWithoutChangingNativeVisibilityOrRowHeight() {
        Settings.CENTER_PLAYBACK_BUTTON_SIZE.save(10);
        icon.setVisibility(View.INVISIBLE);
        CenterPlaybackButtonPatch.resize(controls);
        layout(320);

        assertEquals(34, icon.getLayoutParams().width);
        assertEquals(48, center.getWidth());
        assertEquals(48, center.getHeight());
        assertEquals(80, controls.getHeight());
        assertEquals(View.INVISIBLE, icon.getVisibility());
    }

    @Test
    public void unrelatedGroupWithMissingNativeIconRemainsUnchanged() {
        center.removeView(icon);
        Settings.CENTER_PLAYBACK_BUTTON_SIZE.save(120);
        CenterPlaybackButtonPatch.resize(controls);
        layout(320);

        assertEquals(80, center.getWidth());
        assertEquals(80, controls.getHeight());
    }

    @Test
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void roundedPlayAt120PercentRastersAtFinalBoundsInsteadOfUpscaling() {
        // YouTube's shadow renderer draws at intrinsic bounds. Its output subsequently goes to FIT_CENTER.
        var resources = icon.getResources();
        Drawable stock = CenterPlaybackButtonPatch.loadShadowSource(resources, ROUNDED_PLAY, null, icon);
        assertEquals(STOCK_ICON_SIZE, stock.getIntrinsicWidth());
        assertSame(stockReplay, CenterPlaybackButtonPatch.loadReplay(context, STOCK_REPLAY, icon));

        Settings.CENTER_PLAYBACK_BUTTON_SIZE.save(120);
        CenterPlaybackButtonPatch.resize(controls);
        layout(720);
        int viewport = icon.getWidth() - icon.getPaddingLeft() - icon.getPaddingRight();
        assertEquals(47, viewport);
        Drawable resized = CenterPlaybackButtonPatch.loadShadowSource(resources, ROUNDED_PLAY, null, icon);
        assertEquals(viewport, resized.getIntrinsicWidth());
        assertEquals(viewport, resized.getIntrinsicHeight());
        Drawable resizedBitmapVariant = CenterPlaybackButtonPatch.loadShadowSource(
                resources, ROUNDED_PLAY_BITMAP, null, icon);
        assertEquals(viewport, resizedBitmapVariant.getIntrinsicWidth());
        assertSame(vectorReplay, CenterPlaybackButtonPatch.loadReplay(context, STOCK_REPLAY, icon));

        var unrelatedIcon = new ImageView(context);
        assertEquals(STOCK_ICON_SIZE,
                CenterPlaybackButtonPatch.loadShadowSource(resources, ROUNDED_PLAY, null, unrelatedIcon)
                        .getIntrinsicWidth());
        assertSame(stockReplay, CenterPlaybackButtonPatch.loadReplay(context, STOCK_REPLAY, unrelatedIcon));

        Bitmap baseline = Bitmap.createScaledBitmap(rasterize(stock, STOCK_ICON_SIZE), viewport, viewport, true);
        Bitmap actual = rasterize(resized, viewport);
        Bitmap reference = rasterize(new RoundedPlayDrawable(), viewport);
        assertTrue(actual.sameAs(reference));
        assertTrue(rasterize(resizedBitmapVariant, viewport).sameAs(reference));

        int baselineEdgePixels = countPartialAlpha(baseline);
        int actualEdgePixels = countPartialAlpha(actual);
        assertTrue("Final-size vector edge pixels: " + actualEdgePixels
                + "; scaled bitmap edge pixels: " + baselineEdgePixels, actualEdgePixels < baselineEdgePixels);
    }

    private static Bitmap rasterize(Drawable drawable, int size) {
        var bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        drawable.setBounds(0, 0, size, size);
        drawable.draw(new Canvas(bitmap));
        return bitmap;
    }

    private static int countPartialAlpha(Bitmap bitmap) {
        int count = 0;
        for (int y = 0; y < bitmap.getHeight(); y++) {
            for (int x = 0; x < bitmap.getWidth(); x++) {
                int alpha = Color.alpha(bitmap.getPixel(x, y));
                if (alpha > 0 && alpha < 255) count++;
            }
        }
        return count;
    }

    /** Path and viewport of stock 21.45.90's yt_fill_experimental_play_vd_theme_24. */
    private static final class RoundedPlayDrawable extends VectorDrawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        RoundedPlayDrawable() {
            paint.setColor(Color.WHITE);
            path.moveTo(5f, 4.623f);
            path.lineTo(5f, 19.38f);
            path.arcTo(5f, 17.877f, 8f, 20.877f, 179.877f, -120.32f, false);
            path.lineTo(22f, 12f);
            path.lineTo(7.26f, 3.33f);
            path.arcTo(5f, 3.123f, 8f, 6.123f, -59.558f, -120.434f, false);
            path.close();
        }

        @Override
        public int getIntrinsicWidth() {
            return STOCK_ICON_SIZE;
        }

        @Override
        public int getIntrinsicHeight() {
            return STOCK_ICON_SIZE;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            int save = canvas.save();
            canvas.translate(bounds.left, bounds.top);
            canvas.scale((float) bounds.width() / STOCK_ICON_SIZE, (float) bounds.height() / STOCK_ICON_SIZE);
            canvas.drawPath(path, paint);
            canvas.restoreToCount(save);
        }
    }

    private View addNeighbor(int id, int rule, int anchor) {
        var view = new FrameLayout(context);
        view.setId(id);
        var params = new RelativeLayout.LayoutParams(48, 48);
        params.addRule(rule, anchor);
        params.addRule(RelativeLayout.CENTER_VERTICAL);
        controls.addView(view, params);
        return view;
    }

    private void layout(int width) {
        int height = controls.getLayoutParams().height;
        controls.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        controls.layout(0, 0, width, height);
    }

    private static int midpoint(View view) {
        return view.getLeft() + view.getWidth() / 2;
    }

    private void tap(int x, int y) {
        var down = MotionEvent.obtain(0, 0, MotionEvent.ACTION_DOWN, x, y, 0);
        var up = MotionEvent.obtain(0, 20, MotionEvent.ACTION_UP, x, y, 0);
        controls.dispatchTouchEvent(down);
        controls.dispatchTouchEvent(up);
        down.recycle();
        up.recycle();
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
    }
}

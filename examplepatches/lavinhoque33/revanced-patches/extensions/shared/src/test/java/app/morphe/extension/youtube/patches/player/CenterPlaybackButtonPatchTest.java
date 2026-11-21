/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.player;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
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
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

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

    private ActivityController<Activity> activity;
    private Context context;
    private RelativeLayout controls;
    private FrameLayout center;
    private ImageView icon;
    private View previous;
    private View next;
    private int controlLookups;

    @SuppressWarnings("deprecation")
    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        var resources = app.getResources();
        var indexed = new Resources(resources.getAssets(), resources.getDisplayMetrics(),
                resources.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String type, String pkg) {
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

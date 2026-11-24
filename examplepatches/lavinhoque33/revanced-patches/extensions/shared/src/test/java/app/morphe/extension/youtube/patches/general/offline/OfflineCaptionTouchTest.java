/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.os.SystemClock;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
public class OfflineCaptionTouchTest {
    private static final int PLAYER_WIDTH = 400;

    private FrameLayout player;
    private OfflineSubtitleOverlay.CaptionTextView caption;

    @Before
    public void setUp() {
        Activity activity = Robolectric.buildActivity(Activity.class).get();
        player = new FrameLayout(activity);
        caption = new OfflineSubtitleOverlay.CaptionTextView(activity);
        caption.setText("An offline caption across both sides of the player");
        caption.setTextIsSelectable(true); // Match the flags a host theme can enable.
        assertTrue(caption.isClickable());
        player.addView(caption, new FrameLayout.LayoutParams(280, 60));
        player.measure(View.MeasureSpec.makeMeasureSpec(PLAYER_WIDTH, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(220, View.MeasureSpec.EXACTLY));
        player.layout(0, 0, PLAYER_WIDTH, 220);
        caption.layout(60, 140, 340, 200);
    }

    @Test
    public void doubleTapOnLeftCaptionReachesPlayer() {
        assertCaptionDoubleTap(100, false);
    }

    @Test
    public void doubleTapOnRightCaptionReachesPlayer() {
        assertCaptionDoubleTap(300, true);
    }

    @Test
    public void swipeStartingOnCaptionReachesPlayer() {
        List<Integer> actions = new ArrayList<>();
        player.setOnTouchListener((view, event) -> {
            actions.add(event.getActionMasked());
            return true;
        });

        long start = SystemClock.uptimeMillis();
        send(start, start, MotionEvent.ACTION_DOWN, 100, 170);
        send(start, start + 30, MotionEvent.ACTION_MOVE, 160, 170);
        send(start, start + 60, MotionEvent.ACTION_UP, 220, 170);

        assertEquals(List.of(MotionEvent.ACTION_DOWN, MotionEvent.ACTION_MOVE, MotionEvent.ACTION_UP), actions);
    }

    private void assertCaptionDoubleTap(int x, boolean forward) {
        List<Boolean> seeks = new ArrayList<>();
        GestureDetector detector = new GestureDetector(player.getContext(),
                new GestureDetector.SimpleOnGestureListener() {
                    @Override
                    public boolean onDown(MotionEvent event) {
                        return true;
                    }

                    @Override
                    public boolean onDoubleTapEvent(MotionEvent event) {
                        if (event.getActionMasked() == MotionEvent.ACTION_UP) {
                            seeks.add(event.getX() > player.getWidth() / 2f);
                        }
                        return true;
                    }
                });
        player.setOnTouchListener((view, event) -> detector.onTouchEvent(event));

        long start = SystemClock.uptimeMillis();
        send(start, start, MotionEvent.ACTION_DOWN, x, 170);
        send(start, start + 20, MotionEvent.ACTION_UP, x, 170);
        send(start + 80, start + 80, MotionEvent.ACTION_DOWN, x, 170);
        send(start + 80, start + 100, MotionEvent.ACTION_UP, x, 170);

        assertEquals(List.of(forward), seeks);
    }

    private void send(long downTime, long eventTime, int action, int x, int y) {
        if (action == MotionEvent.ACTION_DOWN) {
            assertTrue(x >= caption.getLeft() && x < caption.getRight()
                    && y >= caption.getTop() && y < caption.getBottom());
        }
        MotionEvent event = MotionEvent.obtain(downTime, eventTime, action, x, y, 0);
        try {
            player.dispatchTouchEvent(event);
        } finally {
            event.recycle();
        }
    }
}

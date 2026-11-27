package org.ungoogled.car;

import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;

/**
 * Android Auto hands a Car App Library app gestures (click, scroll, scale), not touches. This turns them
 * back into touchscreen events for Maps' car UI: a click is a tap, a scroll a one-finger drag, a scale a
 * two-finger pinch. Coordinates are those of Maps' car display.
 */
final class MapsTouch {
    /** A gesture with no news for this long has ended: the finger lifts. */
    private static final long IDLE_MS = 120;
    private static final long TAP_MS = 40;
    private static final float START_SPAN = 200f;

    /** Where the touches go. The event is only valid during the call. */
    interface Target {
        void send(MotionEvent event);
    }

    /**
     * Where a drag happens. A scroll does not say where the finger is, so the drag is made in the part of the UI
     * the scroll most likely means (a list, or the map): [dx], [dy] are its first step.
     */
    interface DragArea {
        Rect find(float dx, float dy);
    }

    private final Handler main = new Handler(Looper.getMainLooper());
    private final Target target;
    private final DragArea dragArea;
    private int width, height;

    private boolean dragging, pinching;
    private long downTime;
    private final Rect bounds = new Rect();   // of the drag
    private float x, y;          // one finger
    private float focusX, focusY, span;    // two fingers
    private final Runnable idle = this::end;

    MapsTouch(Target target, DragArea dragArea) {
        this.target = target;
        this.dragArea = dragArea;
    }

    void size(int width, int height) {
        this.width = width;
        this.height = height;
    }

    void click(float cx, float cy) {
        end();
        long down = SystemClock.uptimeMillis();
        send(down, down, MotionEvent.ACTION_DOWN, cx, cy);
        main.postDelayed(() -> send(down, SystemClock.uptimeMillis(), MotionEvent.ACTION_UP, cx, cy), TAP_MS);
    }

    /** [dx], [dy]: how far the content moved since the last call, as GestureDetector.onScroll gives it. */
    void scroll(float dx, float dy) {
        if (pinching) end();
        main.removeCallbacks(idle);
        long now = SystemClock.uptimeMillis();
        if (!dragging) {
            dragging = true;
            Rect area = dragArea.find(dx, dy);
            if (area == null || area.isEmpty()) bounds.set(0, 0, width, height);
            else bounds.set(area);
            downTime = now;
            x = bounds.exactCenterX();
            y = bounds.exactCenterY();
            send(downTime, now, MotionEvent.ACTION_DOWN, x, y);
        }
        x -= dx;
        y -= dy;
        // Near an edge: lift and start again from the middle, so a long drag does not leave the area.
        float marginX = bounds.width() * 0.1f, marginY = bounds.height() * 0.1f;
        if (x < bounds.left + marginX || x > bounds.right - marginX
                || y < bounds.top + marginY || y > bounds.bottom - marginY) {
            send(downTime, now, MotionEvent.ACTION_UP, x, y);
            downTime = now;
            x = bounds.exactCenterX();
            y = bounds.exactCenterY();
            send(downTime, now, MotionEvent.ACTION_DOWN, x, y);
        } else {
            send(downTime, now, MotionEvent.ACTION_MOVE, x, y);
        }
        main.postDelayed(idle, IDLE_MS);
    }

    /** [factor] above 1 zooms in. */
    void scale(float fx, float fy, float factor) {
        if (dragging) end();
        main.removeCallbacks(idle);
        long now = SystemClock.uptimeMillis();
        float limit = Math.min(width, height) * 0.45f;
        if (pinching && (span * factor < 30f || span * factor > limit)) {
            // The fingers cannot spread or close any further: lift and start again.
            sendPinch(MotionEvent.ACTION_CANCEL, now);
            pinching = false;
        }
        if (!pinching) {
            pinching = true;
            downTime = now;
            span = START_SPAN;
            focusX = fx;
            focusY = fy;
            sendPinch(MotionEvent.ACTION_DOWN, now);
            sendPinch(MotionEvent.ACTION_POINTER_DOWN | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT), now);
        }
        span = Math.max(30f, Math.min(limit, span * factor));
        focusX = fx;
        focusY = fy;
        sendPinch(MotionEvent.ACTION_MOVE, now);
        main.postDelayed(idle, IDLE_MS);
    }

    /** Lifts every finger. */
    void end() {
        main.removeCallbacks(idle);
        long now = SystemClock.uptimeMillis();
        if (dragging) {
            dragging = false;
            send(downTime, now, MotionEvent.ACTION_UP, x, y);
        }
        if (pinching) {
            pinching = false;
            sendPinch(MotionEvent.ACTION_POINTER_UP | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT), now);
            sendPinch(MotionEvent.ACTION_UP, now);
        }
    }

    private void send(long down, long now, int action, float px, float py) {
        MotionEvent event = MotionEvent.obtain(down, now, action, px, py, 0);
        event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try {
            target.send(event);
        } finally {
            event.recycle();
        }
    }

    private void sendPinch(int action, long now) {
        // Pointer 1 is not down yet at the first DOWN, nor after the POINTER_UP.
        int actionMasked = action & MotionEvent.ACTION_MASK;
        int count = actionMasked == MotionEvent.ACTION_DOWN || actionMasked == MotionEvent.ACTION_UP ? 1 : 2;
        MotionEvent.PointerProperties[] properties = new MotionEvent.PointerProperties[count];
        MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[count];
        for (int i = 0; i < count; i++) {
            properties[i] = new MotionEvent.PointerProperties();
            properties[i].id = i;
            properties[i].toolType = MotionEvent.TOOL_TYPE_FINGER;
            coords[i] = new MotionEvent.PointerCoords();
            coords[i].x = focusX + (i == 0 ? -span : span);
            coords[i].y = focusY;
            coords[i].pressure = 1f;
            coords[i].size = 1f;
        }
        MotionEvent event = MotionEvent.obtain(downTime, now, action, count, properties, coords,
                0, 0, 1f, 1f, 0, 0, InputDevice.SOURCE_TOUCHSCREEN, 0);
        try {
            target.send(event);
        } finally {
            event.recycle();
        }
    }
}

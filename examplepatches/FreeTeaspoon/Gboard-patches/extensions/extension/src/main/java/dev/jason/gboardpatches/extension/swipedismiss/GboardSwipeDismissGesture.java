package dev.jason.gboardpatches.extension.swipedismiss;

public final class GboardSwipeDismissGesture {
    public static final float DISTANCE_DP = 48f;
    public static final float DIRECTION_RATIO = 1.2f;
    public static final long DEFAULT_LONG_PRESS_TIMEOUT_MS = 300L;
    public static final long MAX_SWIPE_DURATION_MS = 500L;

    private int pointerId = -1;
    private float downX;
    private float downY;
    private long downTime;
    private boolean hasLeftTouchSlop;
    private boolean consumed;

    public static boolean isHeaderStart(float x, float y, int left, int top,
            int right, int bottom) {
        return right > left && bottom > top
                && x >= left && x < right && y >= top && y < bottom;
    }

    public void begin(boolean admitted, int id, float x, float y) {
        begin(admitted, id, x, y, 0L);
    }

    public void begin(boolean admitted, int id, float x, float y, long downTime) {
        reset();
        if (admitted && id >= 0) {
            pointerId = id;
            downX = x;
            downY = y;
            this.downTime = downTime;
        }
    }

    public boolean move(int id, float x, float y, float density, float touchSlop) {
        return move(id, x, y, density, touchSlop, 0L, Long.MAX_VALUE);
    }

    public boolean move(int id, float x, float y, float density, float touchSlop,
            long eventTime, long longPressTimeout) {
        if (id != pointerId || consumed) {
            return false;
        }

        float dx = Math.abs(x - downX);
        float dy = y - downY;
        float safeTouchSlop = Math.max(touchSlop, 0f);

        // 1. Disqualify upward movement past touch slop (e.g. dragging a candidate to delete target).
        if (dy < -safeTouchSlop) {
            reset();
            return false;
        }

        // 2. Disqualify predominantly horizontal movement past touch slop (e.g. candidate scroll).
        if (dx > safeTouchSlop && dx > dy) {
            reset();
            return false;
        }

        // 3. Time-based long press and slow drag disqualification:
        if (eventTime > 0L && downTime > 0L && eventTime >= downTime) {
            long elapsed = eventTime - downTime;
            long effectiveTimeout = longPressTimeout > 0L
                    ? Math.min(longPressTimeout, DEFAULT_LONG_PRESS_TIMEOUT_MS)
                    : DEFAULT_LONG_PRESS_TIMEOUT_MS;

            // If the gesture lingers past max swipe duration, disqualify as a slow drag/scroll.
            if (elapsed > MAX_SWIPE_DURATION_MS) {
                reset();
                return false;
            }

            boolean withinSlop = (dx <= safeTouchSlop && Math.abs(dy) <= safeTouchSlop);
            if (withinSlop) {
                // If stationary within touch slop past long press timeout,
                // a long press was triggered in the underlying view (e.g. toolbar reorder / candidate delete).
                if (elapsed >= effectiveTimeout) {
                    reset();
                    return false;
                }
            } else if (!hasLeftTouchSlop) {
                // First movement outside touch slop: if it took longer than long-press timeout to begin moving,
                // the view already triggered a long press before the drag started.
                if (elapsed >= effectiveTimeout) {
                    reset();
                    return false;
                }
                hasLeftTouchSlop = true;
            }
        }

        float safeDensity = density > 0f ? density : 1f;
        float activationDistance = DISTANCE_DP * safeDensity;

        if (dy >= activationDistance && dy >= dx * DIRECTION_RATIO) {
            consumed = true;
            return true;
        }
        return false;
    }

    public boolean isConsumed() {
        return consumed;
    }

    public boolean isTracking() {
        return pointerId >= 0;
    }

    public void reset() {
        pointerId = -1;
        downTime = 0L;
        hasLeftTouchSlop = false;
        consumed = false;
    }
}

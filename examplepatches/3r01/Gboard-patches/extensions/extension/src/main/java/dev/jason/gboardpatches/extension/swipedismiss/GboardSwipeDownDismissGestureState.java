package dev.jason.gboardpatches.extension.swipedismiss;

final class GboardSwipeDownDismissGestureState {
    static final float TRIGGER_DISTANCE_DP = 48f;
    static final float DIRECTION_RATIO = 1.2f;

    private boolean tracking;
    private boolean consumed;
    private float startX;
    private float startY;
    private long longPressDeadline;
    private float touchSlop;
    private boolean moving;

    static boolean isHeaderStart(float x, float y, int left, int top, int width, int height) {
        return width > 0 && height > 0
                && x >= left && x < left + width && y >= top && y < top + height;
    }

    void begin(boolean inHeader, float x, float y, long eventTime,
            float touchSlop, int longPressTimeout) {
        tracking = inHeader;
        consumed = false;
        startX = x;
        startY = y;
        longPressDeadline = eventTime + longPressTimeout;
        this.touchSlop = touchSlop;
        moving = false;
    }

    boolean move(float x, float y, float density, long eventTime) {
        if (!tracking || consumed) {
            return false;
        }
        float dx = x - startX;
        float dy = y - startY;
        float horizontal = Math.abs(dx);
        float safeDensity = density > 0f ? density : 1f;
        if (!moving && eventTime >= longPressDeadline) {
            tracking = false;
            return false;
        }
        if (dx * dx + dy * dy > touchSlop * touchSlop) {
            moving = true;
        }
        if ((horizontal > touchSlop && horizontal > Math.max(0f, dy))
                || dy < -touchSlop) {
            tracking = false;
            return false;
        }
        if (dy >= TRIGGER_DISTANCE_DP * safeDensity && dy >= horizontal * DIRECTION_RATIO) {
            consumed = true;
            return true;
        }
        return false;
    }

    boolean isConsumed() {
        return consumed;
    }

    boolean isTracking() {
        return tracking;
    }

    void reset() {
        tracking = false;
        consumed = false;
    }
}

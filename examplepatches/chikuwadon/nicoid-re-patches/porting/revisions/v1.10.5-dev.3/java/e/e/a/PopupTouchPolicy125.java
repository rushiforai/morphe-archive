package e.e.a;

/** Testable touch state for popup video, independent of Android view lifecycles. */
public final class PopupTouchPolicy125 {
    public static final int NONE = 0;
    public static final int SINGLE_TAP = 1;
    public static final int DOUBLE_TAP = 2;
    private PopupTouchPolicy125() {}

    public static final class State {
        private long lastUp = -1L;
        private float lastX, lastY, downX, downY;
        private long downAt;
        private boolean routing, moved, invalid, second, confirmed;
        private boolean startedVisible;

        public boolean begin(long now, float x, float y,
                             boolean visible, boolean interactive,
                             int doubleSlop, long doubleTimeoutMs) {
            boolean recent = lastUp >= 0 && now >= lastUp
                    && now - lastUp <= doubleTimeoutMs
                    && within(x, y, lastX, lastY, doubleSlop);
            second = recent;
            routing = !interactive || second;
            invalid = moved = confirmed = false;
            downX = x;
            downY = y;
            downAt = now;
            startedVisible = visible;
            if (!routing) lastUp = -1L;
            return routing;
        }

        public void move(float x, float y, int touchSlop) {
            if (!routing || invalid) return;
            if (!within(x, y, downX, downY, touchSlop)) {
                moved = invalid = true;
                confirmed = false;
                lastUp = -1L;
            }
        }

        public boolean markDoubleTap() {
            if (!routing || invalid || !second) return false;
            confirmed = true;
            return true;
        }

        public int end(long now, long longPressTimeoutMs) {
            if (!routing) return NONE;
            routing = false;
            if (invalid || moved || now < downAt
                    || now - downAt > longPressTimeoutMs) {
                lastUp = -1L;
                confirmed = second = false;
                return NONE;
            }
            if (confirmed && second) {
                lastUp = -1L;
                confirmed = second = false;
                return DOUBLE_TAP;
            }
            lastUp = now;
            lastX = downX;
            lastY = downY;
            confirmed = second = false;
            return SINGLE_TAP;
        }

        public void cancel() {
            invalid = true;
            confirmed = second = false;
            lastUp = -1L;
        }

        public void reset() {
            cancel();
            routing = moved = false;
        }

        public boolean routing() { return routing; }
        public boolean dragging() { return routing && moved; }
        public boolean startedVisible() { return startedVisible; }

        private static boolean within(float x, float y, float x0, float y0, int slop) {
            float dx = x - x0;
            float dy = y - y0;
            return dx * dx + dy * dy <= (float) slop * slop;
        }
    }
}

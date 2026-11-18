package io.github.sabopura.morphe.extension.twitch.ui;

/** The calculations of the ported components that do not need a view, kept here so they can be tested. */
final class PortMath {
    private PortMath() {
    }

    /** elastic-slider: how far a pull past the end stretches; free at first, flattening towards {@code max}. */
    static float rubber(float past, float max) {
        if (past == 0) return 0;
        return (float) (2 * (1 / (1 + Math.exp(-Math.abs(past) / max)) - .5) * max);
    }

    /** elastic-slider: pill scaleY for a stretch {@code over}. */
    static float rubberThin(float over, float max) {
        float t = Math.max(0, Math.min(1.2f, Math.abs(over) / max));
        return 1 - (over >= 0 ? t * .2f : -t * .12f);
    }

    /** segment-timer: the minute under a point. A jump over half the dial is the seam, so it holds at that end. */
    static int minuteAt(double dx, double dy, int previous, int ticks) {
        double angle = Math.toDegrees(Math.atan2(dx, -dy));
        int minute = (int) Math.round(((angle + 360) % 360) / (360d / ticks));
        boolean high = previous > ticks / 2;
        if (minute == 0) minute = high ? ticks : 1;
        if (Math.abs(minute - previous) > ticks / 2) minute = high ? ticks : 1;
        return Math.max(1, Math.min(ticks, minute));
    }

    /** jelly-tabs: damping from the stiffness, mass and bounce the source aims with. */
    static float damping(float stiffness, float mass, float bounce) {
        return (float) (2 * Math.sqrt(stiffness * mass) * (1 - bounce));
    }

    /** mobile-drawer: where the sheet sits for a pointer offset along the closing axis (dragElastic .7 / .04). */
    static float sheetFollow(float offset) {
        return offset * (offset >= 0 ? .7f : .04f);
    }

    /** mobile-drawer: whether a release closes the sheet. Offset in dp, velocity in dp/s. */
    static boolean sheetCloses(float offset, float velocity) {
        return offset > 80 || velocity > 500;
    }

    /** toast-stack pill: long enough to read, never under the 1.2 s the design asks for. */
    static int noticeMillis(int characters) {
        return Math.max(1200, Math.min(4000, 800 + characters * 80));
    }

    /** Whether a drag just arrived on {@code mark}; the only moment a slider gives a haptic tick. */
    static boolean landedOn(int before, int after, int mark) {
        return before != mark && after == mark;
    }

    /** "Text size" to "text size" inside a sentence; an acronym such as "VOD speed" keeps its capitals. */
    static String lowerFirst(String title) {
        if (title == null || title.isEmpty()) return "";
        if (title.length() > 1 && Character.isUpperCase(title.charAt(1))) return title;
        return Character.toLowerCase(title.charAt(0)) + title.substring(1);
    }

    /** inline-confirm: when the undo goes; it waits while a screen reader explores, and never ends before {@code grace}. */
    static long undoDeadline(long since, long grace, long recommended, boolean exploring) {
        return exploring ? Long.MAX_VALUE : since + Math.max(grace, recommended);
    }

    /** One step a slider's key moves, as a stock SeekBar takes them; 0 for keys it leaves to focus moves. */
    static int keyStep(int keyCode) {
        switch (keyCode) {
            case android.view.KeyEvent.KEYCODE_DPAD_LEFT:
            case android.view.KeyEvent.KEYCODE_MINUS:
            case android.view.KeyEvent.KEYCODE_NUMPAD_SUBTRACT:
                return -1;
            case android.view.KeyEvent.KEYCODE_DPAD_RIGHT:
            case android.view.KeyEvent.KEYCODE_PLUS:
            case android.view.KeyEvent.KEYCODE_EQUALS:
            case android.view.KeyEvent.KEYCODE_NUMPAD_ADD:
                return 1;
            default:
                return 0;
        }
    }

    /** One step for TalkBack's scroll actions on a slider; 0 for any other action. */
    static int actionStep(int action) {
        if (action == android.view.accessibility.AccessibilityNodeInfo.ACTION_SCROLL_FORWARD) return 1;
        if (action == android.view.accessibility.AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD) return -1;
        return 0;
    }

    /** A playback rate as words read it: 1, 1.5, 1.25. */
    static String rateText(float rate) {
        String text = String.format(java.util.Locale.ROOT, "%.2f", rate);
        if (text.endsWith("0")) text = text.substring(0, text.length() - 1);
        if (text.endsWith(".0")) text = text.substring(0, text.length() - 2);
        return text;
    }

    /** reorder-list: the slot a held row's top {@code y} is nearest to. */
    static int slotAt(float y, float step, int count) {
        return Math.max(0, Math.min(count - 1, Math.round(y / step)));
    }

    /** reorder-list: {@code order} with {@code id} taken out and put back at {@code slot}. */
    static int[] reorder(int[] order, int id, int slot) {
        int[] next = new int[order.length];
        int n = 0;
        for (int current : order) {
            if (current == id) continue;
            if (n == slot) next[n++] = id;
            next[n++] = current;
        }
        if (n == slot) next[n] = id;
        return next;
    }

    /**
     * reorder-list: how fast a held row scrolls its list, in px/s, when the finger at {@code y} is within
     * {@code band} of the visible {@code top} or {@code bottom}; deeper into the band is faster.
     */
    static float edgeScroll(float y, float top, float bottom, float band, float fastest) {
        if (band <= 0 || bottom - top <= 2 * band) return 0;
        if (y < top + band) return -fastest * Math.min(1, (top + band - y) / band);
        if (y > bottom - band) return fastest * Math.min(1, (y - (bottom - band)) / band);
        return 0;
    }

    /**
     * segment-timer: the dial's side that leaves room for its clock, text {@code textWidth} wide, inside the
     * ring's free middle ({@code inner} of the side); never under {@code least}, never over {@code most}.
     */
    static int dialSide(float textWidth, float inner, int least, int most) {
        int wanted = (int) Math.ceil(textWidth / inner);
        return Math.max(least, Math.min(Math.max(least, most), wanted));
    }
}

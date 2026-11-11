package app.fakh.extension.shared;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.SystemClock;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.Window;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.util.WeakHashMap;

/**
 * Slide across the tabs of a {@link GlassCapsule} bar, as on an iPhone: a finger that goes down on any tab and moves
 * along the bar pulls the pill over to it and carries it, with a haptic tick for each tab it crosses, and letting go
 * opens the tab it ended on. A tap on another tab ticks too.
 *
 * <p>It wraps the window's callback so it sees each touch before the app does. A touch on the bar goes on to the app
 * as it is, so a tap still opens its tab. It turns into a slide only once the finger has moved along the bar past the
 * touch slop, and further along than across, before the long press time. The app then gets a cancel, as when the
 * system takes a gesture away, and the rest of the gesture stays here. Anything that throws ends the slide and the
 * touch goes on to the app.
 */
public final class TabSlide {
    /** The tabs of a bar, along the same axis and in the same units the app gives {@link SlidingPill#select}. */
    public interface Tabs {
        /** How many tabs the bar has, hidden ones included. */
        int count();

        /** The leading edge of tab {@code index}: left on a bottom bar, top on a rail. Equal to {@link #end} when hidden. */
        float start(int index);

        /** The trailing edge of tab {@code index}. */
        float end(int index);

        /** The selected tab, or -1. */
        int selected();

        /** Opens tab {@code index}, as a tap on it would. */
        void open(int index);
    }

    /** Ticks closer together than this are dropped, so a fast slide doesn't turn into a buzz. */
    private static final long MIN_TICK_GAP_MS = 35;
    private static final int IDLE = 0;
    /** A finger went down on the capsule and may still turn into a slide; its touches go on to the app. */
    private static final int WATCHING = 1;
    /** Sliding: the app had its cancel, and the rest of the gesture is kept from it. */
    private static final int SLIDING = 2;

    /** The slide in each window's callback, held weakly so a closed window takes it along. */
    private static final WeakHashMap<Window, TabSlide[]> windows = new WeakHashMap<>();
    private static long lastTick;

    private final View bar;
    private final GlassCapsule capsule;
    private final boolean vertical;
    private final Tabs tabs;
    private final float slop;
    private final int[] place = new int[2];
    private int state = IDLE;
    private float downAlong;
    private float downAcross;
    /** The bar's offset on the screen along its axis, and how far the pill as drawn sits from the slider's units. */
    private float barStart;
    private float shift;
    /** Where the finger went down, in the slider's units. */
    private float grabbed;
    /** Where the finger puts the middle of the pill now, in the slider's units; the pill may still be on its way. */
    private float target;
    /** The tab under the finger on the last move, for the ticks. */
    private int over;

    private TabSlide(View bar, GlassCapsule capsule, boolean vertical, Tabs tabs) {
        this.bar = bar;
        this.capsule = capsule;
        this.vertical = vertical;
        this.tabs = tabs;
        this.slop = ViewConfiguration.get(bar.getContext()).getScaledTouchSlop();
    }

    /**
     * Lets a finger slide across the tabs of {@code bar}, whose background is {@code capsule}. Once per window: a bar
     * the app rebuilt in the same window takes over its touches.
     *
     * @param vertical whether the bar is a side rail, whose pill slides from top to bottom
     */
    public static void install(View bar, GlassCapsule capsule, boolean vertical, Tabs tabs) {
        Context context = bar.getContext();
        while (context instanceof ContextWrapper && !(context instanceof Activity)) {
            context = ((ContextWrapper) context).getBaseContext();
        }
        if (!(context instanceof Activity)) return;
        Window window = ((Activity) context).getWindow();
        TabSlide slide = new TabSlide(bar, capsule, vertical, tabs);
        TabSlide[] current = windows.get(window);
        if (current != null) {
            current[0].giveUp();
            current[0] = slide;
            return;
        }
        Window.Callback inner = window.getCallback();
        if (inner == null) return;
        TabSlide[] holder = {slide};
        windows.put(window, holder);
        window.setCallback((Window.Callback) Proxy.newProxyInstance(TabSlide.class.getClassLoader(),
                new Class<?>[] {Window.Callback.class}, (proxy, method, args) -> {
                    if (args != null && args.length == 1 && args[0] instanceof MotionEvent
                            && "dispatchTouchEvent".equals(method.getName())) {
                        boolean kept;
                        try {
                            kept = holder[0].onTouch((MotionEvent) args[0], inner);
                        } catch (Throwable failure) {
                            holder[0].giveUp();
                            kept = false;
                        }
                        if (kept) return Boolean.TRUE;
                    }
                    try {
                        return method.invoke(inner, args);
                    } catch (InvocationTargetException failure) {
                        throw failure.getCause() == null ? failure : failure.getCause();
                    }
                }));
    }

    /**
     * The tabs of a bar made of Views: the shown children of {@code row}, measured from the left edge of
     * {@code relativeTo}, which is where the app measures the span it gives {@link SlidingPill#select} from. A tab
     * opens with a click.
     */
    public static Tabs children(android.view.ViewGroup row, View relativeTo) {
        return new Tabs() {
            @Override
            public int count() {
                return row.getChildCount();
            }

            @Override
            public float start(int index) {
                View tab = row.getChildAt(index);
                float left = 0;
                for (View v = tab; v != null && v != relativeTo; v = v.getParent() instanceof View ? (View) v.getParent() : null) {
                    left += v.getLeft();
                }
                return left;
            }

            @Override
            public float end(int index) {
                View tab = row.getChildAt(index);
                return tab.getVisibility() == View.VISIBLE ? start(index) + tab.getWidth() : start(index);
            }

            @Override
            public int selected() {
                for (int i = 0; i < row.getChildCount(); i++) {
                    if (row.getChildAt(i).isSelected()) return i;
                }
                return -1;
            }

            @Override
            public void open(int index) {
                row.getChildAt(index).performClick();
            }
        };
    }

    /** A light haptic tick, as the pill passes a tab. */
    public static void tick(View view) {
        long now = SystemClock.uptimeMillis();
        if (now - lastTick < MIN_TICK_GAP_MS) return;
        lastTick = now;
        view.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
    }

    /** Follows {@code event} and answers whether it is kept from the app, which {@code inner} passes touches to. */
    private boolean onTouch(MotionEvent event, Window.Callback inner) {
        // Any touch on the screen may move what's behind the bar, so a Liquid Glass backdrop follows it for a while.
        capsule.stir();
        int action = event.getActionMasked();
        float along = vertical ? event.getRawY() : event.getRawX();
        float across = vertical ? event.getRawX() : event.getRawY();
        if (action == MotionEvent.ACTION_DOWN) {
            if (state == SLIDING) capsule.slider().release();
            state = IDLE;
            if (!bar.isAttachedToWindow() || !bar.isShown() || !capsule.slider().has()) return false;
            bar.getLocationOnScreen(place);
            float x = event.getRawX() - place[0];
            float y = event.getRawY() - place[1];
            if (!capsule.onCapsule(x, y)) return false;
            barStart = vertical ? place[1] : place[0];
            shift = capsule.pillCenter(vertical) - capsule.slider().center();
            downAlong = along;
            downAcross = across;
            // The pill goes to the finger, whichever tab it went down on.
            grabbed = along - barStart - shift;
            over = tabs.selected();
            state = WATCHING;
            return false;
        }
        boolean ends = action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL;
        switch (state) {
            case WATCHING:
                if (ends || action == MotionEvent.ACTION_POINTER_DOWN) {
                    state = IDLE;
                    // A tap: it ticks when it opens another tab.
                    int tab = tabAt(grabbed);
                    if (action == MotionEvent.ACTION_UP && tab >= 0 && tab != tabs.selected()) tick(bar);
                    return false;
                }
                if (action != MotionEvent.ACTION_MOVE) return false;
                float moved = Math.abs(along - downAlong);
                float sideways = Math.abs(across - downAcross);
                if (moved < slop || moved <= sideways) {
                    if (sideways >= slop) state = IDLE;
                    return false;
                }
                if (event.getEventTime() - event.getDownTime() >= ViewConfiguration.getLongPressTimeout()) {
                    // The tab's own long press has had its turn.
                    state = IDLE;
                    return false;
                }
                state = SLIDING;
                MotionEvent cancel = MotionEvent.obtain(event);
                cancel.setAction(MotionEvent.ACTION_CANCEL);
                try {
                    inner.dispatchTouchEvent(cancel);
                } finally {
                    cancel.recycle();
                }
                follow(along);
                return true;
            case SLIDING:
                if (action == MotionEvent.ACTION_MOVE) {
                    follow(along);
                } else if (ends) {
                    state = IDLE;
                    int tab = tabAt(target);
                    if (action == MotionEvent.ACTION_UP && tab >= 0 && tab != tabs.selected()) tabs.open(tab);
                    capsule.slider().release();
                }
                return true;
            default:
                return false;
        }
    }

    /** Carries the pill with a finger at {@code along} on the screen, ticking as its middle reaches another tab. */
    private void follow(float along) {
        float center = grabbed + along - downAlong;
        float first = Float.NaN;
        float last = Float.NaN;
        for (int i = 0; i < tabs.count(); i++) {
            if (tabs.end(i) <= tabs.start(i)) continue;
            if (Float.isNaN(first)) first = (tabs.start(i) + tabs.end(i)) / 2;
            last = (tabs.start(i) + tabs.end(i)) / 2;
        }
        // The pill's middle stays between the middles of the first and last tabs.
        if (!Float.isNaN(first)) center = Math.max(first, Math.min(last, center));
        target = center;
        capsule.slider().drag(center);
        int now = tabAt(center);
        if (now >= 0 && now != over) {
            over = now;
            tick(bar);
        }
    }

    /** The shown tab at {@code position}, in the slider's units, or the nearest one past the ends; -1 with none. */
    private int tabAt(float position) {
        int nearest = -1;
        float best = Float.MAX_VALUE;
        for (int i = 0; i < tabs.count(); i++) {
            float start = tabs.start(i);
            float end = tabs.end(i);
            if (end <= start) continue;
            float off = position < start ? start - position : position >= end ? position - end : 0;
            if (off < best) {
                best = off;
                nearest = i;
            }
        }
        return nearest;
    }

    /** Ends a slide after a failure, so the pill goes back to the selected tab and the next gesture starts fresh. */
    private void giveUp() {
        if (state == SLIDING) capsule.slider().release();
        state = IDLE;
    }
}

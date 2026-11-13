package e.e.a;

import android.graphics.Path;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewConfiguration;
import android.widget.ListView;

/** List gestures, including optional trace feedback, for the live-program hub. */
final class NicoliveListGestures {
    private final GestureRules110 rules = new GestureRules110();
    private final Rect bounds = new Rect();
    private final Path path = new Path();
    private final int[] origin = new int[2];
    private GestureControls110.Trace trace;
    private boolean tracking, claimed, feedback;
    private NicoliveActivity host;

    void reset() {
        tracking = claimed = false;
        if (trace != null && trace.getParent() instanceof ViewGroup)
            ((ViewGroup) trace.getParent()).removeView(trace);
        trace = null;
        host = null;
    }

    private void showTrace(NicoliveActivity activity) {
        if (!feedback || trace != null) return;
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof ViewGroup)) return;
        GestureControls110.Trace overlay = new GestureControls110.Trace(activity);
        overlay.rules = rules;
        overlay.setClickable(false);
        ((ViewGroup) content).addView(overlay, new ViewGroup.LayoutParams(-1, -1));
        trace = overlay;
        updateTrace(activity);
    }

    private void updateTrace(NicoliveActivity activity) {
        if (trace == null) return;
        trace.path.set(path);
        String action = GestureControls110.action(activity, rules.pattern);
        trace.message = rules.valid() && supports(activity, action)
                ? GestureControls110.name(activity, action) : "";
        trace.invalidate();
    }

    boolean handle(NicoliveActivity activity, ListView list, MotionEvent event) {
        int action = event.getActionMasked();
        float density = activity.getResources().getDisplayMetrics().density;
        float x = event.getRawX() / density;
        float y = event.getRawY() / density;
        if (action == MotionEvent.ACTION_DOWN) {
            reset();
            host = activity;
            tracking = list != null && list.isShown() && list.getGlobalVisibleRect(bounds)
                    && bounds.contains((int) event.getRawX(), (int) event.getRawY())
                    && GestureControls110.prefs(activity).getBoolean("list_gestures_enabled", false)
                    && !GestureControls110.excluded(activity.getWindow().getDecorView(),
                            event.getRawX(), event.getRawY());
            if (tracking) {
                rules.distance = GestureRules110.threshold(
                        GestureControls110.prefs(activity).getInt("gesture_sensitivity", 50));
                rules.down(x, y);
                View content = activity.findViewById(android.R.id.content);
                if (content == null) { reset(); return false; }
                content.getLocationOnScreen(origin);
                path.reset();
                path.moveTo(event.getRawX() - origin[0], event.getRawY() - origin[1]);
                feedback = GestureControls110.prefs(activity)
                        .getBoolean("list_gestures_display", true);
            }
            return false;
        }
        if (!tracking || host != activity) return false;
        if (event.getPointerCount() != 1 || action == MotionEvent.ACTION_CANCEL) {
            boolean consumed = claimed;
            reset();
            return consumed;
        }
        if (action == MotionEvent.ACTION_MOVE) {
            path.lineTo(event.getRawX() - origin[0], event.getRawY() - origin[1]);
            if (!claimed && rules.pattern.isEmpty()
                    && event.getEventTime() - event.getDownTime()
                    > ViewConfiguration.getLongPressTimeout()) {
                reset();
                return false;
            }
            rules.move(x, y);
            if (!claimed && rules.valid() && Dev128.allowClaim(activity, rules.pattern)
                    && supports(activity, GestureControls110.action(activity, rules.pattern))) {
                claimed = true;
                MotionEvent cancel = MotionEvent.obtain(event);
                try {
                    cancel.setAction(MotionEvent.ACTION_CANCEL);
                    activity.getWindow().superDispatchTouchEvent(cancel);
                } finally {
                    cancel.recycle();
                }
                // Keep scrolling stable; no touch-down position rollback.
                showTrace(activity);
            }
            if (claimed) updateTrace(activity);
            return claimed;
        }
        if (action == MotionEvent.ACTION_UP) {
            boolean consumed = claimed;
            String selected = GestureControls110.action(activity, rules.pattern);
            boolean execute = consumed && rules.valid() && !rules.cancelled(x, y)
                    && Dev128.allowClaim(activity, rules.pattern) && supports(activity, selected);
            reset();
            if (execute) perform(activity, list, selected);
            return consumed;
        }
        return claimed;
    }

    private static boolean supports(NicoliveActivity activity, String action) {
        return "refresh".equals(action) || "top".equals(action) || "bottom".equals(action)
                || activity.hubTab == 0 && ("lefttab".equals(action) || "righttab".equals(action));
    }

    static void perform(NicoliveActivity activity, ListView list, String action) {
        if (!supports(activity, action)) return;
        switch (action) {
            case "refresh": activity.refreshFeed(); break;
            case "top": list.setSelection(0); break;
            case "bottom":
                int loaded = list.getCount() - list.getFooterViewsCount();
                if (loaded > 0) list.setSelection(loaded - 1);
                break;
            case "lefttab": activity.moveCategory(-1); break;
            case "righttab": activity.moveCategory(1); break;
        }
    }
}

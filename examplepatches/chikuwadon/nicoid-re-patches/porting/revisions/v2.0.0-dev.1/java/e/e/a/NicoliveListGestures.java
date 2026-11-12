package e.e.a;

import android.graphics.Rect;
import android.view.MotionEvent;
import android.widget.ListView;

/** Applies configured list gestures to the broadcast feed. */
final class NicoliveListGestures {
    private final GestureRules110 rules = new GestureRules110();
    private final Rect bounds = new Rect();
    private boolean tracking, claimed;

    boolean handle(NicoliveActivity activity, ListView list, MotionEvent event) {
        int action = event.getActionMasked();
        float density = activity.getResources().getDisplayMetrics().density;
        float x = event.getRawX() / density;
        float y = event.getRawY() / density;
        if (action == MotionEvent.ACTION_DOWN) {
            claimed = false;
            tracking = list != null && list.getGlobalVisibleRect(bounds)
                    && bounds.contains((int) event.getRawX(), (int) event.getRawY())
                    && GestureControls110.prefs(activity).getBoolean("list_gestures_enabled", false);
            if (tracking) {
                rules.distance = GestureRules110.threshold(
                        GestureControls110.prefs(activity).getInt("gesture_sensitivity", 50));
                rules.down(x, y);
            }
            return false;
        }
        if (!tracking) return claimed;
        if (event.getPointerCount() != 1 || action == MotionEvent.ACTION_CANCEL) {
            tracking = false;
            return claimed;
        }
        if (action == MotionEvent.ACTION_MOVE) {
            rules.move(x, y);
            if (!claimed && rules.valid() && Dev128.allowClaim(activity, rules.pattern)
                    && supports(activity, GestureControls110.action(activity, rules.pattern))) {
                claimed = true;
                MotionEvent cancel = MotionEvent.obtain(event);
                cancel.setAction(MotionEvent.ACTION_CANCEL);
                activity.getWindow().superDispatchTouchEvent(cancel);
                cancel.recycle();
            }
        } else if (action == MotionEvent.ACTION_UP) {
            tracking = false;
            if (claimed && rules.valid() && !rules.cancelled(x, y)) {
                perform(activity, list, GestureControls110.action(activity, rules.pattern));
            }
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

package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.widget.LinearLayout;
import android.widget.TextView;

/** A grab handle. The row follows the finger, and one drag can move it several places. */
final class DragOrder {
    interface Move {
        /** False leaves the row where it is. */
        boolean move(int from, int to);
    }

    private DragOrder() {
    }

    static TextView handle(Activity activity, LinearLayout rows, Move move) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView handle = new TextView(activity);
        handle.setText("☰");
        handle.setTextSize(18);
        handle.setTextColor(MorpheDialog.sub(activity));
        handle.setGravity(android.view.Gravity.CENTER);
        int pad = Math.round(12 * density);
        handle.setPadding(pad, pad, pad, pad);
        handle.setOnTouchListener(new View.OnTouchListener() {
            int home = -1;
            float startY;
            boolean settling;

            @Override
            public boolean onTouch(View v, MotionEvent event) {
                View line = v.getParent() instanceof View ? (View) v.getParent() : null;
                if (line == null) return false;
                int action = event.getActionMasked();
                if (settling) return true;
                if (action == MotionEvent.ACTION_DOWN) {
                    home = rows.indexOfChild(line);
                    startY = event.getRawY();
                    if (home < 0) return false;
                    line.setTranslationZ(6 * density);
                    ViewParent parent = rows.getParent();
                    while (parent != null) {
                        parent.requestDisallowInterceptTouchEvent(true);
                        parent = parent.getParent();
                    }
                    return true;
                }
                if (action == MotionEvent.ACTION_MOVE) {
                    place(rows, line, home, event.getRawY() - startY);
                    return true;
                }
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                    settling = true;
                    try {
                        int target = place(rows, line, home, event.getRawY() - startY);
                        settle(rows, line, home, target, move);
                    } finally {
                        settling = false;
                        home = -1;
                    }
                    return true;
                }
                return true;
            }
        });
        return handle;
    }

    /** Slides the grabbed row with the finger and shifts the rows it passes. */
    private static int place(LinearLayout rows, View line, int home, float dy) {
        int count = rows.getChildCount();
        int height = Math.max(line.getHeight(), 1);
        int target = home;
        if (home >= 0) {
            target = home + Math.round(dy / height);
            if (target < 0) target = 0;
            if (target >= count) target = count - 1;
        }
        for (int i = 0; i < count; i++) {
            View child = rows.getChildAt(i);
            float shift = 0;
            if (child != line && home >= 0) {
                if (target > home && i > home && i <= target) shift = -height;
                else if (target < home && i < home && i >= target) shift = height;
            }
            if (child.getTranslationY() != shift) child.setTranslationY(shift);
        }
        line.setTranslationY(dy);
        return target;
    }

    private static void settle(LinearLayout rows, View line, int home, int target, Move move) {
        int count = rows.getChildCount();
        for (int i = 0; i < count; i++) {
            View child = rows.getChildAt(i);
            child.setTranslationY(0);
            child.setTranslationZ(0);
        }
        if (home < 0 || target == home) return;
        int from = home;
        while (from < target) {
            if (!move.move(from, from + 1)) break;
            from++;
        }
        while (from > target) {
            if (!move.move(from, from - 1)) break;
            from--;
        }
        rows.removeView(line);
        rows.addView(line, from);
    }
}

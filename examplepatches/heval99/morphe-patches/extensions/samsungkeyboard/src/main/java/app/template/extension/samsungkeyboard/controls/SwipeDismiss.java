package app.template.extension.samsungkeyboard.controls;

import android.content.Context;
import android.content.ContextWrapper;
import android.inputmethodservice.InputMethodService;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Swipe down to dismiss": a downward drag that starts on the suggestion strip or the toolbar
 * hides the keyboard. Hooked into HoneyBoardLayout.onInterceptTouchEvent. A gesture is armed only
 * when its first touch lands inside one of the strip views below (found by class simple name, which
 * the layout XML keeps); a touch that starts on the keys is never looked at again, so typing is
 * untouched. The keyboard is hidden with InputMethodService.requestHideSelf.
 */
@SuppressWarnings("unused")
public final class SwipeDismiss {
    private static final String TAG = "Morphe-SamsungKeyboard";

    static final String FEATURE = "samsungkeyboard.swipe_dismiss";

    /** Views that make up the suggestion strip and the toolbar (names kept by the layout XML). */
    private static final String[] STRIP_VIEWS = {
        "CandidateTableLayout",
        "CandidateView",
        "CandidateCloseButtonFrame",
        "CandidateExpandButtonFrame",
        "BeeHivePrimaryContainer",
    };

    /** The drag must pass this many touch slops downward. */
    private static final int SLOP_FACTOR = 3;

    /** And be this many times longer vertically than horizontally. */
    private static final int VERTICAL_RATIO = 2;

    private static boolean armed;
    private static float startX;
    private static float startY;

    /**
     * Patched in at the start of onInterceptTouchEvent. True takes the gesture away from the
     * children (the keyboard is being hidden), false leaves the stock handling alone.
     */
    public static boolean intercept(View view, MotionEvent event) {
        try {
            if (view == null || event == null) return false;
            if (!HevalSettings.isEnabled(FEATURE)) {
                armed = false;
                return false;
            }
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    armed = startsOnStrip(view, event.getX(), event.getY());
                    startX = event.getX();
                    startY = event.getY();
                    return false;
                case MotionEvent.ACTION_MOVE:
                    if (!armed) return false;
                    if (event.getPointerCount() > 1) {
                        armed = false;
                        return false;
                    }
                    float dx = event.getX() - startX;
                    float dy = event.getY() - startY;
                    int slop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
                    if (dy > SLOP_FACTOR * slop && dy > VERTICAL_RATIO * Math.abs(dx)) {
                        armed = false;
                        return hide(view);
                    }
                    return false;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    armed = false;
                    return false;
                default:
                    return false;
            }
        } catch (Throwable failure) {
            armed = false;
            try {
                HevalSettings.reportFailure(FEATURE, failure);
            } catch (Throwable ignored) {
                // Reporting is optional.
            }
            return false;
        }
    }

    /** Whether (x, y), in {@code root}'s coordinates, is inside a strip view or one of its children. */
    private static boolean startsOnStrip(View root, float x, float y) {
        View view = root;
        while (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            View hit = null;
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                View child = group.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE) continue;
                float childX = x + group.getScrollX() - child.getX();
                float childY = y + group.getScrollY() - child.getY();
                if (childX >= 0 && childY >= 0 && childX < child.getWidth() && childY < child.getHeight()) {
                    hit = child;
                    x = childX;
                    y = childY;
                    break;
                }
            }
            if (hit == null) break;
            if (isStrip(hit)) return true;
            view = hit;
        }
        return false;
    }

    private static boolean isStrip(View view) {
        String name = view.getClass().getSimpleName();
        for (String strip : STRIP_VIEWS) {
            if (strip.equals(name)) return true;
        }
        return false;
    }

    /** Hides the keyboard; false when no keyboard service was found, so the gesture stays stock. */
    private static boolean hide(View view) {
        InputMethodService service = serviceOf(view.getContext());
        if (service == null) service = KeyboardService.get();
        if (service == null) {
            Log.w(TAG, "Swipe down to dismiss: no keyboard service to hide");
            return false;
        }
        service.requestHideSelf(0);
        return true;
    }

    private static InputMethodService serviceOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof InputMethodService) return (InputMethodService) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private SwipeDismiss() { }
}

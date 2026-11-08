package io.github.sazap10.extension.sync;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;

/**
 * Places Sync's toolbar-anchored sheets (sort, more actions) directly below the activity's toolbar.
 * <p>
 * Sync removes the BottomSheetBehavior from these sheets and leaves them at the top of the dialog's
 * CoordinatorLayout. Before edge-to-edge was enforced, the dialog content started below the status bar, which put
 * the sheet where Sync expected it. From target 35 the dialog window starts at the top of the screen, so the sheet
 * covers the toolbar. This helper converts the toolbar's bottom edge into the CoordinatorLayout's coordinate space
 * and uses it as the sheet's top margin. Both positions are measured on screen, so status bar height, display
 * cutouts and orientation are all accounted for.
 */
@SuppressWarnings("unused")
public final class AnchoredSheets {
    private static final int TAG_KEY = 0x5e7c0001;

    private AnchoredSheets() {
    }

    /**
     * Called from BottomSheetDialog's insets listener for sheets without a BottomSheetBehavior.
     * Positions the sheet before the next frame is drawn.
     */
    public static void position(final View sheet) {
        try {
            if (sheet == null || sheet.getTag(TAG_KEY) != null) return;
            final ViewTreeObserver observer = sheet.getViewTreeObserver();
            final ViewTreeObserver.OnPreDrawListener listener = new ViewTreeObserver.OnPreDrawListener() {
                @Override
                public boolean onPreDraw() {
                    sheet.setTag(TAG_KEY, null);
                    ViewTreeObserver current = sheet.getViewTreeObserver();
                    if (current.isAlive()) current.removeOnPreDrawListener(this);
                    // Skip this frame if the margin changed, so the sheet never draws at the old position.
                    return !applyTopMargin(sheet);
                }
            };
            sheet.setTag(TAG_KEY, listener);
            observer.addOnPreDrawListener(listener);
        } catch (Throwable ignored) {
            // Positioning is cosmetic. Never crash the dialog because of it.
        }
    }

    /** @return true if the margin changed. */
    private static boolean applyTopMargin(View sheet) {
        try {
            ViewParent parent = sheet.getParent();
            if (!(parent instanceof View)) return false;
            View container = (View) parent;

            Activity activity = activity(sheet.getContext());
            if (activity == null) return false;
            int toolbarId = activity.getResources().getIdentifier("toolbar", "id", activity.getPackageName());
            if (toolbarId == 0) return false;
            View toolbar = activity.findViewById(toolbarId);
            if (toolbar == null || !toolbar.isShown() || toolbar.getHeight() == 0) return false;

            int[] toolbarLocation = new int[2];
            toolbar.getLocationOnScreen(toolbarLocation);
            int[] containerLocation = new int[2];
            container.getLocationOnScreen(containerLocation);

            // Sync only anchors sheets to a toolbar at the top of the screen.
            int screenHeight = activity.getResources().getDisplayMetrics().heightPixels;
            if (toolbarLocation[1] > screenHeight / 2) return false;

            int top = Math.max(0, toolbarLocation[1] + toolbar.getHeight() - containerLocation[1]);

            ViewGroup.LayoutParams params = sheet.getLayoutParams();
            if (!(params instanceof ViewGroup.MarginLayoutParams)) return false;
            ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) params;
            if (margins.topMargin == top) return false;
            margins.topMargin = top;
            sheet.setLayoutParams(margins);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}

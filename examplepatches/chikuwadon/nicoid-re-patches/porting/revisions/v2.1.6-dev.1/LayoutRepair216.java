package e.e.a;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

/**
 * Maintain each parent ViewGroup's LayoutParams contract when the service
 * decoder view is reused by an Activity-hosted mini-player. No player reset.
 */
public final class LayoutRepair216 {
    private LayoutRepair216() {}

    public static ViewGroup.LayoutParams compatible(ViewGroup parent, ViewGroup.LayoutParams original) {
        if (parent == null || original == null) return original;
        if (parent instanceof FrameLayout && !(original instanceof FrameLayout.LayoutParams))
            return new FrameLayout.LayoutParams(original);
        if (parent instanceof LinearLayout && !(original instanceof LinearLayout.LayoutParams))
            return new LinearLayout.LayoutParams(original);
        if (parent instanceof RelativeLayout && !(original instanceof RelativeLayout.LayoutParams))
            return new RelativeLayout.LayoutParams(original);
        return original;
    }

    /** Run immediately after the mini subtree is installed, before first measure. */
    public static void sanitize(View root) {
        if (!(root instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) root;
        int count = parent.getChildCount();
        for (int i = 0; i < count; i++) {
            View child = parent.getChildAt(i);
            ViewGroup.LayoutParams existing = child.getLayoutParams();
            ViewGroup.LayoutParams corrected = compatible(parent, existing);
            if (corrected != existing) {
                child.setLayoutParams(corrected);
                Log.w("nicoid-mini", "Repaired incompatible child LayoutParams before measuring mini-player");
            }
            if (child instanceof ViewGroup) sanitize(child);
        }
    }
}

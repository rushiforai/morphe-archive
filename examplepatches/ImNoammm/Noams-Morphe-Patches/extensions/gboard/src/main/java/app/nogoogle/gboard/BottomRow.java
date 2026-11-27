package app.nogoogle.gboard;

import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.LinearLayout;

import java.util.WeakHashMap;

/**
 * Height of the keyboard's bottom row, the one with the space bar (No-Google settings → Keyboard),
 * patched in by the "Space bar row height" patch. A keyboard's body (SoftKeyboardView) gets a fixed
 * height and its rows share it in a vertical LinearLayout: each row has a fixed part (often 0) plus a
 * share of the rest by weight, and on the letters keyboard the bottom row gets 238 of 1000. Both parts
 * of the bottom row shrink by the chosen factor and the body's height by what that frees, so the other
 * rows keep their size and the whole keyboard gets shorter.
 */
@SuppressWarnings("unused")
public final class BottomRow {
    // Gboard's own {fixed part, weight, container weight sum} of every bottom row changed so far
    private static final WeakHashMap<View, float[]> STOCK = new WeakHashMap<>();
    private static int spaceId;

    private BottomRow() {
    }

    /** True when the "Space bar row height" patch was applied: the patch makes this return true. */
    public static boolean patched() {
        return false;
    }

    /** Patched at the start of SoftKeyboardView's height setter: the height to give the keyboard's body. */
    public static int height(View keyboard, int height) {
        if (height <= 0 || !(keyboard instanceof ViewGroup)) return height;
        try {
            return resize((ViewGroup) keyboard, height);
        } catch (Throwable t) {
            return height;
        }
    }

    /** The chosen share of Gboard's bottom row height (1: Gboard's own). */
    private static float factor() {
        try {
            int percent = Integer.parseInt(NoGoogleSettings.str(NoGoogleSettings.BOTTOM_ROW_HEIGHT));
            return percent > 0 && percent < 100 ? percent / 100f : 1f;
        } catch (NumberFormatException e) {
            return 1f;
        }
    }

    private static int resize(ViewGroup keyboard, int height) {
        View space = findSpace(keyboard);
        if (space == null) return height;
        // The space bar's row: its ancestor whose parent is the vertical LinearLayout holding the rows
        View row = space;
        ViewParent parent = row.getParent();
        while (parent instanceof ViewGroup && parent != keyboard && !vertical(parent)) {
            row = (View) parent;
            parent = parent.getParent();
        }
        if (parent == keyboard || !(parent instanceof LinearLayout)) return height;
        LinearLayout rows = (LinearLayout) parent;
        // Only where the rows fill the body and the space bar's row is the last one
        ViewGroup.LayoutParams rowsLp = rows.getLayoutParams();
        if (rows.getParent() != keyboard || rowsLp == null || rowsLp.height != ViewGroup.LayoutParams.MATCH_PARENT
                || rows.getChildAt(rows.getChildCount() - 1) != row
                || !(row.getLayoutParams() instanceof LinearLayout.LayoutParams)) {
            return height;
        }
        LinearLayout.LayoutParams rowLp = (LinearLayout.LayoutParams) row.getLayoutParams();
        float[] stock = STOCK.get(row);
        if (stock == null) {
            stock = new float[]{rowLp.height, rowLp.weight, rows.getWeightSum()};
            STOCK.put(row, stock);
        }
        int stockFixed = (int) stock[0];
        float stockWeight = stock[1];

        // What the rows do not share by weight: paddings, margins and every row's fixed part
        int fixed = keyboard.getPaddingTop() + keyboard.getPaddingBottom()
                + rows.getPaddingTop() + rows.getPaddingBottom();
        if (rowsLp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams m = (ViewGroup.MarginLayoutParams) rowsLp;
            fixed += m.topMargin + m.bottomMargin;
        }
        float weights = 0;
        for (int i = 0; i < rows.getChildCount(); i++) {
            View child = rows.getChildAt(i);
            if (child.getVisibility() == View.GONE) continue;
            if (!(child.getLayoutParams() instanceof LinearLayout.LayoutParams)) return height;
            LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) child.getLayoutParams();
            int own = child == row ? stockFixed : lp.height;
            if (own < 0) return height; // wrap_content / match_parent: not a fixed part
            fixed += own + lp.topMargin + lp.bottomMargin;
            weights += child == row ? stockWeight : lp.weight;
        }
        float sum = stock[2] > 0 ? stock[2] : weights;
        if (height < fixed) return height;

        float factor = factor();
        int newFixed = Math.round(stockFixed * factor);
        float newWeight = stockWeight * factor;
        float newSum = sum - stockWeight + newWeight;
        if (rowLp.height != newFixed || rowLp.weight != newWeight) {
            rowLp.height = newFixed;
            rowLp.weight = newWeight;
            row.setLayoutParams(rowLp);
        }
        // An unset weight sum is the sum of the weights, which follows the new weight by itself
        if (stock[2] > 0) rows.setWeightSum(newSum);
        // The rows share the same space by weight as before, less what the bottom row gave up
        float shared = sum > 0 ? (height - fixed) * newSum / sum : height - fixed;
        return fixed - stockFixed + newFixed + Math.round(shared);
    }

    private static boolean vertical(ViewParent view) {
        return view instanceof LinearLayout && ((LinearLayout) view).getOrientation() == LinearLayout.VERTICAL;
    }

    /** The space bar (id key_pos_space) in this keyboard, or null. */
    private static View findSpace(ViewGroup keyboard) {
        int id = spaceId;
        if (id != 0) return keyboard.findViewById(id);
        id = findId(keyboard, keyboard.getResources());
        if (id == 0) return null;
        spaceId = id;
        return keyboard.findViewById(id);
    }

    /** Looks the space bar's id up by its resource name: Gboard's own ids differ between versions. */
    private static int findId(View view, Resources res) {
        int id = view.getId();
        if (id != View.NO_ID && (id >>> 24) == 0x7f) {
            try {
                if ("key_pos_space".equals(res.getResourceEntryName(id))) return id;
            } catch (Resources.NotFoundException ignored) {
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                int found = findId(group.getChildAt(i), res);
                if (found != 0) return found;
            }
        }
        return 0;
    }
}

package semicoloncolonel.mobilestream.extension.npr;

import android.view.View;
import android.view.ViewGroup;

/**
 * NPR — "Skip ads". A sponsor slot is the root view of a row in a
 * RecyclerView, and a RecyclerView keeps a hidden row's measured height. The
 * row is hidden and given zero height and margins, so it takes no space.
 */
@SuppressWarnings("unused")
public final class AdRowCollapser {
    private AdRowCollapser() {
    }

    public static void collapse(View row) {
        if (row == null) return;
        row.setVisibility(View.GONE);
        ViewGroup.LayoutParams params = row.getLayoutParams();
        if (params == null) {
            params = new ViewGroup.MarginLayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0);
        }
        params.height = 0;
        if (params instanceof ViewGroup.MarginLayoutParams) {
            ((ViewGroup.MarginLayoutParams) params).setMargins(0, 0, 0, 0);
        }
        row.setLayoutParams(params);
    }
}

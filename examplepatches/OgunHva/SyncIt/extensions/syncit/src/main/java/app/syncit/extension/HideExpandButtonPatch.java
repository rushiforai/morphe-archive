package app.syncit.extension;

import android.widget.LinearLayout;

/**
 * Gives the width of the hidden expand chevron back to the post text.
 *
 * <p>Sync reserves room for the chevron in the text wrapper's right padding before the holder
 * draws a post. With the chevron gone, that room is unused and the text stops short of the edge.
 *
 * @noinspection unused
 */
public final class HideExpandButtonPatch {
    /** Width the expand button takes in the card layouts. */
    private static final float CHEVRON_WIDTH_DP = 38f;

    private HideExpandButtonPatch() {}

    /**
     * Called after a post holder has set its text padding.
     *
     * @param textWrapper The wrapper holding the title, description and flair.
     */
    public static void reduceTextPadding(LinearLayout textWrapper) {
        if (textWrapper == null) {
            return;
        }

        int reduce = Math.round(
                CHEVRON_WIDTH_DP * textWrapper.getResources().getDisplayMetrics().density);
        int right = textWrapper.getPaddingRight();
        int reduced = Math.max(0, right - reduce);
        if (reduced != right) {
            textWrapper.setPadding(
                    textWrapper.getPaddingLeft(),
                    textWrapper.getPaddingTop(),
                    reduced,
                    textWrapper.getPaddingBottom()
            );
        }
    }
}

package app.morphe.extension.tinder.patches;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.TextView;

/**
 * Adds the Telegram row to Tinder's Legal settings section, directly below the
 * Terms of Service row.
 *
 * <p>The row is built from the Terms row so it keeps the same colors, padding,
 * background and margins as the rows Tinder renders itself.
 */
public final class TinderTelegramRow {
    private static final String TAG = "TinderTelegramLink";
    private static final String URL = "https://t.me/wagg13mods";
    private static final String ROW_TAG = "morphe_telegram_row";
    private static final String LABEL = "Telegram WAGG13 MODS";

    private TinderTelegramRow() {}

    /**
     * Inserts the Telegram row after the Terms of Service row.
     *
     * @param container the LinearLayout holding the Legal rows
     * @param termsRow the Terms of Service row
     */
    public static void addBelowTerms(ViewGroup container, TextView termsRow) {
        if (container == null || termsRow == null) return;
        if (container.findViewWithTag(ROW_TAG) != null) return;

        try {
            Context context = container.getContext();
            TextView row = new TextView(context);

            row.setText(LABEL);
            row.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, termsRow.getTextSize());
            row.setTextColor(termsRow.getTextColors());
            row.setTypeface(termsRow.getTypeface());
            row.setGravity(termsRow.getGravity());
            row.setPadding(
                    termsRow.getPaddingLeft(),
                    termsRow.getPaddingTop(),
                    termsRow.getPaddingRight(),
                    termsRow.getPaddingBottom());
            row.setMinimumHeight(termsRow.getMinimumHeight());

            Drawable background = copyBackground(termsRow);
            if (background != null) row.setBackground(background);

            ViewGroup.LayoutParams params = termsRow.getLayoutParams();
            if (params instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams source = (ViewGroup.MarginLayoutParams) params;
                ViewGroup.MarginLayoutParams copy =
                        new ViewGroup.MarginLayoutParams(source.width, source.height);
                copy.setMargins(
                        source.leftMargin, source.topMargin, source.rightMargin, source.bottomMargin);
                row.setLayoutParams(copy);
            } else if (params != null) {
                row.setLayoutParams(new ViewGroup.LayoutParams(params.width, params.height));
            }

            row.setTag(ROW_TAG);
            row.setClickable(true);
            row.setFocusable(true);
            row.setOnClickListener(view -> openUrl(container.getContext()));

            int index = container.indexOfChild(termsRow);
            container.addView(row, index + 1);
        } catch (Throwable t) {
            Log.e(TAG, "Unable to add the Telegram row", t);
        }
    }

    private static Drawable copyBackground(TextView source) {
        Drawable background = source.getBackground();
        if (background == null) return null;
        Drawable.ConstantState state = background.getConstantState();
        if (state == null) return background;
        return state.newDrawable(source.getResources()).mutate();
    }

    private static void openUrl(Context context) {
        if (context == null) return;
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(URL));
            if (!(context instanceof Activity)) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }
            context.startActivity(intent);
        } catch (Throwable t) {
            Log.e(TAG, "Unable to open the Telegram link", t);
        }
    }
}

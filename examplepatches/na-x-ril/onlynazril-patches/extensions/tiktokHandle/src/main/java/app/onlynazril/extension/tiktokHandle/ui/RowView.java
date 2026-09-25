package app.onlynazril.extension.tiktokHandle.ui;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * A settings row: title, optional summary, one trailing control. Flat by construction — the only
 * decoration is a press ripple, so rows read as one continuous surface instead of stacked cards.
 */
public final class RowView extends LinearLayout {
    private final TextView titleView;
    private TextView summaryView;
    private View trailing;

    public RowView(Context context, String title, String summary, View trailing) {
        super(context);
        this.trailing = trailing;
        setOrientation(HORIZONTAL);
        setGravity(Gravity.CENTER_VERTICAL);
        setMinimumHeight(Tokens.dp(context, 64));
        setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_3),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_3));
        setBackground(ripple());

        LinearLayout text = new LinearLayout(context);
        text.setOrientation(VERTICAL);
        titleView = line(context, title, Tokens.ROW_TITLE_SP, Tokens.TEXT_PRIMARY, true);
        text.addView(titleView);
        if (summary != null && !summary.isEmpty()) {
            summaryView = line(context, summary, Tokens.ROW_SUMMARY_SP, Tokens.TEXT_SECONDARY, false);
            LinearLayout.LayoutParams params =
                    new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
            params.topMargin = Tokens.dp(context, Tokens.SPACE_1);
            summaryView.setLayoutParams(params);
            text.addView(summaryView);
        }
        addView(text, new LinearLayout.LayoutParams(0, LayoutParams.WRAP_CONTENT, 1f));

        if (trailing != null) {
            LinearLayout.LayoutParams params =
                    new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
            params.leftMargin = Tokens.dp(context, Tokens.SPACE_4);
            addView(trailing, params);
        }
    }

    /**
     * Greys the row out and makes its control inert, without touching the control's own value:
     * a switch that is off with the master stays visibly on so it comes back the same way.
     */
    public void setRowEnabled(boolean enabled) {
        titleView.setTextColor(enabled ? Tokens.TEXT_PRIMARY : Tokens.TEXT_DISABLED);
        if (summaryView != null) {
            summaryView.setTextColor(enabled ? Tokens.TEXT_SECONDARY : Tokens.TEXT_DISABLED);
        }
        if (trailing != null) trailing.setEnabled(enabled);
    }

    private static TextView line(Context context, String text, float sizeSp, int color, boolean bold) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(sizeSp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
        return view;
    }

    private static Drawable ripple() {
        Drawable content = new ColorDrawable(Tokens.SURFACE);
        Drawable mask = new ColorDrawable(0xFFFFFFFF);
        return new RippleDrawable(
                ColorStateList.valueOf(Tokens.SURFACE_PRESSED), content, mask);
    }
}

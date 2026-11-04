package app.wordfeudwordfinder.extension.ui;

import android.content.Context;
import android.content.res.ColorStateList;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import app.wordfeudwordfinder.extension.ui.Strings.Key;

/**
 * Word list download progress (spec section 6.2 step 5): a label, a horizontal bar (indeterminate until the first
 * percentage arrives) and the percentage. Main thread only. Hidden (GONE) until {@link #start}.
 */
final class DownloadProgress extends LinearLayout {
    private final String lang;
    private final ProgressBar bar;
    private final TextView pct;

    DownloadProgress(Context ctx, Theme theme, String lang, float density) {
        super(ctx);
        this.lang = lang;
        setOrientation(VERTICAL);
        setGravity(Gravity.CENTER_HORIZONTAL);
        setVisibility(GONE);

        TextView label = Widgets.text(ctx, 14, theme.textSecondary, Fonts.inter(ctx));
        label.setGravity(Gravity.CENTER);
        label.setText(Strings.get(lang, Key.DOWNLOADING));
        addView(label, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        bar = new ProgressBar(ctx, null, android.R.attr.progressBarStyleHorizontal);
        bar.setMax(100);
        bar.setProgressTintList(ColorStateList.valueOf(theme.accent));
        bar.setIndeterminateTintList(ColorStateList.valueOf(theme.accent));
        LayoutParams blp = new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        blp.topMargin = FabPlacement.dp(density, 4);
        addView(bar, blp);

        pct = Widgets.text(ctx, 12, theme.textSecondary, Fonts.inter(ctx));
        pct.setGravity(Gravity.CENTER);
        addView(pct, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    /** Shows the bar without a percentage yet. */
    void start() {
        bar.setIndeterminate(true);
        pct.setVisibility(GONE);
        setVisibility(VISIBLE);
    }

    /** Shows {@code p} (clamped to 0..100); ignored while hidden. */
    void setPercent(int p) {
        if (getVisibility() != VISIBLE) return;
        int v = Math.max(0, Math.min(100, p));
        if (!bar.isIndeterminate() && v < bar.getProgress()) return; // a late replayed value: never go back
        bar.setIndeterminate(false);
        bar.setProgress(v);
        pct.setText(String.format(Strings.get(lang, Key.DOWNLOAD_PCT), v));
        pct.setVisibility(VISIBLE);
    }

    void hide() {
        setVisibility(GONE);
    }
}

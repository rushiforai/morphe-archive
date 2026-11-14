package app.template.extension.ui;

import android.animation.ValueAnimator;
import android.content.Context;
import android.view.Gravity;
import android.view.InflateException;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ProgressBar;

/** Hosts Letterboxd's indeterminate spinner only while a visible operation is pending. */
public final class LoadingIndicator extends FrameLayout {
    private final boolean compact;
    private View indicator;

    public LoadingIndicator(Context context, boolean compact) {
        super(context);
        this.compact = compact;
        // The adjacent status text announces progress.
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        setVisibility(GONE);
    }

    public void setLoading(boolean loading) {
        if (loading && ValueAnimator.areAnimatorsEnabled()) {
            if (indicator == null) indicator = createIndicator();
            if (getChildCount() == 0) addView(indicator);
            setVisibility(VISIBLE);
        } else {
            // LetterboxdSpinner stops its animator on detach, not on visibility changes.
            removeAllViews();
            setVisibility(GONE);
        }
    }

    private View createIndicator() {
        Context context = getContext();
        int layout = context.getResources().getIdentifier(
                "item_loading_indicator", "layout", context.getPackageName());
        if (layout != 0) {
            try {
                View row = LayoutInflater.from(context).inflate(layout, this, false);
                if (!compact) return row;
                int id = context.getResources().getIdentifier("spinner", "id", context.getPackageName());
                View spinner = row.findViewById(id);
                if (spinner != null && spinner.getParent() instanceof ViewGroup) {
                    ((ViewGroup) spinner.getParent()).removeView(spinner);
                    spinner.setLayoutParams(new LayoutParams(dp(20), dp(20), Gravity.CENTER));
                    return spinner;
                }
            } catch (InflateException ignored) {
                // A different host version may lack the custom view.
            }
        }
        ProgressBar fallback = new ProgressBar(context, null, android.R.attr.progressBarStyleSmall);
        int size = dp(compact ? 20 : 30);
        LayoutParams params = new LayoutParams(size, size, Gravity.CENTER);
        if (!compact) params.setMargins(0, dp(16), 0, dp(16));
        fallback.setLayoutParams(params);
        return fallback;
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}

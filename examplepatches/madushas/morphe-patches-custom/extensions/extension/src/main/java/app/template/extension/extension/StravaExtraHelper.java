package app.template.extension.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * Injects the "Extra Settings" entry row above Strava's Compose settings list.
 *
 * SettingsFragment.onCreateView returns a bare ComposeView; the patch renames
 * that method and swaps in a wrapper that calls the original, then wraps the
 * result in a vertical column: native-styled header row (title + chevron,
 * theme colors, theme ripple) + divider + the original Compose list.
 * Tap → Extra Settings activity.
 *
 * Idempotent: if the original view is already inside our wrapper (fragment
 * view recreated / re-attached), the existing wrapper is returned unchanged.
 */
public final class StravaExtraHelper {

    private static final String WRAPPER_TAG = "morphe_extra_wrapper";

    private StravaExtraHelper() {
    }

    public static View wrapSettingsView(View original) {
        if (original == null) {
            return null;
        }
        if (original.getParent() instanceof View parent
                && WRAPPER_TAG.equals(parent.getTag())) {
            // Already wrapped — return the column root.
            return (View) parent.getParent();
        }

        Context ctx = original.getContext();

        // ── Header row ──────────────────────────────────────────────────
        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(android.view.Gravity.CENTER_VERTICAL);
        row.setPadding(dp(ctx, 20), dp(ctx, 14), dp(ctx, 20), dp(ctx, 14));

        int textColorPrimary = themeColor(ctx, android.R.attr.textColorPrimary, Color.WHITE);
        int textColorSecondary = themeColor(ctx, android.R.attr.textColorSecondary, Color.GRAY);

        TextView title = new TextView(ctx);
        title.setText("Extra Settings");
        title.setTextSize(17);
        title.setTextColor(textColorPrimary);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        row.addView(title, titleLp);

        TextView chevron = new TextView(ctx);
        chevron.setText("›");
        chevron.setTextSize(22);
        chevron.setTextColor(textColorSecondary);
        row.addView(chevron);

        Drawable ripple = themeRipple(ctx);
        if (ripple != null) {
            row.setBackgroundDrawable(ripple.mutate());
        } else {
            row.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        }
        row.setClickable(true);
        row.setOnClickListener(v -> {
            Context c = v.getContext();
            try {
                // The row's context may be a ContextThemeWrapper, not the
                // Activity — start from the application context with an
                // explicit component + NEW_TASK so it works from any context.
                Context app = c.getApplicationContext();
                Intent intent = new Intent()
                        .setClassName(
                                app.getPackageName(),
                                "app.template.extension.extension.StravaExtraSettingsActivity")
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                c.startActivity(intent);
            } catch (Throwable t) {
                android.widget.Toast.makeText(
                                c,
                                "Extra Settings failed: " + t.getClass().getSimpleName(),
                                android.widget.Toast.LENGTH_LONG)
                        .show();
            }
        });

        // ── Divider between row and list ────────────────────────────────
        View divider = new View(ctx);
        divider.setBackgroundColor(themeColor(ctx, android.R.attr.listDivider, 0x1E000000));
        LinearLayout dividerPad = new LinearLayout(ctx);
        dividerPad.setOrientation(LinearLayout.VERTICAL);
        dividerPad.setPadding(dp(ctx, 20), 0, dp(ctx, 20), 0);
        dividerPad.addView(divider, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(ctx, 1))));

        // ── Column: row + divider + original Compose list ───────────────
        LinearLayout column = new LinearLayout(ctx);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setTag(WRAPPER_TAG);
        column.addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        column.addView(dividerPad, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        column.addView(original, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        FrameLayout wrapper = new FrameLayout(ctx);
        wrapper.addView(column, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return wrapper;
    }

    private static int dp(Context ctx, float v) {
        return Math.round(v * ctx.getResources().getDisplayMetrics().density);
    }

    private static int themeColor(Context ctx, int attr, int fallback) {
        try {
            android.content.res.TypedArray ta = ctx.getTheme().obtainStyledAttributes(
                    new int[]{attr});
            int color = ta.getColor(0, fallback);
            ta.recycle();
            return color;
        } catch (Throwable t) {
            return fallback;
        }
    }

    private static Drawable themeRipple(Context ctx) {
        try {
            android.content.res.TypedArray ta = ctx.getTheme().obtainStyledAttributes(
                    new int[]{android.R.attr.selectableItemBackground});
            Drawable d = ta.getDrawable(0);
            ta.recycle();
            return d;
        } catch (Throwable t) {
            return null;
        }
    }
}

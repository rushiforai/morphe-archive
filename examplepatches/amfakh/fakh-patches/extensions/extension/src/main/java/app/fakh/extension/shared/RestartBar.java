package app.fakh.extension.shared;

import android.app.Activity;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

/** A snackbar-like bar that says a change applies after a restart, with a Restart action. */
public final class RestartBar {
    private static final String TAG = "fakh_restart_bar";

    private RestartBar() {
    }

    /**
     * Shows the bar above the bottom edge of the screen, saying "Restart [app] to apply the change"; a second call
     * replaces the first. It hides itself after a few seconds.
     *
     * @param activity the activity to show it in
     * @param bottom   extra space under the bar, such as the height of the navigation bar, in pixels
     */
    public static void show(Activity activity, int bottom) {
        ViewGroup root = activity.findViewById(android.R.id.content);
        if (root == null) return;
        View old = root.findViewWithTag(TAG);
        if (old != null) root.removeView(old);
        boolean night = MaterialYou.night(activity);
        float density = activity.getResources().getDisplayMetrics().density;
        // The Material 3 inverse surface: light text on a dark bar, and the reverse in the dark theme.
        int surface = night ? 0xFFE6E0E9 : 0xFF322F35;
        int text = night ? 0xFF322F35 : 0xFFF5EFF7;
        int action = night ? 0xFF6750A4 : 0xFFD0BCFF;

        LinearLayout bar = new LinearLayout(activity);
        bar.setTag(TAG);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(Math.round(16 * density), Math.round(6 * density), Math.round(8 * density), Math.round(6 * density));
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(4 * density);
        background.setColor(surface);
        bar.setBackground(background);
        bar.setElevation(6 * density);

        TextView label = new TextView(activity);
        label.setText(I18n.f("Restart %1$s to apply the change", activity.getApplicationInfo().loadLabel(activity.getPackageManager())));
        label.setTextSize(14);
        label.setTextColor(text);
        bar.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));

        TextView restart = new TextView(activity);
        restart.setText(I18n.tr("Restart"));
        restart.setTextSize(14);
        restart.setAllCaps(true);
        restart.setTextColor(action);
        restart.setPadding(Math.round(12 * density), Math.round(12 * density), Math.round(12 * density), Math.round(12 * density));
        restart.setOnClickListener(v -> AppRuntime.restart(activity));
        bar.addView(restart);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM);
        int margin = Math.round(16 * density);
        params.setMargins(margin, margin, margin, margin + bottom);
        root.addView(bar, params);
        bar.postDelayed(() -> root.removeView(bar), 6000);
    }
}

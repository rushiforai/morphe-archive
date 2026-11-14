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
        show(activity, bottom, false);
    }

    /**
     * Like {@link #show(Activity, int)}, with the Restart action in the wallpaper's accent when its colors apply.
     *
     * @param activity the activity to show it in
     * @param bottom   extra space under the bar, in pixels
     * @param dynamic  whether the user turned Material You on
     */
    public static void show(Activity activity, int bottom, boolean dynamic) {
        ViewGroup root = activity.findViewById(android.R.id.content);
        if (root == null) return;
        View old = root.findViewWithTag(TAG);
        if (old != null) root.removeView(old);
        boolean night = MaterialYou.night(activity);
        float density = activity.getResources().getDisplayMetrics().density;
        // A dark bar with light text in both themes: the Material 3 inverse surface in the light theme, and its
        // highest surface container in the dark one, so the bar never lights up a dark screen.
        int surface = night ? 0xFF36343B : 0xFF322F35;
        int text = night ? 0xFFE6E0E9 : 0xFFF5EFF7;
        // The inverse primary of a dark bar is the wallpaper's tone 80, in both themes.
        int action = MaterialYou.wallpaper(dynamic) ? activity.getColor(android.R.color.system_accent1_200) : 0xFF8AB4F8;

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

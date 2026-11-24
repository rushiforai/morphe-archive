package app.tvpatches.extension.youtubetv;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;

/**
 * FaroTV splash screen. The "Custom branding" patch turns off Cobalt's built-in splash (YouTube
 * logo) and shows this view on top of the window instead: the app icon and name on the FaroTV
 * gradient. It is removed when the web app calls hideSplashScreen, or after a time limit.
 */
@SuppressWarnings("unused")
public final class SplashOverlay {
    private static final long MAX_SHOW_MS = 20000;
    private static WeakReference<Dialog> current = new WeakReference<>(null);

    private SplashOverlay() {
    }

    /** Called at the end of CobaltActivity.onCreate. */
    public static void show(Activity activity) {
        Log.i(TvScripts.TAG, "splash show called");
        try {
            String name = TvScripts.brandingName();
            if (name.isEmpty() || current.get() != null) return;

            float u = Math.max(activity.getResources().getDisplayMetrics().widthPixels,
                    activity.getResources().getDisplayMetrics().heightPixels) / 1280f;

            FrameLayout root = new FrameLayout(activity);
            root.setBackground(new GradientDrawable(GradientDrawable.Orientation.TL_BR,
                    new int[]{0xFF0B1F3A, 0xFF0E6E7A}));
            root.setClickable(true);

            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);

            ImageView icon = new ImageView(activity);
            Drawable appIcon = activity.getPackageManager().getApplicationIcon(activity.getPackageName());
            icon.setImageDrawable(appIcon);
            int size = Math.round(120 * u);
            row.addView(icon, new LinearLayout.LayoutParams(size, size));

            TextView text = new TextView(activity);
            SpannableString label = new SpannableString(name);
            if (name.length() > 2 && name.endsWith("TV")) {
                label.setSpan(new ForegroundColorSpan(0xFFFFB43A), name.length() - 2, name.length(),
                        Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            text.setText(label);
            text.setTextColor(0xFFFFFFFF);
            text.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
            text.setTextSize(TypedValue.COMPLEX_UNIT_PX, 72 * u);
            LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            textParams.leftMargin = Math.round(28 * u);
            row.addView(text, textParams);

            root.addView(row, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));

            // Its own window: Cobalt draws the page on a surface that covers normal views.
            Dialog dialog = new Dialog(activity, android.R.style.Theme_Black_NoTitleBar_Fullscreen);
            dialog.setContentView(root);
            dialog.setCancelable(false);
            Window window = dialog.getWindow();
            if (window != null) {
                window.setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.MATCH_PARENT);
                window.setWindowAnimations(0);
            }
            dialog.show();
            current = new WeakReference<>(dialog);
            Log.i(TvScripts.TAG, "splash overlay shown");

            new Handler(Looper.getMainLooper()).postDelayed(SplashOverlay::hide, MAX_SHOW_MS);
        } catch (Throwable t) {
            Log.w(TvScripts.TAG, "splash overlay failed", t);
        }
    }

    /** Called from StarboardBridge.hideSplashScreen (any thread). */
    public static void hide() {
        // A short delay: the web app reports "ready" slightly before it has drawn.
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            Dialog dialog = current.get();
            Log.i(TvScripts.TAG, "splash hide requested (shown=" + (dialog != null) + ")");
            if (dialog == null) return;
            current = new WeakReference<>(null);
            Window window = dialog.getWindow();
            View view = window != null ? window.getDecorView() : null;
            if (view == null) {
                dialog.dismiss();
                return;
            }
            view.animate().alpha(0f).setDuration(300).withEndAction(() -> {
                try {
                    dialog.dismiss();
                } catch (Exception ignored) {
                }
            }).start();
        }, 700);
    }
}

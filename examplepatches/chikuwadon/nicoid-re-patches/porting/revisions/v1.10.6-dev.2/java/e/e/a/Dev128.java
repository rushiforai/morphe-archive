package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.preference.PreferenceManager;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Issue #113: do not steal a native scroll for vertical reversal strokes. */
public final class Dev128 {
    public static final String KEY = "gesture_vertical_reversal_enabled";
    private Dev128() {}

    public static boolean allowClaim(Context context, String pattern) {
        if (!GestureTurnPolicy128.verticalReversal(pattern)) return true;
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        return GestureTurnPolicy128.allowClaim(
                prefs.getBoolean(KEY, false), pattern);
    }

    public static void reset(Context context) {
        // The default is OFF for both upgraded and new installations.
        PreferenceManager.getDefaultSharedPreferences(context)
                .edit().remove(KEY).apply();
    }

    private static int dp(Context c, float dip) {
        return (int) (c.getResources().getDisplayMetrics().density * dip + 0.5f);
    }

    public static void install(Activity activity, LinearLayout box) {
        if (activity == null || box == null || activity.isFinishing()) return;
        final Context c = activity;
        final SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(c);
        final String label = Dev112.tr(c,
                "上下の折り返し（↑↓・↓↑）を認識",
                "Recognize vertical reversals (↑↓ / ↓↑)",
                "辨識上下折返（↑↓ / ↓↑）");
        final String description = Dev112.tr(c,
                "OFFの場合、上下スクロール中の方向転換をジェスチャーとして認識しません",
                "When off, scrolling direction reversals are not recognized as gestures",
                "關閉後，上下捲動時的方向反轉不會被辨識為手勢");

        CheckBox option = new CheckBox(c);
        option.setText(label);
        option.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        option.setChecked(prefs.getBoolean(KEY, false));
        option.setOnCheckedChangeListener((button, checked) ->
                prefs.edit().putBoolean(KEY, checked).apply());
        // Use the application's existing accent instead of the Android default.
        try {
            Class<?> panel = Class.forName("e.e.a.PanelUi");
            java.lang.reflect.Method tint =
                    panel.getDeclaredMethod("tint", CompoundButton.class);
            tint.setAccessible(true);
            tint.invoke(null, option);
        } catch (ReflectiveOperationException ignored) {
            // The control remains usable even on an older target.
        }

        TextView summary = new TextView(c);
        summary.setText(description);
        summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        summary.setAlpha(0.75f);
        summary.setPadding(dp(c, 32), 0, dp(c, 8), dp(c, 5));
        box.addView(option,
                new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));
        box.addView(summary,
                new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));
    }
}

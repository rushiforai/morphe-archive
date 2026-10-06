package rhubarbshoelaces.patches.maps.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

public final class ThemeHelper {

    private static Boolean hybridThemeCached = null;

    // --- HYBRID THEME GETTER FOR BYTECODE HOOK ---
    public static boolean isHybridThemeEnabled() {
        if (hybridThemeCached != null) {
            return hybridThemeCached;
        }
        try {
            android.app.Application app = (android.app.Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            if (app != null) {
                SharedPreferences prefs = app.getSharedPreferences("ungoogled_prefs", Context.MODE_PRIVATE);
                hybridThemeCached = prefs.getBoolean("hybrid_theme", false);
                return hybridThemeCached;
            }
        } catch (Exception ignored) {}
        return false;
    }

    // --- UI INJECTOR: HYBRID THEME ROW (WITH SLIDING SWITCH & AUTO-RESTART) ---
    public static void addHybridThemeRow(Activity customizationActivity) {
        try {
            ViewGroup root = (ViewGroup) customizationActivity.findViewById(android.R.id.content);
            if (root == null || root.getChildCount() == 0) return;

            ViewGroup mainLayout = (ViewGroup) root.getChildAt(0);
            for (int i = 0; i < mainLayout.getChildCount(); i++) {
                View child = mainLayout.getChildAt(i);
                if (child instanceof ScrollView) {
                    ScrollView sv = (ScrollView) child;
                    if (sv.getChildCount() > 0 && sv.getChildAt(0) instanceof LinearLayout) {
                        LinearLayout body = (LinearLayout) sv.getChildAt(0);

                        SharedPreferences settingsPrefs = customizationActivity.getSharedPreferences("settings_preference", Context.MODE_PRIVATE);
                        String darkMode = settingsPrefs.getString("dark_mode", "FOLLOW_SYSTEM");
                        boolean systemNight = (customizationActivity.getResources().getConfiguration().uiMode & android.content.res.Configuration.UI_MODE_NIGHT_MASK) == android.content.res.Configuration.UI_MODE_NIGHT_YES;
                        boolean isDark = "ON".equals(darkMode) || (!"OFF".equals(darkMode) && systemNight);

                        int titleColor = isDark ? 0xFFE3E3E3 : 0xFF1B1B1F;
                        int subtitleColor = isDark ? 0xFFC4C7C5 : 0xFF5F6368;

                        // Horizontal Container Layout
                        LinearLayout rowLayout = new LinearLayout(customizationActivity);
                        rowLayout.setOrientation(LinearLayout.HORIZONTAL);
                        rowLayout.setGravity(Gravity.CENTER_VERTICAL);
                        rowLayout.setPadding(dp(customizationActivity, 20), dp(customizationActivity, 14), dp(customizationActivity, 20), dp(customizationActivity, 14));
                        rowLayout.setClickable(true);
                        rowLayout.setFocusable(true);

                        TypedValue outValue = new TypedValue();
                        customizationActivity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, outValue, true);
                        rowLayout.setBackgroundResource(outValue.resourceId);

                        // Text Layout (Left side, Weight = 1)
                        LinearLayout textContainer = new LinearLayout(customizationActivity);
                        textContainer.setOrientation(LinearLayout.VERTICAL);

                        TextView title = new TextView(customizationActivity);
                        title.setText("Light Map in Dark Mode");
                        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
                        title.setTextColor(titleColor);

                        TextView subtitle = new TextView(customizationActivity);
                        subtitle.setText("Force daytime map canvas when UI is in Dark Mode");
                        subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                        subtitle.setTextColor(subtitleColor);
                        subtitle.setPadding(0, dp(customizationActivity, 2), 0, 0);

                        textContainer.addView(title);
                        textContainer.addView(subtitle);

                        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1.0f);
                        rowLayout.addView(textContainer, textParams);

                        // Sliding Switch Widget (Right side)
                        SharedPreferences prefs = customizationActivity.getSharedPreferences("ungoogled_prefs", Context.MODE_PRIVATE);
                        boolean enabled = prefs.getBoolean("hybrid_theme", false);

                        Switch toggleSwitch = new Switch(customizationActivity);
                        toggleSwitch.setChecked(enabled);
                        toggleSwitch.setFocusable(false);
                        toggleSwitch.setClickable(false);

                        LinearLayout.LayoutParams switchParams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
                        switchParams.setMarginStart(dp(customizationActivity, 16));
                        rowLayout.addView(toggleSwitch, switchParams);

                        // Row Click Handler (Toggles Switch & Auto-Restarts)
                        rowLayout.setOnClickListener(v -> {
                            boolean newState = !prefs.getBoolean("hybrid_theme", false);
                            prefs.edit().putBoolean("hybrid_theme", newState).apply();
                            hybridThemeCached = newState;
                            toggleSwitch.setChecked(newState);

                            Context app = customizationActivity.getApplicationContext();
                            Toast.makeText(app, "Restarting Maps to apply theme...", Toast.LENGTH_SHORT).show();

                            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                                Intent intent = app.getPackageManager().getLaunchIntentForPackage(app.getPackageName());
                                if (intent != null) {
                                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                                    app.startActivity(intent);
                                }
                                Runtime.getRuntime().exit(0);
                            }, 500);
                        });

                        body.addView(rowLayout);
                        break;
                    }
                }
            }
        } catch (Exception ignored) {}
    }

    private static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics());
    }
}
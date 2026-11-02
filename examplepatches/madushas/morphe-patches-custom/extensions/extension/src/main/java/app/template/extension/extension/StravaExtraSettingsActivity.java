package app.template.extension.extension;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

/**
 * Morphe "Extra Settings" screen for Strava — programmatic UI only (pdb
 * pattern), themed with the app's own StravaPreferenceTheme at runtime so
 * status bar, background and typography match the native Settings screen.
 *
 * Phase 1 settings:
 *   - Theme mode (System / Light / Dark) — writes the app's own
 *     pref.appearance.value (int ordinal: 0=DARK, 1=LIGHT, 2=SYSTEM) and
 *     applies it globally via UiModeManager.setApplicationNightMode (API 31+,
 *     the same call Strava's AppearanceActivity flow ends in). Verified
 *     on device.
 *   - Accent color — read-only display; the accent is a BUILD-TIME patch
 *     option (stravaAccent stringOption, ExtraSettingsPatch.kt).
 *   - About — patch info.
 */
public final class StravaExtraSettingsActivity extends Activity {

    private int textColorPrimary = Color.WHITE;
    private int textColorSecondary = Color.LTGRAY;
    private int backgroundColor = Color.BLACK;
    private int accent = Color.parseColor("#FC5200");

    private SharedPreferences prefs;

    private int dp(float v) {
        return Math.round(v * getResources().getDisplayMetrics().density);
    }

    // ── System-window insets ────────────────────────────────────────────────
    //
    // Strava's own window flags (see `dumpsys window` on device):
    //   fl = LAYOUT_IN_SCREEN LAYOUT_INSET_DECOR DRAWS_SYSTEM_BAR_BACKGROUNDS
    //        + pfl EDGE_TO_EDGE_ENFORCED, no FLAG_TRANSLUCENT_STATUS
    // i.e. the activity fills the whole display and the framework hands the
    // system-bar insets to the app, so a programmatic root view has to pad
    // itself. Defensive window flags + a nav-bar colour keep the bars opaque
    // and app-coloured (the theme's StravaTheme.TranslucentStatusBar sibling
    // sets windowTranslucentStatus, and any of the app's translucent themes
    // being applied at runtime would otherwise leave the bar transparent).

    /** Make the system bars opaque and app-coloured, and drop any translucent-status flag. */
    private void applyWindowInsetsFixes() {
        Window window = getWindow();
        try {
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);

            // Same colour the native Settings screen uses (StravaTheme.Base:
            // android:statusBarColor = @color/navbar_background), so the bar
            // blends with our app-bar background.
            int[] attrs = {android.R.attr.statusBarColor, android.R.attr.navigationBarColor};
            android.content.res.TypedArray ta = getTheme().obtainStyledAttributes(attrs);
            int statusColor = ta.getColor(0, backgroundColor);
            int navColor = ta.getColor(1, statusColor);
            ta.recycle();
            if (statusColor != 0) {
                window.setStatusBarColor(statusColor);
            }
            if (navColor != 0) {
                window.setNavigationBarColor(navColor);
            }

            // Light backgrounds need dark status-bar icons (deprecated flag,
            // but the only pure-framework way pre-WindowInsetsController).
            int lum = (int) (0.299 * Color.red(backgroundColor)
                    + 0.587 * Color.green(backgroundColor)
                    + 0.114 * Color.blue(backgroundColor));
            if (lum > 127) {
                View decor = getWindow().getDecorView();
                decor.setSystemUiVisibility(
                        decor.getSystemUiVisibility() | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Framework status-bar height in px. API 30+ reads the real inset from
     * WindowMetrics — reliable under Android 15 edge-to-edge enforcement and
     * with display cutouts; below API 30, the classic status_bar_height
     * dimen, with a 24dp default when neither is available.
     */
    private int statusBarHeight() {
        try {
            if (android.os.Build.VERSION.SDK_INT >= 30) {
                WindowInsets wm = getWindowManager().getCurrentWindowMetrics()
                        .getWindowInsets();
                return wm.getInsetsIgnoringVisibility(
                        WindowInsets.Type.statusBars()).top;
            }
            int id = getResources().getIdentifier("status_bar_height", "dimen", "android");
            if (id != 0) {
                return getResources().getDimensionPixelSize(id);
            }
        } catch (Throwable ignored) {
        }
        return Math.round(24 * getResources().getDisplayMetrics().density);
    }

    /** Framework navigation-bar height in px (0 when unavailable). */
    private int seededNavigationBarHeight() {
        try {
            int id = getResources().getIdentifier("navigation_bar_height", "dimen", "android");
            if (id != 0) {
                return getResources().getDimensionPixelSize(id);
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    private static int safeInsetTop(WindowInsets insets) {
        try {
            return insets.getSystemWindowInsetTop();
        } catch (Throwable t) {
            return 0;
        }
    }

    private static int safeInsetBottom(WindowInsets insets) {
        try {
            return insets.getSystemWindowInsetBottom();
        } catch (Throwable t) {
            return 0;
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        prefs = StravaAccentHelper.prefs(this);


        // The manifest android:theme attribute can be dropped by the patch
        // pipeline's manifest serializer — apply the settings theme at runtime
        // so typography/status bar still match the native Settings screen.
        try {
            int themeId = getResources().getIdentifier(
                    "StravaPreferenceTheme", "style", getPackageName());
            if (themeId != 0) {
                setTheme(themeId);
            }
        } catch (Throwable ignored) {
        }

        resolveThemeColors();

        applyWindowInsetsFixes();

        // Native-style root: app-bar header (back arrow + title) + scrollable
        // content, matching the app's own toolbar look via theme colors.
        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);

        LinearLayout appBar = new LinearLayout(this);
        appBar.setOrientation(LinearLayout.HORIZONTAL);
        appBar.setGravity(Gravity.CENTER_VERTICAL);
        appBar.setBackgroundColor(backgroundColor);
        int barPad = dp(12);
        appBar.setPadding(barPad, 0, barPad, 0);
        appBar.setElevation(dp(4));

        TextView back = new TextView(this);
        // Prefer the app's real AppCompat back-arrow drawable over a glyph.
        android.graphics.drawable.Drawable backIcon = null;
        try {
            int backId = getResources().getIdentifier(
                    "abc_ic_ab_back_material", "drawable", getPackageName());
            if (backId != 0) {
                backIcon = getDrawable(backId);
            }
        } catch (Throwable ignored) {
        }
        if (backIcon != null) {
            back.setText("");
            back.setCompoundDrawablesWithIntrinsicBounds(backIcon, null, null, null);
        } else {
            back.setText("←");
        }
        back.setTextSize(22);
        back.setTextColor(textColorPrimary);
        back.setPadding(0, dp(14), dp(22), dp(14));
        back.setOnClickListener(v -> finish());
        back.setGravity(Gravity.CENTER_VERTICAL);
        appBar.addView(back);

        TextView title = new TextView(this);
        title.setText("Extra Settings");
        title.setTextSize(19);
        title.setTypeface(null, android.graphics.Typeface.BOLD);
        title.setTextColor(textColorPrimary);
        appBar.addView(title);

        ScrollView scroll = new ScrollView(this);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(20);
        root.setPadding(pad, dp(8), pad, dp(24));
        scroll.addView(root, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        buildUpsellSection(root);
        buildRecordingSection(root);
        buildPowerSection(root);
        buildAccentSection(root);
        buildAboutSection(root);

        page.addView(appBar, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(56)));
        page.addView(scroll, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // The window is edge-to-edge (targetSdk 34+ / Android 15 behaviour),
        // so the framework does NOT inset our content for the system bars:
        // without padding the app bar draws UNDER the status bar and the back
        // arrow ends up unclickable. Pad the root by the real inset instead.
        final int seededStatusBarHeight = statusBarHeight();
        page.setPadding(0, seededStatusBarHeight, 0, seededNavigationBarHeight());
        page.setOnApplyWindowInsetsListener((v, insets) -> {
            // Never shrink and never add twice: take the larger of what we
            // seeded and what the framework dispatches (covers display cutouts
            // and landscape/tablet insets).
            int top = Math.max(v.getPaddingTop(), safeInsetTop(insets));
            int bottom = Math.max(v.getPaddingBottom(), safeInsetBottom(insets));
            v.setPadding(v.getPaddingLeft(), top, v.getPaddingRight(), bottom);
            // Do not consume — children must keep seeing the insets too.
            return insets;
        });
        setContentView(page);
    }

    private void resolveThemeColors() {
        try {
            int[] attrs = {android.R.attr.textColorPrimary, android.R.attr.textColorSecondary,
                    android.R.attr.colorAccent, android.R.attr.windowBackground};
            android.content.res.TypedArray ta = getTheme().obtainStyledAttributes(attrs);
            textColorPrimary = ta.getColor(0, textColorPrimary);
            textColorSecondary = ta.getColor(1, textColorSecondary);
            accent = ta.getColor(2, accent);
            backgroundColor = ta.getColor(3, backgroundColor);
            ta.recycle();
        } catch (Throwable ignored) {
        }
    }

    private TextView header(String text) {
        TextView tv = new TextView(this);
        tv.setText(text);
        tv.setAllCaps(true);
        tv.setTextSize(13);
        tv.setTextColor(textColorSecondary);
        tv.setPadding(0, dp(20), 0, dp(8));
        return tv;
    }

    // ── Upsell toggles (runtime — the patch gates read these prefs) ────────

    private void buildUpsellSection(LinearLayout root) {
        root.addView(header("Hide upsells & promos"));

        switchRow(root, "Hide \"Time to flex\" replay card",
                "morphe.hide.activity-replay-upsell-card", true);
        switchRow(root, "Hide \"Your predictions are ready\" banner",
                "morphe.hide.subscriber-feature-header", true);
        switchRow(root, "Hide \"See how far you've come\" banner",
                "morphe.hide.recap-progress-entrypoint", true);
        switchRow(root, "Hide \"Your predictions are ready\" card",
                "morphe.hide.performance-predictions-banner", true);
        switchRow(root, "Hide Data Peek upsell carousel",
                "morphe.hide.data-peek-upsell", true);
        switchRow(root, "Hide Maps \"Explore anywhere\" card",
                "morphe.hide.maps-data-peek", true);

        root.addView(header("Content"));
        switchRow(root, "Hide celebration popups",
                "morphe.hide.celebrations", false);

        // Subscription preview banners: one switch, two module types.
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(8), dp(12), dp(8), dp(12));
        TextView tv = new TextView(this);
        tv.setText("Hide subscription preview banners");
        tv.setTextSize(16);
        tv.setTextColor(textColorPrimary);
        tv.setLayoutParams(new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(tv);
        Switch sw = new Switch(this);
        boolean on = prefs.getBoolean("morphe.hide.sub-preview-banner-large", true)
                && prefs.getBoolean("morphe.hide.sub-preview-banner-small", true);
        sw.setChecked(on);
        sw.setOnCheckedChangeListener((b, checked) -> prefs.edit()
                .putBoolean("morphe.hide.sub-preview-banner-large", checked)
                .putBoolean("morphe.hide.sub-preview-banner-small", checked)
                .apply());
        row.addView(sw);
        root.addView(row);
    }

    private void switchRow(LinearLayout root, String title, String key, boolean def) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(4), dp(16), dp(4), dp(16));
        TextView tv = new TextView(this);
        tv.setText(title);
        tv.setTextSize(16);
        tv.setTextColor(textColorPrimary);
        tv.setLayoutParams(new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        tv.setPadding(dp(8), 0, dp(16), 0);
        row.addView(tv);
        Switch sw = new Switch(this);
        sw.setChecked(prefs.getBoolean(key, def));
        sw.setOnCheckedChangeListener((b, checked) ->
                prefs.edit().putBoolean(key, checked).apply());
        row.addView(sw);
        root.addView(row);
        root.addView(divider());
    }

    /** Thin separator matching native list rows. */
    private View divider() {
        View v = new View(this);
        v.setBackgroundColor((textColorSecondary & 0x00FFFFFF) | 0x33000000);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(1)));
        lp.leftMargin = dp(12);
        lp.rightMargin = dp(12);
        v.setLayoutParams(lp);
        return v;
    }

    // ── Accent (read-only; build-time option) ───────────────────────────────

    private void buildAccentSection(LinearLayout root) {
        root.addView(header("Accent color"));

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        View swatch = new View(this);
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setColor(accent);
        swatch.setBackgroundDrawable(circle);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(28), dp(28));
        lp.gravity = Gravity.CENTER_VERTICAL;
        lp.rightMargin = dp(12);
        row.addView(swatch, lp);

        TextView label = new TextView(this);
        label.setText("Set when building the patch (stravaAccent option)");
        label.setTextSize(14);
        label.setTextColor(textColorSecondary);
        row.addView(label);

        root.addView(row);
    }

    // ── About ───────────────────────────────────────────────────────────────

    /**
     * Safe power-features: toggles that drive Strava's OWN hidden debug
     * prefs (same keys its SU Tools screens write; verified in
     * res/xml/debug_tools_preferences.xml + Modular UI Tools). All take
     * effect on next app start. Risky switches (staging/canary/proxy) are
     * deliberately NOT surfaced.
     */
    private void buildRecordingSection(LinearLayout root) {
        root.addView(header("Recording"));
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(4), dp(16), dp(4), dp(16));
        TextView tv = new TextView(this);
        tv.setText("Lock recording screen touches");
        tv.setTextSize(16);
        tv.setTextColor(textColorPrimary);
        tv.setLayoutParams(new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        tv.setPadding(dp(8), 0, dp(16), 0);
        row.addView(tv);
        Switch sw = new Switch(this);
        sw.setChecked(prefs.getBoolean("morphe.record_touch_lock", true));
        sw.setOnCheckedChangeListener((b, checked) -> {
            prefs.edit().putBoolean("morphe.record_touch_lock", checked).apply();
            StravaTouchLock.applyTo(this, checked);
        });
        row.addView(sw);
        root.addView(row);
        root.addView(divider());
    }

    private void buildPowerSection(LinearLayout root) {
        root.addView(header("Power features"));
        switchRow(root, "Highlight modular-UI modules (debug)",
                "pref.modular_ui_dev_tools_type_overlay", false);
        switchRow(root, "Show activity name overlay (debug)",
                "pref.show_activity_name_enabled", false);
        switchRow(root, "Debug font",
                "pref.debug_font_enabled", false);
    }

    private void buildAboutSection(LinearLayout root) {
        root.addView(header("About"));
        String text = "Morphe Extra Settings\n"
                + "Patch set 1.23.0-strava.2\n"
                + "Active: Unlock Premium, OTP password login, upsell removal,\n"
                + "telemetry removal, signature spoof.\n"
                + "Toggles apply immediately — no restart needed.\n"
                + "Strava " + versionName();
        TextView tv = new TextView(this);
        tv.setText(text);
        tv.setTextSize(13);
        tv.setTextColor(textColorSecondary);
        tv.setLineSpacing(dp(2), 1f);
        root.addView(tv);
    }

    private String versionName() {
        try {
            return getPackageManager().getPackageInfo(getPackageName(), 0).versionName;
        } catch (Throwable t) {
            return "?";
        }
    }
}

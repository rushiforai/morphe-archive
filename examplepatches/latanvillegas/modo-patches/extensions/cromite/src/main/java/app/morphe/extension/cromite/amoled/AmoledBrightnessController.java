package app.morphe.extension.cromite.amoled;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.content.res.ColorStateList;
import android.widget.ImageView;
import android.content.res.Configuration;
import android.view.View;
import android.util.Log;
import android.view.Gravity;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.graphics.drawable.ColorDrawable;
import android.view.ContextThemeWrapper;
import android.view.Window;
import android.view.WindowManager;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.PopupWindow;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

/**
 * Runtime portion of Cromite patch 14. Android-framework-only implementation.
 *
 * This class must be packaged into the patched APK before adding bytecode calls
 * to it. The patcher Kotlin source is NOT itself part of the app runtime.
 */
public final class AmoledBrightnessController {
    private static final String PREFS = "morphe_cromite_amoled";
    private static final String KEY_MANUAL = "manual_window_brightness";
    private static final String KEY_BRIGHTNESS = "window_brightness_percent";
    private static final String KEY_WEB = "web_luminance_percent";
    private static final String KEY_AMOLED = "amoled_enabled";
    private static final String KEY_THEME = "browser_theme";
    private static final String KEY_WEB_MODE = "web_darkening_mode";
    private static volatile Context browserContext;

    private AmoledBrightnessController() {}

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext()
                .getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /**
     * Called from ChromeTabbedActivity.onResume and whenever the dialog
     * changes the window-brightness setting. No WRITE_SETTINGS permission.
     */
    public static void applyWindowBrightness(Activity activity) {
        if (activity == null) return;
        browserContext = activity.getApplicationContext();
        SharedPreferences p = prefs(activity);
        float value = -1.0f; // Android: follow system brightness
        if (p.getBoolean(KEY_MANUAL, false)) {
            int percent = clamp(p.getInt(KEY_BRIGHTNESS, 50));
            // Android WindowManager expects (0,1] for explicit brightness.
            // Map UI 0% to a very dim but nonzero value, not the system sentinel.
            value = Math.max(0.01f, percent / 100.0f);
        }
        Window window = activity.getWindow();
        if (window == null) return;
        WindowManager.LayoutParams params = window.getAttributes();
        params.screenBrightness = value;
        window.setAttributes(params);
        applyTabletStatusBar(activity);
    }

    /** Native Cromite Force Tablet Mode switch, stored in Lm13;.a. */
    private static boolean forceTabletModeEnabled() {
        try {
            Class<?> holder = Class.forName("m13", false,
                    AmoledBrightnessController.class.getClassLoader());
            java.lang.reflect.Field field = holder.getDeclaredField("a");
            field.setAccessible(true);
            Object value = field.get(null);
            return value instanceof SharedPreferences &&
                    ((SharedPreferences) value).getBoolean("force_tablet_ui_enabled", false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static final String STATUS_DIAG_TAG = "MorpheStatusDiag";

    /** Diagnostic-only: log real window insets on each layout/insets pass. */
    private static void installStatusDiagnostics(Activity activity, View decor) {
        if (decor.getTag(0x7e0200a1) != null) return;
        decor.setTag(0x7e0200a1, Boolean.TRUE);
        decor.addOnLayoutChangeListener((view, l, t, r, b, ol, ot, orr, ob) ->
                logStatusSnapshot(activity, "layout"));
        decor.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View v) {
                logStatusSnapshot(activity, "attached");
            }
            @Override public void onViewDetachedFromWindow(View v) {
                Log.i(STATUS_DIAG_TAG, "detached activity=" + activity.getClass().getName());
            }
        });
    }

    private static void logStatusSnapshot(Activity activity, String stage) {
        Window window = activity.getWindow();
        if (window == null) return;
        View decor = window.getDecorView();
        WindowInsets insets = decor.getRootWindowInsets();
        String visible = "unknown";
        if (insets != null && android.os.Build.VERSION.SDK_INT >= 30) {
            visible = String.valueOf(insets.isVisible(WindowInsets.Type.statusBars()));
        }
        Log.i(STATUS_DIAG_TAG, stage
                + " activity=" + activity.getClass().getName()
                + " tablet=" + forceTabletModeEnabled()
                + " statusVisible=" + visible
                + " flags=0x" + Integer.toHexString(window.getAttributes().flags)
                + " systemUi=0x" + Integer.toHexString(decor.getSystemUiVisibility())
                + " attached=" + decor.isAttachedToWindow());
    }

    /** Diagnostic build: capture calls and subsequent status-bar visibility. */
    public static void applyTabletStatusBar(Activity activity) {
        if (activity == null) return;
        Window window = activity.getWindow();
        if (window == null) return;
        View decor = window.getDecorView();
        boolean tablet = forceTabletModeEnabled();
        installStatusDiagnostics(activity, decor);
        logStatusSnapshot(activity, "before");
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            android.view.WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                if (tablet) {
                    controller.hide(WindowInsets.Type.statusBars());
                } else {
                    controller.show(WindowInsets.Type.statusBars());
                }
            }
            Log.i(STATUS_DIAG_TAG, "request=" + (tablet ? "hide" : "show")
                    + " controller=" + (controller != null)
                    + " activity=" + activity.getClass().getName());
        } else if (tablet) {
            window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        } else {
            window.clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        }
        logStatusSnapshot(activity, "after");
        decor.post(() -> logStatusSnapshot(activity, "posted"));
    }

    /** Browser-only enforcement for Android 15 edge-to-edge tab strip. */
    private static void forceBrowserStatusBar(Activity activity) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        Window window = activity.getWindow();
        if (window == null) return;
        View decor = window.getDecorView();
        boolean tablet = forceTabletModeEnabled();
        // The Chromium tab strip already draws behind the system status bar.
        // Request fullscreen at the Window level, not just via WindowInsetsController.
        // Never change navigation-bar visibility or other Chromium UI flags.
        if (tablet) {
            window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        } else {
            window.clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        }
        int ui = decor.getSystemUiVisibility();
        int fullscreen = View.SYSTEM_UI_FLAG_FULLSCREEN;
        int next = tablet ? ui | fullscreen : ui & ~fullscreen;
        if (ui != next) decor.setSystemUiVisibility(next);
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            android.view.WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                if (tablet) controller.hide(WindowInsets.Type.statusBars());
                else controller.show(WindowInsets.Type.statusBars());
            }
        }
        logStatusSnapshot(activity, "browser-enforced");
    }

    /** Called only from the verified ChromeTabbedActivity resume/focus hooks. */
    public static void applyBrowserTabletStatusBar(Activity activity) {
        Log.i(STATUS_DIAG_TAG, "browser-hook-enter activity="
                + (activity == null ? "null" : activity.getClass().getName()));
        if (activity == null) return;
        // The browser lifecycle hook is verified and runs before any web-content
        // decision. Retain only the application context; never retain Activity.
        browserContext = activity.getApplicationContext();
        forceBrowserStatusBar(activity);
        Window window = activity.getWindow();
        if (window == null) return;
        View decor = window.getDecorView();
        // Chromium can set its own system UI during the same focus/resume pass.
        // Reapply once after that dispatch without a persistent layout loop.
        decor.post(() -> forceBrowserStatusBar(activity));
    }

    public static int webLuminancePercent(Context context) {
        return clamp(prefs(context).getInt(KEY_WEB, 100));
    }

    public static boolean amoledEnabled(Context context) {
        return prefs(context).getBoolean(KEY_AMOLED, false);
    }

    /**
     * Web-content theme policy, independent of the Morphe AMOLED dialog.
     * Native Cromite Theme is authoritative: System follows Android night mode,
     * Light requests light content, and Dark requests dark content.
     *
     * This method is a policy decision only. It must be called from a verified
     * Chromium WebContents darkening hook before it can affect rendered pages.
     */
    public static boolean shouldAutoDarkenWebContents() {
        Context context = browserContext;
        return context != null && automaticWebDarkeningEnabled(context);
    }

    public static boolean automaticWebDarkeningEnabled(Context context) {
        if (context == null) return false;
        int selected = nativeThemeSetting();
        if (selected == 2) return true;
        if (selected == 1) return false;
        return (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    /**
     * Cromite 153.0.8010.37 native theme preference:
     * 0 = system, 1 = light, 2 = dark.
     * Verified against Liu8.a() and Lb3f.c0() in the original DEX.
     * The SharedPreferences holder is Lm13;.a, not the Morphe dialog prefs.
     */
    static Context browserApplicationContext() {
        return browserContext;
    }

    static int nativeThemeSelection() {
        return nativeThemeSetting();
    }

    private static int nativeThemeSetting() {
        try {
            Class<?> holder = Class.forName("m13", false,
                    AmoledBrightnessController.class.getClassLoader());
            java.lang.reflect.Field preferenceField = holder.getDeclaredField("a");
            preferenceField.setAccessible(true);
            Object value = preferenceField.get(null);
            if (value instanceof SharedPreferences) {
                int selected = ((SharedPreferences) value).getInt("ui_theme_setting", -1);
                if (selected >= 0 && selected <= 2) return selected;
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // On a missing/changed obfuscated field, follow Android system.
        }
        return 0;
    }

    /** Resolve the native Cromite choice, following Android only for System. */
    public static int resolvedPureThemeColor(Context context) {
        int selected = nativeThemeSetting();
        boolean dark = selected == 2 || (selected == 0
                && (context.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES);
        return dark ? Color.BLACK : Color.WHITE;
    }

    /** Foreground paired with the selected pure surface, including Android System mode. */
    public static int resolvedPureThemeForeground(Context context) {
        return resolvedPureThemeColor(context) == Color.BLACK ? Color.WHITE : Color.BLACK;
    }

    /** Recolors a verified native background setter without touching scratch registers. */
    public static void applyNativeSurfaceBackground(View view) {
        if (view == null) return;
        view.setBackgroundColor(resolvedPureThemeColor(view.getContext()));
    }

    /** Scope foreground changes to the verified menu subtree, never to WebContents. */
    public static void applyNativeMenuSurface(View root) {
        if (root == null) return;
        int background = resolvedPureThemeColor(root.getContext());
        int foreground = resolvedPureThemeForeground(root.getContext());
        root.setBackgroundColor(background);
        recolorMenuSubtree(root, background, foreground);
        // Popup content can receive its own native backgrounds after setContentView.
        // Reapply to this popup subtree on its next layout, without touching WebContents.
        root.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override public void onLayoutChange(View view, int left, int top, int right,
                    int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
                view.removeOnLayoutChangeListener(this);
                int bg = resolvedPureThemeColor(view.getContext());
                recolorMenuSubtree(view, bg, bg == Color.BLACK ? Color.WHITE : Color.BLACK);
            }
        });
    }

    private static void recolorMenuSubtree(View node, int background, int foreground) {
        // Menu rows and nested submenu panels can have their own opaque backgrounds.
        // Restrict this override to the verified popup content hierarchy.
        if (node instanceof ViewGroup) node.setBackgroundColor(background);
        if (node instanceof TextView) {
            ((TextView) node).setTextColor(foreground);
        }
        if (node instanceof ImageView) {
            ((ImageView) node).setImageTintList(ColorStateList.valueOf(foreground));
        }
        if (node instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) node;
            for (int i = 0; i < group.getChildCount(); i++) {
                recolorMenuSubtree(group.getChildAt(i), background, foreground);
            }
        }
    }

    /** Match the Android status bar to the active native Cromite theme. */
    public static void applySettingsStatusBar(Activity activity) {
        if (activity == null) return;
        applyTabletStatusBar(activity);
        Window window = activity.getWindow();
        if (window == null) return;
        int background = resolvedPureThemeColor(activity);
        // Android 15 enforces edge-to-edge: the status-bar region can show the
        // decor/window background rather than the legacy statusBarColor.
        // Set both backing surfaces to the native pure theme color.
        window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(background));
        window.setStatusBarColor(background);
        View decor = window.getDecorView();
        if (decor == null) return;
        decor.setBackgroundColor(background);
        applySettingsStatusInset(activity);
        // Chromium may restore its own system-bar appearance after Settings
        // initializes. Reapply icon contrast on the next UI traversal.
        applySettingsStatusIconContrast(window, background);
        decor.post(() -> {
            if (!activity.isFinishing() && !activity.isDestroyed()
                    && !forceTabletModeEnabled()) {
                applySettingsStatusIconContrast(window, resolvedPureThemeColor(activity));
            }
        });
        // Android 10+ contrast enforcement can insert a light scrim over the
        // requested black status bar, independently of the Chromium surface.
        if (android.os.Build.VERSION.SDK_INT >= 29) {
            window.setStatusBarContrastEnforced(false);
        }
    }

    /** Match status icon contrast to the native Settings surface (not web content). */
    private static void applySettingsStatusIconContrast(Window window, int background) {
        View decor = window.getDecorView();
        boolean darkIcons = background == Color.WHITE;
        int flags = decor.getSystemUiVisibility();
        int bit = View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
        int next = darkIcons ? flags | bit : flags & ~bit;
        if (next != flags) decor.setSystemUiVisibility(next);
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            android.view.WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                controller.setSystemBarsAppearance(
                        darkIcons ? android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS : 0,
                        android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS);
            }
        }
    }

    /** Android 15 edge-to-edge: paint the actual top inset behind status icons. */
    private static void applySettingsStatusInset(Activity activity) {
        if (forceTabletModeEnabled()) return;
        Window window = activity.getWindow();
        if (window == null) return;
        View root = window.getDecorView();
        if (!(root instanceof FrameLayout)) return;
        FrameLayout frame = (FrameLayout) root;
        final String tag = "morphe_settings_status_inset";
        View strip = frame.findViewWithTag(tag);
        if (strip == null) {
            strip = new View(activity);
            strip.setTag(tag);
            strip.setClickable(false);
            strip.setFocusable(false);
            // Draw above the app content, not behind its opaque white surfaces.
            frame.addView(strip, new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.MATCH_PARENT, 0, Gravity.TOP));
        }
        int height = 0;
        WindowInsets insets = root.getRootWindowInsets();
        if (insets != null) {
            if (android.os.Build.VERSION.SDK_INT >= 30) {
                height = insets.getInsetsIgnoringVisibility(WindowInsets.Type.statusBars()).top;
            } else {
                height = insets.getStableInsetTop();
            }
        }
        if (height <= 0) {
            int id = activity.getResources().getIdentifier("status_bar_height", "dimen", "android");
            if (id != 0) height = activity.getResources().getDimensionPixelSize(id);
        }
        if (height <= 0) return;
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) strip.getLayoutParams();
        if (lp.height != height) {
            lp.height = height;
            strip.setLayoutParams(lp);
        }
        strip.setBackgroundColor(resolvedPureThemeColor(activity));
        strip.bringToFront();
    }

    /** The search box and expanded query container have independent drawables. */
    public static void applySettingsSearchSurface(View root) {
        if (root == null) return;
        root.setBackgroundColor(resolvedPureThemeColor(root.getContext()));
        applySettingsSearchField(root);
    }

    /** Search controls are a separate native Settings surface. */
    public static void applySettingsSearchField(View root) {
        if (root == null) return;
        if (root instanceof EditText) {
            EditText input = (EditText) root;
            int background = resolvedPureThemeColor(root.getContext());
            int foreground = background == Color.BLACK ? Color.WHITE : Color.BLACK;
            input.setBackgroundColor(background);
            input.setTextColor(foreground);
            input.setHintTextColor(background == Color.BLACK ? 0xFFBDBDBD : 0xFF555555);
            return;
        }
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                applySettingsSearchField(group.getChildAt(i));
            }
        }
    }

    /** Targeted surface hook; does not recolor web content or Chromium text. */
    public static void applyTabDialogBackground(View view) {
        if (view == null || !amoledEnabled(view.getContext())) return;
        view.setBackgroundColor(resolvedPureThemeColor(view.getContext()));
    }

    public static String browserTheme(Context context) {
        String value = prefs(context).getString(KEY_THEME, "device");
        if ("black".equals(value) || "white".equals(value)) return value;
        return "device";
    }

    /**
     * The controls persist their values; web luminance and theme need separate
     * verified Chromium rendering hooks before they can affect page/UI colors.
     */
    public static void showSettings(Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        SharedPreferences p = prefs(activity);
        // Chromium's activity theme can resolve platform dialog text to near-white
        // while resolving the platform dialog surface to white. Isolate the dialog
        // and all of its widgets under the framework's explicit dark theme.
        Context dialogContext = new ContextThemeWrapper(
                activity, android.R.style.Theme_Material_Dialog_Alert);
        final LinearLayout panel = new LinearLayout(dialogContext);
        panel.setBackgroundColor(Color.BLACK);
        panel.setOrientation(LinearLayout.VERTICAL);
        int pad = (int) (16 * activity.getResources().getDisplayMetrics().density);
        panel.setPadding(pad, pad, pad, pad);

        TextView themeLabel = new TextView(dialogContext);
        themeLabel.setText("Tema del navegador");
        themeLabel.setTextColor(Color.WHITE);
        panel.addView(themeLabel);

        android.widget.Spinner theme = new android.widget.Spinner(dialogContext);
        final String[] themes = {"Sistema", "Negro puro", "Blanco puro"};
        android.widget.ArrayAdapter<String> adapter = new android.widget.ArrayAdapter<>(
                dialogContext, android.R.layout.simple_spinner_item, themes);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        theme.setAdapter(adapter);
        String savedTheme = browserTheme(activity);
        theme.setSelection("black".equals(savedTheme) ? 1 : "white".equals(savedTheme) ? 2 : 0);
        panel.addView(theme);

        CheckBox amoled = new CheckBox(dialogContext);
        amoled.setText("AMOLED");
        amoled.setChecked(p.getBoolean(KEY_AMOLED, false));
        panel.addView(amoled);

        TextView webModeLabel = new TextView(dialogContext);
        webModeLabel.setText("Oscurecimiento de páginas web");
        webModeLabel.setTextColor(Color.WHITE);
        panel.addView(webModeLabel);
        android.widget.Spinner webMode = new android.widget.Spinner(dialogContext);
        final String[] webModes = {"Manual (casilla de Cromite)", "Automático con AMOLED"};
        android.widget.ArrayAdapter<String> webModeAdapter = new android.widget.ArrayAdapter<>(
                dialogContext, android.R.layout.simple_spinner_item, webModes);
        webModeAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        webMode.setAdapter(webModeAdapter);
        webMode.setSelection("automatic".equals(p.getString(KEY_WEB_MODE, "manual")) ? 1 : 0);
        webMode.setEnabled(amoled.isChecked());
        panel.addView(webMode);

        CheckBox manual = new CheckBox(dialogContext);
        manual.setText("Control manual del brillo de ventana");
        manual.setChecked(p.getBoolean(KEY_MANUAL, false));
        panel.addView(manual);

        TextView windowLabel = new TextView(dialogContext);
        windowLabel.setText("Brillo de ventana (%)");
        windowLabel.setTextColor(Color.WHITE);
        panel.addView(windowLabel);
        SeekBar windowBar = new SeekBar(dialogContext);
        windowBar.setMax(100);
        windowBar.setProgress(clamp(p.getInt(KEY_BRIGHTNESS, 50)));
        windowBar.setEnabled(manual.isChecked());
        panel.addView(windowBar);

        TextView webLabel = new TextView(dialogContext);
        webLabel.setText("Luminancia web (%) — pendiente de integración");
        webLabel.setTextColor(Color.WHITE);
        panel.addView(webLabel);
        SeekBar webBar = new SeekBar(dialogContext);
        webBar.setMax(100);
        webBar.setProgress(webLuminancePercent(activity));
        panel.addView(webBar);

        manual.setOnCheckedChangeListener((button, checked) -> {
            p.edit().putBoolean(KEY_MANUAL, checked).apply();
            windowBar.setEnabled(checked);
            applyWindowBrightness(activity);
        });
        windowBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int value, boolean user) {
                if (user) {
                    p.edit().putInt(KEY_BRIGHTNESS, clamp(value)).apply();
                    applyWindowBrightness(activity);
                }
            }
            @Override public void onStartTrackingTouch(SeekBar bar) {}
            @Override public void onStopTrackingTouch(SeekBar bar) {}
        });
        webBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int value, boolean user) {
                if (user) p.edit().putInt(KEY_WEB, clamp(value)).apply();
            }
            @Override public void onStartTrackingTouch(SeekBar bar) {}
            @Override public void onStopTrackingTouch(SeekBar bar) {}
        });
        amoled.setOnCheckedChangeListener((button, checked) -> {
            p.edit().putBoolean(KEY_AMOLED, checked).apply();
            webMode.setEnabled(checked);
        });
        webMode.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener() {
            @Override public void onItemSelected(android.widget.AdapterView<?> parent,
                    android.view.View view, int position, long id) {
                p.edit().putString(KEY_WEB_MODE, position == 1 ? "automatic" : "manual").apply();
            }
            @Override public void onNothingSelected(android.widget.AdapterView<?> parent) {}
        });
        theme.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener() {
            @Override public void onItemSelected(android.widget.AdapterView<?> parent,
                    android.view.View view, int position, long id) {
                String value = position == 1 ? "black" : position == 2 ? "white" : "device";
                p.edit().putString(KEY_THEME, value).apply();
            }
            @Override public void onNothingSelected(android.widget.AdapterView<?> parent) {}
        });

        AlertDialog dialog = new AlertDialog.Builder(dialogContext)
                .setTitle("AMOLED y brillo")
                .setView(panel)
                .setPositiveButton("Cerrar", (ignored, which) -> {})
                .create();
        dialog.setOnShowListener(ignored -> {
            Window window = dialog.getWindow();
            if (window != null) window.setBackgroundDrawable(new ColorDrawable(Color.BLACK));
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(Color.WHITE);
        });
        dialog.show();
    }

    private static int clamp(int percent) {
        return Math.max(0, Math.min(100, percent));
    }
}

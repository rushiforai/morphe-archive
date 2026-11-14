package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.res.AssetManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.hardware.display.DisplayManager;
import android.view.Display;
import android.view.View;

import java.util.Locale;

import app.morphe.extension.shared.Utils;

/**
 * App-only display density, chosen in Maps' Settings (row "UI density").
 * <p>
 * The AAOS layout expects windows of 930 dp or more. In split screen on the DiLink 3 head unit
 * (240 dpi) Maps gets 635 dp. A lower density for this app only makes its UI smaller and its
 * windows wider in dp, without changing other apps or the system.
 * <p>
 * The choice is stored in this app's preferences and read when the Application and each activity
 * attach their base context, so a new choice applies after the app restarts. Without a choice, 200
 * dpi applies only on the screen it was chosen on (1920x1080 at 240 dpi, the Dolphin's); other
 * screens keep the system density until the user picks one (from 0.1.1).
 * <p>
 * On another display, such as a launcher's virtual display (from 0.1.8): a density the display's owner set (any
 * other than the system's) is kept, so a launcher's density setting works; a display left at the system density gets
 * the chosen density, as the main display does. The language applies on every display. A move between displays of
 * different densities recreates the activity, so the rule follows the new display.
 */
@SuppressWarnings("unused")
public final class UiDensityPatch {
    private static final String TAG = "MorpheUiDensity";
    private static final String PREFERENCES = "morphe_ui_density";
    private static final String KEY_DENSITY_DPI = "density_dpi";
    /** Chosen on the Dolphin after trying 160 and 180; the default on that screen only. */
    private static final int DEFAULT_DENSITY_DPI = 200;
    /** The Dolphin's screen, in either orientation, at its system density. */
    private static final int TESTED_LONG_PX = 1920, TESTED_SHORT_PX = 1080, TESTED_SYSTEM_DPI = 240;
    private static volatile int defaultDpi = -1;
    /** 0 keeps the system density. */
    private static final int[] CHOICES = {0, 200, 180, 160};
    private static boolean logged;
    /** The display of the last activity wrapped, for a log line when it changes; -1 before the first. */
    private static int lastDisplayId = -1;

    private UiDensityPatch() {
    }

    /** The stored choice, the default when nothing is stored, 0 for the system density. */
    static int getTargetDensityDpi(Context context) {
        try {
            SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            if (!preferences.contains(KEY_DENSITY_DPI)) return defaultDensityDpi(context);
            int value = preferences.getInt(KEY_DENSITY_DPI, DEFAULT_DENSITY_DPI);
            for (int choice : CHOICES) {
                if (choice == value) return value;
            }
            ReportLog.w(TAG, "Ignoring unknown stored density " + value);
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not read the UI density choice", exception);
        }
        return defaultDensityDpi(context);
    }

    /** Without a stored choice: 200 on the tested screen, else 0 (the system density). */
    static int defaultDensityDpi(Context context) {
        int value = defaultDpi;
        if (value >= 0) return value;
        int system = Resources.getSystem().getConfiguration().densityDpi;
        Point size = new Point();
        try {
            DisplayManager displays = (DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
            Display display = displays == null ? null : displays.getDisplay(Display.DEFAULT_DISPLAY);
            if (display != null) display.getRealSize(size);
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not read the screen size", exception);
        }
        value = testedScreen(size.x, size.y, system) ? DEFAULT_DENSITY_DPI : 0;
        defaultDpi = value;
        ReportLog.i(TAG, "Default UI density " + (value > 0 ? value + " dpi" : "system") + " (screen " + size.x + "x"
                + size.y + " at " + system + " dpi" + (value > 0 ? ", the tested screen)" : ", not the tested 1920x1080 at 240 dpi)"));
        return value;
    }

    static boolean testedScreen(int width, int height, int systemDpi) {
        return Math.max(width, height) == TESTED_LONG_PX && Math.min(width, height) == TESTED_SHORT_PX
                && systemDpi == TESTED_SYSTEM_DPI;
    }

    /** For the problem report: the stored choice, 0 for the system density, null when nothing is stored. */
    static Integer storedDensityDpi(Context context) {
        try {
            SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            return preferences.contains(KEY_DENSITY_DPI) ? preferences.getInt(KEY_DENSITY_DPI, DEFAULT_DENSITY_DPI) : null;
        } catch (RuntimeException exception) {
            return null;
        }
    }

    /**
     * Injection point: attachBaseContext of the Application; {@link #wrapActivity} for the activities.
     * <p>
     * The override sets densityDpi and, with a language chosen ({@link AppLanguage}), the locale. The
     * framework keeps such a delta when it updates the configuration (MapsActivity handles screen-size
     * changes, such as entering split screen, without being recreated). Screen sizes in dp are left to the
     * system, so they stay current.
     */
    public static Context wrap(Context base) {
        return wrap(base, true);
    }

    // [density] false: the language only (an activity on another display).
    private static Context wrap(Context base, boolean density) {
        if (base == null) return null;
        int target = density && SafeMode.on(base, SafeMode.UI_DENSITY) ? getTargetDensityDpi(base) : 0;
        // The chosen language rides in the same override; null keeps the system's.
        Locale locale = AppLanguage.locale(base);
        if (target <= 0 && locale == null) return base;
        try {
            int system = base.getResources().getConfiguration().densityDpi;
            boolean change = target > 0 && system != target;
            if (!change && locale == null) return base;
            Configuration override = new Configuration();
            if (change) override.densityDpi = target;
            if (locale != null) override.setLocale(locale);
            Context wrapped = base.createConfigurationContext(override);
            if (change && !logged) {
                logged = true;
                ReportLog.i(TAG, "UI density " + target + " dpi (system " + system + " dpi)");
            }
            return wrapped;
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not apply UI density " + target + (locale == null ? "" : " and language " + locale), exception);
            return base;
        }
    }

    /**
     * Injection point: attachBaseContext of AppCompatActivity, the first in MapsActivity's hierarchy.
     * <p>
     * As {@link #wrap}, but the activity keeps its own context as its base and takes only the resources, assets
     * and theme of the configuration context. A display change reaches the activity's context through that base
     * (Activity.dispatchMovedToDisplay, ContextWrapper.updateDisplay), and the activity's window manager uses that
     * context's display. With the configuration context as the base, it kept the old display: a tooltip added after
     * Maps moved from a hosted display to the default one, and the hosted display went away, failed with
     * InvalidDisplayException (seen in a problem report).
     */
    public static Context wrapActivity(Context base) {
        Context configured = wrap(base, base == null || densityApplies(base));
        if (configured == base || configured == null) return configured;
        return new ConfiguredContext(base, configured);
    }

    /**
     * Whether the chosen density applies on a display: always on the main display; on another only while it is at the
     * system density, since another density was set by the display's owner (a launcher's setting).
     */
    static boolean appliesOn(int displayId, int displayDpi, int systemDpi) {
        return displayId == Display.DEFAULT_DISPLAY || displayDpi == systemDpi;
    }

    /**
     * {@link #appliesOn} for an activity's base context, before its window exists; true when unknown. Logs when the
     * display differs from the last activity's.
     */
    private static boolean densityApplies(Context base) {
        try {
            Display display = ApiCompat.getDisplay(base);
            int id = display != null ? display.getDisplayId() : Display.DEFAULT_DISPLAY;
            int dpi = base.getResources().getConfiguration().densityDpi;
            int system = Resources.getSystem().getConfiguration().densityDpi;
            boolean applies = appliesOn(id, dpi, system);
            if (id != lastDisplayId) {
                boolean first = lastDisplayId < 0;
                lastDisplayId = id;
                if (id != Display.DEFAULT_DISPLAY) {
                    ReportLog.i(TAG, "Display " + id + " at " + dpi + " dpi: " + (applies
                            ? "the system density, UI density applies"
                            : "set by its owner (system " + system + " dpi), kept"));
                } else if (!first) {
                    ReportLog.i(TAG, "Main display again: UI density applies");
                }
            }
            return applies;
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Could not read the activity's display, UI density applies", error);
            return true;
        }
    }

    /** The density of [context]'s display when UI density does not apply there (another display, set by its owner), else 0. */
    private static int ownerDensity(Context context) {
        try {
            Display display = ApiCompat.getDisplay(context);
            if (display == null) return 0;
            android.util.DisplayMetrics metrics = new android.util.DisplayMetrics();
            display.getMetrics(metrics);
            int system = Resources.getSystem().getConfiguration().densityDpi;
            return appliesOn(display.getDisplayId(), metrics.densityDpi, system) ? 0 : metrics.densityDpi;
        } catch (RuntimeException error) {
            return 0;
        }
    }

    /** The activity's own context with the resources of a configuration context. */
    private static final class ConfiguredContext extends ContextWrapper {
        private final Context configured;

        ConfiguredContext(Context base, Context configured) {
            super(base);
            this.configured = configured;
        }

        @Override
        public Resources getResources() {
            return configured.getResources();
        }

        @Override
        public AssetManager getAssets() {
            return configured.getAssets();
        }

        @Override
        public Resources.Theme getTheme() {
            return configured.getTheme();
        }
    }

    // Settings row. The patch adds it to Maps' Settings list, before About & help.

    /** Injection point: the row title. */
    public static String getSettingsTitle(Context context) {
        return isThai(context) ? "ขนาดการแสดงผล (UI density)" : "UI density";
    }

    /** Injection point: the row subtitle, the current choice. */
    public static String getSettingsSummary(Context context) {
        if (!SafeMode.on(context, SafeMode.UI_DENSITY)) {
            boolean thai = isThai(context);
            return (thai ? "ใช้ขนาดของระบบชั่วคราว · สวิตช์ใน " : "System density for now · switch in ")
                    + ReportPatch.reportPlace(context, thai);
        }
        String label = describedLabel(context, getTargetDensityDpi(context));
        // Settings shown on a display whose owner set its density (a launcher's): the choice does not apply there.
        int other = ownerDensity(context);
        if (other <= 0) return label;
        return label + (isThai(context) ? " · จอนี้ใช้ " + other + " dpi ของจอเอง" : " · this screen uses its own " + other + " dpi");
    }

    /**
     * Injection point: the row's click action. The container view of the Settings screen, if the
     * patch found one, gives the activity when the given context is not one.
     */
    public static Runnable getSettingsAction(Context context, View container) {
        return () -> showChooser(context, container);
    }

    private static void showChooser(Context context, View container) {
        Activity activity = findActivity(context);
        if (activity == null && container != null) activity = findActivity(container.getContext());
        if (activity == null || activity.isFinishing()) {
            ReportLog.w(TAG, "No activity for the UI density chooser: " + context);
            return;
        }
        Activity host = activity;
        int current = getTargetDensityDpi(host);
        String[] labels = new String[CHOICES.length];
        int checked = 0;
        for (int index = 0; index < CHOICES.length; index++) {
            labels[index] = describedLabel(host, CHOICES[index]);
            if (CHOICES[index] == current) checked = index;
        }
        new AlertDialog.Builder(host)
                .setTitle(getSettingsTitle(host))
                .setSingleChoiceItems(labels, checked, (dialog, which) -> {
                    dialog.dismiss();
                    if (CHOICES[which] != current) confirmRestart(host, CHOICES[which]);
                })
                .setNegativeButton(isThai(host) ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    // The density is applied when contexts are created, so the app restarts to use a new choice.
    private static void confirmRestart(Activity activity, int densityDpi) {
        boolean thai = isThai(activity);
        String label = choiceLabel(activity, densityDpi);
        new AlertDialog.Builder(activity)
                .setTitle(getSettingsTitle(activity))
                .setMessage(thai
                        ? "Maps จะเริ่มใหม่เพื่อใช้ " + label + " การนำทางที่กำลังทำงานจะหยุด"
                        : "Maps restarts to use " + label + ". Active navigation stops.")
                .setPositiveButton(thai ? "เริ่มใหม่" : "Restart", (dialog, which) -> {
                    // commit, not apply: the process exits right after.
                    boolean saved = activity.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                            .edit().putInt(KEY_DENSITY_DPI, densityDpi).commit();
                    ReportLog.i(TAG, "UI density set to " + densityDpi + " (saved " + saved + "), restarting");
                    Utils.restartApp(activity);
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    private static String choiceLabel(Context context, int densityDpi) {
        if (densityDpi > 0) return densityDpi + " dpi";
        int system = Resources.getSystem().getConfiguration().densityDpi;
        return (isThai(context) ? "ตามระบบ (" : "System (") + system + " dpi)";
    }

    /** The label with what the choice does, for the chooser and the Settings row. */
    private static String describedLabel(Context context, int densityDpi) {
        boolean thai = isThai(context);
        int dpi = densityDpi > 0 ? densityDpi : Resources.getSystem().getConfiguration().densityDpi;
        String hint = densityDpi == defaultDensityDpi(context) ? (thai ? "ค่าเริ่มต้น" : "default")
                : dpi > DEFAULT_DENSITY_DPI ? (thai ? "ใหญ่ขึ้น การ์ดอาจล้นเมื่อแบ่งจอ" : "larger, cards may not fit in split screen")
                : dpi == CHOICES[CHOICES.length - 1] ? (thai ? "เล็กที่สุด" : "smallest")
                : dpi < DEFAULT_DENSITY_DPI ? (thai ? "เล็กลง" : "smaller") : null;
        return hint == null ? choiceLabel(context, densityDpi) : choiceLabel(context, densityDpi) + " · " + hint;
    }

    /** Whether the extension's own texts are Thai: the language chosen in Settings, else the context's. */
    public static boolean isThai(Context context) {
        Boolean chosen = AppLanguage.thai(context);
        if (chosen != null) return chosen;
        try {
            return "th".equals(context.getResources().getConfiguration().getLocales().get(0).getLanguage());
        } catch (RuntimeException exception) {
            return false;
        }
    }

    static Activity findActivity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}

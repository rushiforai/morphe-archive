package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.view.View;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Locale;

import app.morphe.extension.shared.Utils;

/**
 * The app's language, chosen in Maps' Settings (row "Language"): the system's (the default), English or Thai.
 * <p>
 * Maps follows the head unit's language, and a head unit offers few. The chosen language goes into the
 * configuration override that carries the UI density ({@link UiDensityPatch#wrap}), so the Application and each
 * activity get it when they attach their base context, and it becomes the process's default locale, which Maps
 * uses for formats and requests. Maps' car UI views use a context of their own, whose configuration Maps builds
 * from scratch, so {@link #carConfiguration} adds the language there too (without it, Maps' own
 * texts stay in the system's language). Only the language changes: the region stays the system's. It is read once per
 * process, so a new choice applies after the app restarts. Maps carries about 80 resource languages; only the two
 * that were checked are offered.
 * <p>
 * The report screen's process runs no feature, so nothing wraps its Application: {@link ReportActivity} wraps its
 * own context with {@link #wrapReportScreen}, reading the choice again each time it opens, and is built again when
 * it comes back to the front after a change ({@link #reportScreenChanged}).
 */
@SuppressWarnings("unused")
public final class AppLanguage {
    private static final String TAG = "MorpheLanguage";
    private static final String PREFERENCES = "morphe_language", KEY_LANGUAGE = "language";
    /** No override. */
    static final String SYSTEM = "system";
    private static final String[] CHOICES = {SYSTEM, "en", "th"};
    /**
     * Read again when another process changed the file: the report screen's process outlives a restart of Maps.
     * The mode is deprecated, but getSharedPreferences still checks the file for a change with it.
     */
    @SuppressWarnings("deprecation")
    private static final int READ_MODE = Context.MODE_MULTI_PROCESS;
    /** The language this process applies: null before the first wrap, SYSTEM for none. */
    private static volatile String applied;
    /** The system's first locale, before any override; for the labels, the region and the report. */
    private static volatile Locale systemLocale;
    /** The report screen's process: its default locale before this screen first replaced it, null while it is untouched. */
    private static volatile Locale reportDefaultBefore;
    /**
     * The report screen's process: the language its texts use, read when the screen attaches (or at the first text
     * before that), so the texts built in between do not read the file each time. Null before the first read.
     */
    private static volatile String reportLanguage;
    /** Whether {@link #carConfiguration} logged, once per process. */
    private static volatile boolean carLogged;

    private AppLanguage() {
    }

    /** The stored choice, SYSTEM when nothing or something unknown is stored. */
    static String stored(Context context) {
        String value = storedOrNull(context);
        if (value == null) return SYSTEM;
        for (String choice : CHOICES) if (choice.equals(value)) return choice;
        ReportLog.w(TAG, "Ignoring unknown stored language " + value);
        return SYSTEM;
    }

    private static String storedOrNull(Context context) {
        try {
            return context.getSharedPreferences(PREFERENCES, READ_MODE).getString(KEY_LANGUAGE, null);
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not read the language choice", exception);
            return null;
        }
    }

    /**
     * From {@link UiDensityPatch#wrap}, with the unwrapped base context: the locale for the override, null for the
     * system's. The first call in a process decides for its lifetime and sets the default locale.
     */
    static Locale locale(Context base) {
        String language = applied;
        if (language == null) {
            synchronized (AppLanguage.class) {
                language = applied;
                if (language == null) {
                    language = SYSTEM;
                    try {
                        Locale system = system(base);
                        if (SafeMode.on(base, SafeMode.LANGUAGE)) language = stored(base);
                        if (!SYSTEM.equals(language)) {
                            Locale chosen = localeOf(language, system);
                            Locale.setDefault(chosen);
                            ReportLog.i(TAG, "Language " + chosen.toLanguageTag() + " (system " + system.toLanguageTag() + ")");
                        }
                    } catch (RuntimeException exception) {
                        ReportLog.w(TAG, "Could not apply the language", exception);
                        language = SYSTEM;
                    }
                    applied = language;
                }
            }
        }
        return SYSTEM.equals(language) ? null : localeOf(language, system(base));
    }

    /**
     * Injection point: the configuration of Maps' car UI context ("OverrideDensityContextWrapper"), right after
     * Maps builds it and before its createConfigurationContext. Maps builds it from scratch with only the density
     * and the screen size, and createConfigurationContext uses only that configuration, not the override
     * {@link UiDensityPatch#wrap} put on the activity (AOSP on Android 10 and 11; later versions not checked), so Maps'
     * own texts would stay in the system's language. The chosen language is added here; nothing changes with the
     * system's language. Maps' cluster and HUD activities use the same wrapper; their other views get the language
     * from wrap, which reaches them through AppCompatActivity (the turn-card cluster activity does not extend it).
     */
    public static void carConfiguration(Configuration configuration) {
        String language = applied;
        if (configuration == null || language == null || SYSTEM.equals(language)) return;
        try {
            Locale chosen = localeOf(language, system(null));
            configuration.setLocale(chosen);
            if (!carLogged) {
                carLogged = true;
                ReportLog.i(TAG, "Maps' car UI context uses " + chosen.toLanguageTag());
            }
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not set the language of Maps' car UI context", exception);
        }
    }

    /**
     * From {@link ReportActivity#attachBaseContext}: the report screen in the chosen language. Its process
     * applies no override elsewhere, so the choice is read each time the screen opens, and the process's
     * default locale goes back to what it was when the choice goes back to the system's.
     */
    static Context wrapReportScreen(Context base) {
        if (base == null) return null;
        try {
            // The switches as they are now: this process lives on while Maps restarts.
            SafeMode.refresh(base);
            Locale system = system(base);
            String language = reportChoice(base);
            reportLanguage = language;
            if (SYSTEM.equals(language)) {
                // Back to the system's language: only a default this screen replaced earlier is put back.
                Locale before = reportDefaultBefore;
                if (before != null) {
                    Locale.setDefault(before);
                    reportDefaultBefore = null;
                }
                return base;
            }
            Locale chosen = localeOf(language, system);
            if (reportDefaultBefore == null) reportDefaultBefore = Locale.getDefault();
            Locale.setDefault(chosen);
            Configuration override = new Configuration();
            override.setLocale(chosen);
            return base.createConfigurationContext(override);
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not apply the language to the report screen", exception);
            return base;
        }
    }

    /**
     * For {@link UiDensityPatch#isThai}: whether the extension's own texts are Thai, from the language in use;
     * null with the system's language, where the context decides. A context that was never wrapped (a service,
     * a view's context) so gets the same language as the screens.
     */
    static Boolean thai(Context context) {
        String language = textLanguage(context);
        return language == null || SYSTEM.equals(language) ? null : Boolean.valueOf("th".equals(language));
    }

    // The language in use: what this process applied; in the report screen's process, what the screen read when it
    // attached, so a screen that stays open keeps one language until it is built again.
    private static String textLanguage(Context context) {
        if (!SafeMode.isReportProcess()) return applied;
        String language = reportLanguage;
        if (language != null) return language;
        if (context == null) return SYSTEM;
        language = reportChoice(context);
        reportLanguage = language;
        return language;
    }

    // The report screen's process: the stored choice while its switch is on and safe mode is off (the conditions the
    // main process applies it under).
    private static String reportChoice(Context context) {
        return !SafeMode.included(SafeMode.LANGUAGE) || !SafeMode.switchOn(SafeMode.LANGUAGE) || SafeMode.automatic()
                ? SYSTEM : stored(context);
    }

    /** For ReportActivity: the language its screen was built in, read by {@link #wrapReportScreen}. */
    static String reportScreenLanguage() {
        return reportLanguage;
    }

    /**
     * From ReportActivity when its window gains the focus: whether the language now differs from [built], the one the
     * screen was built in. The screen is single-task in its own process, so a language chosen in Maps' Settings
     * meanwhile finds it open. Reads the switches and the choice again; the texts keep [built] until the screen is
     * built again.
     */
    static boolean reportScreenChanged(Context context, String built) {
        try {
            SafeMode.refresh(context);
            return built != null && !built.equals(reportChoice(context));
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not check the report screen's language", exception);
            return false;
        }
    }

    // The chosen language with the system's region: units and formats that follow the region stay as they were.
    private static Locale localeOf(String language, Locale system) {
        return new Locale(language, system == null ? "" : system.getCountry());
    }

    // The system's first locale: system resources carry no app override.
    private static Locale system(Context context) {
        Locale locale = systemLocale;
        if (locale != null) return locale;
        try {
            locale = Resources.getSystem().getConfiguration().getLocales().get(0);
        } catch (RuntimeException exception) {
            locale = null;
        }
        if (locale == null) locale = Locale.getDefault();
        systemLocale = locale;
        return locale;
    }

    /** For the problem report: the stored choice (null when none), what this process applies, and the system's locale. */
    static JSONObject report(Context context) throws JSONException {
        String choice = storedOrNull(context), now = applied;
        Locale system = system(context);
        return new JSONObject()
                .put("choice", choice != null ? choice : JSONObject.NULL)
                .put("applied", now != null ? now : JSONObject.NULL)
                .put("system", system != null ? system.toLanguageTag() : JSONObject.NULL);
    }

    // Settings row. The patch adds it to Maps' Settings list, after UI density.

    /** Injection point: the row title. */
    public static String getSettingsTitle(Context context) {
        return UiDensityPatch.isThai(context) ? "ภาษา (Language)" : "Language";
    }

    /** Injection point: the row subtitle, the current choice. */
    public static String getSettingsSummary(Context context) {
        boolean thai = UiDensityPatch.isThai(context);
        if (!SafeMode.on(context, SafeMode.LANGUAGE)) {
            return (thai ? "ใช้ภาษาของระบบชั่วคราว · สวิตช์ใน " : "System language for now · switch in ")
                    + ReportPatch.reportPlace(context, thai);
        }
        return choiceLabel(context, stored(context));
    }

    /**
     * Injection point: the row's click action. The container view of the Settings screen, if the
     * patch found one, gives the activity when the given context is not one.
     */
    public static Runnable getSettingsAction(Context context, View container) {
        return () -> showChooser(context, container);
    }

    private static void showChooser(Context context, View container) {
        Activity activity = UiDensityPatch.findActivity(context);
        if (activity == null && container != null) activity = UiDensityPatch.findActivity(container.getContext());
        if (activity == null || activity.isFinishing()) {
            ReportLog.w(TAG, "No activity for the language chooser: " + context);
            return;
        }
        Activity host = activity;
        boolean thai = UiDensityPatch.isThai(host);
        String current = stored(host);
        String[] labels = new String[CHOICES.length];
        int checked = 0;
        for (int index = 0; index < CHOICES.length; index++) {
            labels[index] = choiceLabel(host, CHOICES[index]);
            if (CHOICES[index].equals(current)) checked = index;
        }
        new AlertDialog.Builder(host)
                .setTitle(getSettingsTitle(host))
                .setSingleChoiceItems(labels, checked, (dialog, which) -> {
                    dialog.dismiss();
                    if (CHOICES[which].equals(current)) return;
                    if (SafeMode.on(host, SafeMode.LANGUAGE)) confirmRestart(host, CHOICES[which]);
                    else saveForLater(host, CHOICES[which]);
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    // While the switch is off this process keeps the system's language whatever is stored, so a restart would
    // change nothing: the choice is saved for the next process with the switch on.
    private static void saveForLater(Activity activity, String language) {
        boolean saved = save(activity, language);
        ReportLog.i(TAG, "Language set to " + language + " (saved " + saved + ") while switched off, no restart");
        ReportBuilder.saveSnapshot(activity.getApplicationContext(), true);
        boolean thai = UiDensityPatch.isThai(activity);
        String label = choiceLabel(activity, language);
        new AlertDialog.Builder(activity)
                .setTitle(getSettingsTitle(activity))
                .setMessage(thai
                        ? "บันทึกแล้ว จะใช้ " + label + " เมื่อเปิด Language อีกครั้งใน " + ReportPatch.reportPlace(activity, true)
                        : "Saved. " + label + " is used once Language is switched on again in "
                        + ReportPatch.reportPlace(activity, false) + ".")
                .setPositiveButton(thai ? "ตกลง" : "OK", null)
                .show();
    }

    // The language is applied when contexts are created, so the app restarts to use a new choice.
    private static void confirmRestart(Activity activity, String language) {
        boolean thai = UiDensityPatch.isThai(activity);
        String label = choiceLabel(activity, language);
        new AlertDialog.Builder(activity)
                .setTitle(getSettingsTitle(activity))
                .setMessage(thai
                        ? "Maps จะเริ่มใหม่เพื่อใช้ " + label + " การนำทางที่กำลังทำงานจะหยุด"
                        : "Maps restarts to use " + label + ". Active navigation stops.")
                .setPositiveButton(thai ? "เริ่มใหม่" : "Restart", (dialog, which) -> {
                    boolean saved = save(activity, language);
                    ReportLog.i(TAG, "Language set to " + language + " (saved " + saved + "), restarting");
                    Utils.restartApp(activity);
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    // commit, not apply: the process exits right after, and the report screen's process reads the file.
    private static boolean save(Context context, String language) {
        try {
            return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putString(KEY_LANGUAGE, language).commit();
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not save the language choice", exception);
            return false;
        }
    }

    // A language in its own name, so it can be found from any language; the system's with its language in brackets.
    private static String choiceLabel(Context context, String language) {
        if ("en".equals(language)) return "English";
        if ("th".equals(language)) return "ไทย";
        Locale system = system(context);
        String name = system == null ? "" : system.getDisplayLanguage(system);
        String label = UiDensityPatch.isThai(context) ? "ตามระบบ" : "System";
        return name == null || name.isEmpty() ? label : label + " (" + name + ")";
    }
}

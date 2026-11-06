package app.ayufa.extension.simeji;

import android.content.Context;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * Runtime settings for the Ayufa Simeji patches.
 *
 * <p>The patched methods consult the static getters of this class on
 * every call, so flipping a switch in the settings UI takes effect
 * without re-patching. The values live in a small text file inside
 * the app's files directory instead of SharedPreferences: the file's
 * modification time is checked on every read, which makes changes
 * propagate between the app process and the keyboard (IME) process,
 * something SharedPreferences does not reliably do.
 *
 * <p>Every hide feature defaults to on, matching the behaviour of the
 * patches before runtime settings existed. The VIP spoof defaults to
 * off: it changes how the app treats the account, so it is opt-in.
 */
public final class SimejiSettings {

    public static final String KEY_HIDE_ADS = "hide_ads";
    public static final String KEY_BLOCK_REWARDED_ADS = "block_rewarded_ads";
    public static final String KEY_HIDE_PROMOTIONS = "hide_promotions";
    public static final String KEY_BLOCK_VIP_GUIDE = "block_vip_guide";
    public static final String KEY_DISABLE_PUSH_POPUPS = "disable_push_popups";
    public static final String KEY_SKIP_SUBSCRIPTION_RETENTION = "skip_subscription_retention";
    public static final String KEY_DISABLE_ANALYTICS = "disable_analytics";
    public static final String KEY_HIDE_POINT_ENTRY = "hide_point_entry";
    public static final String KEY_DISABLE_REVIEW_PROMPTS = "disable_review_prompts";
    public static final String KEY_HIDE_AI_ASSISTANT = "hide_ai_assistant";
    public static final String KEY_SPOOF_VIP = "spoof_vip";

    private static final String FILE_NAME = "ayufa_simeji_settings.txt";

    private static final Map<String, Boolean> DEFAULTS = new HashMap<>();

    static {
        DEFAULTS.put(KEY_HIDE_ADS, true);
        DEFAULTS.put(KEY_BLOCK_REWARDED_ADS, true);
        DEFAULTS.put(KEY_HIDE_PROMOTIONS, true);
        DEFAULTS.put(KEY_BLOCK_VIP_GUIDE, true);
        DEFAULTS.put(KEY_DISABLE_PUSH_POPUPS, true);
        DEFAULTS.put(KEY_SKIP_SUBSCRIPTION_RETENTION, true);
        DEFAULTS.put(KEY_DISABLE_ANALYTICS, true);
        DEFAULTS.put(KEY_HIDE_POINT_ENTRY, true);
        DEFAULTS.put(KEY_DISABLE_REVIEW_PROMPTS, true);
        DEFAULTS.put(KEY_HIDE_AI_ASSISTANT, true);
        DEFAULTS.put(KEY_SPOOF_VIP, false);
    }

    private static Context cachedContext;
    private static Map<String, Boolean> cachedValues;
    private static long cachedModified = -1L;

    private SimejiSettings() {
    }

    // region Feature getters used by the patched methods.

    public static boolean hideAds() {
        return isOn(KEY_HIDE_ADS);
    }

    /** Rewarded ads are blocked only together with the other ads. */
    public static boolean rewardedAdsBlocked() {
        return isOn(KEY_HIDE_ADS) && isOn(KEY_BLOCK_REWARDED_ADS);
    }

    public static boolean hidePromotions() {
        return isOn(KEY_HIDE_PROMOTIONS);
    }

    public static boolean blockVipGuide() {
        return isOn(KEY_BLOCK_VIP_GUIDE);
    }

    public static boolean disablePushPopups() {
        return isOn(KEY_DISABLE_PUSH_POPUPS);
    }

    public static boolean skipSubscriptionRetention() {
        return isOn(KEY_SKIP_SUBSCRIPTION_RETENTION);
    }

    public static boolean disableAnalytics() {
        return isOn(KEY_DISABLE_ANALYTICS);
    }

    public static boolean hidePointEntry() {
        return isOn(KEY_HIDE_POINT_ENTRY);
    }

    public static boolean disableReviewPrompts() {
        return isOn(KEY_DISABLE_REVIEW_PROMPTS);
    }

    public static boolean hideAiAssistant() {
        return isOn(KEY_HIDE_AI_ASSISTANT);
    }

    public static boolean spoofVip() {
        return isOn(KEY_SPOOF_VIP);
    }

    // endregion

    /** Current value of any key, falling back to its default. */
    public static boolean isOn(String key) {
        Boolean value = load().get(key);
        if (value != null) {
            return value;
        }
        Boolean fallback = DEFAULTS.get(key);
        return fallback != null && fallback;
    }

    /** Default value of a key, for building the settings UI. */
    public static boolean defaultValue(String key) {
        Boolean fallback = DEFAULTS.get(key);
        return fallback != null && fallback;
    }

    /**
     * Stores one value and rewrites the settings file atomically, so
     * other processes never read a half-written file.
     */
    public static synchronized void set(Context context, String key, boolean value) {
        init(context);
        Map<String, Boolean> values = new HashMap<>(load());
        values.put(key, value);
        File file = settingsFile(context);
        if (file == null) {
            return;
        }
        File tmp = new File(file.getParent(), FILE_NAME + ".tmp");
        BufferedWriter writer = null;
        try {
            writer = new BufferedWriter(new FileWriter(tmp));
            for (Map.Entry<String, Boolean> entry : values.entrySet()) {
                writer.write(entry.getKey() + "=" + (entry.getValue() ? "1" : "0"));
                writer.newLine();
            }
            writer.flush();
            writer.close();
            writer = null;
            if (!tmp.renameTo(file)) {
                // Rename can fail across mount points; fall back to a
                // direct write so the setting is at least stored.
                writeDirectly(file, values);
            }
        } catch (Throwable ignored) {
            // Settings are best-effort: never crash the host app.
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (Throwable ignored) {
                }
            }
        }
        cachedValues = values;
        cachedModified = file.lastModified();
    }

    private static void writeDirectly(File file, Map<String, Boolean> values) throws Exception {
        BufferedWriter writer = new BufferedWriter(new FileWriter(file));
        try {
            for (Map.Entry<String, Boolean> entry : values.entrySet()) {
                writer.write(entry.getKey() + "=" + (entry.getValue() ? "1" : "0"));
                writer.newLine();
            }
            writer.flush();
        } finally {
            writer.close();
        }
    }

    /** Seeds the context cache from UI code that has a real context. */
    public static synchronized void init(Context context) {
        if (context != null) {
            cachedContext = context.getApplicationContext();
        }
    }

    private static synchronized Map<String, Boolean> load() {
        Context context = appContext();
        if (context == null) {
            return cachedValues != null ? cachedValues : new HashMap<String, Boolean>();
        }
        File file = settingsFile(context);
        if (file == null) {
            return cachedValues != null ? cachedValues : new HashMap<String, Boolean>();
        }
        long modified = file.exists() ? file.lastModified() : 0L;
        if (cachedValues != null && modified == cachedModified) {
            return cachedValues;
        }
        Map<String, Boolean> values = new HashMap<>();
        if (file.exists()) {
            BufferedReader reader = null;
            try {
                reader = new BufferedReader(new FileReader(file));
                String line;
                while ((line = reader.readLine()) != null) {
                    int sep = line.indexOf('=');
                    if (sep > 0) {
                        values.put(line.substring(0, sep).trim(),
                                "1".equals(line.substring(sep + 1).trim()));
                    }
                }
            } catch (Throwable ignored) {
                // A broken file simply means "all defaults".
            } finally {
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (Throwable ignored) {
                    }
                }
            }
        }
        cachedValues = values;
        cachedModified = modified;
        return cachedValues;
    }

    private static File settingsFile(Context context) {
        try {
            File dir = context.getFilesDir();
            return dir != null ? new File(dir, FILE_NAME) : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * Resolves the application context without a compile-time
     * dependency on the host app, so the patched methods can call the
     * getters from any process (app or IME) at any time.
     */
    private static Context appContext() {
        if (cachedContext != null) {
            return cachedContext;
        }
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method currentApplication = activityThread.getMethod("currentApplication");
            Object application = currentApplication.invoke(null);
            if (application instanceof Context) {
                cachedContext = (Context) application;
            }
        } catch (Throwable ignored) {
            // No context yet: callers fall back to the defaults.
        }
        return cachedContext;
    }
}

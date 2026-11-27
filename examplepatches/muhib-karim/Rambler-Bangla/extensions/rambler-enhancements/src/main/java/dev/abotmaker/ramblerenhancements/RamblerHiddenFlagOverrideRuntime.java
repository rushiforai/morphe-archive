/*
 * Rambler Bangla - Native Gboard 18.5.4 OVERRIDE flag-store helper.
 *
 * Adapted from johninnld/nl-morphe-patches (GPL-3.0) for Gboard 18.5.4's
 * native FlagFactory (`okf.g(olk.OVERRIDE)` -> `okq.e(String, boolean)`).
 * See ATTRIBUTION.md and THIRD-PARTY-NOTICES.md.
 */
package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Applies curated Gboard 18.5.4 hidden/beta boolean flags directly through Gboard's own
 * {@code OVERRIDE} layer ({@code okf.g(olk.OVERRIDE)} -> {@code okq.e(String, boolean)}),
 * notifying Gboard's internal flag listeners live without requiring a restart.
 */
public final class RamblerHiddenFlagOverrideRuntime {
    private static final String TAG = "RamblerBangla";
    private static final String PREF_PREFIX = "pref_rambler_hidden_flag_";
    private static final String FLAG_FACTORY_CLASS = "okf";
    private static final String FLAG_PRIORITY_CLASS = "olk";
    private static final String PRIORITY_OVERRIDE = "OVERRIDE";

    public static final class Entry {
        public final String flagName;
        public final String title;
        public final String summary;
        public final boolean defaultEnabled;

        Entry(String flagName, String title, String summary, boolean defaultEnabled) {
            this.flagName = flagName;
            this.title = title;
            this.summary = summary;
            this.defaultEnabled = defaultEnabled;
        }
    }

    private static final List<Entry> ENTRIES = Collections.unmodifiableList(Arrays.asList(
            new Entry(
                    "enable_system_clipboard_direct_paste_for_quick_paste",
                    "Quick-paste direct clipboard chip",
                    "Pastes copied text with one tap from the suggestion bar quick-paste chip.",
                    true),
            new Entry(
                    "enable_rambler_al_toolbar_overflow_menu",
                    "Rambler toolbar overflow menu",
                    "Adds the secondary overflow menu button to the floating Rambler toolbar.",
                    true),
            new Entry(
                    "rambler_preserve_rewritten_text_on_revert",
                    "Keep rewritten text on revert",
                    "Preserves the rewritten version when reverting from the full Rambler transcript.",
                    true),
            new Entry(
                    "agentic_dictation_enable_auto_parallel_retry",
                    "Rambler automatic retry",
                    "Retries eligible transient recognition failures automatically using cached audio.",
                    true),
            new Entry(
                    "enable_jetson_in_toolbar",
                    "Show Rambler in keyboard toolbar",
                    "Keeps the Rambler voice typing entry visible in Gboard's toolbar.",
                    true),
            new Entry(
                    "agentic_dictation_persist_ui_on_keyboard_switch",
                    "Persist Rambler UI across switches",
                    "Keeps the Rambler dictation session UI intact when switching keyboard layouts.",
                    true),
            new Entry(
                    "agentic_dictation_emoji_skintone_replacement",
                    "Rambler emoji skin-tone replacement",
                    "Applies your preferred emoji skin tone when dictating emoji with Rambler.",
                    true),
            new Entry(
                    "enable_email_provider_completion",
                    "Native email provider completion (fixed list)",
                    "Optional: enables Gboard's built-in fixed email provider strip. Off by default so personalized @mention suggestions stay clean.",
                    false)));

    private static final AtomicBoolean BOOTSTRAPPED = new AtomicBoolean(false);

    private RamblerHiddenFlagOverrideRuntime() {
    }

    public static List<Entry> entries() {
        return ENTRIES;
    }

    public static boolean isEnabled(Context context, String flagName, boolean defaultValue) {
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return defaultValue;
        }
        try {
            return prefs.getBoolean(PREF_PREFIX + flagName, defaultValue);
        } catch (Throwable ignored) {
            return defaultValue;
        }
    }

    public static boolean setEnabled(Context context, String flagName, boolean enabled) {
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        boolean saved = false;
        if (prefs != null) {
            try {
                saved = prefs.edit().putBoolean(PREF_PREFIX + flagName, enabled).commit();
            } catch (Throwable ignored) {
                saved = false;
            }
        }
        boolean applied = applyOverride(flagName, enabled);
        return saved || applied;
    }

    /** Called once when Gboard initializes context; idempotent and fail-safe. */
    public static void applyAtStartupIfNeeded(Context context) {
        if (!RamblerDynamicConfig.FEATURE_HIDDEN_FLAGS && !RamblerDynamicConfig.FEATURE_RAMBLER_EXTRAS) {
            return;
        }
        if (context == null || !BOOTSTRAPPED.compareAndSet(false, true)) {
            return;
        }
        for (Entry entry : ENTRIES) {
            boolean enabled = isEnabled(context, entry.flagName, entry.defaultEnabled);
            applyOverride(entry.flagName, enabled);
        }
    }

    /** Writes a boolean flag directly into Gboard 18.5.4's native OVERRIDE layer. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static boolean applyOverride(String flagName, boolean value) {
        if (flagName == null || flagName.isEmpty()) {
            return false;
        }
        try {
            ClassLoader loader = RamblerHiddenFlagOverrideRuntime.class.getClassLoader();
            Class<?> flagFactory = Class.forName(FLAG_FACTORY_CLASS, false, loader);
            Class<?> priorityEnum = Class.forName(FLAG_PRIORITY_CLASS, false, loader);
            Object overridePriority = Enum.valueOf((Class<Enum>) priorityEnum, PRIORITY_OVERRIDE);
            Method writerFactory = flagFactory.getDeclaredMethod("g", priorityEnum);
            writerFactory.setAccessible(true);
            Object writer = writerFactory.invoke(null, overridePriority);
            if (writer == null) {
                return false;
            }
            Method setBoolean = writer.getClass().getMethod("e", String.class, boolean.class);
            setBoolean.setAccessible(true);
            setBoolean.invoke(writer, flagName, value);
            return true;
        } catch (Throwable failure) {
            try {
                Log.w(TAG, "Hidden flag override failed for " + flagName, failure);
            } catch (Throwable ignored) {
                // Never disrupt Gboard.
            }
            return false;
        }
    }
}

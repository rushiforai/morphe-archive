package dev.jason.gboardpatches.extension.writingtools;

import android.content.Context;
import android.util.Log;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

public final class GboardAiWritingToolsRuntime {
    static final String FLAG_WRITING_HELPER = "writing_helper";
    static final String FLAG_CONFIG_PROOFREAD = "config_proofread";
    static final String FLAG_WRITING_HELPER_ON_SELECTED_TEXT =
            "writing_helper_on_selected_text";
    static final String FLAG_WRITING_HELPER_ENABLE_TEXT_STYLIZATION_INTERNAL =
            "writing_helper_enable_text_stylization_internal";
    static final String FLAG_WRITING_TOOLS = "writing_tools";
    static final String FLAG_ENABLE_WRITING_TOOLS_COOPERATIVE_MODE =
            "enable_writing_tools_cooperative_mode";
    static final String FLAG_WRITING_HELPER_SUPPORTED_LANGUAGE_TAGS =
            "writing_helper_supported_language_tags";
    static final String FLAG_LLM_PC_SUPPORTED_LANGUAGE_TAGS =
            "llm_pc_supported_language_tags";
    static final String FLAG_WRITING_HELPER_MODEL_VERSION =
            "writing_helper_model_version";
    static final String FLAG_WRITING_HELPER_TEXT_STYLIZATION_MODEL_VERSION =
            "writing_helper_text_stylization_model_version";
    static final String FLAG_ALLOW_GEN_AI_SERVER = "allow_gen_ai_server";
    static final String FLAG_ENABLE_WRITING_TOOLS_FOR_MINORS =
            "enable_writing_tools_for_minors";
    static final String ALL_LANGUAGES_ALLOWLIST_VALUE = "*";
    static final String PROOFREAD_MODEL_VERSION_OVERRIDE =
            "202408051448_prod_sd_config";
    static final String STYLIZATION_MODEL_VERSION_OVERRIDE =
            "202504090000_writing_tools_config";

    private static final String TAG = "GboardPatches";
    private static final String LOG_PREFIX = "[gboard-ai-writing-tools] ";
    private static final String PREFERENCE_MANAGER_CLASS_NAME = "oql";
    private static final String PREFERENCE_MANAGER_FACTORY_METHOD = "O";
    private static final String PREFERENCE_MANAGER_BOOLEAN_METHOD = "at";
    private static final String WRITING_TOOLS_SHOWN_IN_BAR_CLASS = "gjz";
    private static final String WRITING_TOOLS_SHOWN_IN_BAR_FIELD = "a";
    private static final String[] FORCED_SIGNAL_TARGET_SPECS = new String[] { "gjz#a" };

    private static volatile Context applicationContext;
    private static volatile Field flagNameField;
    private static volatile ClassLoader cachedSignalClassLoader;
    private static volatile Set<Object> cachedForcedSignals;
    private static final AtomicBoolean FLAG_HOOK_LOGGED = new AtomicBoolean(false);
    private static final AtomicInteger FLAG_OVERRIDE_COUNT = new AtomicInteger(0);
    private static final AtomicBoolean SIGNAL_HOOK_LOGGED = new AtomicBoolean(false);
    private static final AtomicInteger SIGNAL_OVERRIDE_COUNT = new AtomicInteger(0);

    private GboardAiWritingToolsRuntime() {
    }

    public static Object getOverriddenFlagValue(Object receiver) {
        try {
            Context context = resolveContext();
            if (context == null || receiver == null) {
                return null;
            }
            GboardAiWritingToolsSettings.Snapshot settings =
                    GboardAiWritingToolsSettings.snapshot(context);
            String flagName = readFlagName(receiver);
            GboardAiWritingToolsOfficialPreferences.Snapshot officialPreferences =
                    resolveOfficialPreferencesSnapshot(
                            context,
                            receiver.getClass().getClassLoader(),
                            flagName,
                            GboardAiWritingToolsOfficialPreferences.snapshot());
            return computeOverrideValue(
                    flagName,
                    settings.featureEnabled,
                    settings.allKeyboardsEnabled,
                    officialPreferences);
        } catch (Throwable throwable) {
            Log.w(TAG, LOG_PREFIX + "failed to compute flag override", throwable);
            return null;
        }
    }

    public static Object applyOverriddenFlagValue(Object receiver, Object originalResult) {
        Object overriddenValue = getOverriddenFlagValue(receiver);
        if (overriddenValue != null && !valuesEqual(originalResult, overriddenValue)) {
            try {
                Context context = resolveContext();
                GboardAiWritingToolsSettings.Snapshot settings = context == null
                        ? new GboardAiWritingToolsSettings.Snapshot(false, false)
                        : GboardAiWritingToolsSettings.snapshot(context);
                logFlagOverride(readFlagName(receiver), originalResult, overriddenValue,
                        settings.featureEnabled, settings.allKeyboardsEnabled);
            } catch (Throwable throwable) {
                Log.w(TAG, LOG_PREFIX + "failed to log flag override", throwable);
            }
        }
        return overriddenValue != null ? overriddenValue : originalResult;
    }

    public static boolean shouldForceSignalTrue(Object signal) {
        try {
            Context context = resolveContext();
            if (context == null || signal == null) {
                return false;
            }
            GboardAiWritingToolsSettings.Snapshot settings =
                    GboardAiWritingToolsSettings.snapshot(context);
            if (!settings.featureEnabled) {
                return false;
            }
            boolean forced = getForcedSignals(signal.getClass().getClassLoader()).contains(signal);
            if (forced) {
                logSignalOverride(describeSignal(signal), settings.featureEnabled);
            }
            return forced;
        } catch (Throwable throwable) {
            Log.w(TAG, LOG_PREFIX + "failed to evaluate signal override", throwable);
            return false;
        }
    }

    public static boolean shouldBypassSettingsRemoval(int keyResId) {
        try {
            Context context = resolveContext();
            if (context == null || !GboardAiWritingToolsSettings.snapshot(context).featureEnabled) {
                return false;
            }
            return keyResId == GboardAiWritingToolsOfficialPreferences.SHOW_FIX_IT_BUTTON_PREF_KEY
                    || keyResId == GboardAiWritingToolsOfficialPreferences.SERVER_PROOFREAD_PREF_KEY
                    || keyResId == GboardAiWritingToolsOfficialPreferences.SERVER_WRITING_TOOLS_PREF_KEY
                    || keyResId == GboardAiWritingToolsOfficialPreferences
                    .WRITING_TOOLS_COOPERATIVE_MODE_PREF_KEY;
        } catch (Throwable throwable) {
            Log.w(TAG, LOG_PREFIX + "failed to evaluate settings visibility override",
                    throwable);
            return false;
        }
    }

    static Object computeOverrideValue(String flagName, boolean featureEnabled,
            boolean allKeyboardsEnabled,
            GboardAiWritingToolsOfficialPreferences.Snapshot officialPreferences) {
        if (!featureEnabled || flagName == null || flagName.isEmpty()) {
            return null;
        }

        Boolean booleanOverride = desiredBooleanFlagValue(flagName, officialPreferences);
        if (booleanOverride != null) {
            return booleanOverride;
        }

        String modelVersionOverride = desiredModelVersionFlagValue(flagName);
        if (modelVersionOverride != null) {
            return modelVersionOverride;
        }

        if (allKeyboardsEnabled && shouldForceLanguageAllowlistFlag(flagName)) {
            return ALL_LANGUAGES_ALLOWLIST_VALUE;
        }
        return null;
    }

    static String buildFlagOverrideLog(String flagName, Object originalValue,
            Object overriddenValue, boolean featureEnabled, boolean allKeyboardsEnabled) {
        return "flag override"
                + ": flag=" + String.valueOf(flagName)
                + ", original=" + String.valueOf(originalValue)
                + ", override=" + String.valueOf(overriddenValue)
                + ", featureEnabled=" + featureEnabled
                + ", allKeyboardsEnabled=" + allKeyboardsEnabled;
    }

    static String buildSignalOverrideLog(String signalDescription, boolean featureEnabled) {
        return "signal override"
                + ": signal=" + String.valueOf(signalDescription)
                + ", featureEnabled=" + featureEnabled;
    }

    private static Boolean desiredBooleanFlagValue(String flagName,
            GboardAiWritingToolsOfficialPreferences.Snapshot officialPreferences) {
        if (officialPreferences == null) {
            officialPreferences = GboardAiWritingToolsOfficialPreferences.snapshot();
        }
        if (FLAG_CONFIG_PROOFREAD.equals(flagName)) {
            return officialPreferences.overrideProofreadFlagValue();
        }
        if (FLAG_WRITING_TOOLS.equals(flagName)
                || FLAG_ENABLE_WRITING_TOOLS_COOPERATIVE_MODE.equals(flagName)
                || FLAG_WRITING_HELPER_ON_SELECTED_TEXT.equals(flagName)
                || FLAG_WRITING_HELPER_ENABLE_TEXT_STYLIZATION_INTERNAL.equals(flagName)) {
            return officialPreferences.overrideEditTextWithAiFlagValue();
        }
        if (FLAG_WRITING_HELPER.equals(flagName)
                || FLAG_ENABLE_WRITING_TOOLS_FOR_MINORS.equals(flagName)) {
            return officialPreferences.overrideAnyFeatureFlagValue();
        }
        if (FLAG_ALLOW_GEN_AI_SERVER.equals(flagName)) {
            return officialPreferences.overrideAllowAnyServerFlagValue();
        }
        return null;
    }

    private static GboardAiWritingToolsOfficialPreferences.Snapshot resolveOfficialPreferencesSnapshot(
            Context context, ClassLoader classLoader, String flagName,
            GboardAiWritingToolsOfficialPreferences.Snapshot snapshot) {
        if (snapshot == null) {
            snapshot = GboardAiWritingToolsOfficialPreferences.snapshot();
        }
        if (!shouldSeedOfficialPreferences(flagName, snapshot)) {
            return snapshot;
        }
        return seedOfficialPreferencesSnapshot(context, classLoader, snapshot);
    }

    private static boolean shouldSeedOfficialPreferences(String flagName,
            GboardAiWritingToolsOfficialPreferences.Snapshot snapshot) {
        if (flagName == null || flagName.isEmpty() || snapshot == null) {
            return false;
        }
        if (FLAG_CONFIG_PROOFREAD.equals(flagName)) {
            return snapshot.overrideProofreadFlagValue() == null;
        }
        if (FLAG_WRITING_TOOLS.equals(flagName)
                || FLAG_ENABLE_WRITING_TOOLS_COOPERATIVE_MODE.equals(flagName)
                || FLAG_WRITING_HELPER_ON_SELECTED_TEXT.equals(flagName)
                || FLAG_WRITING_HELPER_ENABLE_TEXT_STYLIZATION_INTERNAL.equals(flagName)) {
            return snapshot.overrideEditTextWithAiFlagValue() == null;
        }
        if (FLAG_WRITING_HELPER.equals(flagName)
                || FLAG_ENABLE_WRITING_TOOLS_FOR_MINORS.equals(flagName)) {
            return snapshot.overrideAnyFeatureFlagValue() == null;
        }
        if (FLAG_ALLOW_GEN_AI_SERVER.equals(flagName)) {
            return snapshot.overrideAllowAnyServerFlagValue() == null;
        }
        return false;
    }

    private static GboardAiWritingToolsOfficialPreferences.Snapshot seedOfficialPreferencesSnapshot(
            Context context, ClassLoader classLoader,
            GboardAiWritingToolsOfficialPreferences.Snapshot fallbackSnapshot) {
        if (context == null || classLoader == null) {
            return fallbackSnapshot;
        }
        try {
            Class<?> preferenceManagerClass = Class.forName(
                    PREFERENCE_MANAGER_CLASS_NAME,
                    false,
                    classLoader);
            Object preferenceManager = preferenceManagerClass
                    .getMethod(PREFERENCE_MANAGER_FACTORY_METHOD, Context.class)
                    .invoke(null, context);
            if (preferenceManager == null) {
                return fallbackSnapshot;
            }
            seedOfficialPreferenceValue(
                    preferenceManager,
                    GboardAiWritingToolsOfficialPreferences.SHOW_FIX_IT_BUTTON_PREF_KEY);
            seedOfficialPreferenceValue(
                    preferenceManager,
                    GboardAiWritingToolsOfficialPreferences.SERVER_PROOFREAD_PREF_KEY);
            seedOfficialPreferenceValue(
                    preferenceManager,
                    GboardAiWritingToolsOfficialPreferences.SERVER_WRITING_TOOLS_PREF_KEY);
            seedOfficialPreferenceValue(
                    preferenceManager,
                    GboardAiWritingToolsOfficialPreferences.WRITING_TOOLS_COOPERATIVE_MODE_PREF_KEY);
            return GboardAiWritingToolsOfficialPreferences.snapshot();
        } catch (Throwable throwable) {
            Log.w(TAG, LOG_PREFIX + "failed to seed official writing-tools preferences", throwable);
            return fallbackSnapshot;
        }
    }

    private static void seedOfficialPreferenceValue(Object preferenceManager, int keyResId)
            throws Throwable {
        Object value = preferenceManager.getClass()
                .getMethod(PREFERENCE_MANAGER_BOOLEAN_METHOD, int.class)
                .invoke(preferenceManager, Integer.valueOf(keyResId));
        if (value instanceof Boolean) {
            GboardAiWritingToolsOfficialPreferences.notePreferenceValue(
                    keyResId,
                    ((Boolean) value).booleanValue());
        }
    }

    private static String desiredModelVersionFlagValue(String flagName) {
        if (FLAG_WRITING_HELPER_MODEL_VERSION.equals(flagName)) {
            return PROOFREAD_MODEL_VERSION_OVERRIDE;
        }
        if (FLAG_WRITING_HELPER_TEXT_STYLIZATION_MODEL_VERSION.equals(flagName)) {
            return STYLIZATION_MODEL_VERSION_OVERRIDE;
        }
        return null;
    }

    private static boolean shouldForceLanguageAllowlistFlag(String flagName) {
        return FLAG_WRITING_HELPER_SUPPORTED_LANGUAGE_TAGS.equals(flagName)
                || FLAG_LLM_PC_SUPPORTED_LANGUAGE_TAGS.equals(flagName);
    }

    private static boolean valuesEqual(Object left, Object right) {
        return left == right || (left != null && left.equals(right));
    }

    private static String readFlagName(Object receiver) throws Throwable {
        Field field = flagNameField;
        if (field == null || !field.getDeclaringClass().isInstance(receiver)) {
            field = receiver.getClass().getDeclaredField("a");
            field.setAccessible(true);
            flagNameField = field;
        }
        Object value = field.get(receiver);
        return value instanceof String ? (String) value : null;
    }

    private static String describeSignal(Object signal) {
        if (signal == null) {
            return "<null>";
        }
        try {
            return signal.getClass().getName() + "(" + signal + ")";
        } catch (Throwable ignored) {
            return signal.getClass().getName();
        }
    }

    private static void logFlagOverride(String flagName, Object originalValue,
            Object overriddenValue, boolean featureEnabled, boolean allKeyboardsEnabled) {
        logOnce(FLAG_HOOK_LOGGED, LOG_PREFIX + "flag override hook reached");
        logLimited(FLAG_OVERRIDE_COUNT, 80, LOG_PREFIX + buildFlagOverrideLog(
                flagName,
                originalValue,
                overriddenValue,
                featureEnabled,
                allKeyboardsEnabled));
    }

    private static void logSignalOverride(String signalDescription, boolean featureEnabled) {
        logOnce(SIGNAL_HOOK_LOGGED, LOG_PREFIX + "signal override hook reached");
        logLimited(SIGNAL_OVERRIDE_COUNT, 80, LOG_PREFIX + buildSignalOverrideLog(
                signalDescription,
                featureEnabled));
    }

    private static void logOnce(AtomicBoolean gate, String message) {
        if (gate.compareAndSet(false, true)) {
            Log.w(TAG, message);
        }
    }

    private static void logLimited(AtomicInteger counter, int limit, String message) {
        if (counter.incrementAndGet() <= limit) {
            Log.w(TAG, message);
        }
    }

    private static Set<Object> getForcedSignals(ClassLoader classLoader) throws Throwable {
        if (classLoader == cachedSignalClassLoader && cachedForcedSignals != null) {
            return cachedForcedSignals;
        }

        LinkedHashSet<Object> forcedSignals = new LinkedHashSet<Object>();
        for (String spec : FORCED_SIGNAL_TARGET_SPECS) {
            int separatorIndex = spec.indexOf('#');
            if (separatorIndex <= 0 || separatorIndex >= spec.length() - 1) {
                continue;
            }
            addStaticFieldValue(
                    forcedSignals,
                    classLoader,
                    spec.substring(0, separatorIndex),
                    spec.substring(separatorIndex + 1));
        }

        Set<Object> immutableSignals = Collections.unmodifiableSet(forcedSignals);
        cachedSignalClassLoader = classLoader;
        cachedForcedSignals = immutableSignals;
        return immutableSignals;
    }

    private static void addStaticFieldValue(Set<Object> values, ClassLoader classLoader,
            String className, String fieldName) throws Throwable {
        Class<?> targetClass = Class.forName(className, false, classLoader);
        Field field = targetClass.getDeclaredField(fieldName);
        field.setAccessible(true);
        Object value = field.get(null);
        if (value != null) {
            values.add(value);
        }
    }

    private static Context resolveContext() {
        Context cached = applicationContext;
        if (cached != null) {
            return cached;
        }

        Context reflected = reflectedApplicationContext(
                "android.app.ActivityThread",
                "currentApplication");
        if (reflected != null) {
            applicationContext = reflected;
            return reflected;
        }

        reflected = reflectedApplicationContext(
                "android.app.AppGlobals",
                "getInitialApplication");
        if (reflected != null) {
            applicationContext = reflected;
            return reflected;
        }

        return null;
    }

    static Context reflectedApplicationContext(String className, String methodName) {
        try {
            Class<?> owner = Class.forName(className);
            Object application = owner.getMethod(methodName).invoke(null);
            if (!(application instanceof Context context)) {
                return null;
            }
            Context resolvedContext = context.getApplicationContext();
            return resolvedContext != null ? resolvedContext : context;
        } catch (Throwable ignored) {
            return null;
        }
    }

    static String[] forcedSignalTargetSpecsForTesting() {
        return FORCED_SIGNAL_TARGET_SPECS.clone();
    }
}

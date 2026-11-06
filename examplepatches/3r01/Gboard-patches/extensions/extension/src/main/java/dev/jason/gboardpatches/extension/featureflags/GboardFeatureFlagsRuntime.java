package dev.jason.gboardpatches.extension.featureflags;

import android.content.Context;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;

@SuppressWarnings("unused")
public final class GboardFeatureFlagsRuntime {
    public static final String FLAG_DEVICE_INTELLIGENCE =
            "enable_device_intelligence";
    public static final String FLAG_GRAMMAR_CHECKER =
            "enable_grammar_checker";
    public static final String FLAG_INLINE_SUGGESTIONS =
            "enable_inline_suggestions_on_client_side";
    public static final String FLAG_MULTIPLE_SMART_SUGGESTIONS =
            "show_multiple_categories";
    public static final String FLAG_KEY_SHAPE_SELECTION =
            "more_pill_keys";

    private static final Map<String, String> FLAG_TO_FEATURE_KEY =
            createFlagToFeatureKeyMap();
    private static final Map<String, Boolean> FEATURE_ENABLED_CACHE =
            Collections.synchronizedMap(new HashMap<String, Boolean>());

    private static volatile Context APPLICATION_CONTEXT;

    private GboardFeatureFlagsRuntime() {
    }

    public static Object applyOverriddenFlagValue(String flagName, Object original) {
        if (original != Boolean.FALSE) {
            return original;
        }

        return isActiveRecognizedFlag(flagName) ? Boolean.TRUE : original;
    }

    public static Object applyMultipleSmartSuggestionsFlagValue(String flagName, Object original) {
        return applyOverriddenFlagValue(flagName, original);
    }

    public static Object applyDeviceIntelligenceFlagValue(String flagName, Object original) {
        return applySelectedFlagValue(
                flagName,
                original,
                FLAG_DEVICE_INTELLIGENCE,
                GboardPatchesFeatureAvailability.FEATURE_DEVICE_INTELLIGENCE);
    }

    public static Object applyGrammarCheckerFlagValue(String flagName, Object original) {
        return applySelectedFlagValue(
                flagName,
                original,
                FLAG_GRAMMAR_CHECKER,
                GboardPatchesFeatureAvailability.FEATURE_GRAMMAR_CHECKER);
    }

    public static Object applyInlineSuggestionsFlagValue(String flagName, Object original) {
        return applySelectedFlagValue(
                flagName,
                original,
                FLAG_INLINE_SUGGESTIONS,
                GboardPatchesFeatureAvailability.FEATURE_INLINE_SUGGESTIONS);
    }

    public static Object applyKeyShapeSelectionFlagValue(String flagName, Object original) {
        return applySelectedFlagValue(
                flagName,
                original,
                FLAG_KEY_SHAPE_SELECTION,
                GboardPatchesFeatureAvailability.FEATURE_KEY_SHAPE_SELECTION);
    }

    private static Object applySelectedFlagValue(
            String flagName,
            Object original,
            String selectedFlag,
            String selectedFeatureKey) {
        if (original != Boolean.FALSE || !selectedFlag.equals(flagName)) {
            return original;
        }
        return isActiveFeature(selectedFeatureKey) ? Boolean.TRUE : original;
    }

    private static boolean isActiveRecognizedFlag(String flagName) {
        if (flagName == null || flagName.isEmpty()) {
            return false;
        }

        String featureKey = FLAG_TO_FEATURE_KEY.get(flagName);
        if (featureKey == null) {
            return false;
        }

        return isActiveFeature(featureKey);
    }

    private static boolean isActiveFeature(String featureKey) {
        Boolean cached = FEATURE_ENABLED_CACHE.get(featureKey);
        if (cached != null) {
            return cached.booleanValue();
        }

        Context context = applicationContext();
        if (context == null) {
            return false;
        }

        boolean enabled = GboardPatchesFeatureAvailability.hasFeature(context, featureKey);
        FEATURE_ENABLED_CACHE.put(featureKey, Boolean.valueOf(enabled));
        return enabled;
    }

    private static Map<String, String> createFlagToFeatureKeyMap() {
        Map<String, String> featureKeys = new HashMap<String, String>();
        featureKeys.put(
                FLAG_DEVICE_INTELLIGENCE,
                GboardPatchesFeatureAvailability.FEATURE_DEVICE_INTELLIGENCE);
        featureKeys.put(
                FLAG_GRAMMAR_CHECKER,
                GboardPatchesFeatureAvailability.FEATURE_GRAMMAR_CHECKER);
        featureKeys.put(
                FLAG_INLINE_SUGGESTIONS,
                GboardPatchesFeatureAvailability.FEATURE_INLINE_SUGGESTIONS);
        featureKeys.put(
                FLAG_MULTIPLE_SMART_SUGGESTIONS,
                GboardPatchesFeatureAvailability.FEATURE_MULTIPLE_SMART_SUGGESTIONS);
        featureKeys.put(
                FLAG_KEY_SHAPE_SELECTION,
                GboardPatchesFeatureAvailability.FEATURE_KEY_SHAPE_SELECTION);
        return Collections.unmodifiableMap(featureKeys);
    }

    private static Context applicationContext() {
        Context context = APPLICATION_CONTEXT;
        if (context != null) {
            return context;
        }

        context = reflectedApplicationContext("android.app.ActivityThread", "currentApplication");
        if (context != null) {
            APPLICATION_CONTEXT = context;
            return context;
        }

        context = reflectedApplicationContext("android.app.AppGlobals", "getInitialApplication");
        if (context != null) {
            APPLICATION_CONTEXT = context;
        }
        return context;
    }

    private static Context reflectedApplicationContext(String className, String methodName) {
        try {
            Class<?> owner = Class.forName(className);
            Method method = owner.getDeclaredMethod(methodName);
            Object application = method.invoke(null);
            return application instanceof Context ? (Context) application : null;
        } catch (Throwable ignored) {
            return null;
        }
    }
}

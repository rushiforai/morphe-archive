package dev.jason.gboardpatches.extension.featureflags;

import android.content.Context;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;

@SuppressWarnings("unused")
public final class GboardFeatureFlagsRuntime {
    public static final String FLAG_CLIPBOARD_ENTITY_EXTRACTION =
            "enable_clipboard_entity_extraction";
    public static final String FLAG_CLIPBOARD_ITEM_EDIT =
            "enable_clipboard_text_editor";
    public static final String FLAG_DEVICE_INTELLIGENCE =
            "enable_device_intelligence";
    public static final String FLAG_GRAMMAR_CHECKER =
            "enable_grammar_checker";
    public static final String FLAG_INLINE_SUGGESTIONS =
            "enable_inline_suggestions_on_client_side";
    public static final String FLAG_KEY_SHAPE_SELECTION =
            "more_pill_keys";

    private static final Map<String, String> FLAG_TO_FEATURE_KEY =
            createFlagToFeatureKeyMap();
    private static final Map<String, Boolean> FEATURE_ENABLED_CACHE =
            Collections.synchronizedMap(new HashMap<String, Boolean>());

    private static volatile Context APPLICATION_CONTEXT;

    private GboardFeatureFlagsRuntime() {
    }

    public static boolean shouldForceFlagTrue(String flagName) {
        if (flagName == null || flagName.isEmpty()) {
            return false;
        }

        String featureKey = FLAG_TO_FEATURE_KEY.get(flagName);
        if (featureKey == null) {
            return false;
        }

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
                FLAG_CLIPBOARD_ENTITY_EXTRACTION,
                GboardPatchesFeatureAvailability.FEATURE_CLIPBOARD_ENTITY_EXTRACTION);
        featureKeys.put(
                FLAG_CLIPBOARD_ITEM_EDIT,
                GboardPatchesFeatureAvailability.FEATURE_CLIPBOARD_ITEM_EDIT);
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

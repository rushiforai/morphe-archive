package io.github.bakwudo.uyu.extension.settings;

public final class PrivacySupport {
    private PrivacySupport() {}

    public static boolean shouldDisableComscore() {
        return Settings.DISABLE_COMSCORE.get();
    }

    public static void beforeCrashReport() {
        if (!Settings.DISABLE_BUGSNAG.get()) return;
        try {
            Class<?> clazz = Class.forName("com.google.firebase.crashlytics.FirebaseCrashlytics");
            Object instance = clazz.getMethod("getInstance").invoke(null);
            clazz.getMethod("setCrashlyticsCollectionEnabled", boolean.class)
                    .invoke(instance, false);
        } catch (Throwable ignored) {}
    }

    public static boolean shouldDisableCrashReporting() {
        return Settings.DISABLE_BUGSNAG.get();
    }
}

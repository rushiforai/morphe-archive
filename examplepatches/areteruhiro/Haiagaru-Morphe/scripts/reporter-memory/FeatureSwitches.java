package app.morphe.extension.chmate;
/** Host-only default settings; Android-backed settings are exercised by instrumentation. */
final class FeatureSwitches {
    static boolean enabled(String key, boolean initial) { return initial; }
}

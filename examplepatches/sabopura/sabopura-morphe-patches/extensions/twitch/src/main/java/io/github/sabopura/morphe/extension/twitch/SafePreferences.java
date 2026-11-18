package io.github.sabopura.morphe.extension.twitch;

import android.content.SharedPreferences;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Settings whose reads answer the default when the stored value has another type than the one asked
 * for. SharedPreferences throws there, and a value can arrive with the wrong type from an import that
 * was edited by hand, from a backup of another version, or from an older build that kept the key
 * differently. The patch reads its settings inside Twitch's own calls, where a throw takes the app down.
 */
public final class SafePreferences implements SharedPreferences {
    /** One wrapper for each file: Android hands out the same object for a file as long as the app runs. */
    private static final Map<SharedPreferences, SafePreferences> WRAPPED = new ConcurrentHashMap<>();

    private final SharedPreferences base;

    private SafePreferences(SharedPreferences base) {
        this.base = base;
    }

    /** {@code base} with safe reads; null stays null. */
    public static SharedPreferences of(SharedPreferences base) {
        if (base == null || base instanceof SafePreferences) return base;
        SafePreferences safe = WRAPPED.get(base);
        if (safe != null) return safe;
        safe = new SafePreferences(base);
        SafePreferences earlier = WRAPPED.putIfAbsent(base, safe);
        return earlier == null ? safe : earlier;
    }

    private static void mistyped(String key, ClassCastException failure) {
        ClassCastException named = new ClassCastException(nameable(key) + ": " + failure.getMessage());
        // The report should point at the code that asked for the value, not at this wrapper.
        StackTraceElement[] trace = failure.getStackTrace();
        String self = SafePreferences.class.getName();
        int caller = 0;
        while (caller < trace.length && !self.equals(trace[caller].getClassName())) caller++;
        while (caller < trace.length && self.equals(trace[caller].getClassName())) caller++;
        named.setStackTrace(Arrays.copyOfRange(trace, caller, trace.length));
        Diagnostics.note("settings.type", named);
    }

    /** A setting's own name can be shown; a key made from a channel or a video says what was watched. */
    static String nameable(String key) {
        if (key == null || key.isEmpty() || key.length() > 40) return "(key)";
        for (int i = 0; i < key.length(); i++) {
            char c = key.charAt(i);
            if (!(c >= 'a' && c <= 'z' || c == '_')) return "(key)";
        }
        return key;
    }

    @Override
    public boolean getBoolean(String key, boolean fallback) {
        try {
            return base.getBoolean(key, fallback);
        } catch (ClassCastException e) {
            mistyped(key, e);
            return fallback;
        }
    }

    @Override
    public int getInt(String key, int fallback) {
        try {
            return base.getInt(key, fallback);
        } catch (ClassCastException e) {
            mistyped(key, e);
            return fallback;
        }
    }

    @Override
    public long getLong(String key, long fallback) {
        try {
            return base.getLong(key, fallback);
        } catch (ClassCastException e) {
            mistyped(key, e);
            return fallback;
        }
    }

    @Override
    public float getFloat(String key, float fallback) {
        try {
            return base.getFloat(key, fallback);
        } catch (ClassCastException e) {
            mistyped(key, e);
            return fallback;
        }
    }

    @Override
    public String getString(String key, String fallback) {
        try {
            return base.getString(key, fallback);
        } catch (ClassCastException e) {
            mistyped(key, e);
            return fallback;
        }
    }

    @Override
    public Set<String> getStringSet(String key, Set<String> fallback) {
        try {
            return base.getStringSet(key, fallback);
        } catch (ClassCastException e) {
            mistyped(key, e);
            return fallback;
        }
    }

    @Override
    public Map<String, ?> getAll() {
        return base.getAll();
    }

    @Override
    public boolean contains(String key) {
        return base.contains(key);
    }

    @Override
    public Editor edit() {
        return base.edit();
    }

    @Override
    public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
        base.registerOnSharedPreferenceChangeListener(listener);
    }

    @Override
    public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
        base.unregisterOnSharedPreferenceChangeListener(listener);
    }
}

package io.github.ilikeadofai.vocacolle.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

/** Persistent settings owned by the VocaColle Morphe extension. */
@SuppressWarnings("deprecation")
public final class SettingsStore {
    private static final boolean DEFAULT_RUNTIME_FEATURES_ENABLED = true;

    private final Backend backend;

    public SettingsStore(Backend backend) {
        if (backend == null) {
            throw new NullPointerException("backend");
        }
        this.backend = backend;
    }

    public static SettingsStore from(Context context) {
        if (context == null) {
            throw new NullPointerException("context");
        }
        Context applicationContext = context.getApplicationContext();
        Context storageContext = applicationContext != null ? applicationContext : context;
        SharedPreferences preferences =
                PreferenceManager.getDefaultSharedPreferences(storageContext);
        return new SettingsStore(new SharedPreferencesBackend(preferences));
    }

    public boolean areRuntimeFeaturesEnabled() {
        return backend.getBoolean(
                SettingKeys.RUNTIME_FEATURES_ENABLED,
                DEFAULT_RUNTIME_FEATURES_ENABLED
        );
    }

    public void setRuntimeFeaturesEnabled(boolean enabled) {
        backend.putBoolean(SettingKeys.RUNTIME_FEATURES_ENABLED, enabled);
    }

    public DisplayLanguage getDisplayLanguage() {
        String value = backend.getString(
                SettingKeys.DISPLAY_LANGUAGE,
                DisplayLanguage.SYSTEM.persistedValue()
        );
        return DisplayLanguage.fromPersistedValue(value);
    }

    public void setDisplayLanguage(DisplayLanguage language) {
        if (language == null) {
            throw new NullPointerException("language");
        }
        backend.putString(SettingKeys.DISPLAY_LANGUAGE, language.persistedValue());
    }

    public interface Backend {
        boolean getBoolean(String key, boolean defaultValue);

        void putBoolean(String key, boolean value);

        String getString(String key, String defaultValue);

        void putString(String key, String value);
    }

    private static final class SharedPreferencesBackend implements Backend {
        private final SharedPreferences preferences;

        private SharedPreferencesBackend(SharedPreferences preferences) {
            this.preferences = preferences;
        }

        @Override
        public boolean getBoolean(String key, boolean defaultValue) {
            return preferences.getBoolean(key, defaultValue);
        }

        @Override
        public void putBoolean(String key, boolean value) {
            preferences.edit().putBoolean(key, value).apply();
        }

        @Override
        public String getString(String key, String defaultValue) {
            return preferences.getString(key, defaultValue);
        }

        @Override
        public void putString(String key, String value) {
            preferences.edit().putString(key, value).apply();
        }
    }
}

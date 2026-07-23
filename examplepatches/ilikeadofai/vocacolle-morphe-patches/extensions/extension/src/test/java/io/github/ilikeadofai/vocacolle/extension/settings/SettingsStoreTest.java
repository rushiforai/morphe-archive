package io.github.ilikeadofai.vocacolle.extension.settings;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.Map;
import org.junit.Test;

public class SettingsStoreTest {
    @Test
    public void runtimeFeaturesDefaultToEnabledAndPersistChanges() {
        InMemoryBackend backend = new InMemoryBackend();
        SettingsStore firstProcess = new SettingsStore(backend);

        assertTrue(firstProcess.areRuntimeFeaturesEnabled());
        firstProcess.setRuntimeFeaturesEnabled(false);

        SettingsStore restartedProcess = new SettingsStore(backend);
        assertFalse(restartedProcess.areRuntimeFeaturesEnabled());
    }

    @Test
    public void displayLanguageDefaultsToSystemAndPersistsValidValues() {
        InMemoryBackend backend = new InMemoryBackend();
        SettingsStore firstProcess = new SettingsStore(backend);

        assertEquals(DisplayLanguage.SYSTEM, firstProcess.getDisplayLanguage());
        firstProcess.setDisplayLanguage(DisplayLanguage.KOREAN);

        assertEquals(
                DisplayLanguage.KOREAN,
                new SettingsStore(backend).getDisplayLanguage()
        );
    }

    @Test
    public void unknownStoredDisplayLanguageFallsBackToSystem() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.putString(SettingKeys.DISPLAY_LANGUAGE, "unsupported");

        assertEquals(
                DisplayLanguage.SYSTEM,
                new SettingsStore(backend).getDisplayLanguage()
        );
    }

    private static final class InMemoryBackend implements SettingsStore.Backend {
        private final Map<String, Boolean> values = new HashMap<>();
        private final Map<String, String> stringValues = new HashMap<>();

        @Override
        public boolean getBoolean(String key, boolean defaultValue) {
            return values.getOrDefault(key, defaultValue);
        }

        @Override
        public void putBoolean(String key, boolean value) {
            values.put(key, value);
        }

        @Override
        public String getString(String key, String defaultValue) {
            return stringValues.getOrDefault(key, defaultValue);
        }

        @Override
        public void putString(String key, String value) {
            stringValues.put(key, value);
        }
    }
}

package dev.jason.gboardpatches.extension.spacebarlogo;

import org.junit.Assert;
import org.junit.Test;

import android.content.SharedPreferences;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public final class GboardSpacebarLogoSettingsTest {
    @Test
    public void normalizesSupportedColorFormats() {
        Assert.assertEquals("#4285F4", GboardSpacebarLogoSettings.normalizeColorValue("4285f4"));
        Assert.assertEquals("#804285F4", GboardSpacebarLogoSettings.normalizeColorValue("#804285f4"));
        Assert.assertEquals("AUTO", GboardSpacebarLogoSettings.normalizeColorValue("auto"));
        Assert.assertNull(GboardSpacebarLogoSettings.tryNormalizeColorHex("#12345"));
    }

    @Test
    public void normalizesIconsToGoogleG() {
        Assert.assertEquals("HEART", GboardSpacebarLogoContract.normalizeIcon("heart"));
        Assert.assertEquals("EMOJI", GboardSpacebarLogoContract.normalizeIcon("emoji"));
        Assert.assertEquals("GOOGLE_G", GboardSpacebarLogoContract.normalizeIcon("unknown"));
    }

    @Test
    public void defaultsMatchAcceptedFeature() {
        Assert.assertFalse(GboardSpacebarLogoSettings.DEFAULT_ENABLED);
        Assert.assertEquals("GOOGLE_G", GboardSpacebarLogoSettings.DEFAULT_ICON);
        Assert.assertEquals("#4285F4", GboardSpacebarLogoSettings.DEFAULT_COLOR_HEX);
    }

    @Test
    public void customColorSurvivesSelectingAnotherPreset() {
        MemoryPreferences preferences = new MemoryPreferences();
        GboardSpacebarLogoSettings.ensureDefaults(preferences);

        Assert.assertTrue(GboardSpacebarLogoSettings.writeCustomColor(
                preferences, "#80123456"));
        Assert.assertEquals("#80123456",
                GboardSpacebarLogoSettings.readCustomColorHex(preferences));
        Assert.assertEquals("CUSTOM",
                GboardSpacebarLogoSettings.readColorSelection(preferences));

        Assert.assertTrue(GboardSpacebarLogoSettings.writeColorHex(
                preferences, GboardSpacebarLogoSettings.GOOGLE_RED));
        Assert.assertEquals(GboardSpacebarLogoSettings.GOOGLE_RED,
                GboardSpacebarLogoSettings.readColorSelection(preferences));
        Assert.assertEquals("#80123456",
                GboardSpacebarLogoSettings.readCustomColorHex(preferences));
    }

    @Test
    public void defaultsSeedAllOwnedValuesWithoutErasingExistingCustomColor() {
        MemoryPreferences preferences = new MemoryPreferences();
        preferences.values.put(GboardSpacebarLogoSettings.PREF_KEY_CUSTOM_COLOR, "#123456");

        GboardSpacebarLogoSettings.ensureDefaults(preferences);

        Assert.assertFalse(GboardSpacebarLogoSettings.readEnabled(preferences));
        Assert.assertEquals("GOOGLE_G", GboardSpacebarLogoSettings.readIcon(preferences));
        Assert.assertEquals("#123456",
                GboardSpacebarLogoSettings.readCustomColorHex(preferences));
    }

    private static final class MemoryPreferences implements SharedPreferences {
        final Map<String, Object> values = new HashMap<>();

        @Override public Map<String, ?> getAll() {
            return Collections.unmodifiableMap(new HashMap<>(values));
        }
        @Override public String getString(String key, String fallback) {
            Object value = values.get(key); return value instanceof String ? (String) value : fallback;
        }
        @Override @SuppressWarnings("unchecked") public Set<String> getStringSet(
                String key, Set<String> fallback) {
            Object value = values.get(key); return value instanceof Set ? (Set<String>) value : fallback;
        }
        @Override public int getInt(String key, int fallback) { return fallback; }
        @Override public long getLong(String key, long fallback) { return fallback; }
        @Override public float getFloat(String key, float fallback) { return fallback; }
        @Override public boolean getBoolean(String key, boolean fallback) {
            Object value = values.get(key); return value instanceof Boolean
                    ? ((Boolean) value).booleanValue() : fallback;
        }
        @Override public boolean contains(String key) { return values.containsKey(key); }
        @Override public Editor edit() { return new MemoryEditor(); }
        @Override public void registerOnSharedPreferenceChangeListener(
                OnSharedPreferenceChangeListener listener) { }
        @Override public void unregisterOnSharedPreferenceChangeListener(
                OnSharedPreferenceChangeListener listener) { }

        private final class MemoryEditor implements Editor {
            final Map<String, Object> pending = new HashMap<>();
            final Set<String> removals = new HashSet<>();
            boolean clear;
            @Override public Editor putString(String key, String value) { pending.put(key, value); return this; }
            @Override public Editor putStringSet(String key, Set<String> value) { pending.put(key, value); return this; }
            @Override public Editor putInt(String key, int value) { pending.put(key, value); return this; }
            @Override public Editor putLong(String key, long value) { pending.put(key, value); return this; }
            @Override public Editor putFloat(String key, float value) { pending.put(key, value); return this; }
            @Override public Editor putBoolean(String key, boolean value) { pending.put(key, value); return this; }
            @Override public Editor remove(String key) { removals.add(key); return this; }
            @Override public Editor clear() { clear = true; return this; }
            @Override public boolean commit() { apply(); return true; }
            @Override public void apply() {
                if (clear) values.clear();
                for (String key : removals) values.remove(key);
                values.putAll(pending);
            }
        }
    }
}

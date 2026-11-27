package dev.srwi.gintype.extension.thicctopbar;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class ThiccTopBarSettingsTest {

    @Test
    public void defaultStateIsEnabled() {
        TestSharedPreferences prefs = new TestSharedPreferences();
        Assert.assertTrue(GboardThiccTopBarSettings.readEnabled(prefs));
    }

    @Test
    public void readEnabledWithNullContextFailsClosed() {
        Assert.assertFalse(GboardThiccTopBarSettings.readEnabled((Context) null));
    }

    @Test
    public void readsBooleanAndStringValues() {
        TestSharedPreferences prefs = new TestSharedPreferences();

        prefs.values.put(GboardThiccTopBarSettings.PREF_KEY_ENABLED, Boolean.FALSE);
        Assert.assertFalse(GboardThiccTopBarSettings.readEnabled(prefs));

        prefs.values.put(GboardThiccTopBarSettings.PREF_KEY_ENABLED, Boolean.TRUE);
        Assert.assertTrue(GboardThiccTopBarSettings.readEnabled(prefs));

        prefs.values.put(GboardThiccTopBarSettings.PREF_KEY_ENABLED, "false");
        Assert.assertFalse(GboardThiccTopBarSettings.readEnabled(prefs));

        prefs.values.put(GboardThiccTopBarSettings.PREF_KEY_ENABLED, "true");
        Assert.assertTrue(GboardThiccTopBarSettings.readEnabled(prefs));
    }

    @Test
    public void writeAndEnsureDefault() {
        TestSharedPreferences prefs = new TestSharedPreferences();

        GboardThiccTopBarSettings.ensureDefault(prefs);
        Assert.assertEquals(Boolean.TRUE, prefs.values.get(GboardThiccTopBarSettings.PREF_KEY_ENABLED));

        GboardThiccTopBarSettings.writeEnabled(prefs, false);
        Assert.assertFalse(GboardThiccTopBarSettings.readEnabled(prefs));

        GboardThiccTopBarSettings.writeEnabled(prefs, true);
        Assert.assertTrue(GboardThiccTopBarSettings.readEnabled(prefs));
    }

    @Test
    public void chooseNormalAccentPrefersStockTrailThenPrimaryThenGoogleBlue() {
        Assert.assertEquals(0xFFECC09F,
                ThiccTopBarGboardReflector.chooseNormalAccentColor(0xECC09F, 0xA8C7FA, true));
        Assert.assertEquals(0xFFA8C7FA,
                ThiccTopBarGboardReflector.chooseNormalAccentColor(-1, 0xA8C7FA, true));
        Assert.assertEquals(0xFF8AB4F8,
                ThiccTopBarGboardReflector.chooseNormalAccentColor(-1, -1, true));
        Assert.assertEquals(0xFF1A73E8,
                ThiccTopBarGboardReflector.chooseNormalAccentColor(-1, -1, false));
    }

    @Test
    public void recordStockTrailAccentUpdatesResolvedColorWhenDarkPolarityMatches() {
        try {
            ThiccTopBarGboardReflector.resetAccentCacheForTesting();
            ThiccTopBarGboardReflector.recordStockTrailAccent(null, 0xECC09F);
            Assert.assertEquals(0xFFECC09F, ThiccTopBarGboardReflector.resolveNormalAccentColor(null, true));
            Assert.assertTrue(ThiccTopBarGboardReflector.perceivedLuminance(0xFFECC09F) >= 140f);
            Assert.assertTrue(ThiccTopBarGboardReflector.perceivedLuminance(0xFF845B38) < 140f);
        } finally {
            ThiccTopBarGboardReflector.resetAccentCacheForTesting();
        }
    }

    @Test
    public void recordKeyboardThemeAccentOverridesStockTrailAndEnsuresReadability() {
        try {
            ThiccTopBarGboardReflector.resetAccentCacheForTesting();
            ThiccTopBarGboardReflector.recordStockTrailAccent(null, 0xECC09F);
            ThiccTopBarGboardReflector.recordKeyboardThemeAccent(0xE91E63);
            int darkResolved = ThiccTopBarGboardReflector.resolveNormalAccentColor(null, true);
            Assert.assertTrue(ThiccTopBarGboardReflector.perceivedLuminance(darkResolved & 0x00ffffff) >= 115f);

            ThiccTopBarGboardReflector.recordKeyboardThemeAccent(0xD3E3FD);
            int lightResolved = ThiccTopBarGboardReflector.resolveNormalAccentColor(null, false);
            Assert.assertTrue(ThiccTopBarGboardReflector.perceivedLuminance(lightResolved & 0x00ffffff) <= 155f);

            // Already readable colors are preserved verbatim.
            Assert.assertEquals(0xA8C7FA, ThiccTopBarGboardReflector.ensureReadableAccentRgb(0xA8C7FA, true));
            Assert.assertEquals(0x1A73E8, ThiccTopBarGboardReflector.ensureReadableAccentRgb(0x1A73E8, false));
        } finally {
            ThiccTopBarGboardReflector.resetAccentCacheForTesting();
        }
    }

    @Test
    public void topbarScaleDefaultsAndPersistence() {
        TestSharedPreferences prefs = new TestSharedPreferences();
        Assert.assertEquals(
                GboardThiccTopBarSettings.DEFAULT_TOPBAR_SCALE,
                GboardThiccTopBarSettings.readTopbarScale(prefs),
                0.0001f);

        GboardThiccTopBarSettings.ensureDefaults(prefs);
        Assert.assertEquals(
                GboardThiccTopBarSettings.DEFAULT_TOPBAR_SCALE,
                GboardThiccTopBarSettings.readTopbarScale(prefs),
                0.0001f);

        GboardThiccTopBarSettings.writeTopbarScale(prefs, 1.50f);
        Assert.assertEquals(1.50f, GboardThiccTopBarSettings.readTopbarScale(prefs), 0.0001f);

        // Re-running ensureDefaults must preserve explicit user values.
        GboardThiccTopBarSettings.ensureDefaults(prefs);
        Assert.assertEquals(1.50f, GboardThiccTopBarSettings.readTopbarScale(prefs), 0.0001f);
    }

    @Test
    public void doubleTapMultiWordSelectDefaultsTrueAndPersistsToggle() {
        TestSharedPreferences prefs = new TestSharedPreferences();
        Assert.assertTrue(GboardThiccTopBarSettings.readDoubleTapMultiWordSelect(prefs));

        GboardThiccTopBarSettings.ensureDefaults(prefs);
        Assert.assertTrue(GboardThiccTopBarSettings.readDoubleTapMultiWordSelect(prefs));

        GboardThiccTopBarSettings.writeDoubleTapMultiWordSelect(prefs, false);
        Assert.assertFalse(GboardThiccTopBarSettings.readDoubleTapMultiWordSelect(prefs));

        // Re-running ensureDefaults must preserve explicit user values.
        GboardThiccTopBarSettings.ensureDefaults(prefs);
        Assert.assertFalse(GboardThiccTopBarSettings.readDoubleTapMultiWordSelect(prefs));
    }

    @Test
    public void topbarScaleSanitizesAndClampsOutOfRangeValues() {
        TestSharedPreferences prefs = new TestSharedPreferences();

        Assert.assertEquals(
                GboardThiccTopBarSettings.DEFAULT_TOPBAR_SCALE,
                GboardThiccTopBarSettings.sanitizeTopbarScale(Float.NaN),
                0.0001f);
        Assert.assertEquals(
                GboardThiccTopBarSettings.DEFAULT_TOPBAR_SCALE,
                GboardThiccTopBarSettings.sanitizeTopbarScale(Float.POSITIVE_INFINITY),
                0.0001f);
        Assert.assertEquals(
                GboardThiccTopBarSettings.MIN_TOPBAR_SCALE,
                GboardThiccTopBarSettings.sanitizeTopbarScale(0.5f),
                0.0001f);
        Assert.assertEquals(
                GboardThiccTopBarSettings.MAX_TOPBAR_SCALE,
                GboardThiccTopBarSettings.sanitizeTopbarScale(3.5f),
                0.0001f);

        prefs.values.put(GboardThiccTopBarSettings.PREF_KEY_TOPBAR_SCALE, 2.75f);
        Assert.assertEquals(
                GboardThiccTopBarSettings.MAX_TOPBAR_SCALE,
                GboardThiccTopBarSettings.readTopbarScale(prefs),
                0.0001f);

        prefs.values.put(GboardThiccTopBarSettings.PREF_KEY_TOPBAR_SCALE, "invalid");
        Assert.assertEquals(
                GboardThiccTopBarSettings.DEFAULT_TOPBAR_SCALE,
                GboardThiccTopBarSettings.readTopbarScale(prefs),
                0.0001f);
    }

    @Test
    public void invertSwipeDefaultsAndPersistence() {
        TestSharedPreferences prefs = new TestSharedPreferences();
        Assert.assertFalse(GboardThiccTopBarSettings.readInvertSwipe(prefs));

        GboardThiccTopBarSettings.ensureDefaults(prefs);
        Assert.assertFalse(GboardThiccTopBarSettings.readInvertSwipe(prefs));

        Assert.assertTrue(GboardThiccTopBarSettings.writeInvertSwipe(prefs, true));
        Assert.assertTrue(GboardThiccTopBarSettings.readInvertSwipe(prefs));

        // Re-running ensureDefaults must preserve explicit user choice.
        GboardThiccTopBarSettings.ensureDefaults(prefs);
        Assert.assertTrue(GboardThiccTopBarSettings.readInvertSwipe(prefs));

        prefs.values.put(GboardThiccTopBarSettings.PREF_KEY_INVERT_SWIPE, "invalid");
        Assert.assertFalse(GboardThiccTopBarSettings.readInvertSwipe(prefs));
    }

    @Test
    public void computeSwappedIndexRespectsInvertDirection() {
        // Default (wheel-roll): flick up moves bottom word into center (+1), flick down moves top into center (-1).
        Assert.assertEquals(1, VerticalWordWheelView.computeSwappedIndex(0, 3, true, false));
        Assert.assertEquals(2, VerticalWordWheelView.computeSwappedIndex(0, 3, false, false));

        // Inverted: flick up selects top word (-1), flick down selects bottom word (+1).
        Assert.assertEquals(2, VerticalWordWheelView.computeSwappedIndex(0, 3, true, true));
        Assert.assertEquals(1, VerticalWordWheelView.computeSwappedIndex(0, 3, false, true));

        // Wrap-around on 2-item list swaps cleanly in either mode.
        Assert.assertEquals(1, VerticalWordWheelView.computeSwappedIndex(0, 2, true, false));
        Assert.assertEquals(1, VerticalWordWheelView.computeSwappedIndex(0, 2, true, true));
    }

    @Test
    public void swipeSensitivityDefaultsPersistenceAndSanitization() {
        TestSharedPreferences prefs = new TestSharedPreferences();
        Assert.assertEquals(
                GboardThiccTopBarSettings.DEFAULT_SWIPE_SENSITIVITY,
                GboardThiccTopBarSettings.readSwipeSensitivity(prefs),
                0.0001f);

        GboardThiccTopBarSettings.ensureDefaults(prefs);
        Assert.assertEquals(
                GboardThiccTopBarSettings.DEFAULT_SWIPE_SENSITIVITY,
                GboardThiccTopBarSettings.readSwipeSensitivity(prefs),
                0.0001f);

        GboardThiccTopBarSettings.writeSwipeSensitivity(prefs, 0.75f);
        Assert.assertEquals(0.75f, GboardThiccTopBarSettings.readSwipeSensitivity(prefs), 0.0001f);

        // Re-running ensureDefaults must preserve explicit user values.
        GboardThiccTopBarSettings.ensureDefaults(prefs);
        Assert.assertEquals(0.75f, GboardThiccTopBarSettings.readSwipeSensitivity(prefs), 0.0001f);

        Assert.assertEquals(
                GboardThiccTopBarSettings.DEFAULT_SWIPE_SENSITIVITY,
                GboardThiccTopBarSettings.sanitizeSwipeSensitivity(Float.NaN),
                0.0001f);
        Assert.assertEquals(
                GboardThiccTopBarSettings.MIN_SWIPE_SENSITIVITY,
                GboardThiccTopBarSettings.sanitizeSwipeSensitivity(0.05f),
                0.0001f);
        Assert.assertEquals(
                GboardThiccTopBarSettings.MAX_SWIPE_SENSITIVITY,
                GboardThiccTopBarSettings.sanitizeSwipeSensitivity(4.0f),
                0.0001f);

        prefs.values.put(GboardThiccTopBarSettings.PREF_KEY_SWIPE_SENSITIVITY, "invalid");
        Assert.assertEquals(
                GboardThiccTopBarSettings.DEFAULT_SWIPE_SENSITIVITY,
                GboardThiccTopBarSettings.readSwipeSensitivity(prefs),
                0.0001f);
    }

    @Test
    public void horizontalStepThresholdScalesWithTopbarSizeAndSensitivity() {
        float base = 16f;

        // Default scale (1.0) and default sensitivity (1.0) preserves base step distance.
        Assert.assertEquals(16f, ThiccTopBarView.computeHorizontalStepThresholdPx(base, 1.0f, 1.0f), 0.001f);

        // Larger top bar requires proportionally more distance per word step.
        Assert.assertEquals(24f, ThiccTopBarView.computeHorizontalStepThresholdPx(base, 1.5f, 1.0f), 0.001f);
        Assert.assertEquals(32f, ThiccTopBarView.computeHorizontalStepThresholdPx(base, 2.0f, 1.0f), 0.001f);

        // Higher sensitivity reduces required distance; lower sensitivity increases it.
        Assert.assertEquals(8f, ThiccTopBarView.computeHorizontalStepThresholdPx(base, 1.0f, 2.0f), 0.001f);
        Assert.assertEquals(32f, ThiccTopBarView.computeHorizontalStepThresholdPx(base, 1.0f, 0.5f), 0.001f);

        // Combined: 2.0x top bar size with 0.5x sensitivity yields 4.0x distance.
        Assert.assertEquals(64f, ThiccTopBarView.computeHorizontalStepThresholdPx(base, 2.0f, 0.5f), 0.001f);

        // Out-of-range inputs are clamped/sanitized safely.
        Assert.assertEquals(
                base * GboardThiccTopBarSettings.DEFAULT_TOPBAR_SCALE,
                ThiccTopBarView.computeHorizontalStepThresholdPx(base, Float.NaN, Float.NaN),
                0.001f);
    }

    private static final class TestSharedPreferences implements SharedPreferences {
        final Map<String, Object> values = new HashMap<>();

        @Override
        public Map<String, ?> getAll() {
            return values;
        }

        @Override
        public String getString(String key, String defValue) {
            Object v = values.get(key);
            return v instanceof String ? (String) v : defValue;
        }

        @Override
        public Set<String> getStringSet(String key, Set<String> defValues) {
            return defValues;
        }

        @Override
        public int getInt(String key, int defValue) {
            Object v = values.get(key);
            return v instanceof Integer ? (Integer) v : defValue;
        }

        @Override
        public long getLong(String key, long defValue) {
            Object v = values.get(key);
            return v instanceof Long ? (Long) v : defValue;
        }

        @Override
        public float getFloat(String key, float defValue) {
            Object v = values.get(key);
            return v instanceof Float ? (Float) v : defValue;
        }

        @Override
        public boolean getBoolean(String key, boolean defValue) {
            Object v = values.get(key);
            return v instanceof Boolean ? (Boolean) v : defValue;
        }

        @Override
        public boolean contains(String key) {
            return values.containsKey(key);
        }

        @Override
        public Editor edit() {
            return new TestEditor();
        }

        @Override
        public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {}

        @Override
        public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {}

        final class TestEditor implements Editor {
            final Map<String, Object> pending = new HashMap<>();

            @Override
            public Editor putString(String key, String value) { pending.put(key, value); return this; }
            @Override
            public Editor putStringSet(String key, Set<String> values) { return this; }
            @Override
            public Editor putInt(String key, int value) { pending.put(key, value); return this; }
            @Override
            public Editor putLong(String key, long value) { pending.put(key, value); return this; }
            @Override
            public Editor putFloat(String key, float value) { pending.put(key, value); return this; }
            @Override
            public Editor putBoolean(String key, boolean value) { pending.put(key, value); return this; }
            @Override
            public Editor remove(String key) { pending.remove(key); values.remove(key); return this; }
            @Override
            public Editor clear() { pending.clear(); values.clear(); return this; }
            @Override
            public boolean commit() { values.putAll(pending); return true; }
            @Override
            public void apply() { commit(); }
        }
    }
}

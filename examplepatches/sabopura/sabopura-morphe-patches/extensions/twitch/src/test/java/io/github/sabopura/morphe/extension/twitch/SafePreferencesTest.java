package io.github.sabopura.morphe.extension.twitch;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.SharedPreferences;

import org.junit.Test;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class SafePreferencesTest {
    /** Stored values that throw on a read of another type, as Android's own do. */
    private static final class Stored implements SharedPreferences {
        final Map<String, Object> values = new HashMap<>();

        @SuppressWarnings("unchecked")
        private <T> T read(String key, T fallback) {
            Object value = values.get(key);
            return value == null ? fallback : (T) value;
        }

        @Override public boolean getBoolean(String key, boolean fallback) {
            Boolean value = read(key, null);
            return value == null ? fallback : value;
        }

        @Override public int getInt(String key, int fallback) {
            Integer value = read(key, null);
            return value == null ? fallback : value;
        }

        @Override public long getLong(String key, long fallback) {
            Long value = read(key, null);
            return value == null ? fallback : value;
        }

        @Override public float getFloat(String key, float fallback) {
            Float value = read(key, null);
            return value == null ? fallback : value;
        }

        @Override public String getString(String key, String fallback) {
            String value = read(key, null);
            return value == null ? fallback : value;
        }

        @Override public Set<String> getStringSet(String key, Set<String> fallback) {
            Set<String> value = read(key, null);
            return value == null ? fallback : value;
        }

        @Override public Map<String, ?> getAll() {
            return values;
        }

        @Override public boolean contains(String key) {
            return values.containsKey(key);
        }

        @Override public Editor edit() {
            return null;
        }

        @Override public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
        }

        @Override public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
        }
    }

    @Test
    public void aValueOfAnotherTypeReadsAsTheDefault() {
        Stored stored = new Stored();
        // An import edited by hand: a switch written as text, a size written as a switch.
        stored.values.put("hide_unfollow", "true");
        stored.values.put("font_percent", true);
        stored.values.put("words", 3);
        stored.values.put("sleep_until", "soon");
        stored.values.put("ratio", "wide");
        stored.values.put("favorite_emotes", "KEKW");
        SharedPreferences safe = SafePreferences.of(stored);

        assertFalse(safe.getBoolean("hide_unfollow", false));
        assertTrue(safe.getBoolean("hide_unfollow", true));
        assertEquals(100, safe.getInt("font_percent", 100));
        assertEquals("", safe.getString("words", ""));
        assertEquals(7L, safe.getLong("sleep_until", 7L));
        assertEquals(1.5f, safe.getFloat("ratio", 1.5f), 0f);
        assertEquals(Collections.<String>emptySet(), safe.getStringSet("favorite_emotes", Collections.<String>emptySet()));
    }

    @Test
    public void aValueOfTheRightTypeAndAMissingOneReadAsBefore() {
        Stored stored = new Stored();
        stored.values.put("enabled", false);
        stored.values.put("font_percent", 130);
        stored.values.put("words", "w");
        SharedPreferences safe = SafePreferences.of(stored);

        assertFalse(safe.getBoolean("enabled", true));
        assertEquals(130, safe.getInt("font_percent", 100));
        assertEquals("w", safe.getString("words", ""));
        assertEquals(5, safe.getInt("missing", 5));
        assertNull(safe.getString("missing", null));
        assertTrue(safe.contains("enabled"));
        assertSame(stored.values, safe.getAll());
    }

    @Test
    public void oneFileHasOneWrapperAndAWrapperIsNotWrappedAgain() {
        Stored stored = new Stored();
        SharedPreferences safe = SafePreferences.of(stored);
        assertSame(safe, SafePreferences.of(stored));
        assertSame(safe, SafePreferences.of(safe));
        assertNull(SafePreferences.of(null));
    }

    @Test
    public void onlyASettingsOwnNameIsShownInTheDiagnostics() {
        assertEquals("hide_unfollow", SafePreferences.nameable("hide_unfollow"));
        // Keys made from what was watched stay out of the text a user pastes into a bug report.
        assertEquals("(key)", SafePreferences.nameable("vod_sync_2928138160"));
        assertEquals("(key)", SafePreferences.nameable("profile:SomeChannel"));
        assertEquals("(key)", SafePreferences.nameable(""));
        assertEquals("(key)", SafePreferences.nameable(null));
    }
}

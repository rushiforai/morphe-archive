import android.content.SharedPreferences;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/** Test-only storage with Android SharedPreferences type and clear semantics. */
final class InMemoryPreferences implements SharedPreferences {
    private final Map<String, Object> values = new HashMap<>();
    private final Set<OnSharedPreferenceChangeListener> listeners = new HashSet<>();

    private Object read(String key, Object fallback, Class<?> type) {
        Object value = values.get(key);
        if (value == null) return fallback;
        if (!type.isInstance(value)) throw new ClassCastException(key);
        return value;
    }

    @Override public Map<String, ?> getAll() { return Collections.unmodifiableMap(new HashMap<>(values)); }
    @Override public String getString(String key, String fallback) { return (String) read(key, fallback, String.class); }
    @SuppressWarnings("unchecked")
    @Override public Set<String> getStringSet(String key, Set<String> fallback) {
        Set<String> result = (Set<String>) read(key, fallback, Set.class);
        return result == null ? null : new HashSet<>(result);
    }
    @Override public int getInt(String key, int fallback) { return (Integer) read(key, fallback, Integer.class); }
    @Override public long getLong(String key, long fallback) { return (Long) read(key, fallback, Long.class); }
    @Override public float getFloat(String key, float fallback) { return (Float) read(key, fallback, Float.class); }
    @Override public boolean getBoolean(String key, boolean fallback) { return (Boolean) read(key, fallback, Boolean.class); }
    @Override public boolean contains(String key) { return values.containsKey(key); }
    @Override public Editor edit() { return new MemoryEditor(); }
    @Override public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) { listeners.add(listener); }
    @Override public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) { listeners.remove(listener); }

    private final class MemoryEditor implements Editor {
        private final Map<String, Object> pending = new HashMap<>();
        private boolean clear;
        private Editor put(String key, Object value) { pending.put(key, value); return this; }
        @Override public Editor putString(String key, String value) { return put(key, value); }
        @Override public Editor putStringSet(String key, Set<String> value) { return put(key, value == null ? null : new HashSet<>(value)); }
        @Override public Editor putInt(String key, int value) { return put(key, value); }
        @Override public Editor putLong(String key, long value) { return put(key, value); }
        @Override public Editor putFloat(String key, float value) { return put(key, value); }
        @Override public Editor putBoolean(String key, boolean value) { return put(key, value); }
        @Override public Editor remove(String key) { return put(key, null); }
        @Override public Editor clear() { clear = true; return this; }
        @Override public boolean commit() {
            Set<String> changed = new HashSet<>();
            if (clear) { changed.addAll(values.keySet()); values.clear(); }
            for (Map.Entry<String, Object> entry : pending.entrySet()) {
                if (entry.getValue() == null) values.remove(entry.getKey());
                else values.put(entry.getKey(), entry.getValue());
                changed.add(entry.getKey());
            }
            for (String key : changed) for (OnSharedPreferenceChangeListener listener : new HashSet<>(listeners)) {
                listener.onSharedPreferenceChanged(InMemoryPreferences.this, key);
            }
            return true;
        }
        @Override public void apply() { commit(); }
    }
}

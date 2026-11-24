package android.content;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public interface SharedPreferences {
    interface Editor {
        Editor putString(String key, String value);
        Editor putInt(String key, int value);
        Editor putLong(String key, long value);
        Editor putBoolean(String key, boolean value);
        Editor remove(String key);
        Editor clear();
        boolean commit();
        void apply();
    }

    Map<String, ?> getAll();
    String getString(String key, String defValue);
    int getInt(String key, int defValue);
    long getLong(String key, long defValue);
    boolean getBoolean(String key, boolean defValue);
    boolean contains(String key);
    Editor edit();

    final class InMemory implements SharedPreferences {
        private final Map<String, Object> data = new HashMap<String, Object>();

        @Override public synchronized Map<String, ?> getAll() {
            return Collections.unmodifiableMap(new HashMap<String, Object>(data));
        }

        @Override public synchronized String getString(String key, String defValue) {
            Object v = data.get(key);
            return v instanceof String ? (String) v : defValue;
        }

        @Override public synchronized int getInt(String key, int defValue) {
            Object v = data.get(key);
            return v instanceof Integer ? ((Integer) v).intValue() : defValue;
        }

        @Override public synchronized long getLong(String key, long defValue) {
            Object v = data.get(key);
            return v instanceof Long ? ((Long) v).longValue() : defValue;
        }

        @Override public synchronized boolean getBoolean(String key, boolean defValue) {
            Object v = data.get(key);
            return v instanceof Boolean ? ((Boolean) v).booleanValue() : defValue;
        }

        @Override public synchronized boolean contains(String key) {
            return data.containsKey(key);
        }

        @Override public Editor edit() {
            return new Editor() {
                private final Map<String, Object> staged = new HashMap<String, Object>();
                private boolean clearFirst = false;

                @Override public Editor putString(String key, String value) { staged.put(key, value); return this; }
                @Override public Editor putInt(String key, int value) { staged.put(key, Integer.valueOf(value)); return this; }
                @Override public Editor putLong(String key, long value) { staged.put(key, Long.valueOf(value)); return this; }
                @Override public Editor putBoolean(String key, boolean value) { staged.put(key, Boolean.valueOf(value)); return this; }
                @Override public Editor remove(String key) { staged.put(key, null); return this; }
                @Override public Editor clear() { clearFirst = true; staged.clear(); return this; }
                @Override public boolean commit() { apply(); return true; }

                @Override public void apply() {
                    synchronized (InMemory.this) {
                        if (clearFirst) data.clear();
                        for (Map.Entry<String, Object> e : staged.entrySet()) {
                            if (e.getValue() == null) data.remove(e.getKey());
                            else data.put(e.getKey(), e.getValue());
                        }
                    }
                }
            };
        }
    }
}

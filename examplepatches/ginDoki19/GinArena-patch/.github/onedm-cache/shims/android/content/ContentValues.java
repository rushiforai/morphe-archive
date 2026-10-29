package android.content;

import java.util.HashMap;
import java.util.Map;

public final class ContentValues {
    private final Map<String, Object> values = new HashMap<>();
    public ContentValues() {}
    public ContentValues(int size) {}
    public void put(String key, String value) { values.put(key, value); }
    public void put(String key, Integer value) { values.put(key, value); }
    public void put(String key, Long value) { values.put(key, value); }
    public void put(String key, Boolean value) { values.put(key, value); }
    public void put(String key, Double value) { values.put(key, value); }
    public void put(String key, Float value) { values.put(key, value); }
    public void put(String key, byte[] value) { values.put(key, value); }
    public void putNull(String key) { values.put(key, null); }
    public Object get(String key) { return values.get(key); }
    public int size() { return values.size(); }
    public void clear() { values.clear(); }
}

package android.os;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class Bundle implements Parcelable {
    private final Map<String, Object> map = new HashMap<String, Object>();

    public Bundle() {}

    public Bundle(Bundle other) {
        if (other != null) map.putAll(other.map);
    }

    public void putAll(Bundle other) {
        if (other != null) map.putAll(other.map);
    }

    public void putString(String key, String value) { map.put(key, value); }
    public String getString(String key) {
        Object v = map.get(key);
        return v instanceof String ? (String) v : null;
    }

    public void putBoolean(String key, boolean value) { map.put(key, Boolean.valueOf(value)); }
    public boolean getBoolean(String key) { return getBoolean(key, false); }
    public boolean getBoolean(String key, boolean def) {
        Object v = map.get(key);
        return v instanceof Boolean ? ((Boolean) v).booleanValue() : def;
    }

    public void putLong(String key, long value) { map.put(key, Long.valueOf(value)); }
    public long getLong(String key) { return getLong(key, 0L); }
    public long getLong(String key, long def) {
        Object v = map.get(key);
        return v instanceof Long ? ((Long) v).longValue() : def;
    }

    public void putCharSequence(String key, CharSequence value) { map.put(key, value); }
    public CharSequence getCharSequence(String key) {
        Object v = map.get(key);
        return v instanceof CharSequence ? (CharSequence) v : null;
    }
    public CharSequence getCharSequence(String key, CharSequence def) {
        CharSequence v = getCharSequence(key);
        return v != null ? v : def;
    }

    public void putParcelable(String key, Parcelable value) { map.put(key, value); }
    @SuppressWarnings("unchecked")
    public <T extends Parcelable> T getParcelable(String key) {
        Object v = map.get(key);
        try { return (T) v; } catch (ClassCastException e) { return null; }
    }

    public void putParcelableArray(String key, Parcelable[] value) { map.put(key, value); }
    public Parcelable[] getParcelableArray(String key) {
        Object v = map.get(key);
        return v instanceof Parcelable[] ? (Parcelable[]) v : null;
    }

    public boolean containsKey(String key) { return map.containsKey(key); }
    public void remove(String key) { map.remove(key); }
    public Set<String> keySet() { return map.keySet(); }

    @Override public int describeContents() { return 0; }
    @Override public void writeToParcel(Parcel dest, int flags) {}
}

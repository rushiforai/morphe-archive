package android.os;
import java.util.ArrayList;
import java.util.HashMap;
public class Bundle extends HashMap<String, Object> {
    public int getInt(String key) { return (Integer) getOrDefault(key, 0); }
    public void putInt(String key, int value) { put(key, value); }
    @SuppressWarnings("unchecked")
    public <T> ArrayList<T> getParcelableArrayList(String key) { return (ArrayList<T>) get(key); }
    public <T> void putParcelableArrayList(String key, ArrayList<T> value) { put(key, value); }
}

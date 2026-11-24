package android.content.res;

import android.util.DisplayMetrics;
import java.util.HashMap;
import java.util.Map;

public class Resources {
    private final DisplayMetrics metrics = new DisplayMetrics();
    private final Map<String, Integer> stringIds = new HashMap<String, Integer>();
    private final Map<Integer, String> strings = new HashMap<Integer, String>();
    private int nextId = 1000;

    public void putStringForTest(String name, String value) {
        Integer existing = stringIds.get(name);
        int id = existing != null ? existing.intValue() : nextId++;
        stringIds.put(name, Integer.valueOf(id));
        strings.put(Integer.valueOf(id), value);
    }

    public int getIdentifier(String name, String defType, String defPackage) {
        if ("string".equals(defType)) {
            Integer id = stringIds.get(name);
            return id != null ? id.intValue() : 0;
        }
        return 0;
    }

    public String getString(int id) {
        String value = strings.get(Integer.valueOf(id));
        if (value == null) throw new RuntimeException("Missing resource " + id);
        return value;
    }

    public CharSequence getText(int id) {
        return getString(id);
    }

    public DisplayMetrics getDisplayMetrics() { return metrics; }
}

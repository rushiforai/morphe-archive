package app.morphe.extension.chmate;

import android.content.SharedPreferences;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

public final class SharedNgDefaultsTest {
    static int checks;
    static void check(boolean value) {
        if (!value) throw new AssertionError("check " + checks);
        checks++;
    }

    static SharedPreferences prefs(Map<String, Object> values, int[] writes) {
        SharedPreferences.Editor editor = (SharedPreferences.Editor) Proxy.newProxyInstance(
                SharedNgDefaultsTest.class.getClassLoader(), new Class<?>[]{SharedPreferences.Editor.class},
                (proxy, method, args) -> {
                    if (method.getName().startsWith("put")) {
                        values.put((String) args[0], args[1]);
                        return proxy;
                    }
                    if (method.getName().equals("apply")) { writes[0]++; return null; }
                    throw new AssertionError(method);
                });
        return (SharedPreferences) Proxy.newProxyInstance(
                SharedNgDefaultsTest.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
                (proxy, method, args) -> {
                    if (method.getName().equals("edit")) return editor;
                    if (method.getName().equals("getInt") || method.getName().equals("getBoolean"))
                        return values.getOrDefault(args[0], args[1]);
                    throw new AssertionError(method);
                });
    }

    public static void main(String[] args) {
        for (Integer old : new Integer[]{null, -1, 0, 1, 2, 3, Integer.MAX_VALUE}) {
            Map<String, Object> values = new HashMap<>();
            if (old != null) values.put("threshold", old);
            values.put("enabled", false);
            values.put("exceptions", "preserved");
            int[] writes = {0};
            SharedPreferences prefs = prefs(values, writes);
            SharedNgDefaults.migrate(prefs);
            int expected = old == null || old < 2 ? 2 : old;
            check(prefs.getInt("threshold", SharedNgDefaults.DEFAULT_THRESHOLD) == expected);
            check(writes[0] == 1);
            check(Boolean.FALSE.equals(values.get("enabled")));
            check("preserved".equals(values.get("exceptions")));
            SharedNgDefaults.migrate(prefs);
            check(writes[0] == 1);
            values.put("threshold", 1);
            SharedNgDefaults.migrate(prefs);
            check(prefs.getInt("threshold", 2) == 1);
            check(writes[0] == 1);
        }
        System.out.println("SharedNgDefaultsTest: " + checks + " checks passed");
    }
}

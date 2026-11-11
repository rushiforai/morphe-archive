package e.e.a;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONObject;

/** Round-trip all ambient and tap-area keys through the real backup codec. */
public final class SettingsBackupNewKeysTest {
    private static int assertions;
    private static void require(boolean ok, String what) {
        assertions++;
        if (!ok) throw new AssertionError(what);
    }
    private static void reject(JSONObject encoded, String key, String type, Object value)
            throws Exception {
        JSONObject changed = new JSONObject(encoded.toString());
        changed.getJSONObject("settings").getJSONObject(key)
                .put("type", type).put("value", value);
        try {
            SettingsBackupData.decode(changed);
            throw new AssertionError("Accepted incorrect type for " + key);
        } catch (IOException expected) {
            assertions++;
        }
    }
    public static void main(String[] args) throws Exception {
        Map<String,Object> preferences = new LinkedHashMap<>();
        preferences.put("nicoid_single_tap_control_region",
                "rects:0-19-6-54,77-100-25-95");
        preferences.put("nicoid_single_tap_region_open_only", Boolean.TRUE);
        preferences.put("nicoid_ambient_enabled", Boolean.FALSE);
        preferences.put("nicoid_ambient_mode_0", Boolean.FALSE);
        preferences.put("nicoid_ambient_mode_1", Boolean.TRUE);
        preferences.put("nicoid_ambient_mode_2", Boolean.TRUE);
        preferences.put("nicoid_ambient_sides", 2); // right-only
        String[] keys = {"intensity", "spread", "softness", "brightness", "contrast",
                "saturation", "vibrance", "response", "rate", "resolution"};
        int[] values = {0, 88, 35, 131, 91, 150, 7, 62, 8, 24};
        for (int i=0;i<keys.length;i++) {
            preferences.put("nicoid_ambient_" + keys[i], values[i]);
        }
        // Existing backups remain valid and still omit sensitive settings.
        SettingsBackupData.TYPES.put("comment_hide", "boolean");
        preferences.put("comment_hide", Boolean.TRUE);
        preferences.put("save_cookie", "private-session-do-not-export");
        for (String key : preferences.keySet()) {
            if (key.equals("save_cookie")) continue;
            String expected = key.equals("nicoid_single_tap_control_region") ? "string" :
                    (key.equals("nicoid_single_tap_region_open_only") ||
                     key.equals("nicoid_ambient_enabled") ||
                     key.startsWith("nicoid_ambient_mode_") ||
                     key.equals("comment_hide")) ? "boolean" : "int";
            require(expected.equals(SettingsBackupData.TYPES.get(key)),
                    "Missing registered backup type for " + key);
        }
        JSONObject file = SettingsBackupData.encode(preferences);
        require(file.getInt("version") == 1, "Portable backup format version must stay 1");
        require(!file.toString().contains("private-session"), "Credential must not export");
        Map<String,Object> decoded = SettingsBackupData.decode(file);
        for (Map.Entry<String,Object> entry : preferences.entrySet()) {
            if (entry.getKey().equals("save_cookie")) continue;
            require(entry.getValue().equals(decoded.get(entry.getKey())),
                    "Backup round trip lost type/value: " + entry.getKey());
        }
        require(decoded.size() == preferences.size() - 1, "Unexpected omitted settings");
        reject(file, "nicoid_single_tap_control_region", "int", 1);
        reject(file, "nicoid_single_tap_region_open_only", "string", "true");
        reject(file, "nicoid_ambient_mode_1", "int", 1);
        reject(file, "nicoid_ambient_sides", "boolean", true);
        reject(file, "nicoid_ambient_spread", "string", "80");
        reject(file, "nicoid_ambient_rate", "int", 1.5);
        reject(file, "nicoid_ambient_rate", "int", 2147483648L);
        Map<String,Object> old = new LinkedHashMap<>();
        old.put("comment_hide", false);
        JSONObject legacy = SettingsBackupData.encode(old);
        require(SettingsBackupData.decode(legacy).get("comment_hide").equals(false),
                "Old format backup must still import");
        // Absent values should not be materialized as defaults during import.
        require(!SettingsBackupData.decode(legacy).containsKey("nicoid_ambient_enabled"),
                "Old backups must not forcibly change new preferences");
        System.out.println("PASS: " + assertions +
                " typed tap-area/ambient backup assertions and old-file compatibility");
    }
}

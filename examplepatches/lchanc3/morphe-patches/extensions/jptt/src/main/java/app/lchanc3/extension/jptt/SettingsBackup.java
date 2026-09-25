package app.lchanc3.extension.jptt;

import android.content.Context;
import android.content.SharedPreferences;
import androidx.preference.PreferenceManager;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;
import java.util.Set;

/**
 * Reads and writes the whole of JPTT's settings as JSON.
 *
 * <p>Every setting the app has, its own and the ones these patches add, is a key
 * in the one {@code SharedPreferences} that {@code PreferenceManager} hands out
 * by default, so a backup is that map and nothing else. Accounts and passwords
 * are <em>not</em> in it: {@code LoginActivity} keeps those in a file of its own
 * ({@code com.joshua.jptt.logininfo}), which this never opens.
 *
 * <p>Types are written out beside each value rather than inferred on the way
 * back. JSON has one number type and Android has four, so a round trip through
 * plain JSON would turn a {@code long} into an {@code int} and a
 * {@code ClassCastException} into the next thing the app reads it.
 */
@SuppressWarnings("unused")
public final class SettingsBackup {

    private static final String FORMAT = "jptt-patch-settings/1";
    private static final int MAX_BYTES = 4 * 1024 * 1024;

    public static SharedPreferences preferences(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context);
    }

    /** Every setting, as the JSON written to the file the user picked. */
    public static String export(Context context) throws Exception {
        JSONArray entries = new JSONArray();
        for (Map.Entry<String, ?> entry : preferences(context).getAll().entrySet()) {
            Object value = entry.getValue();
            if (value == null) {
                continue;
            }
            JSONObject item = new JSONObject();
            item.put("key", entry.getKey());
            if (value instanceof Boolean) {
                item.put("type", "boolean").put("value", value);
            } else if (value instanceof Integer) {
                item.put("type", "int").put("value", value);
            } else if (value instanceof Long) {
                item.put("type", "long").put("value", value);
            } else if (value instanceof Float) {
                item.put("type", "float").put("value", ((Float) value).doubleValue());
            } else if (value instanceof String) {
                item.put("type", "string").put("value", value);
            } else if (value instanceof Set) {
                JSONArray members = new JSONArray();
                for (Object member : (Set<?>) value) {
                    members.put(String.valueOf(member));
                }
                item.put("type", "stringSet").put("value", members);
            } else {
                continue;
            }
            entries.put(item);
        }

        JSONObject root = new JSONObject();
        root.put("format", FORMAT);
        root.put("package", context.getPackageName());
        root.put("exported", System.currentTimeMillis());
        root.put("entries", entries);
        return root.toString(2);
    }

    /**
     * Writes the settings in {@code json} over the ones already there, leaving
     * keys the file does not mention alone.
     *
     * @return how many settings were written.
     */
    public static int importFrom(Context context, String json) throws Exception {
        JSONObject root = new JSONObject(json);
        String format = root.optString("format");
        if (!FORMAT.equals(format)) {
            throw new IllegalArgumentException("此檔案不是本應用程式匯出的設定檔（format=" + format + "）");
        }

        JSONArray entries = root.getJSONArray("entries");
        SharedPreferences.Editor editor = preferences(context).edit();
        int written = 0;
        for (int i = 0; i < entries.length(); i++) {
            JSONObject item = entries.getJSONObject(i);
            String key = item.getString("key");
            String type = item.getString("type");
            switch (type) {
                case "boolean":
                    editor.putBoolean(key, item.getBoolean("value"));
                    break;
                case "int":
                    editor.putInt(key, item.getInt("value"));
                    break;
                case "long":
                    editor.putLong(key, item.getLong("value"));
                    break;
                case "float":
                    editor.putFloat(key, (float) item.getDouble("value"));
                    break;
                case "string":
                    editor.putString(key, item.getString("value"));
                    break;
                case "stringSet":
                    JSONArray members = item.getJSONArray("value");
                    java.util.Set<String> set = new java.util.LinkedHashSet<>();
                    for (int m = 0; m < members.length(); m++) {
                        set.add(members.getString(m));
                    }
                    editor.putStringSet(key, set);
                    break;
                default:
                    continue;
            }
            written++;
        }
        editor.apply();
        return written;
    }

    public static void write(OutputStream stream, String text) throws Exception {
        try {
            stream.write(text.getBytes("UTF-8"));
            stream.flush();
        } finally {
            stream.close();
        }
    }

    public static String read(InputStream stream) throws Exception {
        try {
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            byte[] chunk = new byte[8192];
            int read;
            while ((read = stream.read(chunk)) > 0) {
                buffer.write(chunk, 0, read);
                if (buffer.size() > MAX_BYTES) {
                    throw new IllegalArgumentException("檔案過大，不是有效的設定檔");
                }
            }
            return buffer.toString("UTF-8");
        } finally {
            stream.close();
        }
    }

    private SettingsBackup() {
    }
}

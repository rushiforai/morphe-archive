package app.yydarlinker.aicaptions.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.Map;
import java.util.Set;

/** Imports the 1.6.2 stores without modifying them or decoding credentials. */
public enum CaptionStorage {
    SETTINGS("ai_caption_translator", "deepseek_caption_translator"),
    CREDENTIALS("ai_caption_secret", "deepseek_caption_secret"),
    SESSION("ai_caption_session", "deepseek_caption_session");

    private static final String IMPORTED = "legacy_1_6_2_imported";
    private final String current;
    private final String previous;

    CaptionStorage(String current, String previous) {
        this.current = current;
        this.previous = previous;
    }

    public SharedPreferences open(Context context) {
        try {
            SharedPreferences target = context.getSharedPreferences(current, Context.MODE_PRIVATE);
            synchronized (this) {
                if (target.getBoolean(IMPORTED, false)) return target;
                Map<String, ?> snapshot =
                        context.getSharedPreferences(previous, Context.MODE_PRIVATE).getAll();
                if (snapshot.isEmpty()) return target;
                SharedPreferences.Editor importValues = target.edit();
                for (Map.Entry<String, ?> item : snapshot.entrySet()) {
                    String key = item.getKey();
                    if (!target.contains(key) && !IMPORTED.equals(key))
                        copy(importValues, key, item.getValue());
                }
                if (!importValues.putBoolean(IMPORTED, true).commit()) {
                    // Android updates its in-memory preferences even when a disk commit fails.
                    target.edit().remove(IMPORTED).apply();
                    throw new ConfigRead.Failure("legacy_storage_commit");
                }
                return target;
            }
        } catch (RuntimeException unavailable) {
            Log.w("AiCaptions", "CaptionStorage.open " + name() + " failed");
            if (unavailable instanceof ConfigRead.Failure) throw unavailable;
            throw new ConfigRead.Failure("legacy_storage_read");
        }
    }

    @SuppressWarnings("unchecked")
    private static void copy(SharedPreferences.Editor target, String key, Object value) {
        if (value instanceof String) target.putString(key, (String) value);
        else if (value instanceof Boolean) target.putBoolean(key, (Boolean) value);
        else if (value instanceof Integer) target.putInt(key, (Integer) value);
        else if (value instanceof Long) target.putLong(key, (Long) value);
        else if (value instanceof Float) target.putFloat(key, (Float) value);
        else if (value instanceof Set<?>) target.putStringSet(key, (Set<String>) value);
        else throw new ConfigRead.Failure("legacy_storage_type");
    }
}

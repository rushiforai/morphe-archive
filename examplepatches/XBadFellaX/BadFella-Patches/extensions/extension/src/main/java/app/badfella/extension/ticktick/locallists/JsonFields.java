package app.badfella.extension.ticktick.locallists;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Iterator;
import java.util.Set;

/** Strict, bounded JSON field readers. Android's org.json is deliberately lenient. */
final class JsonFields {
    static final long MAX_DATE = 4102444800000L; // 2100-01-01T00:00:00Z

    interface FieldSink {
        void ignored(String path);
    }

    private JsonFields() {
    }

    static JSONObject object(JSONObject parent, String key, String path) throws BackupException {
        Object value = parent.opt(key);
        if (value instanceof JSONObject) return (JSONObject) value;
        throw invalid(path, "must be an object");
    }

    static JSONArray array(JSONObject parent, String key, String path) throws BackupException {
        Object value = parent.opt(key);
        if (value == null || value == JSONObject.NULL) return new JSONArray();
        if (value instanceof JSONArray) return (JSONArray) value;
        throw invalid(path, "must be an array");
    }

    static String requiredString(JSONObject parent, String key, int maxLength, String path)
            throws BackupException {
        String value = optString(parent, key, maxLength, path, false);
        if (value == null || value.isEmpty()) throw invalid(path, "is required");
        return value;
    }

    static String optString(JSONObject parent, String key, int maxLength, String path,
            boolean allowEmpty) throws BackupException {
        Object value = parent.opt(key);
        if (value == null || value == JSONObject.NULL) return null;
        if (!(value instanceof String)) throw invalid(path, "must be a string");
        String text = (String) value;
        if (text.length() > maxLength) throw invalid(path, "is too long");
        if (!allowEmpty && text.isEmpty()) return null;
        return text;
    }

    static Long optLong(JSONObject parent, String key, long min, long max, String path)
            throws BackupException {
        Object value = parent.opt(key);
        if (value == null || value == JSONObject.NULL) return null;
        if (!(value instanceof Number) || value instanceof Double || value instanceof Float) {
            throw invalid(path, "must be an integer");
        }
        long number = ((Number) value).longValue();
        if (number < min || number > max) throw invalid(path, "is out of range");
        return Long.valueOf(number);
    }

    static long requiredLong(JSONObject parent, String key, long min, long max, String path)
            throws BackupException {
        Long value = optLong(parent, key, min, max, path);
        if (value == null) throw invalid(path, "is required");
        return value.longValue();
    }

    static Integer optInt(JSONObject parent, String key, int min, int max, String path)
            throws BackupException {
        Object value = parent.opt(key);
        if (value == null || value == JSONObject.NULL) return null;
        if (!(value instanceof Number) || value instanceof Double || value instanceof Float) {
            throw invalid(path, "must be an integer");
        }
        long number = ((Number) value).longValue();
        if (number < min || number > max) throw invalid(path, "is out of range");
        return Integer.valueOf((int) number);
    }

    static boolean optBoolean(JSONObject parent, String key, boolean fallback, String path)
            throws BackupException {
        Object value = parent.opt(key);
        if (value == null || value == JSONObject.NULL) return fallback;
        if (!(value instanceof Boolean)) throw invalid(path, "must be a boolean");
        return ((Boolean) value).booleanValue();
    }

    static void rejectUnknown(JSONObject parent, Set<String> allowed, String path,
            FieldSink sink) {
        if (sink == null) return;
        Iterator<String> keys = parent.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            if (!allowed.contains(key)) sink.ignored(path + "." + key);
        }
    }

    static BackupException invalid(String path, String message) {
        return new BackupException("Invalid backup field " + path + ": " + message);
    }
}

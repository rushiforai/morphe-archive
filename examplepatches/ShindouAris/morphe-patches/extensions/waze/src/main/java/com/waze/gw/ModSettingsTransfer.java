package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/** Typed, transactional backup/restore for user-facing WazeMod preferences. */
final class ModSettingsTransfer {
    private static final String TAG = "WazeGW.Settings";
    private static final String SCHEMA = "wazemod.settings";
    private static final int SCHEMA_VERSION = 1;
    private static final int MAX_IMPORT_BYTES = 2 * 1024 * 1024;
    private static final int MAX_ENTRIES = 512;

    private ModSettingsTransfer() { }

    static int exportToUri(Context context, SharedPreferences preferences, Uri destination) {
        if (context == null || preferences == null || destination == null) return -1;
        try {
            JSONObject values = new JSONObject();
            int count = 0;
            for (Map.Entry<String, ?> entry : preferences.getAll().entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();
                if (!isExportableKey(key) || value == null) continue;
                JSONObject typed = encode(value);
                if (typed == null) continue;
                values.put(key, typed);
                count++;
            }
            JSONObject root = new JSONObject();
            root.put("schema", SCHEMA);
            root.put("schemaVersion", SCHEMA_VERSION);
            root.put("exportedAtMs", System.currentTimeMillis());
            root.put("sourcePackage", context.getPackageName());
            root.put("settings", values);
            byte[] payload = root.toString(2).getBytes(StandardCharsets.UTF_8);
            try (OutputStream output = context.getContentResolver()
                    .openOutputStream(destination, "w")) {
                if (output == null) return -1;
                output.write(payload);
                output.flush();
            }
            return count;
        } catch (Throwable error) {
            Log.w(TAG, "Unable to export Mod settings", error);
            return -1;
        }
    }

    static int importFromUri(Context context, SharedPreferences preferences, Uri source) {
        if (context == null || preferences == null || source == null) return -1;
        try {
            byte[] payload = readLimited(context, source);
            JSONObject root = new JSONObject(new String(payload, StandardCharsets.UTF_8));
            if (!SCHEMA.equals(root.optString("schema"))
                    || root.optInt("schemaVersion", -1) != SCHEMA_VERSION) {
                throw new IllegalArgumentException("Unsupported settings schema");
            }
            JSONObject values = root.getJSONObject("settings");
            LinkedHashMap<String, Object> staged = new LinkedHashMap<String, Object>();
            java.util.Iterator<String> keys = values.keys();
            while (keys.hasNext()) {
                if (staged.size() >= MAX_ENTRIES) throw new IllegalArgumentException("Too many keys");
                String key = keys.next();
                if (!isExportableKey(key)) throw new IllegalArgumentException("Invalid key: " + key);
                staged.put(key, decode(values.getJSONObject(key)));
            }

            SharedPreferences.Editor editor = preferences.edit();
            for (String existing : preferences.getAll().keySet()) {
                if (isExportableKey(existing)) editor.remove(existing);
            }
            for (Map.Entry<String, Object> entry : staged.entrySet()) {
                put(editor, entry.getKey(), entry.getValue());
            }
            if (!editor.commit()) throw new IllegalStateException("Preference commit failed");
            return staged.size();
        } catch (Throwable error) {
            Log.w(TAG, "Unable to import Mod settings", error);
            return -1;
        }
    }

    private static JSONObject encode(Object value) throws Exception {
        JSONObject typed = new JSONObject();
        if (value instanceof Boolean) typed.put("type", "boolean");
        else if (value instanceof Integer) typed.put("type", "int");
        else if (value instanceof Long) typed.put("type", "long");
        else if (value instanceof Float) typed.put("type", "float");
        else if (value instanceof String) typed.put("type", "string");
        else if (value instanceof Set) {
            JSONArray array = new JSONArray();
            for (Object item : (Set<?>) value) {
                if (!(item instanceof String)) return null;
                array.put(item);
            }
            typed.put("type", "stringSet");
            typed.put("value", array);
            return typed;
        } else return null;
        typed.put("value", value);
        return typed;
    }

    private static Object decode(JSONObject typed) throws Exception {
        String type = typed.getString("type");
        if ("boolean".equals(type)) return typed.getBoolean("value");
        if ("int".equals(type)) return typed.getInt("value");
        if ("long".equals(type)) return typed.getLong("value");
        if ("float".equals(type)) return (float) typed.getDouble("value");
        if ("string".equals(type)) {
            String value = typed.getString("value");
            if (value.length() > 4096) throw new IllegalArgumentException("String too long");
            return value;
        }
        if ("stringSet".equals(type)) {
            JSONArray array = typed.getJSONArray("value");
            if (array.length() > 128) throw new IllegalArgumentException("Set too large");
            java.util.LinkedHashSet<String> result = new java.util.LinkedHashSet<String>();
            for (int i = 0; i < array.length(); i++) {
                String value = array.getString(i);
                if (value.length() > 512) throw new IllegalArgumentException("Set item too long");
                result.add(value);
            }
            return result;
        }
        throw new IllegalArgumentException("Unknown preference type: " + type);
    }

    @SuppressWarnings("unchecked")
    private static void put(SharedPreferences.Editor editor, String key, Object value) {
        if (value instanceof Boolean) editor.putBoolean(key, (Boolean) value);
        else if (value instanceof Integer) editor.putInt(key, (Integer) value);
        else if (value instanceof Long) editor.putLong(key, (Long) value);
        else if (value instanceof Float) editor.putFloat(key, (Float) value);
        else if (value instanceof String) editor.putString(key, (String) value);
        else if (value instanceof Set) editor.putStringSet(key, (Set<String>) value);
        else throw new IllegalArgumentException("Unsupported preference value");
    }

    private static byte[] readLimited(Context context, Uri source) throws Exception {
        try (InputStream input = context.getContentResolver().openInputStream(source);
             ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            if (input == null) throw new IllegalArgumentException("Unable to open settings file");
            byte[] buffer = new byte[8192];
            int total = 0;
            int count;
            while ((count = input.read(buffer)) >= 0) {
                total += count;
                if (total > MAX_IMPORT_BYTES) throw new IllegalArgumentException("Settings file too large");
                output.write(buffer, 0, count);
            }
            return output.toByteArray();
        }
    }

    private static boolean isExportableKey(String key) {
        if (key == null || key.length() == 0 || key.length() > 128
                || !key.matches("[A-Za-z0-9_.-]+")) return false;
        return !key.startsWith("pending_")
                && !key.startsWith("map_build_status_")
                && !key.startsWith("custom_alert_audio_")
                && !key.startsWith("wazemod_asset_")
                && !"hud_link_status".equals(key)
                && !"hud_link_error".equals(key)
                && !"hud_link_log".equals(key);
    }
}

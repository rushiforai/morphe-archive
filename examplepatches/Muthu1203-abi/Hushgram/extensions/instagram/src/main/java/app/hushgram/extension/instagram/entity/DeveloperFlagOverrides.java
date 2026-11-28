/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.entity;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.hushgram.extension.shared.Utils;

/** Typed, user-imported MobileConfig overrides. Only bool and long values are supported. */
public final class DeveloperFlagOverrides {
    private static final String PREFS = "hushgram_developer_flag_overrides";
    private static final String KEY = "json";
    private static final int MAX_BYTES = 256 * 1024;
    private static volatile Map<String, Object> overrides = new HashMap<>();
    private static volatile boolean loaded;
    private static final Map<Long, String> identifiers = new ConcurrentHashMap<>();

    private DeveloperFlagOverrides() { }

    public static Boolean booleanValue(long specifier) {
        String[] ids = ids(specifier);
        if (ids == null) return null;
        Map<String, Object> values = values();
        Object value = values.get(ids[0]);
        if (value instanceof Boolean) return (Boolean) value;
        value = values.get(ids[1]);
        return value instanceof Boolean ? (Boolean) value : null;
    }

    public static Long longValue(long specifier) {
        String[] ids = ids(specifier);
        if (ids == null) return null;
        Map<String, Object> values = values();
        Object value = values.get(ids[0]);
        if (value instanceof Long) return (Long) value;
        value = values.get(ids[1]);
        return value instanceof Long ? (Long) value : null;
    }

    private static String[] ids(long specifier) {
        try {
            String code = identifiers.get(specifier);
            if (code == null) {
                DeveloperOptionsItem item = new DeveloperOptionsItem(specifier);
                code = item.getConfigId();
                identifiers.put(specifier, code);
            }
            int split = code.indexOf("::");
            if (split < 1 || split == code.length() - 2) return null;
            return new String[]{code.substring(0, split), code};
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Map<String, Object> values() {
        if (!loaded) synchronized (DeveloperFlagOverrides.class) {
            if (!loaded) {
                Context context = Utils.getContext();
                if (context != null) {
                    String raw = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getString(KEY, null);
                    if (raw != null) try { overrides = parse(raw); } catch (Exception ignored) { }
                }
                loaded = true;
            }
        }
        return overrides;
    }

    private static Map<String, Object> parse(String source) throws Exception {
        if (source == null || source.getBytes("UTF-8").length > MAX_BYTES) throw new IllegalArgumentException("File too large");
        JSONObject root = new JSONObject(source);
        if (!"hushgram-flag-overrides".equals(root.optString("format")) || root.optInt("version", -1) != 1)
            throw new IllegalArgumentException("Unknown flags file format");
        JSONArray rows = root.optJSONArray("overrides");
        if (rows == null || rows.length() > 1000) throw new IllegalArgumentException("Invalid overrides list");
        Map<String, Object> parsed = new LinkedHashMap<>();
        for (int i = 0; i < rows.length(); i++) {
            JSONObject row = rows.optJSONObject(i);
            if (row == null) throw new IllegalArgumentException("Invalid override");
            String code = row.optString("code", "").trim();
            String type = row.optString("type", "").trim();
            if (!code.matches("[0-9]+(?:::[0-9]+)?")) throw new IllegalArgumentException("Invalid flag ID");
            if ("bool".equals(type)) {
                Object value = row.opt("value");
                if (!(value instanceof Boolean)) throw new IllegalArgumentException("Boolean flag needs true or false");
                parsed.put(code, value);
            } else if ("long".equals(type)) {
                Object value = row.opt("value");
                long number;
                if (value instanceof Number) number = ((Number) value).longValue();
                else if (value instanceof String) number = Long.parseLong((String) value);
                else throw new IllegalArgumentException("Long flag needs an integer");
                parsed.put(code, number);
            } else throw new IllegalArgumentException("Only bool and long flags are supported");
        }
        return parsed;
    }

    public static synchronized int importJson(String source) throws Exception {
        Map<String, Object> parsed = parse(source);
        JSONObject root = new JSONObject().put("format", "hushgram-flag-overrides").put("version", 1);
        JSONArray rows = new JSONArray();
        for (Map.Entry<String, Object> entry : parsed.entrySet()) {
            Object value = entry.getValue();
            rows.put(new JSONObject().put("code", entry.getKey())
                    .put("type", value instanceof Boolean ? "bool" : "long").put("value", value));
        }
        root.put("overrides", rows);
        Context context = Utils.getContext();
        if (context == null) throw new IllegalStateException("App context unavailable");
        SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (!prefs.edit().putString(KEY, root.toString()).commit()) throw new IllegalStateException("Could not save overrides");
        overrides = parsed;
        loaded = true;
        return parsed.size();
    }

    public static String exportJson() {
        Map<String, Object> current = values();
        try {
            JSONObject root = new JSONObject().put("format", "hushgram-flag-overrides").put("version", 1);
            JSONArray rows = new JSONArray();
            for (Map.Entry<String, Object> entry : current.entrySet()) {
                Object value = entry.getValue();
                rows.put(new JSONObject().put("code", entry.getKey())
                        .put("type", value instanceof Boolean ? "bool" : "long").put("value", value));
            }
            return root.put("overrides", rows).toString(2);
        } catch (Exception ignored) {
            return "{\"format\":\"hushgram-flag-overrides\",\"version\":1,\"overrides\":[]}";
        }
    }
}

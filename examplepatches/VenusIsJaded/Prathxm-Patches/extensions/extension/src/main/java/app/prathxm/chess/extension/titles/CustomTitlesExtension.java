package app.prathxm.chess.extension.titles;

import android.util.Log;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONObject;

public class CustomTitlesExtension {
    private static final String TAG = "CustomTitlesExt";
    private static final String JSON_URL = "https://raw.githubusercontent.com/PrathxmOp/my-apis/refs/heads/main/chess.json";
    static final Map<String, String> titleOverrides = new HashMap<>();
    private static boolean isInitialized = false;

    public static void init() {
        if (isInitialized) {
            return;
        }
        isInitialized = true;
        new Thread(new Runnable() {
            @Override
            public void run() {
                // Show the last downloaded titles right away (and when offline).
                String cached = readCache();
                if (cached != null) {
                    try {
                        applyJson(cached);
                    } catch (Exception e) {
                        Log.e(TAG, "Cached titles unreadable: " + e.getMessage());
                    }
                }
                try {
                    URL url = new URL(JSON_URL);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setConnectTimeout(5000);
                    conn.setReadTimeout(10000);
                    conn.setRequestMethod("GET");
                    if (conn.getResponseCode() == 200) {
                        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                        StringBuilder sb = new StringBuilder();
                        String line;
                        while ((line = reader.readLine()) != null) {
                            sb.append(line);
                        }
                        reader.close();

                        applyJson(sb.toString());
                        writeCache(sb.toString());
                        Log.i(TAG, "Loaded " + titleOverrides.size() + " custom titles.");
                    }
                    conn.disconnect();
                } catch (Exception e) {
                    Log.e(TAG, "Fetch failed: " + e.getMessage());
                }
            }
        }).start();
    }

    private static final String CACHE_PREFS = "prathxm_custom_titles";
    private static final String CACHE_KEY = "json";

    private static void applyJson(String text) throws Exception {
        JSONObject json = new JSONObject(text);
        JSONObject titlesJson = json.has("titles") ? json.getJSONObject("titles") : json;
        Map<String, String> fresh = new HashMap<>();
        Iterator<String> keys = titlesJson.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            String value = titlesJson.optString(key, null);
            if (value != null && !value.isEmpty()) {
                fresh.put(key.toLowerCase(java.util.Locale.ROOT).trim(), value.toUpperCase(java.util.Locale.ROOT).trim());
            }
        }
        synchronized (titleOverrides) {
            titleOverrides.clear();
            titleOverrides.putAll(fresh);
        }
    }

    private static android.content.SharedPreferences cachePrefs() {
        // Plain ActivityThread lookup: StockfishExtension.getContext() would also start the
        // engine, which must not happen when only this patch is enabled.
        android.content.Context ctx = null;
        try {
            ctx = (android.content.Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable ignored) {}
        return ctx != null ? ctx.getSharedPreferences(CACHE_PREFS, android.content.Context.MODE_PRIVATE) : null;
    }

    private static String readCache() {
        try {
            android.content.SharedPreferences p = cachePrefs();
            return p != null ? p.getString(CACHE_KEY, null) : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static void writeCache(String text) {
        try {
            android.content.SharedPreferences p = cachePrefs();
            if (p != null) p.edit().putString(CACHE_KEY, text).apply();
        } catch (Throwable ignored) {}
    }

    public static String getOverride(String username, String defaultTitle) {
        if (username == null) {
            return defaultTitle;
        }
        synchronized (titleOverrides) {
            String override = titleOverrides.get(username.toLowerCase(java.util.Locale.ROOT).trim());
            return override != null ? override : defaultTitle;
        }
    }

    public static String getOverrideOrNull(String username) {
        if (username == null) {
            return null;
        }
        synchronized (titleOverrides) {
            return titleOverrides.get(username.toLowerCase(java.util.Locale.ROOT).trim());
        }
    }

    public static Object getOverrideAsChessTitle(String username, Object defaultTitleObj) {
        String override = getOverrideOrNull(username);
        if (override == null) {
            return defaultTitleObj;
        }
        try {
            Class<?> companionClass = Class.forName("com.chess.entities.ChessTitle$Companion");
            Class<?> chessTitleClass = Class.forName("com.chess.entities.ChessTitle");
            Object instance = chessTitleClass.getField("Companion").get(null);
            java.lang.reflect.Method fromCode = companionClass.getMethod("fromCode", String.class);
            Object overrideObj = fromCode.invoke(instance, override);
            return overrideObj != null ? overrideObj : defaultTitleObj;
        } catch (Exception e) {
            try {
                Class<?> companionClass = Class.forName("com.chess.entities.ChessTitle$Companion");
                Class<?> chessTitleClass = Class.forName("com.chess.entities.ChessTitle");
                Object instance = chessTitleClass.getField("INSTANCE").get(null);
                java.lang.reflect.Method fromCode = companionClass.getMethod("fromCode", String.class);
                Object overrideObj = fromCode.invoke(instance, override);
                return overrideObj != null ? overrideObj : defaultTitleObj;
            } catch (Exception ex) {
                return defaultTitleObj;
            }
        }
    }

    public static Object getOverrideAsPaletteChessTitle(String username, Object defaultTitleObj) {
        String override = getOverrideOrNull(username);
        if (override == null) {
            return defaultTitleObj;
        }
        try {
            Class<?> chessTitleClass = Class.forName("com.chess.palette.compose.component.ChessTitle");
            java.lang.reflect.Method valuesMethod = chessTitleClass.getMethod("values");
            Object[] values = (Object[]) valuesMethod.invoke(null);
            
            // Find the instance String field representing code
            java.lang.reflect.Field codeField = null;
            for (java.lang.reflect.Field f : chessTitleClass.getDeclaredFields()) {
                if (!java.lang.reflect.Modifier.isStatic(f.getModifiers()) && f.getType() == String.class) {
                    codeField = f;
                    break;
                }
            }
            
            if (codeField != null) {
                codeField.setAccessible(true);
                for (Object title : values) {
                    String code = (String) codeField.get(title);
                    if (override.equalsIgnoreCase(code)) {
                        return title;
                    }
                }
            }
            return defaultTitleObj;
        } catch (Exception e) {
            Log.e(TAG, "getOverrideAsPaletteChessTitle failed: " + e.getMessage());
            return defaultTitleObj;
        }
    }

    private static String getUsernameFromToString(Object obj) {
        if (obj == null) return null;
        String str = obj.toString();
        int index = str.indexOf("username=");
        if (index != -1) {
            int start = index + "username=".length();
            int endComma = str.indexOf(",", start);
            int endParen = str.indexOf(")", start);
            int end = -1;
            if (endComma != -1 && endParen != -1) {
                end = Math.min(endComma, endParen);
            } else if (endComma != -1) {
                end = endComma;
            } else if (endParen != -1) {
                end = endParen;
            }
            if (end != -1) {
                String username = str.substring(start, end).trim();
                if ("null".equalsIgnoreCase(username)) {
                    return null;
                }
                return username;
            }
        }
        return null;
    }

    public static String overrideModelChessTitle(Object modelObj) {
        if (modelObj == null) {
            return null;
        }
        try {
            String username = getUsernameFromToString(modelObj);
            
            if (username == null) {
                try {
                    java.lang.reflect.Method getUsernameMethod = modelObj.getClass().getMethod("getUsername");
                    username = (String) getUsernameMethod.invoke(modelObj);
                } catch (Exception e) {
                    // Ignore
                }
            }
            
            java.lang.reflect.Field chessTitleField = null;
            for (String fieldName : new String[]{"chess_title", "chessTitle"}) {
                try {
                    chessTitleField = modelObj.getClass().getDeclaredField(fieldName);
                    break;
                } catch (NoSuchFieldException e) {
                    // Ignore
                }
            }
            
            if (chessTitleField == null) {
                for (java.lang.reflect.Field f : modelObj.getClass().getDeclaredFields()) {
                    if (f.getType() == String.class && (f.getName().contains("title") || f.getName().contains("Title"))) {
                        chessTitleField = f;
                        break;
                    }
                }
            }
            
            String defaultTitle = null;
            if (chessTitleField != null) {
                chessTitleField.setAccessible(true);
                defaultTitle = (String) chessTitleField.get(modelObj);
            }
            
            return getOverride(username, defaultTitle);
        } catch (Exception e) {
            Log.e(TAG, "overrideModelChessTitle failed: " + e.getMessage());
        }
        return null;
    }

    public static Object overridePaletteChessTitle(Object uiStateObj) {
        if (uiStateObj == null) {
            return null;
        }
        try {
            String username = getUsernameFromToString(uiStateObj);
            
            if (username == null) {
                try {
                    java.lang.reflect.Method getUsernameMethod = uiStateObj.getClass().getMethod("getUsername");
                    username = (String) getUsernameMethod.invoke(uiStateObj);
                } catch (Exception e) {
                    // Ignore
                }
            }
            
            java.lang.reflect.Field chessTitleField = null;
            try {
                chessTitleField = uiStateObj.getClass().getDeclaredField("chessTitle");
            } catch (NoSuchFieldException e) {
                for (java.lang.reflect.Field f : uiStateObj.getClass().getDeclaredFields()) {
                    if (f.getType().getName().contains("palette") && f.getType().getName().contains("ChessTitle")) {
                        chessTitleField = f;
                        break;
                    }
                }
            }
            
            if (chessTitleField != null) {
                chessTitleField.setAccessible(true);
                Object defaultTitleObj = chessTitleField.get(uiStateObj);
                return getOverrideAsPaletteChessTitle(username, defaultTitleObj);
            }
        } catch (Exception e) {
            Log.e(TAG, "overridePaletteChessTitle failed: " + e.getMessage());
        }
        return null;
    }
}

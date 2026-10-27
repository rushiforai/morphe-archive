package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Build;
import android.webkit.CookieManager;
import org.json.*;
import java.io.*;
import java.util.*;

/** Explicit opt-in credentials export. Never export Android Keystore keys. */
final class HaiagaruBackupSecrets {
    static final String WARNING = "認証情報を含むバックアップは、アカウントを操作できる機密ファイルです。"
            + "ローカルZIP自体は暗号化されません。共有・公開せず安全に保管してください。"
            + "MEGAセッションも選択すると含まれます。端末依存データは別項目・初期OFFです。"
            + "Android Keystoreの秘密鍵は取得できず、別端末への移行では再ログインが必要な場合があります。"
            + "Haiagaruの板別Cookieも対象です。WebViewの通常Cookieを保存しますが、WebViewの分離Cookie・端末認証・サイト側で失効したセッションは復元できません。";
    private static final String IDENTITY = "haiagaru.backup.identity";
    private static final String PRIVATE = "haiagaru.mega-sync.private";

    static synchronized String identity(Context context) throws IOException {
        SharedPreferences prefs = context.getSharedPreferences(IDENTITY, 0);
        String id = prefs.getString("id", "");
        if (id.isEmpty()) {
            id = UUID.randomUUID().toString();
            if (!prefs.edit().putString("id", id).commit()) throw new IOException("バックアップ端末IDを保存できません");
        }
        return id;
    }

    private static boolean allowed(String name) {
        return name.matches("[A-Za-z0-9_.-]{1,200}") && !name.equals(IDENTITY)
                && !name.startsWith("haiagaru.mega-sync.") && !name.equals("boot_prefs");
    }

    private static boolean credential(String name) {
        String lower = name.toLowerCase(Locale.ROOT);
        for (String part : new String[]{"auth", "login", "account", "token", "secret", "password",
                "cookie", "session", "monakey", "apikey", "api_key", "credential", "bearer", "passwd", "imgur"}) {
            if (lower.contains(part)) return true;
        }
        return false;
    }

    static JSONObject capture(Context context) throws Exception {
        JSONObject result = new JSONObject(), preferences = new JSONObject();
        File directory = new File(context.getApplicationInfo().dataDir, "shared_prefs");
        File[] files = directory.listFiles((d, name) -> name.endsWith(".xml"));
        if (files != null) for (File file : files) {
            String name = file.getName().substring(0, file.getName().length() - 4);
            if (allowed(name)) {
                Map<String, ?> all = context.getSharedPreferences(name, 0).getAll();
                Map<String, Object> selected = new HashMap<>();
                for (Map.Entry<String, ?> value : all.entrySet()) {
                    if (credential(name) || credential(value.getKey())) selected.put(value.getKey(), value.getValue());
                }
                if (!selected.isEmpty()) preferences.put(name, encode(selected));
            }
        }
        result.put("preferences", preferences);
        if (Build.VERSION.SDK_INT >= 24 && HaiagaruMegaSession.hasSession(context)) {
            result.put("megaSession", HaiagaruMegaSession.readSession(context));
        }
        result.put("webCookies", captureWebCookies(context));
        return result;
    }

    static JSONObject captureDevice(Context context) throws Exception {
        return new JSONObject().put("installation", identity(context)).put("sourcePackage", context.getPackageName())
                .put("megaEncryptedPreferences", encode(context.getSharedPreferences(PRIVATE, 0).getAll()));
    }

    static void validateDevice(Context context, JSONObject snapshot, int flags) throws Exception {
        if ((flags & HaiagaruSyncSnapshot.DEVICE_DATA) == 0) return;
        JSONObject device = snapshot.optJSONObject("deviceData");
        if (device == null || !identity(context).equals(device.optString("installation"))
                || !context.getPackageName().equals(device.optString("sourcePackage"))) {
            throw new IOException("端末依存データは同じインストール環境でのみ復元できます。この項目を外して再実行してください");
        }
    }

    static void restore(Context context, JSONObject snapshot, int flags, boolean merge) throws Exception {
        JSONObject auth = snapshot.optJSONObject("authentication");
        if ((flags & HaiagaruSyncSnapshot.DEVICE_DATA) != 0) {
            validateDevice(context, snapshot, flags);
            if ((flags & HaiagaruSyncSnapshot.AUTH) == 0 || auth == null || !auth.has("megaSession")) {
                decode(context.getSharedPreferences(PRIVATE, 0), snapshot.getJSONObject("deviceData")
                        .getJSONObject("megaEncryptedPreferences"), merge);
            }
        }
        if ((flags & HaiagaruSyncSnapshot.AUTH) == 0 || auth == null) return;
        JSONObject preferences = auth.getJSONObject("preferences");
        String source = snapshot.optString("sourcePackage");
        for (Iterator<String> names = preferences.keys(); names.hasNext();) {
            String name = names.next();
            if (!allowed(name)) throw new IOException("未対応の認証設定領域です");
            String target = name.equals(source + "_preferences") ? context.getPackageName() + "_preferences" : name;
            if(name.equals("haiagaru.board-cookies")){
                synchronized(BoardCookies.class){
                    decode(context.getSharedPreferences(target, 0), preferences.getJSONObject(name), merge);
                    BoardCookies.restored();
                }
            }else decode(context.getSharedPreferences(target, 0), preferences.getJSONObject(name), merge);
        }
        if (auth.has("megaSession") && (!merge || !HaiagaruMegaSession.hasSession(context))) {
            if (Build.VERSION.SDK_INT < 24) throw new IOException("MEGAセッションの復元にはAndroid 7以降が必要です");
            // Re-encrypt with the destination installation's Keystore key.
            HaiagaruMegaSession.saveSession(context, auth.getString("megaSession"));
        }
        JSONArray cookies = auth.optJSONArray("webCookies");
        if (cookies != null && cookies.length() > 0) {
            CookieManager manager = CookieManager.getInstance();
            for (int i = 0; i < cookies.length(); i++) {
                JSONObject cookie = cookies.getJSONObject(i);
                String url = cookie.getString("url"), value = cookie.getString("cookie");
                if (!url.matches("https?://[^/\\s]+/.*") || value.indexOf('\r') >= 0 || value.indexOf('\n') >= 0) throw new IOException("不正なWeb Cookieです");
                if (merge && manager.getCookie(url) != null) continue;
                manager.setCookie(url, value);
            }
            manager.flush();
        }
    }

    private static JSONObject encode(Map<String, ?> values) throws Exception {
        JSONObject result = new JSONObject();
        for (Map.Entry<String, ?> item : values.entrySet()) {
            Object value = item.getValue(); String type;
            if (value instanceof Set) { type = "set"; value = new JSONArray((Set<?>) value); }
            else if (value instanceof Boolean) type = "boolean";
            else if (value instanceof Integer) type = "int";
            else if (value instanceof Long) type = "long";
            else if (value instanceof Float) type = "float";
            else if (value instanceof String) type = "string";
            else continue;
            result.put(item.getKey(), new JSONObject().put("type", type).put("value", value));
        }
        return result;
    }

    private static void decode(SharedPreferences preferences, JSONObject values, boolean merge) throws Exception {
        SharedPreferences.Editor editor = preferences.edit();
        for (Iterator<String> keys = values.keys(); keys.hasNext();) {
            String key = keys.next();
            if (merge && preferences.contains(key)) continue;
            JSONObject item = values.getJSONObject(key);
            switch (item.getString("type")) {
                case "boolean": editor.putBoolean(key, item.getBoolean("value")); break;
                case "int": editor.putInt(key, item.getInt("value")); break;
                case "long": editor.putLong(key, item.getLong("value")); break;
                case "float": editor.putFloat(key, (float)item.getDouble("value")); break;
                case "string": editor.putString(key, item.getString("value")); break;
                case "set":
                    Set<String> set = new HashSet<>(); JSONArray array = item.getJSONArray("value");
                    for (int i = 0; i < array.length(); i++) set.add(array.getString(i));
                    editor.putStringSet(key, set); break;
                default: throw new IOException("未対応の認証設定値です");
            }
        }
        if (!editor.commit()) throw new IOException("認証情報を保存できません");
    }

    private static JSONArray captureWebCookies(Context context) throws Exception {
        JSONArray result = new JSONArray();
        File base = new File(context.getApplicationInfo().dataDir, "app_webview");
        File database = new File(base, "Default/Cookies");
        if (!database.isFile()) database = new File(base, "Cookies");
        if (!database.isFile()) return result;
        CookieManager manager = CookieManager.getInstance();
        manager.flush();
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(database.getPath(), null, SQLiteDatabase.OPEN_READONLY);
             Cursor cursor = db.rawQuery("SELECT host_key,path,name,is_secure,is_httponly,expires_utc FROM cookies", null)) {
            while (cursor.moveToNext()) {
                String host = cursor.getString(0), path = cursor.getString(1), name = cursor.getString(2);
                String url = (cursor.getInt(3) != 0 ? "https://" : "http://")
                        + (host.startsWith(".") ? host.substring(1) : host) + path;
                String header = manager.getCookie(url);
                if (header == null) continue;
                for (String pair : header.split(";")) {
                    String[] parts = pair.trim().split("=", 2);
                    if (parts.length != 2 || !parts[0].equals(name)) continue;
                    String cookie = name + "=" + parts[1] + "; Path=" + path + "; Domain=" + host;
                    if (cursor.getInt(3) != 0) cookie += "; Secure";
                    if (cursor.getInt(4) != 0) cookie += "; HttpOnly";
                    long expiry = cursor.getLong(5) / 1000 - 11644473600000L;
                    if (expiry > 0) {
                        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", Locale.US);
                        format.setTimeZone(TimeZone.getTimeZone("GMT"));
                        cookie += "; Expires=" + format.format(new Date(expiry));
                    }
                    result.put(new JSONObject().put("url", url).put("cookie", cookie));
                    break;
                }
            }
        }
        return result;
    }
}

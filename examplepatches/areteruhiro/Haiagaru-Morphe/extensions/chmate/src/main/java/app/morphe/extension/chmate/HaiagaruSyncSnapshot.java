package app.morphe.extension.chmate;

import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Base64;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.LinkedHashSet;

/** Versioned, bounded backup format independent of ChMate's obfuscated classes. */
final class HaiagaruSyncSnapshot {
    static final int BOOKMARKS = 1;
    static final int NG = 2;
    static final int SETTINGS = 4;
    static final int POST_HISTORY = 8;
    static final int KAKIKOMI = 16;
    static final int COOKIES = 32;
    static final int ALL = BOOKMARKS | NG | SETTINGS | POST_HISTORY | KAKIKOMI | COOKIES;
    static final int DEFAULT = ALL & ~COOKIES;
    private static final int SCHEMA = 1;
    private static final int MAX_FILE_BYTES = 16 * 1024 * 1024;
    private static final int MAX_SNAPSHOT_BYTES = 32 * 1024 * 1024;
    private static final int MAX_BOOKMARKS = 200_000;
    private static final String HAIAGARU_PREFS =
            "io.github.areteruhiro.chmate.haiagaru.ui-config";

    private HaiagaruSyncSnapshot() {}

    static String describeChanges(Context context, JSONObject remote, int categories, boolean merge)
            throws Exception {
        JSONObject local = validate(capture(context, categories));
        StringBuilder result = new StringBuilder();
        if ((categories & BOOKMARKS) != 0) {
            Set<String> keys = new HashSet<>();
            JSONArray current = local.optJSONArray("bookmarks");
            for (int i = 0; current != null && i < current.length(); i++) {
                JSONObject row = current.getJSONObject(i);
                keys.add(row.optString("name") + ":" + row.optLong("created"));
            }
            int count = 0;
            JSONArray rows = remote.optJSONArray("bookmarks");
            for (int i = 0; rows != null && i < rows.length(); i++) {
                JSONObject row = rows.getJSONObject(i);
                if (keys.add(row.optString("name") + ":" + row.optLong("created"))) count++;
            }
            result.append("お気に入り・閲覧履歴: 追加 ").append(count).append("件\n");
        }
        if ((categories & SETTINGS) != 0) {
            JSONObject files = remote.optJSONObject("settings");
            int added = 0, changed = 0;
            for (Iterator<String> names = files.keys(); names.hasNext();) {
                String name = names.next();
                String target = name.equals(remote.optString("sourcePackage") + "_preferences")
                        ? context.getPackageName() + "_preferences" : name;
                JSONObject values = files.getJSONObject(name);
                Map<String, ?> existing = context.getSharedPreferences(target, Context.MODE_PRIVATE).getAll();
                for (Iterator<String> keys = values.keys(); keys.hasNext();) {
                    String key = keys.next();
                    if (!safePreferenceKey(key)) continue;
                    if (!existing.containsKey(key)) added++;
                    else if (!merge && !values.getJSONObject(key).toString().equals(
                            String.valueOf(encodePreference(existing.get(key))))) changed++;
                }
            }
            result.append("設定: 追加 ").append(added).append("項目、更新 ").append(changed).append("項目\n");
        }
        if ((categories & NG) != 0) result.append("NG設定: 重複を除いて追加\n");
        if ((categories & POST_HISTORY) != 0) result.append("書き込み履歴: ")
                .append(java.util.Objects.equals(local.opt("postDataList"), remote.opt("postDataList"))
                        ? "変更なし" : merge ? "重複を除いて追加" : "ファイルを更新").append('\n');
        if ((categories & KAKIKOMI) != 0) result.append("書き込みメモ: ")
                .append(java.util.Objects.equals(local.opt("kakikomi"), remote.opt("kakikomi"))
                        ? "変更なし" : merge ? "不足する記録を追加" : "ファイルを更新").append('\n');
        if ((categories & COOKIES) != 0) {
            JSONObject cookies = remote.optJSONObject("cookies");
            result.append("Cookie（ログイン情報を含む）: ")
                    .append(cookies == null ? 0 : cookies.length()).append("保存領域を確認");
            if (cookies != null && cookies.length() == 0) result.append("（保存済みCookieなし）");
            result.append('\n');
        }
        return result.toString();
    }

    static byte[] capture(Context context, int categories) throws Exception {
        JSONObject snapshot = new JSONObject();
        snapshot.put("schema", SCHEMA);
        snapshot.put("createdAt", System.currentTimeMillis());
        snapshot.put("sourcePackage", context.getPackageName());
        snapshot.put("categories", categories & ALL);
        if ((categories & BOOKMARKS) != 0) {
            snapshot.put("bookmarks", captureBookmarks(context));
        }
        if ((categories & NG) != 0) {
            snapshot.put("ng", captureNg(context));
        }
        if ((categories & SETTINGS) != 0) {
            snapshot.put("settings", captureSettings(context));
        }
        if ((categories & POST_HISTORY) != 0) {
            snapshot.put("postDataList", readOptional(
                    context.getFileStreamPath("postDataList.json")));
        }
        if ((categories & KAKIKOMI) != 0) {
            snapshot.put("kakikomi", readOptional(kakikomiFile(context)));
        }
        if ((categories & COOKIES) != 0) snapshot.put("cookies", captureCookies(context));
        byte[] bytes = snapshot.toString().getBytes(StandardCharsets.UTF_8);
        if (bytes.length > MAX_SNAPSHOT_BYTES) {
            throw new IOException("同期データが32 MiBを超えています");
        }
        return bytes;
    }

    static JSONObject validate(byte[] bytes) throws Exception {
        if (bytes == null || bytes.length == 0 || bytes.length > MAX_SNAPSHOT_BYTES) {
            throw new IOException("同期データのサイズが不正です");
        }
        JSONObject snapshot = new JSONObject(new String(bytes, StandardCharsets.UTF_8));
        if (snapshot.optInt("schema", -1) != SCHEMA) {
            throw new IOException("未対応の同期データ形式です");
        }
        int categories = snapshot.optInt("categories", 0);
        if ((categories & ~ALL) != 0 || categories == 0) {
            throw new IOException("同期対象の指定が不正です");
        }
        if ((categories & BOOKMARKS) != 0 && snapshot.optJSONArray("bookmarks") == null) {
            throw new IOException("履歴データがありません");
        }
        if ((categories & NG) != 0 && snapshot.optJSONObject("ng") == null) {
            throw new IOException("NGデータがありません");
        }
        if ((categories & SETTINGS) != 0 && snapshot.optJSONObject("settings") == null) {
            throw new IOException("設定データがありません");
        }
        if ((categories & COOKIES) != 0 && snapshot.optJSONObject("cookies") == null) {
            throw new IOException("Cookieデータがありません");
        }
        String source = snapshot.optString("sourcePackage", "");
        if (!source.matches("^[A-Za-z][A-Za-z0-9_.]{2,200}$")) {
            throw new IOException("バックアップ元のパッケージ名が不正です");
        }
        return snapshot;
    }

    /** A recovery copy is created before any live data is changed. */
    static void restore(Context context, JSONObject snapshot, int categories) throws Exception {
        validate(snapshot.toString().getBytes(StandardCharsets.UTF_8));
        int available = snapshot.optInt("categories", 0);
        int selected = categories & available & ALL;
        File recoveryDir = new File(context.getFilesDir(), "haiagaru-sync-recovery");
        if (!recoveryDir.isDirectory() && !recoveryDir.mkdirs()) {
            throw new IOException("復元前の退避フォルダを作成できません");
        }
        File recovery = new File(recoveryDir, "before-restore-" + System.currentTimeMillis() + ".json");
        writeAtomic(recovery, capture(context, selected));

        if ((selected & BOOKMARKS) != 0) {
            mergeBookmarks(context, snapshot.optJSONArray("bookmarks"));
        }
        if ((selected & NG) != 0) {
            restoreNg(context, snapshot.optJSONObject("ng"));
        }
        if ((selected & SETTINGS) != 0) {
            restoreSettings(context, snapshot.optJSONObject("settings"),
                    snapshot.optString("sourcePackage", ""));
        }
        if ((selected & POST_HISTORY) != 0 && !snapshot.isNull("postDataList")) {
            writeAtomic(context.getFileStreamPath("postDataList.json"),
                    decodeFile(snapshot.getString("postDataList")));
        }
        if ((selected & KAKIKOMI) != 0 && !snapshot.isNull("kakikomi")) {
            writeAtomic(kakikomiFile(context), decodeFile(snapshot.getString("kakikomi")));
        }
        if ((selected & COOKIES) != 0) restoreCookies(context, snapshot.getJSONObject("cookies"), false);
    }

    /**
     * Adds only values that are absent on this device.  This is deliberately
     * separate from restore(): source/target synchronization may replace a
     * selected value, while two-way synchronization must never erase a local
     * preference, post, or memo.
     */
    static void mergeMissing(Context context, JSONObject snapshot, int categories) throws Exception {
        validate(snapshot.toString().getBytes(StandardCharsets.UTF_8));
        int selected = categories & snapshot.optInt("categories", 0) & ALL;
        if ((selected & BOOKMARKS) != 0) mergeBookmarks(context, snapshot.optJSONArray("bookmarks"));
        if ((selected & NG) != 0) restoreNg(context, snapshot.optJSONObject("ng"));
        if ((selected & SETTINGS) != 0) mergeMissingSettings(context,
                snapshot.optJSONObject("settings"), snapshot.optString("sourcePackage", ""));
        if ((selected & POST_HISTORY) != 0 && !snapshot.isNull("postDataList")) {
            mergeJsonArrayFile(context.getFileStreamPath("postDataList.json"),
                    decodeFile(snapshot.getString("postDataList")));
        }
        if ((selected & KAKIKOMI) != 0 && !snapshot.isNull("kakikomi")) {
            mergeTextFile(kakikomiFile(context), decodeFile(snapshot.getString("kakikomi")));
        }
        if ((selected & COOKIES) != 0) restoreCookies(context, snapshot.getJSONObject("cookies"), true);
    }

    private static boolean cookieStoreName(String name) {
        return name != null && name.matches("^[A-Za-z0-9_.-]{1,160}$")
                && name.toLowerCase(java.util.Locale.ROOT).contains("cookie");
    }

    private static JSONObject captureCookies(Context context) throws Exception {
        JSONObject stores = new JSONObject();
        File directory = new File(context.getApplicationInfo().dataDir, "shared_prefs");
        File[] entries = directory.listFiles((parent, name) ->
                name.endsWith(".xml") && cookieStoreName(name.substring(0, name.length() - 4)));
        if (entries == null) return stores;
        if (entries.length > 32) throw new IOException("Cookie保存領域が多すぎます");
        for (File entry : entries) {
            String name = entry.getName().substring(0, entry.getName().length() - 4);
            JSONObject values = new JSONObject();
            for (Map.Entry<String, ?> item : context.getSharedPreferences(name, Context.MODE_PRIVATE)
                    .getAll().entrySet()) {
                if (item.getKey().length() > 2048 || !(item.getValue() instanceof String)) continue;
                String value = (String) item.getValue();
                if (value.length() <= MAX_FILE_BYTES) values.put(item.getKey(), value);
            }
            stores.put(name, values);
        }
        return stores;
    }

    private static void restoreCookies(Context context, JSONObject stores, boolean missingOnly)
            throws Exception {
        if (stores.length() > 32) throw new IOException("Cookie保存領域が多すぎます");
        for (Iterator<String> names = stores.keys(); names.hasNext();) {
            String name = names.next();
            if (!cookieStoreName(name)) throw new IOException("Cookie保存領域の名前が不正です");
            JSONObject values = stores.optJSONObject(name);
            if (values == null) throw new IOException("Cookieデータが不正です");
            SharedPreferences prefs = context.getSharedPreferences(name, Context.MODE_PRIVATE);
            SharedPreferences.Editor editor = prefs.edit();
            for (Iterator<String> keys = values.keys(); keys.hasNext();) {
                String key = keys.next();
                if (key.length() > 2048 || !(values.opt(key) instanceof String)) {
                    throw new IOException("Cookie項目が不正です");
                }
                String value = values.getString(key);
                if (value.length() > MAX_FILE_BYTES) throw new IOException("Cookie項目が大きすぎます");
                if (!missingOnly || !prefs.contains(key)) editor.putString(key, value);
            }
            if (!editor.commit()) throw new IOException("Cookieを復元できませんでした");
        }
    }

    private static JSONArray captureBookmarks(Context context) throws Exception {
        JSONArray rows = new JSONArray();
        File file = context.getDatabasePath("roidon.sqlite");
        if (!file.isFile()) return rows;
        SQLiteDatabase db = SQLiteDatabase.openDatabase(
                file.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY);
        try (Cursor cursor = db.query("bookmarks", null, null, null, null, null, null)) {
            while (cursor.moveToNext()) {
                if (rows.length() >= MAX_BOOKMARKS) {
                    throw new IOException("履歴が同期上限を超えています");
                }
                JSONObject row = new JSONObject();
                for (int index = 0; index < cursor.getColumnCount(); index++) {
                    String column = cursor.getColumnName(index);
                    if ("_id".equals(column)) continue;
                    switch (cursor.getType(index)) {
                        case Cursor.FIELD_TYPE_INTEGER:
                            row.put(column, cursor.getLong(index));
                            break;
                        case Cursor.FIELD_TYPE_FLOAT:
                            row.put(column, cursor.getDouble(index));
                            break;
                        case Cursor.FIELD_TYPE_STRING:
                            row.put(column, cursor.getString(index));
                            break;
                        case Cursor.FIELD_TYPE_NULL:
                            row.put(column, JSONObject.NULL);
                            break;
                        default:
                            // This table has no binary columns in supported ChMate builds.
                            break;
                    }
                }
                rows.put(row);
            }
        } finally {
            db.close();
        }
        return rows;
    }

    private static void mergeBookmarks(Context context, JSONArray rows) throws Exception {
        if (rows == null || rows.length() > MAX_BOOKMARKS) {
            throw new IOException("履歴データが不正です");
        }
        File file = context.getDatabasePath("roidon.sqlite");
        if (!file.isFile()) throw new IOException("ChMateの履歴DBが見つかりません");
        SQLiteDatabase db = SQLiteDatabase.openDatabase(
                file.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE);
        Set<String> columns = new HashSet<>();
        try (Cursor cursor = db.rawQuery("PRAGMA table_info(bookmarks)", null)) {
            while (cursor.moveToNext()) columns.add(cursor.getString(1));
        }
        db.beginTransaction();
        try {
            for (int index = 0; index < rows.length(); index++) {
                JSONObject row = rows.getJSONObject(index);
                String name = row.optString("name", "");
                long created = row.optLong("created", -1);
                if (name.isEmpty() || created < 0) continue;
                ContentValues values = new ContentValues();
                for (String column : columns) {
                    if ("_id".equals(column) || !row.has(column) || row.isNull(column)) continue;
                    Object value = row.get(column);
                    if (value instanceof String) values.put(column, (String) value);
                    else if (value instanceof Number) values.put(column, ((Number) value).longValue());
                }
                // Preserve existing local rows: importing must not clear a read mark,
                // favourite flag, or a newer title on another device.
                db.insertWithOnConflict("bookmarks", null, values, SQLiteDatabase.CONFLICT_IGNORE);
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
            db.close();
        }
    }

    private static JSONObject captureNg(Context context) throws Exception {
        JSONObject files = new JSONObject();
        File directory = new File(externalRoot(context), "ng");
        File[] entries = directory.listFiles((parent, name) ->
                name.startsWith("_") && name.endsWith(".json"));
        if (entries == null) return files;
        for (File entry : entries) files.put(entry.getName(), readOptional(entry));
        return files;
    }

    private static void restoreNg(Context context, JSONObject files) throws Exception {
        if (files == null) throw new IOException("NGデータがありません");
        File directory = new File(externalRoot(context), "ng");
        if (!directory.isDirectory() && !directory.mkdirs()) {
            throw new IOException("NGフォルダを作成できません");
        }
        for (Iterator<String> names = files.keys(); names.hasNext();) {
            String name = names.next();
            if (!name.matches("^_[A-Za-z0-9_-]+\\.json$") || files.isNull(name)) continue;
            byte[] remote = decodeFile(files.getString(name));
            // Both formats are JSON arrays. Merge by item, never remove local rules.
            JSONArray merged = new JSONArray();
            Set<String> seen = new HashSet<>();
            addUniqueJson(merged, seen, readOptional(new File(directory, name)));
            addUniqueJson(merged, seen, Base64.encodeToString(remote, Base64.NO_WRAP));
            writeAtomic(new File(directory, name),
                    merged.toString().getBytes(StandardCharsets.UTF_8));
        }
    }

    private static void addUniqueJson(JSONArray result, Set<String> seen, String encoded)
            throws Exception {
        if (encoded == null) return;
        JSONArray array = new JSONArray(new String(decodeFile(encoded), StandardCharsets.UTF_8));
        for (int index = 0; index < array.length(); index++) {
            Object entry = array.get(index);
            if (seen.add(entry.toString())) result.put(entry);
        }
    }

    private static JSONObject captureSettings(Context context) throws Exception {
        JSONObject files = new JSONObject();
        String[] names = {
                context.getPackageName() + "_preferences",
                HAIAGARU_PREFS
        };
        for (String name : names) {
            JSONObject values = new JSONObject();
            for (Map.Entry<String, ?> entry : context.getSharedPreferences(
                    name, Context.MODE_PRIVATE).getAll().entrySet()) {
                if (!safePreferenceKey(entry.getKey())) continue;
                JSONObject typed = encodePreference(entry.getValue());
                if (typed != null) values.put(entry.getKey(), typed);
            }
            if (values.length() > 0) files.put(name, values);
        }
        return files;
    }

    private static void restoreSettings(Context context, JSONObject files, String sourcePackage)
            throws Exception {
        if (files == null) throw new IOException("設定データがありません");
        for (Iterator<String> names = files.keys(); names.hasNext();) {
            String name = names.next();
            if (!name.equals(sourcePackage + "_preferences")
                    && !name.equals(HAIAGARU_PREFS)) continue;
            String targetName = !sourcePackage.isEmpty()
                    && name.equals(sourcePackage + "_preferences")
                    ? context.getPackageName() + "_preferences" : name;
            JSONObject values = files.optJSONObject(name);
            if (values == null) continue;
            SharedPreferences.Editor editor = context.getSharedPreferences(
                    targetName, Context.MODE_PRIVATE).edit();
            for (Iterator<String> keys = values.keys(); keys.hasNext();) {
                String key = keys.next();
                if (!safePreferenceKey(key)) continue;
                JSONObject value = values.optJSONObject(key);
                if (value == null) continue;
                switch (value.optString("type")) {
                    case "boolean": editor.putBoolean(key, value.getBoolean("value")); break;
                    case "int": editor.putInt(key, value.getInt("value")); break;
                    case "long": editor.putLong(key, value.getLong("value")); break;
                    case "float": editor.putFloat(key, (float) value.getDouble("value")); break;
                    case "string":
                        String text = value.getString("value");
                        if (!sourcePackage.isEmpty()) {
                            text = text.replace(sourcePackage, context.getPackageName());
                        }
                        editor.putString(key, text);
                        break;
                    case "strings":
                        JSONArray array = value.getJSONArray("value");
                        Set<String> strings = new HashSet<>();
                        for (int index = 0; index < array.length(); index++) {
                            strings.add(array.getString(index));
                        }
                        editor.putStringSet(key, strings);
                        break;
                    default: break;
                }
            }
            if (!editor.commit()) throw new IOException("設定の復元に失敗しました: " + targetName);
        }
    }

    private static void mergeMissingSettings(Context context, JSONObject files, String sourcePackage)
            throws Exception {
        if (files == null) throw new IOException("設定データがありません");
        for (Iterator<String> names = files.keys(); names.hasNext();) {
            String name = names.next();
            if (!name.equals(sourcePackage + "_preferences")
                    && !name.equals(HAIAGARU_PREFS)) continue;
            String targetName = !sourcePackage.isEmpty()
                    && name.equals(sourcePackage + "_preferences")
                    ? context.getPackageName() + "_preferences" : name;
            JSONObject values = files.optJSONObject(name);
            if (values == null) continue;
            SharedPreferences preferences = context.getSharedPreferences(
                    targetName, Context.MODE_PRIVATE);
            SharedPreferences.Editor editor = preferences.edit();
            boolean changed = false;
            for (Iterator<String> keys = values.keys(); keys.hasNext();) {
                String key = keys.next();
                if (!safePreferenceKey(key) || preferences.contains(key)) continue;
                JSONObject value = values.optJSONObject(key);
                if (value == null) continue;
                switch (value.optString("type")) {
                    case "boolean": editor.putBoolean(key, value.getBoolean("value")); changed = true; break;
                    case "int": editor.putInt(key, value.getInt("value")); changed = true; break;
                    case "long": editor.putLong(key, value.getLong("value")); changed = true; break;
                    case "float": editor.putFloat(key, (float) value.getDouble("value")); changed = true; break;
                    case "string":
                        String text = value.getString("value");
                        if (!sourcePackage.isEmpty()) text = text.replace(sourcePackage, context.getPackageName());
                        editor.putString(key, text); changed = true; break;
                    case "strings":
                        JSONArray array = value.getJSONArray("value");
                        Set<String> strings = new HashSet<>();
                        for (int index = 0; index < array.length(); index++) strings.add(array.getString(index));
                        editor.putStringSet(key, strings); changed = true; break;
                    default: break;
                }
            }
            if (changed && !editor.commit()) throw new IOException("設定の追加に失敗しました: " + targetName);
        }
    }

    private static void mergeJsonArrayFile(File target, byte[] remote) throws Exception {
        JSONArray merged = new JSONArray();
        Set<String> seen = new LinkedHashSet<>();
        String local = readUtf8(target);
        if (local != null) addArrayValues(merged, seen, new JSONArray(local));
        addArrayValues(merged, seen, new JSONArray(new String(remote, StandardCharsets.UTF_8)));
        writeAtomic(target, merged.toString().getBytes(StandardCharsets.UTF_8));
    }

    private static void addArrayValues(JSONArray result, Set<String> seen, JSONArray source)
            throws JSONException {
        for (int index = 0; index < source.length(); index++) {
            Object value = source.get(index);
            String key = value.toString();
            if (seen.add(key)) result.put(value);
        }
    }

    private static void mergeTextFile(File target, byte[] remote) throws Exception {
        String local = readUtf8(target);
        String incoming = new String(remote, StandardCharsets.UTF_8);
        // Preserve line order, blank lines and repeated body text. Never dedupe
        // individual lines: they are not independent posting records.
        if (local == null || local.isEmpty()) writeAtomic(target, remote);
        else if (!incoming.isEmpty() && !local.contains(incoming)) {
            if (incoming.startsWith(local)) writeAtomic(target, remote);
            else writeAtomic(target, (local + (local.endsWith("\n") ? "" : "\n")
                    + incoming).getBytes(StandardCharsets.UTF_8));
        }
    }

    private static String readUtf8(File file) throws IOException {
        String encoded = readOptional(file);
        return encoded == null ? null : new String(decodeFile(encoded), StandardCharsets.UTF_8);
    }

    private static JSONObject encodePreference(Object value) throws JSONException {
        JSONObject typed = new JSONObject();
        if (value instanceof Boolean) typed.put("type", "boolean");
        else if (value instanceof Integer) typed.put("type", "int");
        else if (value instanceof Long) typed.put("type", "long");
        else if (value instanceof Float) typed.put("type", "float");
        else if (value instanceof String) typed.put("type", "string");
        else if (value instanceof Set) {
            typed.put("type", "strings");
            typed.put("value", new JSONArray((Set<?>) value));
            return typed;
        } else return null;
        typed.put("value", value);
        return typed;
    }

    private static boolean safePreferenceName(String name) {
        String lower = name.toLowerCase(java.util.Locale.ROOT);
        return (name.matches("^[A-Za-z0-9_.-]{1,160}$")
                && !lower.contains("cookie") && !lower.contains("oauth")
                && !lower.contains("account") && !lower.contains("auth")
                && !lower.contains("2chapi") && !lower.contains("sync"))
                || HAIAGARU_PREFS.equals(name);
    }

    private static boolean safePreferenceKey(String key) {
        String lower = key.toLowerCase(java.util.Locale.ROOT);
        return key.length() <= 160 && !lower.contains("token")
                && !lower.contains("secret") && !lower.contains("password")
                && !lower.contains("cookie") && !lower.contains("session")
                && !lower.contains("monakey") && !lower.contains("oauth")
                && !lower.contains("auth") && !lower.contains("credential")
                && !lower.contains("account") && !lower.contains("login")
                && !lower.contains("apikey") && !lower.contains("api_key")
                && !lower.contains("bearer") && !lower.contains("passwd");
    }

    private static File externalRoot(Context context) throws IOException {
        File root = context.getExternalFilesDir(null);
        if (root == null) throw new IOException("アプリの外部保存領域を利用できません");
        return new File(root, "2chMate");
    }

    private static File kakikomiFile(Context context) throws IOException {
        return new File(externalRoot(context), "kakikomi.txt");
    }

    private static String readOptional(File file) throws IOException {
        if (file == null || !file.isFile()) return null;
        if (file.length() > MAX_FILE_BYTES) throw new IOException("同期ファイルが16 MiBを超えています");
        try (FileInputStream input = new FileInputStream(file);
             ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int count;
            while ((count = input.read(buffer)) != -1) {
                if (output.size() + count > MAX_FILE_BYTES) {
                    throw new IOException("同期ファイルが16 MiBを超えています");
                }
                output.write(buffer, 0, count);
            }
            return Base64.encodeToString(output.toByteArray(), Base64.NO_WRAP);
        }
    }

    private static byte[] decodeFile(String encoded) throws IOException {
        if (encoded == null || encoded.length() > MAX_FILE_BYTES * 2) {
            throw new IOException("同期ファイルが大きすぎます");
        }
        try {
            byte[] bytes = Base64.decode(encoded, Base64.DEFAULT);
            if (bytes.length > MAX_FILE_BYTES) throw new IOException("同期ファイルが大きすぎます");
            return bytes;
        } catch (IllegalArgumentException error) {
            throw new IOException("同期ファイルの形式が不正です", error);
        }
    }

    private static void writeAtomic(File target, byte[] bytes) throws IOException {
        if (bytes.length > MAX_FILE_BYTES && !target.getName().endsWith(".json")) {
            throw new IOException("復元ファイルが大きすぎます");
        }
        File parent = target.getParentFile();
        if (parent == null || (!parent.isDirectory() && !parent.mkdirs())) {
            throw new IOException("復元先のフォルダを作成できません");
        }
        File temporary = new File(parent, target.getName() + ".haiagaru-tmp");
        try (FileOutputStream output = new FileOutputStream(temporary)) {
            output.write(bytes);
            output.getFD().sync();
        }
        if (!temporary.renameTo(target)) {
            throw new IOException("復元ファイルを確定できません: " + target.getName());
        }
    }
}

package dev.rikunode.futatabi.bridge;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Runs before FlutterActivity. The provider is not exported. Failure must not
 * stop the original app from launching, including when the socket is busy.
 */
public final class FutatabiProvider extends ContentProvider {
    private static final String TAG = "FutatabiBridge";
    private static final String FLUTTER_PREFIX =
            "VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu!";

    @Override public boolean onCreate() {
        Context context = getContext();
        if (context == null) return true;
        try {
            registerBoards(context);
        } catch (Exception ex) {
            Log.w(TAG, "Board registration skipped: " + ex.getClass().getSimpleName());
        }
        try {
            final Context app = context.getApplicationContext();
            Thread server = new Thread(() -> {
                try { new BridgeServer(app).run(); }
                catch (Exception ex) { Log.w(TAG, "Bridge unavailable: " + ex.getClass().getSimpleName()); }
            }, "futatabi-loopback");
            server.setDaemon(true);
            server.start();
        } catch (Exception ex) {
            Log.w(TAG, "Bridge start skipped: " + ex.getClass().getSimpleName());
        }
        return true;
    }

    private static final String DEFAULTS_MIGRATED = "futatabi.v04.default_boards_done";
    private static final String AIMOGE = "http://127.0.0.1:18765/aimoge/";
    private static final String ANIMANCH = "http://127.0.0.1:18765/animanch/";
    private static final String MEBUKI = "http://127.0.0.1:18765/mebuki/";
    private static final String NEKO = "https://may.2chan.net/27/";
    private static final String IMG = "https://img.2chan.net/b/";
    private static final String MAY = "https://may.2chan.net/b/";

    private static void registerBoards(Context context) throws Exception {
        SharedPreferences prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);
        SharedPreferences migration = context.getSharedPreferences("futatabi_default_migration", Context.MODE_PRIVATE);
        String raw = prefs.getString("flutter.itaList", null);
        if (raw != null && !raw.startsWith(FLUTTER_PREFIX)) return;
        boolean firstPass = !migration.getBoolean(DEFAULTS_MIGRATED, false);
        String updated = completeBoards(raw, firstPass);
        if (!updated.equals(raw) && !prefs.edit().putString("flutter.itaList", updated).commit()) return;
        if (firstPass) migration.edit().putBoolean(DEFAULTS_MIGRATED, true).commit();
    }

    // Pure saved-list transformation; also used by the host regression test.
    static String completeBoards(String raw, boolean firstPass) throws Exception {
        if (raw != null && !raw.startsWith(FLUTTER_PREFIX)) return raw;
        JSONArray items = raw == null ? new JSONArray() : new JSONArray(raw.substring(FLUTTER_PREFIX.length()));
        boolean change = raw == null;
        if (firstPass) {
            boolean pristine = true;
            boolean stockNeko = raw == null;
            for (int i = 0; i < items.length(); i++) {
                JSONObject board = new JSONObject(items.getString(i));
                String url = board.optString("url");
                if (!NEKO.equals(url) && !IMG.equals(url) && !MAY.equals(url)
                        && !AIMOGE.equals(url) && !ANIMANCH.equals(url) && !MEBUKI.equals(url)) {
                    pristine = false;
                    break;
                }
                if (NEKO.equals(url)) stockNeko = true;
                if (NEKO.equals(url) && !"ねこ".equals(board.optString("name"))) {
                    pristine = false;
                    break;
                }
            }
            if (pristine && stockNeko) {
                JSONArray updated = new JSONArray();
                for (int i = 0; i < items.length(); i++) {
                    JSONObject board = new JSONObject(items.getString(i));
                    if (!NEKO.equals(board.optString("url"))) updated.put(items.getString(i));
                }
                items = updated;
                change = true;
            }
        }
        // The flag gates only the legacy replacement, not missing default boards.
        change |= ensureBoard(items, "二次元裏（img)", IMG, true);
        change |= ensureBoard(items, "二次元裏（may)", MAY, true);
        change |= ensureBoard(items, "あいもげ", AIMOGE, false);
        change |= ensureBoard(items, "あにまん", ANIMANCH, false);
        change |= ensureBoard(items, "めぶき", MEBUKI, false);
        return change ? FLUTTER_PREFIX + items.toString() : raw;
    }

    private static boolean ensureBoard(JSONArray items, String name, String url, boolean normalizeName) throws Exception {
        boolean found = false, changed = false;
        for (int i = 0; i < items.length(); i++) {
            JSONObject existing = new JSONObject(items.getString(i));
            if (!url.equals(existing.optString("url"))) continue;
            found = true;
            if (normalizeName && !name.equals(existing.optString("name"))) {
                existing.put("name", name);
                items.put(i, existing.toString());
                changed = true;
            }
        }
        if (!found) {
            items.put(board(name, url).toString());
            changed = true;
        }
        return changed;
    }

    private static JSONObject board(String name, String url) throws Exception {
        JSONObject entry = new JSONObject();
        entry.put("name", name);
        entry.put("url", url);
        entry.put("favorite", false);
        entry.put("kakikomiData", JSONObject.NULL);
        entry.put("suretateCount", 0);
        entry.put("sureOpenCount", 0);
        entry.put("resuCount", 0);
        entry.put("soudaneCount", 0);
        return entry;
    }

    @Override public String getType(Uri uri) { return null; }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { return null; }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
    @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
}

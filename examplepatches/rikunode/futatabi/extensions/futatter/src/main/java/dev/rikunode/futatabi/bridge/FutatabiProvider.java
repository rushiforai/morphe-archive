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
    private static final String NEKO = "https://may.2chan.net/27/";
    private static final String IMG = "https://img.2chan.net/b/";
    private static final String MAY = "https://may.2chan.net/b/";

    private static void registerBoards(Context context) throws Exception {
        SharedPreferences prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);
        SharedPreferences migration = context.getSharedPreferences("futatabi_default_migration", Context.MODE_PRIVATE);
        String raw = prefs.getString("flutter.itaList", null);
        JSONArray items;
        if (raw == null) {
            items = new JSONArray();
        } else {
            if (!raw.startsWith(FLUTTER_PREFIX)) return;
            items = new JSONArray(raw.substring(FLUTTER_PREFIX.length()));
        }
        boolean change = raw == null;
        // A one-time migration only touches a provably pristine built-in list.
        // Customized user boards are preserved byte-for-byte as JSON entries.
        boolean firstPass = !migration.getBoolean(DEFAULTS_MIGRATED, false);
        if (firstPass) {
            boolean pristine = true;
            boolean stockNeko = raw == null;
            for (int i = 0; i < items.length(); i++) {
                JSONObject board = new JSONObject(items.getString(i));
                String url = board.optString("url");
                if (!NEKO.equals(url) && !IMG.equals(url) && !MAY.equals(url)
                        && !AIMOGE.equals(url) && !ANIMANCH.equals(url)) {
                    pristine = false;
                    break;
                }
                if (NEKO.equals(url)) stockNeko = true;
                if (NEKO.equals(url) && !"\u306d\u3053".equals(board.optString("name"))) {
                    pristine = false;
                    break;
                }
            }
            // Never reconstruct an existing user-managed subset of img/may.
            if (pristine && stockNeko) {
                JSONArray updated = new JSONArray();
                boolean img = false, may = false;
                for (int i = 0; i < items.length(); i++) {
                    JSONObject board = new JSONObject(items.getString(i));
                    String url = board.optString("url");
                    if (NEKO.equals(url)) continue;
                    if (IMG.equals(url)) img = true;
                    if (MAY.equals(url)) may = true;
                    updated.put(items.getString(i));
                }
                if (!img) updated.put(board("img", IMG).toString());
                if (!may) updated.put(board("may", MAY).toString());
                items = updated;
                change = true;
            }
        }
        boolean aimoge = false, animanch = false;
        for (int i = 0; i < items.length(); i++) {
            JSONObject board = new JSONObject(items.getString(i));
            String url = board.optString("url");
            if (AIMOGE.equals(url)) aimoge = true;
            if (ANIMANCH.equals(url)) animanch = true;
        }
        if (!aimoge) { items.put(board("\u3042\u3044\u3082\u3052", AIMOGE).toString()); change = true; }
        if (!animanch) { items.put(board("\u3042\u306b\u307e\u3093", ANIMANCH).toString()); change = true; }
        if (change && !prefs.edit().putString("flutter.itaList", FLUTTER_PREFIX + items.toString()).commit()) {
            return; // Retry on the next launch if Flutter persistence failed.
        }
        if (firstPass) migration.edit().putBoolean(DEFAULTS_MIGRATED, true).commit();
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

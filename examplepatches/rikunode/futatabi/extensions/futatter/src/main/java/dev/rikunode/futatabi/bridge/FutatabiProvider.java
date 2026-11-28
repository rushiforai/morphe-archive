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
            BridgePalette.repair(context);
        } catch (Exception ex) {
            Log.w(TAG, "Palette recovery skipped: " + ex.getClass().getSimpleName());
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
    private static final String JUN = "https://jun.2chan.net/jun/";

    private static final String DELETED = "futatabi.v04.deleted_boards_mask";
    private static final String[] MANAGED = {MAY, IMG, JUN, MEBUKI, AIMOGE, ANIMANCH};
    private static SharedPreferences activePrefs, activeMigration;

    // Stock board-list saves use this setter. XML restore bypasses it.
    // Return null for all other keys to retain the original plugin path.
    public static synchronized Boolean persistBoardList(SharedPreferences prefs, String key, String value) {
        if (!"flutter.itaList".equals(key) || prefs != activePrefs || activeMigration == null) return null;
        int before = -1, after = -1;
        try {
            before = presentMask(prefs.getString(key, null));
            after = presentMask(value);
        } catch (Exception ignored) { }
        boolean saved = prefs.edit().putString(key, value).commit();
        if (saved && before >= 0 && after >= 0) {
            int mask = deletedMask(activeMigration);
            int next = (mask | (before & ~after)) & ~after;
            if (next != mask && !activeMigration.edit().putLong(DELETED, next).commit())
                Log.w(TAG, "Board deletion record not persisted");
        }
        return saved;
    }

    private static int deletedMask(SharedPreferences migration) {
        return migration == null ? 0 : (int)(migration.getLong(DELETED, 0L) & 63L);
    }

    private static int presentMask(String raw) throws Exception {
        if (raw == null) return 0;
        if (!raw.startsWith(FLUTTER_PREFIX)) return -1;
        JSONArray items = new JSONArray(raw.substring(FLUTTER_PREFIX.length()));
        int mask = 0;
        for (int i = 0; i < items.length(); i++) {
            String url = new JSONObject(items.getString(i)).optString("url");
            for (int j = 0; j < MANAGED.length; j++) if (MANAGED[j].equals(url)) mask |= 1 << j;
        }
        return mask;
    }

    // Explicitly restored records are never removed. Their presence cancels
    // a previous suppression, as with a normal explicit re-add.
    private static int reconcilePresent(SharedPreferences migration, String raw) throws Exception {
        int mask = deletedMask(migration);
        int present = presentMask(raw);
        if (present < 0 || migration == null) return mask;
        int next = mask & ~present;
        if (next != mask && migration.edit().putLong(DELETED, next).commit()) return next;
        return mask;
    }

    static synchronized boolean requestBoardRecovery(Context context) {
        return context.getSharedPreferences("futatabi_default_migration", Context.MODE_PRIVATE)
                .edit().remove(DELETED).commit();
    }

    static synchronized void registerBoards(Context context) throws Exception {
        SharedPreferences prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);
        SharedPreferences migration = context.getSharedPreferences("futatabi_default_migration", Context.MODE_PRIVATE);
        activePrefs = prefs;
        activeMigration = migration;
        String raw = prefs.getString("flutter.itaList", null);
        if (raw != null && !raw.startsWith(FLUTTER_PREFIX)) return;
        boolean firstPass = !migration.getBoolean(DEFAULTS_MIGRATED, false);
        String updated = completeBoards(raw, firstPass, reconcilePresent(migration, raw));
        if (!updated.equals(raw)) {
            // Preserve the pre-change value (including absence) in private storage
            // before touching the original Flutter preference.
            SharedPreferences.Editor backup = migration.edit()
                    .putBoolean("itaList_before_write_present", raw != null)
                    .putString("itaList_before_write", raw);
            if (!migration.contains("itaList_original_present"))
                backup.putBoolean("itaList_original_present", raw != null).putString("itaList_original", raw);
            if (!backup.commit()) return;
            if (!prefs.edit().putString("flutter.itaList", updated).commit()) return;
        }
        if (firstPass) migration.edit().putBoolean(DEFAULTS_MIGRATED, true).commit();
    }

    /**
     * Stock getAll already decodes legacy Java-serialized lists and Sets.
     * Repair that decoded value before Dart receives/caches it; never add
     * another Java deserializer or change an unrelated preference.
     */
    public static synchronized void repairDecodedPreferences(SharedPreferences prefs, java.util.Map<String,Object> loaded) {
        final String key = "flutter.itaList";
        Object decoded = loaded.get(key);
        if (!(decoded instanceof java.util.List)) return;
        try {
            JSONArray items = new JSONArray();
            for (Object entry : (java.util.List<?>) decoded) {
                if (!(entry instanceof String)) return;
                items.put(entry);
            }
            String original = FLUTTER_PREFIX + items.toString();
            SharedPreferences migration = prefs == activePrefs ? activeMigration : null;
            String repaired = completeBoards(original, false, reconcilePresent(migration, original));
            // Normalize the decoded legacy value once for later stock saves.
            if (prefs.edit().putString(key, repaired).commit())
                loaded.put(key, repaired);
        } catch (Exception ex) {
            Log.w(TAG, "Legacy board recovery skipped: " + ex.getClass().getSimpleName());
        }
    }

    // Only the three external boards, for the manual confirmation dialog.
    // Unknown storage is not interpreted as absence.
    static boolean[] externalBoardStatus(String raw) throws Exception {
        boolean[] found = new boolean[3];
        if (raw == null) return found;
        if (!raw.startsWith(FLUTTER_PREFIX)) return null;
        JSONArray items = new JSONArray(raw.substring(FLUTTER_PREFIX.length()));
        for (int i = 0; i < items.length(); i++) {
            String url = new JSONObject(items.getString(i)).optString("url");
            if (MEBUKI.equals(url)) found[0] = true;
            if (AIMOGE.equals(url)) found[1] = true;
            if (ANIMANCH.equals(url)) found[2] = true;
        }
        return found;
    }

    // Pure saved-list transformation; also used by the host regression test.
    static String completeBoards(String raw, boolean firstPass) throws Exception {
        return completeBoards(raw, firstPass, 0);
    }

    private static String completeBoards(String raw, boolean firstPass, int deleted) throws Exception {
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
        if ((deleted & 1) == 0) change |= ensureBoard(items, "二次元裏（may)", MAY, firstPass);
        if ((deleted & 2) == 0) change |= ensureBoard(items, "二次元裏（img)", IMG, firstPass);
        // The stock Futaba parser already recognizes /jun/; no bridge route.
        if ((deleted & 4) == 0) change |= ensureBoard(items, "二次元裏（jun)", JUN, false);
        if ((deleted & 8) == 0) change |= ensureBoard(items, "めぶきちゃんねる", MEBUKI, true);
        if ((deleted & 16) == 0) change |= ensureBoard(items, "あいもげ", AIMOGE, false);
        if ((deleted & 32) == 0) change |= ensureBoard(items, "あにまん", ANIMANCH, false);
        change |= orderKnownBoards(items);
        return change ? FLUTTER_PREFIX + items.toString() : raw;
    }

    // Only fill slots already occupied by the six known URLs. Custom entries
    // stay at their exact indices; preserve the original serialized records.
    private static boolean orderKnownBoards(JSONArray items) throws Exception {
        java.util.List<Integer> slots = new java.util.ArrayList<>();
        java.util.List<String> entries = new java.util.ArrayList<>();
        java.util.Map<String, Integer> ranks = new java.util.HashMap<>();
        String[] order = {MAY, IMG, JUN, MEBUKI, AIMOGE, ANIMANCH};
        for (int i = 0; i < order.length; i++) ranks.put(order[i], i);
        java.util.Map<String, Integer> entryRanks = new java.util.HashMap<>();
        for (int i = 0; i < items.length(); i++) {
            String entry = items.getString(i);
            Integer rank = ranks.get(new JSONObject(entry).optString("url"));
            if (rank == null) continue;
            slots.add(i);
            entries.add(entry);
            entryRanks.put(entry, rank);
        }
        entries.sort(java.util.Comparator.comparingInt(entryRanks::get));
        boolean changed = false;
        for (int i = 0; i < slots.size(); i++) {
            int slot = slots.get(i);
            if (!entries.get(i).equals(items.getString(slot))) {
                items.put(slot, entries.get(i));
                changed = true;
            }
        }
        return changed;
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

package app.voidhack.extension.applemusic.lyrics;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

final class LrclibPrefs {
    private static final String TAG = "AppleMusicLrclib";
    private static final String PREFS_NAME = "voidhack_lrclib_lyrics";

    private static final String KEY_ENABLED = "enabled";
    private static final String KEY_FALLBACK_MODE = "fallback_mode";
    private static final String KEY_WORD_SYNC = "word_sync";
    private static final String KEY_ROMANIZATION = "romanization";
    private static final String KEY_ALLOW_PLAIN = "allow_plain";
    private static final String KEY_SEARCH_FALLBACK = "search_fallback";
    private static final String KEY_DEFAULT_OFFSET_MS = "default_offset_ms";
    private static final String KEY_SHOW_BUTTON_BADGE = "show_button_badge";
    private static final String KEY_SHOW_LYRICS_PILL = "show_lyrics_pill";
    private static final String KEY_OVERRIDES = "overrides_json";
    private static final String KEY_LOCAL_FOLDER_URI = "local_lrc_folder_uri";
    private static final String KEY_LOCAL_FOLDER_LABEL = "local_lrc_folder_label";
    private static final String KEY_LOCAL_FOLDER_COUNT = "local_lrc_folder_count";
    private static final String KEY_LOCAL_PRIORITY = "local_lrc_priority";

    private static final long CACHE_HIT_TTL_MS = 7L * 24L * 60L * 60L * 1000L;
    private static final long CACHE_MISS_TTL_MS = 6L * 60L * 60L * 1000L;
    private static final long ID_CACHE_TTL_MS = 30L * 24L * 60L * 60L * 1000L;
    static final int MIN_OFFSET_MS = -10000;
    static final int MAX_OFFSET_MS = 10000;

    static final class CacheLookup {
        final boolean found;
        final boolean hit;
        final LrclibModels.LyricsRecord record;

        CacheLookup(boolean found, boolean hit, LrclibModels.LyricsRecord record) {
            this.found = found;
            this.hit = hit;
            this.record = record;
        }

        static CacheLookup absent() {
            return new CacheLookup(false, false, null);
        }
    }

    private LrclibPrefs() {}

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    static boolean isEnabled(Context context) {
        return prefs(context).getBoolean(KEY_ENABLED, true);
    }

    static void setEnabled(Context context, boolean value) {
        prefs(context).edit().putBoolean(KEY_ENABLED, value).apply();
    }

    static LrclibModels.FallbackMode getFallbackMode(Context context) {
        return LrclibModels.FallbackMode.fromName(
                prefs(context).getString(KEY_FALLBACK_MODE, LrclibModels.FallbackMode.MISSING_AND_UNSYNCED.name()));
    }

    static void setFallbackMode(Context context, LrclibModels.FallbackMode mode) {
        prefs(context).edit().putString(KEY_FALLBACK_MODE, mode.name()).apply();
    }

    static boolean isWordSyncEnabled(Context context) {
        return prefs(context).getBoolean(KEY_WORD_SYNC, true);
    }

    static void setWordSyncEnabled(Context context, boolean value) {
        prefs(context).edit().putBoolean(KEY_WORD_SYNC, value).apply();
    }

    static boolean isRomanizationEnabled(Context context) {
        return prefs(context).getBoolean(KEY_ROMANIZATION, false);
    }

    static void setRomanizationEnabled(Context context, boolean value) {
        prefs(context).edit().putBoolean(KEY_ROMANIZATION, value).apply();
    }

    static boolean isAllowPlainEnabled(Context context) {
        return prefs(context).getBoolean(KEY_ALLOW_PLAIN, true);
    }

    static void setAllowPlainEnabled(Context context, boolean value) {
        prefs(context).edit().putBoolean(KEY_ALLOW_PLAIN, value).apply();
    }

    static boolean isSearchFallbackEnabled(Context context) {
        return prefs(context).getBoolean(KEY_SEARCH_FALLBACK, true);
    }

    static void setSearchFallbackEnabled(Context context, boolean value) {
        prefs(context).edit().putBoolean(KEY_SEARCH_FALLBACK, value).apply();
    }

    static int getDefaultOffsetMs(Context context) {
        return clampOffset(prefs(context).getInt(KEY_DEFAULT_OFFSET_MS, 0));
    }

    static void setDefaultOffsetMs(Context context, int offsetMs) {
        prefs(context).edit().putInt(KEY_DEFAULT_OFFSET_MS, clampOffset(offsetMs)).apply();
    }

    static boolean isShowButtonBadge(Context context) {
        return prefs(context).getBoolean(KEY_SHOW_BUTTON_BADGE, true);
    }

    static void setShowButtonBadge(Context context, boolean value) {
        prefs(context).edit().putBoolean(KEY_SHOW_BUTTON_BADGE, value).apply();
    }

    static boolean isShowLyricsPill(Context context) {
        return prefs(context).getBoolean(KEY_SHOW_LYRICS_PILL, true);
    }

    static void setShowLyricsPill(Context context, boolean value) {
        prefs(context).edit().putBoolean(KEY_SHOW_LYRICS_PILL, value).apply();
    }

    static String getLocalFolderUri(Context context) {
        String val = prefs(context).getString(KEY_LOCAL_FOLDER_URI, "");
        return val == null ? "" : val.trim();
    }

    static boolean hasLocalFolder(Context context) {
        return context != null && !getLocalFolderUri(context).isEmpty();
    }

    static void setLocalFolder(Context context, String uri, String label) {
        String prev = getLocalFolderUri(context);
        if (!prev.isEmpty() && !prev.equals(uri)) {
            releaseTreePermissionQuietly(context, prev);
        }
        prefs(context).edit()
                .putString(KEY_LOCAL_FOLDER_URI, uri == null ? "" : uri.trim())
                .putString(KEY_LOCAL_FOLDER_LABEL, label == null ? "" : label.trim())
                .putInt(KEY_LOCAL_FOLDER_COUNT, 0)
                .apply();
    }

    static void clearLocalFolder(Context context) {
        String prev = getLocalFolderUri(context);
        if (!prev.isEmpty()) {
            releaseTreePermissionQuietly(context, prev);
        }
        prefs(context).edit()
                .remove(KEY_LOCAL_FOLDER_URI)
                .remove(KEY_LOCAL_FOLDER_LABEL)
                .remove(KEY_LOCAL_FOLDER_COUNT)
                .apply();
    }

    static String getLocalFolderLabel(Context context) {
        String label = prefs(context).getString(KEY_LOCAL_FOLDER_LABEL, "");
        return label == null ? "" : label.trim();
    }

    static int getLocalFolderCount(Context context) {
        return Math.max(0, prefs(context).getInt(KEY_LOCAL_FOLDER_COUNT, 0));
    }

    static void setLocalFolderCount(Context context, int count) {
        prefs(context).edit().putInt(KEY_LOCAL_FOLDER_COUNT, Math.max(0, count)).apply();
    }

    static LrclibModels.LocalLrcPriority getLocalLrcPriority(Context context) {
        return LrclibModels.LocalLrcPriority.fromName(
                prefs(context).getString(KEY_LOCAL_PRIORITY, LrclibModels.LocalLrcPriority.PREFER_LOCAL.name()));
    }

    static void setLocalLrcPriority(Context context, LrclibModels.LocalLrcPriority priority) {
        prefs(context).edit().putString(KEY_LOCAL_PRIORITY,
                (priority == null ? LrclibModels.LocalLrcPriority.PREFER_LOCAL : priority).name()).apply();
    }

    private static void releaseTreePermissionQuietly(Context context, String uriStr) {
        try {
            context.getApplicationContext().getContentResolver()
                    .releasePersistableUriPermission(Uri.parse(uriStr), Intent.FLAG_GRANT_READ_URI_PERMISSION);
        } catch (RuntimeException ignored) {
        }
    }

    static int clampOffset(int value) {
        return Math.max(MIN_OFFSET_MS, Math.min(MAX_OFFSET_MS, value));
    }

    static synchronized Map<String, LrclibModels.TrackOverride> loadAllOverrides(Context context) {
        Map<String, LrclibModels.TrackOverride> result = new HashMap<>();
        String raw = prefs(context).getString(KEY_OVERRIDES, null);
        if (raw == null || raw.isEmpty()) return result;
        try {
            JSONObject root = new JSONObject(raw);
            Iterator<String> it = root.keys();
            while (it.hasNext()) {
                String key = it.next();
                JSONObject item = root.optJSONObject(key);
                LrclibModels.TrackOverride ov = LrclibModels.TrackOverride.fromJson(key, item);
                if (ov != null && !ov.isEmpty()) {
                    result.put(key, ov);
                }
            }
        } catch (JSONException e) {
            Log.w(TAG, "Failed to parse overrides JSON", e);
        }
        return result;
    }

    static synchronized List<LrclibModels.TrackOverride> listOverridesNewestFirst(Context context) {
        List<LrclibModels.TrackOverride> list = new ArrayList<>(loadAllOverrides(context).values());
        Collections.sort(list, new Comparator<LrclibModels.TrackOverride>() {
            @Override
            public int compare(LrclibModels.TrackOverride a, LrclibModels.TrackOverride b) {
                return Long.compare(b.updatedAt, a.updatedAt);
            }
        });
        return list;
    }

    static synchronized LrclibModels.TrackOverride getOverride(Context context, String trackKey) {
        if (trackKey == null || trackKey.isEmpty()) return null;
        return loadAllOverrides(context).get(trackKey);
    }

    static synchronized void saveOverride(Context context, LrclibModels.TrackOverride override) {
        if (override == null || override.trackKey.isEmpty()) return;
        Map<String, LrclibModels.TrackOverride> all = loadAllOverrides(context);
        if (override.isEmpty()) {
            all.remove(override.trackKey);
        } else {
            all.put(override.trackKey, override);
        }
        persistOverrides(context, all);
    }

    static synchronized void removeOverride(Context context, String trackKey) {
        if (trackKey == null || trackKey.isEmpty()) return;
        Map<String, LrclibModels.TrackOverride> all = loadAllOverrides(context);
        if (all.remove(trackKey) != null) {
            persistOverrides(context, all);
        }
    }

    static synchronized void clearAllOverrides(Context context) {
        prefs(context).edit().remove(KEY_OVERRIDES).apply();
        pruneUnusedPinnedFiles(context);
    }

    private static void persistOverrides(Context context, Map<String, LrclibModels.TrackOverride> all) {
        JSONObject root = new JSONObject();
        for (Map.Entry<String, LrclibModels.TrackOverride> e : all.entrySet()) {
            try {
                root.put(e.getKey(), e.getValue().toJson());
            } catch (JSONException ignored) {
            }
        }
        prefs(context).edit().putString(KEY_OVERRIDES, root.toString()).apply();
        pruneUnusedPinnedFiles(context);
    }

    static File cacheDir(Context context) {
        File dir = new File(context.getApplicationContext().getCacheDir(), "voidhack_lrclib_cache");
        if (!dir.exists()) dir.mkdirs();
        return dir;
    }

    static File pinnedDir(Context context) {
        File dir = new File(context.getApplicationContext().getFilesDir(), "voidhack_lrclib_pinned");
        if (!dir.exists()) dir.mkdirs();
        return dir;
    }

    static CacheLookup readTrackCache(Context context, String cacheKey) {
        if (cacheKey == null || cacheKey.isEmpty()) return CacheLookup.absent();
        File file = new File(cacheDir(context), "track_" + sha256Hex(cacheKey) + ".json");
        if (!file.isFile()) return CacheLookup.absent();
        try {
            JSONObject obj = new JSONObject(readFileUtf8(file));
            long fetchedAt = obj.optLong("fetchedAt", 0L);
            boolean hit = obj.optBoolean("hit", false);
            long ttl = hit ? CACHE_HIT_TTL_MS : CACHE_MISS_TTL_MS;
            if (System.currentTimeMillis() - fetchedAt > ttl) {
                return CacheLookup.absent();
            }
            if (!hit) {
                return new CacheLookup(true, false, null);
            }
            LrclibModels.LyricsRecord rec = LrclibModels.LyricsRecord.fromJson(obj.optJSONObject("record"));
            if (rec == null) return CacheLookup.absent();
            return new CacheLookup(true, true, rec);
        } catch (IOException | JSONException e) {
            return CacheLookup.absent();
        }
    }

    static void writeTrackCache(Context context, String cacheKey, LrclibModels.LyricsRecord record) {
        if (cacheKey == null || cacheKey.isEmpty()) return;
        File file = new File(cacheDir(context), "track_" + sha256Hex(cacheKey) + ".json");
        try {
            JSONObject obj = new JSONObject();
            obj.put("fetchedAt", System.currentTimeMillis());
            obj.put("hit", record != null);
            if (record != null) {
                obj.put("record", record.toJson());
                writeRecordByIdCache(context, record, false);
            }
            writeFileUtf8(file, obj.toString());
        } catch (IOException | JSONException e) {
            Log.w(TAG, "Failed writing LRCLIB track cache", e);
        }
    }

    static void deleteTrackCache(Context context, String cacheKey) {
        if (cacheKey == null || cacheKey.isEmpty()) return;
        File file = new File(cacheDir(context), "track_" + sha256Hex(cacheKey) + ".json");
        if (file.exists()) file.delete();
    }

    static LrclibModels.LyricsRecord readRecordById(Context context, long lrclibId) {
        if (lrclibId <= 0L) return null;
        File pinned = new File(pinnedDir(context), "id_" + lrclibId + ".json");
        if (pinned.isFile()) {
            try {
                JSONObject obj = new JSONObject(readFileUtf8(pinned));
                LrclibModels.LyricsRecord rec = LrclibModels.LyricsRecord.fromJson(obj.optJSONObject("record"));
                if (rec != null) return rec;
            } catch (IOException | JSONException ignored) {
            }
        }
        File cached = new File(cacheDir(context), "id_" + lrclibId + ".json");
        if (cached.isFile()) {
            try {
                JSONObject obj = new JSONObject(readFileUtf8(cached));
                long fetchedAt = obj.optLong("fetchedAt", 0L);
                if (System.currentTimeMillis() - fetchedAt <= ID_CACHE_TTL_MS) {
                    return LrclibModels.LyricsRecord.fromJson(obj.optJSONObject("record"));
                }
            } catch (IOException | JSONException ignored) {
            }
        }
        return null;
    }

    static void writeRecordByIdCache(Context context, LrclibModels.LyricsRecord record, boolean pinOffline) {
        if (record == null || record.id <= 0L) return;
        try {
            JSONObject obj = new JSONObject();
            obj.put("fetchedAt", System.currentTimeMillis());
            obj.put("record", record.toJson());
            String json = obj.toString();
            File cached = new File(cacheDir(context), "id_" + record.id + ".json");
            writeFileUtf8(cached, json);
            if (pinOffline) {
                File pinned = new File(pinnedDir(context), "id_" + record.id + ".json");
                writeFileUtf8(pinned, json);
            }
        } catch (IOException | JSONException e) {
            Log.w(TAG, "Failed writing LRCLIB record cache", e);
        }
    }

    static boolean hasOfflineLyricsForTrack(Context context, String trackKey, String autoCacheKey) {
        if (context == null || trackKey == null || trackKey.isEmpty()) return false;
        LrclibModels.TrackOverride ov = getOverride(context, trackKey);
        if (ov != null) {
            if (ov.mode == LrclibModels.OverrideMode.FORCE_OFFICIAL) return false;
            if (ov.mode == LrclibModels.OverrideMode.FORCE_LOCAL_LRC) {
                return LocalLrcStore.hasTrackLrc(context, trackKey);
            }
            if (ov.mode == LrclibModels.OverrideMode.FORCE_LRCLIB_ID && ov.lrclibId > 0L) {
                if (new File(pinnedDir(context), "id_" + ov.lrclibId + ".json").isFile()) return true;
                if (new File(cacheDir(context), "id_" + ov.lrclibId + ".json").isFile()) return true;
            }
        }
        if (LocalLrcFolder.hasCachedMatch(trackKey)) {
            return true;
        }
        if (autoCacheKey != null && !autoCacheKey.isEmpty()) {
            CacheLookup lookup = readTrackCache(context, autoCacheKey);
            if (lookup.found && lookup.hit && lookup.record != null) return true;
        }
        return false;
    }

    static int getCacheFileCount(Context context) {
        File dir = cacheDir(context);
        File[] files = dir.listFiles();
        return files == null ? 0 : files.length;
    }

    static void clearCache(Context context) {
        File dir = cacheDir(context);
        File[] files = dir.listFiles();
        if (files != null) {
            for (File f : files) {
                f.delete();
            }
        }
        LocalLrcFolder.invalidateCache();
    }

    private static void pruneUnusedPinnedFiles(Context context) {
        Map<String, LrclibModels.TrackOverride> all = loadAllOverrides(context);
        Set<Long> usedIds = new HashSet<>();
        Set<String> activeLocalKeys = new HashSet<>();
        for (LrclibModels.TrackOverride ov : all.values()) {
            if (ov.mode == LrclibModels.OverrideMode.FORCE_LRCLIB_ID && ov.lrclibId > 0L) {
                usedIds.add(ov.lrclibId);
            } else if (ov.mode == LrclibModels.OverrideMode.FORCE_LOCAL_LRC) {
                activeLocalKeys.add(ov.trackKey);
            }
        }
        LocalLrcStore.pruneUnused(context, activeLocalKeys);
        File[] files = pinnedDir(context).listFiles();
        if (files == null) return;
        for (File f : files) {
            String name = f.getName();
            if (name.startsWith("id_") && name.endsWith(".json")) {
                try {
                    long id = Long.parseLong(name.substring(3, name.length() - 5));
                    if (!usedIds.contains(id)) {
                        f.delete();
                    }
                } catch (NumberFormatException ignored) {
                }
            }
        }
    }

    private static String sha256Hex(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] digest = md.digest(input.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(digest.length * 2);
            for (byte b : digest) {
                sb.append(String.format(Locale.ROOT, "%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            return Integer.toHexString(input.hashCode());
        }
    }

    private static String readFileUtf8(File file) throws IOException {
        try (FileInputStream in = new FileInputStream(file)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            while ((n = in.read(buf)) != -1) {
                out.write(buf, 0, n);
            }
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    private static void writeFileUtf8(File file, String content) throws IOException {
        File tmp = new File(file.getParentFile(), file.getName() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(tmp)) {
            out.write(content.getBytes(StandardCharsets.UTF_8));
        }
        if (!tmp.renameTo(file)) {
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(content.getBytes(StandardCharsets.UTF_8));
            }
            tmp.delete();
        }
    }
}

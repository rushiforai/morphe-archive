package app.morphe.extension.shared.patches.toolkit;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.provider.MediaStore;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;

/**
 * Native engine that inspects Google Photos' internal SQLite databases directly.
 * Full 1:1 data model matching Google Photos Toolkit (GPTK v3.3.0).
 * Queries remote_media, shared_media, envelopes, collections, and remote_locked_media.
 */
public class StorageScanner {

    public enum SourceType {
        LIBRARY("Library"),
        SEARCH("Search"),
        ALBUMS("Albums"),
        SHARED("Shared"),
        FAVORITES("Favorites"),
        TRASH("Trash"),
        LOCKED("Locked Folder");

        public final String displayName;
        SourceType(String displayName) {
            this.displayName = displayName;
        }

        @Override
        public String toString() {
            return displayName;
        }
    }

    public enum SpaceFilter {
        ANY("Any"),
        CONSUMING("Consuming"),
        NON_CONSUMING("Non-Consuming");

        public final String label;
        SpaceFilter(String label) {
            this.label = label;
        }
    }

    public static class AlbumInfo {
        public final String mediaKey;
        public final String title;
        public final int itemCount;
        public final boolean isShared;

        public AlbumInfo(String mediaKey, String title, int itemCount, boolean isShared) {
            this.mediaKey = mediaKey;
            this.title = title != null && !title.isEmpty() ? title : "Untitled Album";
            this.itemCount = itemCount;
            this.isShared = isShared;
        }

        public AlbumInfo(String mediaKey, String title, int itemCount) {
            this(mediaKey, title, itemCount, false);
        }

        @Override
        public String toString() {
            return title + " (" + itemCount + ")";
        }
    }

    /**
     * 1:1 criteria matching every filter from google_photos_toolkit.user.js (Lines 121-289)
     */
    public static class FilterCriteria {
        public SourceType source = SourceType.LIBRARY;

        // 1. Select Albums (Include)
        public List<String> albumsInclude = new ArrayList<>();

        // 2. Search Query
        public String searchQuery = "";

        // 3. Exclude Albums
        public List<String> albumsExclude = new ArrayList<>();

        // 4. Date Interval
        public long lowerBoundaryDate = 0;   // epoch ms
        public long higherBoundaryDate = 0;  // epoch ms
        public String intervalType = "include"; // "include" | "exclude"
        public String dateType = "taken";       // "taken" | "uploaded"

        // 5. Filename Regex
        public String fileNameRegex = "";
        public String fileNameMatchType = "include"; // "include" | "exclude"

        // 6. Description Regex
        public String descriptionRegex = "";
        public String descriptionMatchType = "include"; // "include" | "exclude"

        // 7. Space
        public SpaceFilter space = SpaceFilter.ANY;

        // 8. Similarity
        public float similarityThreshold = 0f; // 0 = disabled, 0.01 - 1.0
        public int imageHeight = 16;           // pixels for hashing (default 16)

        // 9. Size (bytes)
        public long lowerBoundarySize = 0;
        public long higherBoundarySize = 0;

        // 10. Resolution (pixels)
        public int minWidth = 0;
        public int maxWidth = 0;
        public int minHeight = 0;
        public int maxHeight = 0;

        // 11. Duration (seconds)
        public float minDuration = 0;
        public float maxDuration = 0;

        // 12. Quality (null=any, "original", "storage-saver")
        public String quality = null;

        // 13. Type (null=any, "image", "video", "live")
        public String mediaType = null;

        // 14. Upload Status (null=any, "full", "partial")
        public String uploadStatus = null;

        // 15. Archived (null=any, true, false)
        public Boolean archived = null;

        // 16. Ownership (null=any, true, false)
        public Boolean owned = null;

        // 17. Location & Bounding Box
        public Boolean hasLocation = null;
        public Double boundSouth = null;
        public Double boundWest = null;
        public Double boundNorth = null;
        public Double boundEast = null;

        // 18. Favorite (null=any, true, false)
        public Boolean favorite = null;

        // 19. Exclude Shared Links
        public boolean excludeShared = false;

        // 20. Exclude Favorites
        public boolean excludeFavorites = false;

        // 21. Sort by size
        public boolean sortBySize = true;

        // Limit (matching Google Photos max album limit)
        public int limit = 20000;
    }

    public static class AccountInfo {
        public final int accountId;
        public final String accountName;
        public final String dbPath;
        public final String gaiaId;

        public AccountInfo(int accountId, String accountName, String dbPath, String gaiaId) {
            this.accountId = accountId;
            this.accountName = accountName;
            this.dbPath = dbPath;
            this.gaiaId = gaiaId != null ? gaiaId : "";
        }

        public AccountInfo(int accountId, String accountName, String dbPath) {
            this(accountId, accountName, dbPath, "");
        }

        @Override
        public String toString() {
            return accountName;
        }
    }

    public static class MediaItem {
        public final String dedupKey;
        public final String mediaKey;
        public final String filename;
        public final long sizeBytes;
        public final long quotaBytes;
        public final long captureTimestamp;
        public final String remoteUrl;
        public final long trashTimestamp;
        public final int width;
        public final int height;
        public final long duration;
        public final boolean isArchived;
        public final boolean isFavorite;
        public final boolean isMicroVideo;
        public final String mimeType;
        public final double latitude;
        public final double longitude;
        public final String caption;
        public long perceptualHash = 0;
        public int clusterId = -1;
        public boolean isCloudBackedUp = false;

        public MediaItem(String dedupKey, String mediaKey, String filename, long sizeBytes,
                         long quotaBytes, long captureTimestamp, String remoteUrl,
                         long trashTimestamp, int width, int height, long duration,
                         boolean isArchived, boolean isFavorite, boolean isMicroVideo,
                         String mimeType, double latitude, double longitude, String caption) {
            this.dedupKey = dedupKey;
            this.mediaKey = mediaKey;
            this.filename = filename != null ? filename : "Unknown";
            this.sizeBytes = sizeBytes;
            this.quotaBytes = quotaBytes;
            this.captureTimestamp = captureTimestamp;
            this.remoteUrl = remoteUrl;
            this.trashTimestamp = trashTimestamp;
            this.width = width;
            this.height = height;
            this.duration = duration;
            this.isArchived = isArchived;
            this.isFavorite = isFavorite;
            this.isMicroVideo = isMicroVideo;
            this.mimeType = internMimeType(mimeType);
            this.latitude = latitude;
            this.longitude = longitude;
            this.caption = caption != null && !caption.isEmpty() ? caption : "";
        }

        private static String internMimeType(String mime) {
            if (mime == null || mime.isEmpty()) return "";
            if ("image/jpeg".equalsIgnoreCase(mime)) return "image/jpeg";
            if ("image/png".equalsIgnoreCase(mime)) return "image/png";
            if ("image/heic".equalsIgnoreCase(mime)) return "image/heic";
            if ("image/webp".equalsIgnoreCase(mime)) return "image/webp";
            if ("video/mp4".equalsIgnoreCase(mime)) return "video/mp4";
            if ("video/quicktime".equalsIgnoreCase(mime)) return "video/quicktime";
            return mime.intern();
        }

        public boolean isTrashed() {
            return trashTimestamp > 0;
        }

        public String getFormattedSize() {
            return formatBytes(sizeBytes);
        }

        public String getFormattedQuota() {
            return formatBytes(quotaBytes);
        }
    }

    public static List<AccountInfo> getAvailableAccounts(Context context) {
        List<AccountInfo> accounts = new ArrayList<>();
        try {
            SharedPreferences sp = context.getSharedPreferences("accounts", Context.MODE_PRIVATE);
            for (int i = 0; i < 10; i++) {
                String accName = sp.getString(i + ".account_name", null);
                String gaiaId = sp.getString(i + ".gaia_id", "");
                File db = context.getDatabasePath("gphotos" + i + ".db");
                if (accName != null && db.exists()) {
                    accounts.add(new AccountInfo(i, accName, db.getAbsolutePath(), gaiaId));
                }
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Error discovering accounts", t);
        }

        if (accounts.isEmpty()) {
            File dbDir = context.getDatabasePath("gphotos1.db").getParentFile();
            if (dbDir != null && dbDir.exists()) {
                File[] dbs = dbDir.listFiles((dir, name) -> name.matches("gphotos\\d+\\.db"));
                if (dbs != null) {
                    for (File f : dbs) {
                        String name = f.getName().replace("gphotos", "").replace(".db", "");
                        try {
                            int id = Integer.parseInt(name);
                            accounts.add(new AccountInfo(id, "Account " + id, f.getAbsolutePath(), ""));
                        } catch (Throwable ignored) {}
                    }
                }
            }
        }
        return accounts;
    }

    public static AccountInfo getActiveAccount(Context context) {
        List<AccountInfo> accounts = getAvailableAccounts(context);
        if (accounts.isEmpty()) return null;

        // 1. Check native Google Photos accounts.xml "key.active-account-key" (exact active account in app)
        try {
            SharedPreferences sp = context.getSharedPreferences("accounts", Context.MODE_PRIVATE);
            int activeKey = sp.getInt("key.active-account-key", -1);
            if (activeKey >= 0) {
                for (AccountInfo a : accounts) {
                    if (a.accountId == activeKey) return a;
                }
            }
        } catch (Throwable ignored) {}

        // 2. Check photos.backup.backup_prefs "backup_prefs_account_id"
        try {
            SharedPreferences backupSp = context.getSharedPreferences("photos.backup.backup_prefs", Context.MODE_PRIVATE);
            int activeId = backupSp.getInt("backup_prefs_account_id", -1);
            if (activeId >= 0) {
                for (AccountInfo a : accounts) {
                    if (a.accountId == activeId) return a;
                }
            }
        } catch (Throwable ignored) {}

        // 3. Check Morphe account prefs (if user previously manually switched inside Morphe)
        try {
            SharedPreferences morphePrefs = context.getSharedPreferences("morphe_account_prefs", Context.MODE_PRIVATE);
            int selectedIdx = morphePrefs.getInt("selected_account_index", -1);
            if (selectedIdx >= 0) {
                for (AccountInfo a : accounts) {
                    if (a.accountId == selectedIdx) return a;
                }
            }
        } catch (Throwable ignored) {}

        return accounts.get(0);
    }

    private static void tuneDatabasePerformance(SQLiteDatabase db) {
        if (db == null) return;
        try (Cursor c = db.rawQuery("PRAGMA cache_size = -8000", null)) { if (c != null) c.moveToFirst(); } catch (Throwable ignored) {}
        try (Cursor c = db.rawQuery("PRAGMA temp_store = MEMORY", null)) { if (c != null) c.moveToFirst(); } catch (Throwable ignored) {}
    }

    private static final java.util.Set<String> sArchiveCheckedAccounts = java.util.Collections.synchronizedSet(new java.util.HashSet<>());

    public static void ensureArchiveSyncTriggers(SQLiteDatabase db) {
        if (db == null || !hasTable(db, "remote_media") || !hasTable(db, "media") || !hasTable(db, "collections")) return;
        try {
            boolean hasTrigger = false;
            try (Cursor c = db.rawQuery("SELECT 1 FROM sqlite_master WHERE type='trigger' AND name='trg_main_library_sync' LIMIT 1", null)) {
                if (c != null && c.moveToFirst()) {
                    hasTrigger = true;
                }
            } catch (Throwable ignored) {}
            if (hasTrigger) return;

            db.execSQL("DROP TRIGGER IF EXISTS trg_main_archive;");
            db.execSQL("DROP TRIGGER IF EXISTS trg_album_insert_archive;");
            db.execSQL("DROP TRIGGER IF EXISTS trg_album_update_archive;");
            db.execSQL("DROP TRIGGER IF EXISTS trg_main_unarchive;");

            // 1. When the main library collection changes archive state, cascade to sibling album rows and media table
            db.execSQL("CREATE TRIGGER IF NOT EXISTS trg_main_library_sync " +
                    "AFTER UPDATE OF is_archived ON remote_media " +
                    "WHEN NEW.collection_id NOT IN (SELECT collection_media_key FROM collections) " +
                    "BEGIN " +
                    "    UPDATE remote_media SET is_archived = NEW.is_archived WHERE dedup_key = NEW.dedup_key AND is_archived != NEW.is_archived; " +
                    "    UPDATE media SET is_archived = NEW.is_archived WHERE dedup_key = NEW.dedup_key AND is_archived != NEW.is_archived; " +
                    "END;");

            db.execSQL("CREATE TRIGGER IF NOT EXISTS trg_main_library_insert_sync " +
                    "AFTER INSERT ON remote_media " +
                    "WHEN NEW.collection_id NOT IN (SELECT collection_media_key FROM collections) " +
                    "BEGIN " +
                    "    UPDATE remote_media SET is_archived = NEW.is_archived WHERE dedup_key = NEW.dedup_key AND is_archived != NEW.is_archived; " +
                    "    UPDATE media SET is_archived = NEW.is_archived WHERE dedup_key = NEW.dedup_key AND is_archived != NEW.is_archived; " +
                    "END;");

            // 2. When an album row is inserted by delta sync, inherit the main library's archive state
            db.execSQL("CREATE TRIGGER IF NOT EXISTS trg_album_insert_sync " +
                    "AFTER INSERT ON remote_media " +
                    "WHEN NEW.collection_id IN (SELECT collection_media_key FROM collections) " +
                    "BEGIN " +
                    "    UPDATE remote_media SET is_archived = COALESCE(( " +
                    "        SELECT is_archived FROM remote_media " +
                    "        WHERE dedup_key = NEW.dedup_key " +
                    "          AND collection_id NOT IN (SELECT collection_media_key FROM collections) " +
                    "        LIMIT 1 " +
                    "    ), 0) WHERE _id = NEW._id; " +
                    "END;");

            // 3. When media table is updated or inserted, guard it against desynchronizing from the main library row
            db.execSQL("CREATE TRIGGER IF NOT EXISTS trg_media_sync_guard " +
                    "AFTER UPDATE OF is_archived ON media " +
                    "WHEN EXISTS ( " +
                    "    SELECT 1 FROM remote_media " +
                    "    WHERE dedup_key = NEW.dedup_key " +
                    "      AND collection_id NOT IN (SELECT collection_media_key FROM collections) " +
                    "      AND is_archived != NEW.is_archived " +
                    ") " +
                    "BEGIN " +
                    "    UPDATE media SET is_archived = ( " +
                    "        SELECT is_archived FROM remote_media " +
                    "        WHERE dedup_key = NEW.dedup_key " +
                    "          AND collection_id NOT IN (SELECT collection_media_key FROM collections) " +
                    "        LIMIT 1 " +
                    "    ) WHERE _id = NEW._id; " +
                    "END;");

            db.execSQL("CREATE TRIGGER IF NOT EXISTS trg_media_insert_guard " +
                    "AFTER INSERT ON media " +
                    "WHEN EXISTS ( " +
                    "    SELECT 1 FROM remote_media " +
                    "    WHERE dedup_key = NEW.dedup_key " +
                    "      AND collection_id NOT IN (SELECT collection_media_key FROM collections) " +
                    "      AND is_archived != NEW.is_archived " +
                    ") " +
                    "BEGIN " +
                    "    UPDATE media SET is_archived = ( " +
                    "        SELECT is_archived FROM remote_media " +
                    "        WHERE dedup_key = NEW.dedup_key " +
                    "          AND collection_id NOT IN (SELECT collection_media_key FROM collections) " +
                    "        LIMIT 1 " +
                    "    ) WHERE _id = NEW._id; " +
                    "END;");

            // 4. Custom SQLite Partial Indices: Accelerate archive filtering, duplicate checks, and triggers
            db.execSQL("CREATE INDEX IF NOT EXISTS idx_remote_media_active_archive " +
                    "ON remote_media (dedup_key, is_archived) " +
                    "WHERE state = 0 AND trash_timestamp = 0;");

            db.execSQL("CREATE INDEX IF NOT EXISTS idx_remote_media_archived_only " +
                    "ON remote_media (dedup_key) " +
                    "WHERE is_archived = 1;");
        } catch (Throwable t) {
            Logger.printException(() -> "Error ensuring archive sync triggers", t);
        }
    }

    public static void ensureArchiveConsistency(AccountInfo account) {
        if (account == null || account.dbPath == null) return;
        if (!sArchiveCheckedAccounts.add(account.dbPath)) return;
        File dbFile = new File(account.dbPath);
        if (!dbFile.exists()) return;
        new Thread(() -> {
            SQLiteDatabase db = null;
            try {
                db = SQLiteDatabase.openDatabase(dbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
                ensureArchiveSyncTriggers(db);
                if (hasTable(db, "remote_media") && hasTable(db, "media") && hasTable(db, "collections")) {
                    db.beginTransactionNonExclusive();
                    try {
                        db.execSQL("UPDATE remote_media SET is_archived = ( " +
                                "    SELECT is_archived FROM remote_media rm2 " +
                                "    WHERE rm2.dedup_key = remote_media.dedup_key " +
                                "      AND rm2.collection_id NOT IN (SELECT collection_media_key FROM collections) " +
                                "    LIMIT 1 " +
                                ") " +
                                "WHERE collection_id IN (SELECT collection_media_key FROM collections) " +
                                "  AND EXISTS ( " +
                                "    SELECT 1 FROM remote_media rm2 " +
                                "    WHERE rm2.dedup_key = remote_media.dedup_key " +
                                "      AND rm2.collection_id NOT IN (SELECT collection_media_key FROM collections) " +
                                "      AND rm2.is_archived != remote_media.is_archived " +
                                ");");

                        db.execSQL("UPDATE media SET is_archived = ( " +
                                "    SELECT is_archived FROM remote_media " +
                                "    WHERE remote_media.dedup_key = media.dedup_key " +
                                "      AND remote_media.collection_id NOT IN (SELECT collection_media_key FROM collections) " +
                                "    LIMIT 1 " +
                                ") " +
                                "WHERE EXISTS ( " +
                                "    SELECT 1 FROM remote_media " +
                                "    WHERE remote_media.dedup_key = media.dedup_key " +
                                "      AND remote_media.collection_id NOT IN (SELECT collection_media_key FROM collections) " +
                                "      AND remote_media.is_archived != media.is_archived " +
                                ");");
                        db.setTransactionSuccessful();
                    } finally {
                        db.endTransaction();
                    }
                }
            } catch (Throwable ignored) {
            } finally {
                if (db != null) {
                    try { db.close(); } catch (Throwable ignored) {}
                }
            }
        }, "morphe-archive-consistency").start();
    }

    public static List<AlbumInfo> getAvailableAlbums(AccountInfo account) {
        List<AlbumInfo> albums = new ArrayList<>();
        if (account == null) return albums;
        File dbFile = new File(account.dbPath);
        if (!dbFile.exists()) return albums;

        SQLiteDatabase db = null;
        try {
            db = SQLiteDatabase.openDatabase(dbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
            tuneDatabasePerformance(db);
            Map<String, AlbumInfo> albumMap = new LinkedHashMap<>();

            // 1. Query collections (User Albums)
            if (hasTable(db, "collections")) {
                String titleCol = hasColumn(db, "collections", "title_text") ? "coalesce(title_text, title)" : "title";
                String hiddenCond = hasColumn(db, "collections", "is_hidden") ? "AND (is_hidden = 0 OR is_hidden IS NULL)" : "";
                String itemsCol = hasColumn(db, "collections", "total_items") ? "total_items" : "0";
                String audienceCol = hasColumn(db, "collections", "audience") ? "(audience > 1)" : "0";
                String sql = "SELECT collection_media_key, " + titleCol + " as album_title, " + itemsCol + ", " + audienceCol +
                        " FROM collections WHERE album_title IS NOT NULL AND album_title != '' " + hiddenCond +
                        " ORDER BY album_title COLLATE NOCASE ASC";
                try (Cursor c = db.rawQuery(sql, null)) {
                    while (c != null && c.moveToNext()) {
                        String mKey = c.getString(0);
                        String title = c.getString(1);
                        int count = c.getInt(2);
                        boolean isShared = c.getInt(3) == 1;
                        if (mKey != null && title != null && !title.trim().isEmpty()) {
                            albumMap.put(mKey, new AlbumInfo(mKey, title.trim(), count, isShared));
                        }
                    }
                } catch (Throwable tCol) {
                    Logger.printException(() -> "Error querying collections table", tCol);
                }
            }

            // 2. Query envelopes (Shared / Link-shared Albums)
            if (hasTable(db, "envelopes")) {
                String hiddenCond = hasColumn(db, "envelopes", "is_hidden") ? "AND (is_hidden = 0 OR is_hidden IS NULL)" : "";
                String countCol = hasColumn(db, "envelopes", "total_item_count") ? "total_item_count" : "0";
                String sql = "SELECT media_key, title, " + countCol +
                        " FROM envelopes WHERE title IS NOT NULL AND title != '' " + hiddenCond +
                        " ORDER BY title COLLATE NOCASE ASC";
                try (Cursor c = db.rawQuery(sql, null)) {
                    while (c != null && c.moveToNext()) {
                        String mKey = c.getString(0);
                        String title = c.getString(1);
                        int count = c.getInt(2);
                        if (mKey != null && title != null && !title.trim().isEmpty()) {
                            if (!albumMap.containsKey(mKey)) {
                                albumMap.put(mKey, new AlbumInfo(mKey, title.trim(), count, true));
                            }
                        }
                    }
                } catch (Throwable tEnv) {
                    Logger.printException(() -> "Error querying envelopes table", tEnv);
                }
            }

            // 3. Fallback: Distinct collection_id in remote_media or shared_media if collections/envelopes empty
            if (albumMap.isEmpty()) {
                if (hasTable(db, "remote_media")) {
                    String sql = "SELECT DISTINCT collection_id FROM remote_media WHERE collection_id IS NOT NULL AND collection_id != ''";
                    try (Cursor c = db.rawQuery(sql, null)) {
                        while (c != null && c.moveToNext()) {
                            String mKey = c.getString(0);
                            if (mKey != null && !mKey.isEmpty() && !albumMap.containsKey(mKey)) {
                                albumMap.put(mKey, new AlbumInfo(mKey, "Album (" + mKey.substring(0, Math.min(8, mKey.length())) + "…)", 0, false));
                            }
                        }
                    } catch (Throwable ignored) {}
                }
            }

            albums.addAll(albumMap.values());
            Log.i("morphe: StorageScanner", "getAvailableAlbums found " + albums.size() + " albums");
        } catch (Throwable t) {
            Logger.printException(() -> "Error fetching albums", t);
        } finally {
            if (db != null) {
                try { db.close(); } catch (Throwable ignored) {}
            }
        }
        return albums;
    }

    public static List<MediaItem> queryMedia(AccountInfo account, FilterCriteria crit) {
        List<MediaItem> items = new ArrayList<>();
        if (account == null || crit == null) return items;
        File dbFile = new File(account.dbPath);
        if (!dbFile.exists()) return items;

        if (crit.source == SourceType.TRASH) {
            Context ctx = app.morphe.extension.shared.Utils.getContext();
            if (ctx != null) {
                syncCloudTrashToLocalDb(ctx, account);
            }
        }

        SQLiteDatabase db = null;
        try {
            db = SQLiteDatabase.openDatabase(dbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
            tuneDatabasePerformance(db);
            String targetTable = "remote_media";
            if (crit.source == SourceType.SHARED) {
                targetTable = "shared_media";
            } else if (crit.source == SourceType.LOCKED) {
                targetTable = "remote_locked_media";
                if (!hasTable(db, targetTable) || getTableRowCount(db, targetTable) == 0) {
                    if (hasTable(db, "account_local_locked_media")) {
                        targetTable = "account_local_locked_media";
                    }
                }
            }

            if (!hasTable(db, targetTable)) return items;

            StringBuilder where = new StringBuilder("1=1");
            List<String> args = new ArrayList<>();

            // 1. Source constraint
            switch (crit.source) {
                case LIBRARY:
                    if (hasColumn(db, targetTable, "state")) {
                        where.append(" AND (state IS NULL OR state != 2)");
                    }
                    if (hasColumn(db, targetTable, "trash_timestamp")) {
                        where.append(" AND (trash_timestamp IS NULL OR trash_timestamp = 0)");
                    }
                    if (crit.excludeFavorites) {
                        where.append(" AND (is_favorite IS NULL OR is_favorite = 0)");
                    }
                    break;
                case SEARCH:
                    if (hasColumn(db, targetTable, "state")) {
                        where.append(" AND (state IS NULL OR state != 2)");
                    }
                    if (hasColumn(db, targetTable, "trash_timestamp")) {
                        where.append(" AND (trash_timestamp IS NULL OR trash_timestamp = 0)");
                    }
                    if (crit.searchQuery != null && !crit.searchQuery.trim().isEmpty()) {
                        String q = "%" + crit.searchQuery.trim() + "%";
                        boolean hasCap = hasColumn(db, targetTable, "caption");
                        boolean hasUserCap = hasColumn(db, targetTable, "user_specified_caption");
                        if (hasCap && hasUserCap) {
                            where.append(" AND (filename LIKE ? OR caption LIKE ? OR user_specified_caption LIKE ?)");
                            args.add(q);
                            args.add(q);
                            args.add(q);
                        } else if (hasCap || hasUserCap) {
                            String col = hasCap ? "caption" : "user_specified_caption";
                            where.append(" AND (filename LIKE ? OR ").append(col).append(" LIKE ?)");
                            args.add(q);
                            args.add(q);
                        } else {
                            where.append(" AND filename LIKE ?");
                            args.add(q);
                        }
                    }
                    break;
                case ALBUMS:
                    if (hasColumn(db, targetTable, "state")) {
                        where.append(" AND (state IS NULL OR state != 2)");
                    }
                    if (hasColumn(db, targetTable, "trash_timestamp")) {
                        where.append(" AND (trash_timestamp IS NULL OR trash_timestamp = 0)");
                    }
                    if (!crit.albumsInclude.isEmpty()) {
                        where.append(" AND collection_id IN (");
                        for (int i = 0; i < crit.albumsInclude.size(); i++) {
                            if (i > 0) where.append(",");
                            where.append("?");
                            args.add(crit.albumsInclude.get(i));
                        }
                        where.append(")");
                    } else {
                        // In Google Photos Toolkit, selecting Albums source requires picking album(s)
                        return items;
                    }
                    break;
                case SHARED:
                    break;
                case FAVORITES:
                    if (hasColumn(db, targetTable, "state")) {
                        where.append(" AND (state IS NULL OR state != 2)");
                    }
                    where.append(" AND is_favorite = 1");
                    if (hasColumn(db, targetTable, "trash_timestamp")) {
                        where.append(" AND (trash_timestamp IS NULL OR trash_timestamp = 0)");
                    }
                    break;
                case TRASH:
                    if (hasColumn(db, targetTable, "state")) {
                        where.append(" AND (state = 2 OR (trash_timestamp IS NOT NULL AND trash_timestamp > 0))");
                    } else {
                        where.append(" AND trash_timestamp > 0");
                    }
                    break;
                case LOCKED:
                    break;
            }

            // Exclude albums
            if (!crit.albumsExclude.isEmpty()) {
                where.append(" AND (collection_id IS NULL OR collection_id NOT IN (");
                for (int i = 0; i < crit.albumsExclude.size(); i++) {
                    if (i > 0) where.append(",");
                    where.append("?");
                    args.add(crit.albumsExclude.get(i));
                }
                where.append("))");
                if ("remote_media".equals(targetTable) && hasTable(db, "shared_media")) {
                    where.append(" AND dedup_key NOT IN (SELECT dedup_key FROM shared_media WHERE collection_id IN (");
                    for (int i = 0; i < crit.albumsExclude.size(); i++) {
                        if (i > 0) where.append(",");
                        where.append("?");
                        args.add(crit.albumsExclude.get(i));
                    }
                    where.append("))");
                }
            }

            // Space filter
            if (hasColumn(db, targetTable, "quota_charged_bytes")) {
                if (crit.space == SpaceFilter.CONSUMING) {
                    where.append(" AND quota_charged_bytes > 0");
                } else if (crit.space == SpaceFilter.NON_CONSUMING) {
                    where.append(" AND (quota_charged_bytes = 0 OR quota_charged_bytes IS NULL)");
                }
            }

            // Date interval
            String dateCol = "uploaded".equals(crit.dateType) && hasColumn(db, targetTable, "utc_timestamp")
                    ? "utc_timestamp" : "capture_timestamp";

            if (crit.lowerBoundaryDate > 0 && crit.higherBoundaryDate > 0) {
                if ("include".equals(crit.intervalType)) {
                    where.append(" AND ").append(dateCol).append(" >= ? AND ").append(dateCol).append(" <= ?");
                    args.add(String.valueOf(crit.lowerBoundaryDate));
                    args.add(String.valueOf(crit.higherBoundaryDate));
                } else {
                    where.append(" AND NOT (").append(dateCol).append(" >= ? AND ").append(dateCol).append(" <= ?)");
                    args.add(String.valueOf(crit.lowerBoundaryDate));
                    args.add(String.valueOf(crit.higherBoundaryDate));
                }
            } else if (crit.lowerBoundaryDate > 0) {
                if ("include".equals(crit.intervalType)) {
                    where.append(" AND ").append(dateCol).append(" >= ?");
                } else {
                    where.append(" AND ").append(dateCol).append(" < ?");
                }
                args.add(String.valueOf(crit.lowerBoundaryDate));
            } else if (crit.higherBoundaryDate > 0) {
                if ("include".equals(crit.intervalType)) {
                    where.append(" AND ").append(dateCol).append(" <= ?");
                } else {
                    where.append(" AND ").append(dateCol).append(" > ?");
                }
                args.add(String.valueOf(crit.higherBoundaryDate));
            }

            // Size bounds
            if (crit.lowerBoundarySize > 0) {
                where.append(" AND size_bytes >= ?");
                args.add(String.valueOf(crit.lowerBoundarySize));
            }
            if (crit.higherBoundarySize > 0) {
                where.append(" AND size_bytes <= ?");
                args.add(String.valueOf(crit.higherBoundarySize));
            }

            // Resolution
            if (crit.minWidth > 0) {
                where.append(" AND width >= ?");
                args.add(String.valueOf(crit.minWidth));
            }
            if (crit.maxWidth > 0) {
                where.append(" AND width <= ?");
                args.add(String.valueOf(crit.maxWidth));
            }
            if (crit.minHeight > 0) {
                where.append(" AND height >= ?");
                args.add(String.valueOf(crit.minHeight));
            }
            if (crit.maxHeight > 0) {
                where.append(" AND height <= ?");
                args.add(String.valueOf(crit.maxHeight));
            }

            // Duration
            if (crit.minDuration > 0) {
                where.append(" AND duration >= ?");
                args.add(String.valueOf((long) (crit.minDuration * 1000)));
            }
            if (crit.maxDuration > 0) {
                where.append(" AND duration <= ?");
                args.add(String.valueOf((long) (crit.maxDuration * 1000)));
            }

            // Media Type
            if ("image".equalsIgnoreCase(crit.mediaType)) {
                where.append(" AND (mime_type LIKE 'image/%' OR type = 1)");
            } else if ("video".equalsIgnoreCase(crit.mediaType)) {
                where.append(" AND (mime_type LIKE 'video/%' OR type = 2)");
            } else if ("live".equalsIgnoreCase(crit.mediaType)) {
                where.append(" AND is_micro_video = 1");
            }

            // Archived
            if (crit.archived != null) {
                if ("remote_media".equals(targetTable)) {
                    if (crit.archived) {
                        where.append(" AND (is_archived = 1 OR dedup_key IN (SELECT dedup_key FROM remote_media WHERE is_archived = 1))");
                    } else {
                        where.append(" AND is_archived = 0 AND dedup_key NOT IN (SELECT dedup_key FROM remote_media WHERE is_archived = 1)");
                    }
                } else if (hasColumn(db, targetTable, "is_archived")) {
                    where.append(" AND is_archived = ").append(crit.archived ? "1" : "0");
                } else if (hasTable(db, "media")) {
                    // shared_media has no is_archived column; resolve archive state via the media table
                    where.append(" AND dedup_key ").append(crit.archived ? "IN" : "NOT IN")
                         .append(" (SELECT dedup_key FROM media WHERE is_archived = 1)");
                }
            }

            // Favorite
            if (crit.favorite != null && crit.source != SourceType.FAVORITES) {
                where.append(" AND is_favorite = ").append(crit.favorite ? "1" : "0");
            }

            // Quality
            if (hasColumn(db, targetTable, "quota_charged_bytes")) {
                if ("original".equalsIgnoreCase(crit.quality)) {
                    where.append(" AND quota_charged_bytes > 0");
                } else if ("storage-saver".equalsIgnoreCase(crit.quality)) {
                    where.append(" AND (quota_charged_bytes = 0 OR quota_charged_bytes IS NULL)");
                }
            }

            // Ownership
            if (crit.owned != null && hasColumn(db, targetTable, "is_owned")) {
                where.append(" AND is_owned = ").append(crit.owned ? "1" : "0");
            }

            // Upload Status
            if (crit.uploadStatus != null && hasColumn(db, targetTable, "upload_status")) {
                where.append(" AND upload_status = ?");
                args.add(crit.uploadStatus);
            }

            // Location
            boolean hasLat = hasColumn(db, targetTable, "latitude");
            boolean hasLon = hasColumn(db, targetTable, "longitude");
            if (hasLat && hasLon) {
                if (Boolean.TRUE.equals(crit.hasLocation)) {
                    where.append(" AND (latitude IS NOT NULL AND latitude != 0.0)");
                } else if (Boolean.FALSE.equals(crit.hasLocation)) {
                    where.append(" AND (latitude IS NULL OR latitude = 0.0)");
                }
                if (crit.boundSouth != null && crit.boundNorth != null) {
                    where.append(" AND (latitude >= ? AND latitude <= ?)");
                    args.add(String.valueOf(crit.boundSouth));
                    args.add(String.valueOf(crit.boundNorth));
                }
                if (crit.boundWest != null && crit.boundEast != null) {
                    where.append(" AND (longitude >= ? AND longitude <= ?)");
                    args.add(String.valueOf(crit.boundWest));
                    args.add(String.valueOf(crit.boundEast));
                }
            }

            String orderBy = crit.sortBySize ? "size_bytes DESC" : "capture_timestamp DESC";
            if (crit.space == SpaceFilter.CONSUMING && hasColumn(db, targetTable, "quota_charged_bytes")) {
                orderBy = "quota_charged_bytes DESC, size_bytes DESC";
            }

            String latExpr = hasLat ? "latitude" : "0.0";
            String lonExpr = hasLon ? "longitude" : "0.0";
            boolean hasCaption = hasColumn(db, targetTable, "caption");
            boolean hasUserCaption = hasColumn(db, targetTable, "user_specified_caption");
            String captionExpr;
            if (hasCaption && hasUserCaption) {
                captionExpr = "COALESCE(NULLIF(user_specified_caption, ''), caption, '')";
            } else if (hasUserCaption) {
                captionExpr = "COALESCE(user_specified_caption, '')";
            } else if (hasCaption) {
                captionExpr = "COALESCE(caption, '')";
            } else {
                captionExpr = "''";
            }

            String mediaKeyExpr = hasColumn(db, targetTable, "remote_media_key")
                    ? "COALESCE(NULLIF(remote_media_key, ''), media_key)"
                    : (hasColumn(db, targetTable, "media_key") ? "media_key" : "dedup_key");
            String remoteUrlExpr = hasColumn(db, targetTable, "remote_url")
                    ? "remote_url"
                    : (hasColumn(db, targetTable, "private_file_path") ? "private_file_path" : "''");
            String quotaExpr = hasColumn(db, targetTable, "quota_charged_bytes") ? "quota_charged_bytes" : "0";
            String trashExpr = hasColumn(db, targetTable, "trash_timestamp")
                    ? (hasColumn(db, targetTable, "state")
                            ? "CASE WHEN state = 2 AND (trash_timestamp IS NULL OR trash_timestamp = 0) THEN 1 ELSE COALESCE(trash_timestamp, 0) END"
                            : "COALESCE(trash_timestamp, 0)")
                    : (hasColumn(db, targetTable, "state")
                            ? "CASE WHEN state = 2 THEN 1 ELSE 0 END"
                            : "0");

            String groupByClause = "remote_media".equals(targetTable) ? " GROUP BY dedup_key" : "";
            String sql = "SELECT dedup_key, " + mediaKeyExpr + ", filename, size_bytes, " + quotaExpr + ", capture_timestamp, " + remoteUrlExpr + ", " +
                    trashExpr + ", " +
                    "width, height, duration, " +
                    (hasColumn(db, targetTable, "is_archived") ? "is_archived" : "0") + ", " +
                    (hasColumn(db, targetTable, "is_favorite") ? "is_favorite" : "0") + ", " +
                    (hasColumn(db, targetTable, "is_micro_video") ? "is_micro_video" : "0") + ", " +
                    "mime_type, " + latExpr + ", " + lonExpr + ", " + captionExpr + " " +
                    "FROM " + targetTable + " " +
                    "WHERE " + where + groupByClause + " " +
                    "ORDER BY " + orderBy + " LIMIT " + crit.limit;

            Pattern fileNamePat = getCachedPattern(crit.fileNameRegex);
            Pattern descPat = getCachedPattern(crit.descriptionRegex);

            try (Cursor c = db.rawQuery(sql, args.toArray(new String[0]))) {
                if (c != null) {
                    final int cDedupKey = 0;
                    final int cMediaKey = 1;
                    final int cFilename = 2;
                    final int cSizeBytes = 3;
                    final int cQuotaBytes = 4;
                    final int cCaptureTimestamp = 5;
                    final int cRemoteUrl = 6;
                    final int cTrashTimestamp = 7;
                    final int cWidth = 8;
                    final int cHeight = 9;
                    final int cDuration = 10;
                    final int cIsArchived = 11;
                    final int cIsFavorite = 12;
                    final int cIsMicroVideo = 13;
                    final int cMimeType = 14;
                    final int cLatitude = 15;
                    final int cLongitude = 16;
                    final int cCaption = 17;

                    while (c.moveToNext()) {
                        String filename = c.getString(cFilename);
                        String caption = c.getString(cCaption);

                        // In-memory Regex matching
                        if (fileNamePat != null) {
                            boolean matches = fileNamePat.matcher(filename != null ? filename : "").find();
                            if ("exclude".equals(crit.fileNameMatchType) && matches) continue;
                            if ("include".equals(crit.fileNameMatchType) && !matches) continue;
                        }
                        if (descPat != null) {
                            boolean matches = descPat.matcher(caption != null ? caption : "").find();
                            if ("exclude".equals(crit.descriptionMatchType) && matches) continue;
                            if ("include".equals(crit.descriptionMatchType) && !matches) continue;
                        }

                        MediaItem mi = new MediaItem(
                                c.getString(cDedupKey),
                                c.getString(cMediaKey),
                                filename,
                                c.getLong(cSizeBytes),
                                c.getLong(cQuotaBytes),
                                c.getLong(cCaptureTimestamp),
                                c.getString(cRemoteUrl),
                                c.getLong(cTrashTimestamp),
                                c.getInt(cWidth),
                                c.getInt(cHeight),
                                c.getLong(cDuration),
                                c.getInt(cIsArchived) == 1,
                                c.getInt(cIsFavorite) == 1,
                                c.getInt(cIsMicroVideo) == 1,
                                c.getString(cMimeType),
                                c.getDouble(cLatitude),
                                c.getDouble(cLongitude),
                                caption
                        );
                        if ("remote_media".equals(targetTable) || "shared_media".equals(targetTable) || "remote_locked_media".equals(targetTable)) {
                            mi.isCloudBackedUp = true;
                        } else if ("account_local_locked_media".equals(targetTable)) {
                            if (hasTable(db, "remote_locked_media") && mi.dedupKey != null && !mi.dedupKey.isEmpty()) {
                                try (Cursor rc = db.rawQuery("SELECT 1 FROM remote_locked_media WHERE dedup_key = ? LIMIT 1", new String[]{mi.dedupKey})) {
                                    if (rc != null && rc.moveToFirst()) {
                                        mi.isCloudBackedUp = true;
                                    }
                                } catch (Throwable ignored) {}
                            }
                        }
                        items.add(mi);
                    }
                }
            }

            // If Source is ALBUMS, also query shared_media in case items belong to a shared album
            if (crit.source == SourceType.ALBUMS && hasTable(db, "shared_media") && !crit.albumsInclude.isEmpty()) {
                try {
                    StringBuilder sharedWhere = new StringBuilder("collection_id IN (");
                    List<String> sharedArgs = new ArrayList<>();
                    for (int i = 0; i < crit.albumsInclude.size(); i++) {
                        if (i > 0) sharedWhere.append(",");
                        sharedWhere.append("?");
                        sharedArgs.add(crit.albumsInclude.get(i));
                    }
                    sharedWhere.append(")");

                    String sharedMediaKeyExpr = hasColumn(db, "shared_media", "remote_media_key") ? "COALESCE(NULLIF(remote_media_key, ''), media_key)" : "media_key";
                    String sharedLatExpr = hasColumn(db, "shared_media", "latitude") ? "latitude" : "0.0";
                    String sharedLonExpr = hasColumn(db, "shared_media", "longitude") ? "longitude" : "0.0";
                    boolean hasSharedCap = hasColumn(db, "shared_media", "caption");
                    boolean hasSharedUserCap = hasColumn(db, "shared_media", "user_specified_caption");
                    String sharedCapExpr;
                    if (hasSharedCap && hasSharedUserCap) {
                        sharedCapExpr = "COALESCE(NULLIF(user_specified_caption, ''), caption, '')";
                    } else if (hasSharedUserCap) {
                        sharedCapExpr = "COALESCE(user_specified_caption, '')";
                    } else if (hasSharedCap) {
                        sharedCapExpr = "COALESCE(caption, '')";
                    } else {
                        sharedCapExpr = "''";
                    }

                    String sharedSql = "SELECT dedup_key, " + sharedMediaKeyExpr + ", filename, size_bytes, quota_charged_bytes, capture_timestamp, remote_url, " +
                            "0, width, height, duration, 0, (is_favorite IS NOT NULL AND is_favorite = 1), (is_micro_video IS NOT NULL AND is_micro_video = 1), mime_type, " +
                            sharedLatExpr + ", " + sharedLonExpr + ", " + sharedCapExpr + " " +
                            "FROM shared_media WHERE " + sharedWhere;
                    try (Cursor sc = db.rawQuery(sharedSql, sharedArgs.toArray(new String[0]))) {
                        if (sc != null) {
                            final int scDedupKey = 0;
                            final int scMediaKey = 1;
                            final int scFilename = 2;
                            final int scSizeBytes = 3;
                            final int scQuotaBytes = 4;
                            final int scCaptureTimestamp = 5;
                            final int scRemoteUrl = 6;
                            final int scTrashTimestamp = 7;
                            final int scWidth = 8;
                            final int scHeight = 9;
                            final int scDuration = 10;
                            final int scIsArchived = 11;
                            final int scIsFavorite = 12;
                            final int scIsMicroVideo = 13;
                            final int scMimeType = 14;
                            final int scLatitude = 15;
                            final int scLongitude = 16;
                            final int scCaption = 17;

                            HashSet<String> seen = new HashSet<>();
                            for (MediaItem it : items) seen.add(it.dedupKey);

                            while (sc.moveToNext()) {
                                String dKey = sc.getString(scDedupKey);
                                if (dKey == null || seen.contains(dKey)) continue;

                                String filename = sc.getString(scFilename);
                                String caption = sc.getString(scCaption);

                                // In-memory Regex matching
                                if (fileNamePat != null) {
                                    boolean matches = fileNamePat.matcher(filename != null ? filename : "").find();
                                    if ("exclude".equals(crit.fileNameMatchType) && matches) continue;
                                    if ("include".equals(crit.fileNameMatchType) && !matches) continue;
                                }
                                if (descPat != null) {
                                    boolean matches = descPat.matcher(caption != null ? caption : "").find();
                                    if ("exclude".equals(crit.descriptionMatchType) && matches) continue;
                                    if ("include".equals(crit.descriptionMatchType) && !matches) continue;
                                }

                                MediaItem smi = new MediaItem(
                                        dKey,
                                        sc.getString(scMediaKey),
                                        filename,
                                        sc.getLong(scSizeBytes),
                                        sc.getLong(scQuotaBytes),
                                        sc.getLong(scCaptureTimestamp),
                                        sc.getString(scRemoteUrl),
                                        sc.getLong(scTrashTimestamp),
                                        sc.getInt(scWidth),
                                        sc.getInt(scHeight),
                                        sc.getLong(scDuration),
                                        sc.getInt(scIsArchived) == 1,
                                        sc.getInt(scIsFavorite) == 1,
                                        sc.getInt(scIsMicroVideo) == 1,
                                        sc.getString(scMimeType),
                                        sc.getDouble(scLatitude),
                                        sc.getDouble(scLongitude),
                                        caption
                                );
                                smi.isCloudBackedUp = true;
                                items.add(smi);
                                seen.add(dKey);
                            }
                        }
                    }
                } catch (Throwable ignored) {}
            }

            // If Source is LOCKED, also query account_local_locked_media for any local locked items
            if (crit.source == SourceType.LOCKED && hasTable(db, "account_local_locked_media")) {
                try {
                    String localLockedSql = "SELECT dedup_key, dedup_key, filename, size_bytes, 0, capture_timestamp, private_file_path, " +
                            "0, width, height, duration, 0, 0, (is_micro_video IS NOT NULL AND is_micro_video = 1), mime_type, " +
                            (hasColumn(db, "account_local_locked_media", "latitude") ? "latitude" : "0.0") + ", " +
                            (hasColumn(db, "account_local_locked_media", "longitude") ? "longitude" : "0.0") + ", '' " +
                            "FROM account_local_locked_media";
                    try (Cursor lc = db.rawQuery(localLockedSql, null)) {
                        HashSet<String> seen = new HashSet<>();
                        for (MediaItem it : items) seen.add(it.dedupKey);
                        while (lc != null && lc.moveToNext()) {
                            String dKey = lc.getString(0);
                            if (dKey == null || seen.contains(dKey)) continue;

                            String filename = lc.getString(2);
                            if (fileNamePat != null) {
                                boolean matches = fileNamePat.matcher(filename != null ? filename : "").find();
                                if ("exclude".equals(crit.fileNameMatchType) && matches) continue;
                                if ("include".equals(crit.fileNameMatchType) && !matches) continue;
                            }

                            String path = lc.getString(6);
                            String fileUri = (path != null && !path.isEmpty()) ? (path.startsWith("/") ? "file://" + path : path) : "";

                            MediaItem lmi = new MediaItem(
                                    dKey,
                                    dKey,
                                    filename,
                                    lc.getLong(3),
                                    lc.getLong(4),
                                    lc.getLong(5),
                                    fileUri,
                                    0,
                                    lc.getInt(8),
                                    lc.getInt(9),
                                    lc.getLong(10),
                                    false,
                                    false,
                                    lc.getInt(13) == 1,
                                    lc.getString(14),
                                    lc.getDouble(15),
                                    lc.getDouble(16),
                                    ""
                            );
                            if (hasTable(db, "remote_locked_media") && dKey != null && !dKey.isEmpty()) {
                                try (Cursor rc = db.rawQuery("SELECT 1 FROM remote_locked_media WHERE dedup_key = ? LIMIT 1", new String[]{dKey})) {
                                    if (rc != null && rc.moveToFirst()) {
                                        lmi.isCloudBackedUp = true;
                                    }
                                } catch (Throwable ignored) {}
                            }
                            items.add(lmi);
                            seen.add(dKey);
                        }
                    }
                } catch (Throwable ignored) {}
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Error querying media items", t);
        } finally {
            if (db != null) {
                try { db.close(); } catch (Throwable ignored) {}
            }
        }
        Logger.printInfo(() -> "queryMedia finished: " + items.size() + " items returned (mediaType=" + crit.mediaType + ", source=" + crit.source + ")");
        return items;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Perceptual Hashing & Similarity Clustering
    // Uses dHash (difference hash) — robust to brightness/contrast/filter edits.
    // ─────────────────────────────────────────────────────────────────────────

    /**
     * Difference Hash (dHash) — 9×8 grid → 64 horizontal gradient bits.
     * Much more robust than aHash for filter-edited duplicates:
     * - Brightness/contrast changes → same gradient direction → same hash
     * - Color filters → grayscale conversion removes color → same hash
     * - Slight crops → most bits survive → high similarity
     * - Heavy crops or rotations → lower similarity (expected)
     */
    public static long calculateAverageHash(Bitmap bitmap, int hashSize) {
        return app.morphe.extension.shared.patches.toolkit.similarity.ImageSimilarityEngine.calculateDifferenceHash(bitmap, hashSize);
    }

    public static float calculateSimilarity(long hashA, long hashB, int hashSize) {
        return app.morphe.extension.shared.patches.toolkit.similarity.ImageSimilarityEngine.calculateSimilarity(hashA, hashB, hashSize);
    }

    public static List<List<MediaItem>> clusterSimilarItems(List<MediaItem> items, float threshold, int hashSize) {
        return app.morphe.extension.shared.patches.toolkit.similarity.ImageSimilarityEngine.clusterSimilarItems(items, threshold, hashSize);
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Action Execution Engine (Step 3: All 14 Actions)
    // ─────────────────────────────────────────────────────────────────────────
    public static class ActionResult {
        public final boolean success;
        public final int affectedCount;
        public final String message;

        public ActionResult(boolean success, int affectedCount, String message) {
            this.success = success;
            this.affectedCount = affectedCount;
            this.message = message;
        }
    }

    private static volatile Class<?> sAddMediaToAlbumBuilderClass = null;

    private static Class<?> resolveAddMediaToAlbumBuilderClass() {
        if (sAddMediaToAlbumBuilderClass != null) {
            return sAddMediaToAlbumBuilderClass;
        }
        try {
            Class<?> taskClass = ReflectionCache.findClass("com.google.android.apps.photos.album.tasks.AddMediaToAlbumTask");
            for (Constructor<?> c : taskClass.getDeclaredConstructors()) {
                Class<?>[] p = c.getParameterTypes();
                if (p.length == 1 && !p[0].equals(Object.class)) {
                    sAddMediaToAlbumBuilderClass = p[0];
                    return p[0];
                }
            }
        } catch (Throwable t) {
            Logger.printInfo(() -> "Could not resolve builder from AddMediaToAlbumTask: " + t.getMessage());
        }
        for (String name : ToolkitMappings.ADD_MEDIA_TO_ALBUM_BUILDER_CLASSES) {
            Class<?> found = ReflectionCache.findClassOrNull(name);
            if (found != null) {
                sAddMediaToAlbumBuilderClass = found;
                return found;
            }
        }
        return null;
    }

    private static volatile Method sTaskRunnerSyncMethod = null;
    private static volatile Method sTaskRunnerAsyncMethod = null;
    private static volatile boolean sTaskRunnerResolved = false;

    private static boolean tryBindTaskRunner(Class<?> clazz, Class<?> taskBase) {
        if (clazz == null) return false;
        Method syncM = null;
        Method asyncM = null;
        for (Method m : clazz.getMethods()) {
            if (java.lang.reflect.Modifier.isStatic(m.getModifiers())) {
                Class<?>[] p = m.getParameterTypes();
                if (p.length == 2 && Context.class.isAssignableFrom(p[0]) &&
                    (taskBase == null || p[1].isAssignableFrom(taskBase) || taskBase.isAssignableFrom(p[1]))) {
                    if (m.getReturnType() != void.class && syncM == null) {
                        m.setAccessible(true);
                        syncM = m;
                    } else if (m.getReturnType() == void.class && asyncM == null) {
                        m.setAccessible(true);
                        asyncM = m;
                    }
                }
            }
        }
        if (syncM != null) {
            sTaskRunnerSyncMethod = syncM;
            if (asyncM != null) {
                sTaskRunnerAsyncMethod = asyncM;
            }
            return true;
        }
        return false;
    }

    public static synchronized void resolveTaskRunner() {
        if (sTaskRunnerResolved && sTaskRunnerSyncMethod != null) return;
        sTaskRunnerResolved = true;
        try {
            Class<?> taskBase = null;
            try {
                taskBase = ReflectionCache.findClass("com.google.android.apps.photos.actionqueue.ActionWrapper").getSuperclass();
            } catch (Throwable ignored) {}

            for (String name : ToolkitMappings.TASK_RUNNER_CLASSES) {
                Class<?> clazz = ReflectionCache.findClassOrNull(name);
                if (clazz != null && tryBindTaskRunner(clazz, taskBase)) {
                    final String resolvedName = name;
                    Logger.printInfo(() -> "Resolved TaskRunner via candidate: " + resolvedName);
                    return;
                }
            }

            // Dynamic discovery via UpdateFolderStatusTask (references TaskRunner in static helper)
            try {
                Class<?> updateTask = ReflectionCache.findClassOrNull("com.google.android.apps.photos.folderstatus.mixin.UpdateFolderStatusTask");
                if (updateTask != null) {
                    for (Method m : updateTask.getDeclaredMethods()) {
                        if (java.lang.reflect.Modifier.isStatic(m.getModifiers())) {
                            Class<?>[] p = m.getParameterTypes();
                            if (p.length >= 1 && tryBindTaskRunner(p[0], taskBase)) {
                                Logger.printInfo(() -> "Dynamically resolved TaskRunner via UpdateFolderStatusTask: " + p[0].getName());
                                return;
                            }
                        }
                    }
                }
            } catch (Throwable tDyn) {
                Logger.printInfo(() -> "Dynamic TaskRunner discovery error: " + tDyn.getMessage());
            }

            // Dynamic discovery via AlbumActivity
            try {
                Class<?> albumAct = ReflectionCache.findClassOrNull("com.google.android.apps.photos.envelope.AlbumActivity");
                if (albumAct != null) {
                    for (Field f : albumAct.getDeclaredFields()) {
                        if (tryBindTaskRunner(f.getType(), taskBase)) {
                            Logger.printInfo(() -> "Dynamically resolved TaskRunner via AlbumActivity field " + f.getName() + ": " + f.getType().getName());
                            return;
                        }
                    }
                }
            } catch (Throwable ignored) {}
        } catch (Throwable t) {
            Logger.printException(() -> "Error resolving TaskRunner", t);
        }
    }

    public static Object runTaskSync(Context context, Object task) {
        if (context == null || task == null) return null;
        resolveTaskRunner();
        if (sTaskRunnerSyncMethod != null) {
            try {
                return sTaskRunnerSyncMethod.invoke(null, context, task);
            } catch (Throwable t) {
                Logger.printInfo(() -> "runTaskSync invoke error: " + t.getMessage());
            }
        }
        return null;
    }

    public static void runTaskAsync(Context context, Object task) {
        if (context == null || task == null) return;
        resolveTaskRunner();
        if (sTaskRunnerAsyncMethod != null) {
            try {
                sTaskRunnerAsyncMethod.invoke(null, context, task);
                return;
            } catch (Throwable t) {
                Logger.printInfo(() -> "runTaskAsync invoke error: " + t.getMessage());
            }
        }
        new Thread(() -> runTaskSync(context, task)).start();
    }

    public static int getTaskStatusCode(Object result) {
        if (result == null) return -1;
        try {
            Field f = result.getClass().getField("d");
            return f.getInt(result);
        } catch (Throwable t) {
            try {
                Method m = result.getClass().getMethod("e");
                boolean ok = (Boolean) m.invoke(result);
                return ok ? 200 : 500;
            } catch (Throwable ignored) {}
        }
        return -1;
    }

    public static Bundle getTaskResultBundle(Object result) {
        if (result == null) return null;
        try {
            Method m = result.getClass().getMethod("b");
            return (Bundle) m.invoke(result);
        } catch (Throwable ignored) {}
        return null;
    }

    public static Object getServiceLocator(Context context, Class<?> serviceClass) {
        if (context == null || serviceClass == null) return null;
        for (String slName : ToolkitMappings.SERVICE_LOCATOR_CLASSES) {
            try {
                Class<?> slClass = ReflectionCache.findClassOrNull(slName);
                if (slClass != null) {
                    Method m = ReflectionCache.getMethod(slClass, ToolkitMappings.SERVICE_LOCATOR_METHOD, Context.class, Class.class);
                    if (m != null) {
                        Object res = m.invoke(null, context, serviceClass);
                        if (res != null) return res;
                    }
                }
            } catch (Throwable ignored) {}
        }
        return null;
    }

    public static void flushActionQueue(Context context, int accountId, long actionId) {
        if (context == null || actionId <= 0) return;
        for (String flusherName : ToolkitMappings.ACTION_FLUSHER_CLASSES) {
            try {
                Class<?> flusherClass = ReflectionCache.findClassOrNull(flusherName);
                if (flusherClass != null) {
                    Constructor<?> ctor = flusherClass.getConstructor(int.class, long.class);
                    Object inst = ctor.newInstance(accountId, actionId);
                    Method m = flusherClass.getMethod("a", Context.class);
                    m.invoke(inst, context);
                    Logger.printInfo(() -> "ActionQueue flushed via " + flusherName + " for actionId=" + actionId);
                    return;
                }
            } catch (Throwable ignored) {}
        }
    }

    public static Object resolveMediaKey(String key) {
        if (key == null) return null;
        try {
            Class<?> delTaskClass = ReflectionCache.findClass("com.google.android.apps.photos.album.removealbum.DeleteSharedCollectionTask");
            for (Constructor<?> c : delTaskClass.getConstructors()) {
                Class<?>[] pt = c.getParameterTypes();
                if (pt.length >= 2 && pt[0] == int.class) {
                    Class<?> keyClass = pt[1];
                    try {
                        Method aM = keyClass.getMethod("a", String.class);
                        return aM.invoke(null, key);
                    } catch (Throwable t) {
                        Constructor<?> keyCtor = keyClass.getConstructor(String.class);
                        return keyCtor.newInstance(key);
                    }
                }
            }
        } catch (Throwable t) {
            Logger.printInfo(() -> "resolveMediaKey error: " + t.getMessage());
        }
        for (String cName : new String[]{"ajzv", "ajxa", "akch", "ahnr"}) {
            Class<?> clazz = ReflectionCache.findClassOrNull(cName);
            if (clazz != null) {
                try {
                    Method aM = clazz.getMethod("a", String.class);
                    return aM.invoke(null, key);
                } catch (Throwable t) {
                    try {
                        Constructor<?> keyCtor = clazz.getConstructor(String.class);
                        return keyCtor.newInstance(key);
                    } catch (Throwable ignored) {}
                }
            }
        }
        return null;
    }

    public static String createNativeCloudAlbum(Context context, int accountId, String title, List<String> mediaKeys) {
        return createNativeCloudAlbum(context, accountId, title, mediaKeys, null);
    }

    public static String createNativeCloudAlbum(Context context, int accountId, String title, List<String> mediaKeys, int[] outAdded) {
        String createdKey = null;
        int totalAdded = 0;
        try {
            Logger.printInfo(() -> "Creating native cloud album: '" + title + "' for account " + accountId + " with " + (mediaKeys != null ? mediaKeys.size() : 0) + " items");

            // Method 1 (Primary): Create private personal album with title & media items via AddMediaToAlbumTask (single RPC!)
            try {
                Logger.printInfo(() -> "Attempting Method 1: AddMediaToAlbumTask for private album '" + title + "' with " + (mediaKeys != null ? mediaKeys.size() : 0) + " items");
                Class<?> builderClass = resolveAddMediaToAlbumBuilderClass();
                if (builderClass == null) {
                    throw new ClassNotFoundException("Could not find AddMediaToAlbumTask builder class");
                }
                Constructor<?> mqwCtor = null;
                for (Constructor<?> c : builderClass.getDeclaredConstructors()) {
                    Class<?>[] p = c.getParameterTypes();
                    if (p.length == 1 && (p[0] == int.class || p[0] == Integer.class || p[0] == Integer.TYPE)) {
                        mqwCtor = c;
                        break;
                    }
                }
                if (mqwCtor == null && builderClass.getDeclaredConstructors().length > 0) {
                    mqwCtor = builderClass.getDeclaredConstructors()[0];
                }
                if (mqwCtor == null) {
                    throw new NoSuchMethodException("No constructor found for builder " + builderClass.getName());
                }
                mqwCtor.setAccessible(true);
                Object builder = mqwCtor.newInstance(accountId);

                Field fC = null;
                try {
                    fC = builderClass.getField("c");
                } catch (Throwable t) {
                    fC = builderClass.getDeclaredField("c");
                }
                fC.setAccessible(true);
                fC.set(builder, title);

                if (mediaKeys != null && !mediaKeys.isEmpty()) {
                    Field fD = null;
                    try {
                        fD = builderClass.getField("d");
                    } catch (Throwable t) {
                        fD = builderClass.getDeclaredField("d");
                    }
                    fD.setAccessible(true);
                    fD.set(builder, mediaKeys);
                }

                Method aMethod = null;
                for (Method m : builderClass.getDeclaredMethods()) {
                    if (m.getReturnType().getName().contains("AddMediaToAlbumTask") && m.getParameterTypes().length == 0) {
                        aMethod = m;
                        break;
                    }
                }
                if (aMethod == null) {
                    aMethod = builderClass.getMethod("a");
                }
                aMethod.setAccessible(true);
                Object task = aMethod.invoke(builder);

                if (task != null) {
                    Object result = runTaskSync(context, task);

                    if (result != null) {
                        int statusCode = getTaskStatusCode(result);
                        Logger.printInfo(() -> "Method 1 AddMediaToAlbumTask status: " + statusCode);
                        if (statusCode == 200) {
                            Bundle bundle = getTaskResultBundle(result);
                            if (bundle != null) {
                                createdKey = bundle.getString("album_media_key");
                                int added = bundle.getInt("num_added", mediaKeys != null ? mediaKeys.size() : 0);
                                totalAdded = added;
                            }
                            if (createdKey != null && !createdKey.isEmpty()) {
                                final String finalKey = createdKey;
                                final int finalAdded = totalAdded;
                                Logger.printInfo(() -> "Method 1 created private album successfully! Key: " + finalKey + ", added: " + finalAdded);
                                if (outAdded != null && outAdded.length > 0) {
                                    outAdded[0] = totalAdded;
                                }
                                triggerOnlineSync(context, accountId);
                                notifyUiChanges(context, accountId);
                                return createdKey;
                            }
                        } else {
                            try {
                                Object exc = result.getClass().getField("e").get(result);
                                String msg = (String) result.getClass().getField("f").get(result);
                                Logger.printInfo(() -> "Method 1 AddMediaToAlbumTask error: status=" + statusCode + ", msg=" + msg + ", exc=" + exc);
                            } catch (Throwable ignored) {}
                        }
                    } else {
                        Logger.printInfo(() -> "Method 1 AddMediaToAlbumTask: runTaskSync returned null");
                    }
                } else {
                    Logger.printInfo(() -> "Method 1 AddMediaToAlbumTask: builder.a() returned null");
                }
            } catch (Throwable tMethod1) {
                Logger.printException(() -> "Method 1 AddMediaToAlbumTask failed, falling back to Method 2", tMethod1);
            }

            // Method 2 (Fallback): Create Envelope via adwr (Shared Album fallback)

            // Method B (Fallback): Create empty envelope, then add items via AddMediaToEnvelopeTask
            if (createdKey == null || createdKey.isEmpty()) {
                try {
                    Class<?> bemfClass = ReflectionCache.findClassOrNull("bemf");
                    if (bemfClass != null) {
                        Constructor<?> bemfCtor = null;
                        try {
                            bemfCtor = bemfClass.getConstructor(long.class);
                        } catch (Throwable ignored) {}
                        if (bemfCtor != null) {
                            Object builder = bemfCtor.newInstance(System.currentTimeMillis());

                            Field fX = bemfClass.getField("x");
                            fX.setInt(builder, 4); // 4 = ENVELOPE_TYPE_ALBUM_EMPTY (required by adwr.e)

                        Field fG = bemfClass.getField("g");
                        fG.set(builder, title);
                        try {
                            Field fR = bemfClass.getField("r");
                            fR.setBoolean(builder, title != null && !title.isEmpty());
                        } catch (Throwable ignored) {}

                        Class<?> bemgClass = Class.forName("bemg");
                        Constructor<?> bemgCtor = bemgClass.getConstructor(bemfClass);
                        Object bemgObj = bemgCtor.newInstance(builder);

                        Class<?> ladwrClass = Class.forName("adwr");
                        Method dMethod = ladwrClass.getMethod("d", int.class, bemgClass);
                        Object task = dMethod.invoke(null, accountId, bemgObj);

                        if (task != null) {
                            Object result = runTaskSync(context, task);

                            if (result != null) {
                                int statusCode = getTaskStatusCode(result);
                                Logger.printInfo(() -> "Method B CreateEnvelopeTask status: " + statusCode);
                                Bundle bundle = getTaskResultBundle(result);
                                if (bundle != null) {
                                    createdKey = bundle.getString("envelope_media_key");
                                    if (createdKey == null || createdKey.isEmpty()) {
                                        Parcelable shareDetails = bundle.getParcelable("envelope_share_details");
                                        if (shareDetails != null) {
                                            createdKey = (String) Class.forName("bemk").getField("a").get(shareDetails);
                                        }
                                    }
                                }
                            }
                        }

                        if (createdKey != null && !createdKey.isEmpty()) {
                            final String keyB = createdKey;
                            Logger.printInfo(() -> "Method B created empty album. Key: " + keyB);
                            if (mediaKeys != null && !mediaKeys.isEmpty()) {
                                totalAdded = addMediaToCloudAlbum(context, accountId, createdKey, mediaKeys);
                            }
                        }
                        }
                    }
                } catch (Throwable tMethodB) {
                    Logger.printInfo(() -> "Method B CreateEnvelopeTask failed: " + tMethodB.getMessage());
                }
            }

            if (createdKey != null && !createdKey.isEmpty()) {
                final String finalKey = createdKey;
                // Set title online and locally across both methods
                if (title != null && !title.isEmpty()) {
                    setCloudAlbumTitle(context, accountId, finalKey, title);
                }
                if (outAdded != null && outAdded.length > 0) {
                    outAdded[0] = totalAdded;
                }
                triggerOnlineSync(context, accountId);
                notifyUiChanges(context, accountId);
                return createdKey;
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Error in createNativeCloudAlbum", t);
        }
        return null;
    }

    public static boolean setCloudAlbumTitle(Context context, int accountId, String envelopeMediaKey, String title) {
        if (context == null || envelopeMediaKey == null || envelopeMediaKey.isEmpty() || title == null || title.isEmpty()) {
            return false;
        }
        boolean ok = false;
        try {
            Logger.printInfo(() -> "Setting cloud album title: '" + title + "' for " + envelopeMediaKey + " (account " + accountId + ")");

            // 1. Online mutation via mbs (ChangeEnvTitleOptAction) + ActionWrapper
            // Note: mbw proto: c = collection_media_key, e = title, b = 7 (bitmask)
            try {
                Class<?> mbwClass = Class.forName("mbw");
                Constructor<?> mbwCtor = mbwClass.getDeclaredConstructor();
                mbwCtor.setAccessible(true);
                Object mbwObj = mbwCtor.newInstance();

                Field fC = mbwClass.getField("c");
                fC.set(mbwObj, envelopeMediaKey);

                Field fE = mbwClass.getField("e");
                fE.set(mbwObj, title);

                Field fB = mbwClass.getField("b");
                fB.setInt(mbwObj, 7); // bitmask for title present

                Class<?> mbsClass = Class.forName("mbs");
                Constructor<?> mbsCtor = mbsClass.getDeclaredConstructor(Context.class, int.class, mbwClass);
                mbsCtor.setAccessible(true);
                Object mbsAction = mbsCtor.newInstance(context, accountId, mbwObj);

                Class<?> wrapperClass = Class.forName("com.google.android.apps.photos.actionqueue.ActionWrapper");
                Class<?> ltyClass = Class.forName("lty");
                Constructor<?> wrapperCtor = wrapperClass.getConstructor(int.class, ltyClass);
                Object actionWrapper = wrapperCtor.newInstance(accountId, mbsAction);

                Object res = runTaskSync(context, actionWrapper);

                if (res != null) {
                    Bundle bundle = getTaskResultBundle(res);
                    long actionId = bundle != null ? bundle.getLong("LocalResult__action_id", -1L) : -1L;
                    if (actionId != -1L) {
                        flushActionQueue(context, accountId, actionId);
                        ok = true;
                    }
                }
            } catch (Throwable tOpt) {
                Logger.printInfo(() -> "mbs title action failed: " + tOpt.getMessage());
            }

            // Direct online RPC via mms (EditEnvelope) for instant server persistence
            try {
                Class<?> ahnvClass = Class.forName("ahnv");
                Method aM = ahnvClass.getMethod("a", String.class);
                Object ahnvInst = aM.invoke(null, envelopeMediaKey);

                Class<?> mmsClass = Class.forName("mms");
                Constructor<?> mmsCtor = mmsClass.getConstructor(ahnvClass, String.class, int.class);
                Object mmsRpc = mmsCtor.newInstance(ahnvInst, title, 2);

                Class<?> cetrClass = Class.forName("cetr");
                Object cetrInst = getServiceLocator(context, cetrClass);
                if (cetrInst != null) {
                    Class<?> ceupClass = Class.forName("ceup");
                    Method bMethod = cetrClass.getMethod("b", Integer.class, ceupClass);
                    bMethod.invoke(cetrInst, accountId, mmsRpc);
                    Logger.printInfo(() -> "Directly sent EditEnvelope (mms) RPC for title update!");
                    ok = true;
                }
            } catch (Throwable tRpc) {
                Logger.printInfo(() -> "Direct mms RPC failed: " + tRpc.getMessage());
            }

            // 2. Local SQLite write in WAL mode as immediate safety net
            try {
                File f = context.getDatabasePath("gphotos" + accountId + ".db");
                if (f != null && f.exists()) {
                    try (SQLiteDatabase db = SQLiteDatabase.openDatabase(f.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING)) {
                        ContentValues cv = new ContentValues();
                        cv.put("title", title);
                        if (hasTable(db, "envelopes")) {
                            int envRows = db.update("envelopes", cv, "media_key = ?", new String[]{envelopeMediaKey});
                            Logger.printInfo(() -> "Directly updated envelopes title rows: " + envRows);
                            if (envRows > 0) ok = true;
                        }
                        if (hasTable(db, "collections")) {
                            int colRows = db.update("collections", cv, "associated_envelope_media_key = ? OR collection_media_key = ?", new String[]{envelopeMediaKey, envelopeMediaKey});
                            Logger.printInfo(() -> "Directly updated collections title rows: " + colRows);
                            if (colRows > 0) ok = true;
                        }
                    }
                }
            } catch (Throwable tDb) {
                Logger.printInfo(() -> "Direct db title write failed: " + tDb.getMessage());
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Error in setCloudAlbumTitle", t);
        }
        return ok;
    }

    public static int addMediaToCloudAlbum(Context context, int accountId, String envelopeMediaKey, List<String> mediaKeys) {
        if (context == null || envelopeMediaKey == null || envelopeMediaKey.isEmpty() || mediaKeys == null || mediaKeys.isEmpty()) {
            return 0;
        }

        // 1. Check if target is a private personal album (collections table)
        boolean isPrivateCollection = false;
        try {
            File f = context.getDatabasePath("gphotos" + accountId + ".db");
            if (f != null && f.exists()) {
                try (SQLiteDatabase db = SQLiteDatabase.openDatabase(f.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING)) {
                    if (hasTable(db, "collections")) {
                        try (Cursor c = db.rawQuery("SELECT 1 FROM collections WHERE collection_media_key = ? LIMIT 1", new String[]{envelopeMediaKey})) {
                            if (c != null && c.moveToFirst()) {
                                isPrivateCollection = true;
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}

        if (isPrivateCollection) {
            try {
                Logger.printInfo(() -> "Adding " + mediaKeys.size() + " items to private collection " + envelopeMediaKey + " via AddMediaToAlbumTask");
                Class<?> builderClass = resolveAddMediaToAlbumBuilderClass();
                if (builderClass == null) {
                    throw new ClassNotFoundException("Could not find AddMediaToAlbumTask builder class");
                }
                Constructor<?> mqwCtor = null;
                for (Constructor<?> c : builderClass.getDeclaredConstructors()) {
                    Class<?>[] p = c.getParameterTypes();
                    if (p.length == 1 && (p[0] == int.class || p[0] == Integer.class || p[0] == Integer.TYPE)) {
                        mqwCtor = c;
                        break;
                    }
                }
                if (mqwCtor == null && builderClass.getDeclaredConstructors().length > 0) {
                    mqwCtor = builderClass.getDeclaredConstructors()[0];
                }
                if (mqwCtor == null) {
                    throw new NoSuchMethodException("No constructor found for builder " + builderClass.getName());
                }
                mqwCtor.setAccessible(true);
                Object builder = mqwCtor.newInstance(accountId);

                Field fB = null;
                try {
                    fB = builderClass.getField("b");
                } catch (Throwable t) {
                    fB = builderClass.getDeclaredField("b");
                }
                fB.setAccessible(true);
                fB.set(builder, envelopeMediaKey);

                Field fD = null;
                try {
                    fD = builderClass.getField("d");
                } catch (Throwable t) {
                    fD = builderClass.getDeclaredField("d");
                }
                fD.setAccessible(true);
                fD.set(builder, mediaKeys);

                Method aMethod = null;
                for (Method m : builderClass.getDeclaredMethods()) {
                    if (m.getReturnType().getName().contains("AddMediaToAlbumTask") && m.getParameterTypes().length == 0) {
                        aMethod = m;
                        break;
                    }
                }
                if (aMethod == null) {
                    aMethod = builderClass.getMethod("a");
                }
                aMethod.setAccessible(true);
                Object task = aMethod.invoke(builder);

                if (task != null) {
                    Object result = runTaskSync(context, task);

                    if (result != null) {
                        int statusCode = getTaskStatusCode(result);
                        Logger.printInfo(() -> "AddMediaToAlbumTask status: " + statusCode);
                        if (statusCode == 200) {
                            Bundle bundle = getTaskResultBundle(result);
                            int added = bundle != null ? bundle.getInt("num_added", mediaKeys.size()) : mediaKeys.size();
                            return added;
                        }
                    }
                }
            } catch (Throwable tCol) {
                Logger.printException(() -> "AddMediaToAlbumTask failed for collection, falling back to envelope chunking", tCol);
            }
        }

        // 2. Fallback: Envelope addition via AddMediaToEnvelopeTask
        int totalAdded = 0;
        int chunkSize = 100;
        for (int i = 0; i < mediaKeys.size(); i += chunkSize) {
            List<String> chunk = mediaKeys.subList(i, Math.min(i + chunkSize, mediaKeys.size()));
            try {
                Logger.printInfo(() -> "Adding chunk of " + chunk.size() + " items to cloud album " + envelopeMediaKey + " for account " + accountId);

                Class<?> lamwaClass = null;
                for (String name : ToolkitMappings.ADD_MEDIA_TO_ENVELOPE_BUILDER_CLASSES) {
                    lamwaClass = ReflectionCache.findClassOrNull(name);
                    if (lamwaClass != null) break;
                }
                if (lamwaClass == null) {
                    throw new ClassNotFoundException("AddMediaToEnvelopeTask builder not found");
                }
                Constructor<?> lamwaCtor = null;
                for (Constructor<?> c : lamwaClass.getDeclaredConstructors()) {
                    if (c.getParameterTypes().length == 1) {
                        lamwaCtor = c;
                        break;
                    }
                }
                if (lamwaCtor == null) {
                    lamwaCtor = lamwaClass.getConstructor(byte[].class);
                }
                lamwaCtor.setAccessible(true);
                Object builder = lamwaCtor.newInstance(new Object[]{null});

                Field fA = lamwaClass.getField("a");
                fA.setInt(builder, accountId);

                Field fG = lamwaClass.getField("g");
                fG.set(builder, envelopeMediaKey);

                Field fH = lamwaClass.getField("h");
                fH.set(builder, chunk);

                try {
                    Field fD = lamwaClass.getField("d");
                    fD.set(builder, Collections.emptyMap());
                } catch (Throwable ignored) {}

                Method dMethod = lamwaClass.getMethod("d");
                Object task = dMethod.invoke(builder);

                if (task != null) {
                    Object result = runTaskSync(context, task);

                    if (result != null) {
                        int statusCode = getTaskStatusCode(result);
                        Logger.printInfo(() -> "AddMediaToEnvelopeTask chunk status code: " + statusCode);
                        if (statusCode == 200) {
                            Bundle bundle = getTaskResultBundle(result);
                            int added = bundle != null ? bundle.getInt("added_media_count", chunk.size()) : chunk.size();
                            totalAdded += added;
                        } else {
                            try {
                                Object exc = result.getClass().getField("e").get(result);
                                String msg = (String) result.getClass().getField("f").get(result);
                                Logger.printInfo(() -> "AddMediaToEnvelopeTask error status: " + statusCode + ", msg: " + msg + ", exc: " + exc);
                            } catch (Throwable ignored) {}
                            if (chunk.size() > 1) {
                                Logger.printInfo(() -> "Chunk of " + chunk.size() + " items failed, splitting into halves...");
                                int mid = chunk.size() / 2;
                                totalAdded += addMediaToCloudAlbum(context, accountId, envelopeMediaKey, chunk.subList(0, mid));
                                totalAdded += addMediaToCloudAlbum(context, accountId, envelopeMediaKey, chunk.subList(mid, chunk.size()));
                            }
                        }
                    }
                }
            } catch (Throwable t) {
                Logger.printException(() -> "Error in addMediaToCloudAlbum chunk", t);
            }
        }
        final int finalTotal = totalAdded;
        Logger.printInfo(() -> "Finished adding to cloud album. Total items added: " + finalTotal);
        return totalAdded;
    }

    public static boolean deleteCloudAlbum(Context context, int accountId, String albumMediaKey) {
        if (context == null || albumMediaKey == null || albumMediaKey.isEmpty()) return false;
        try {
            Logger.printInfo(() -> "Deleting cloud album: " + albumMediaKey + " for account " + accountId);

            Object optionalKey = resolveMediaKey(albumMediaKey);

            // Determine whether album is a shared envelope (envelopes table) or private album (collections table)
            boolean isSharedEnvelope = false;
            boolean isOwner = true;
            try {
                File f = context.getDatabasePath("gphotos" + accountId + ".db");
                if (f != null && f.exists()) {
                    SQLiteDatabase checkDb = SQLiteDatabase.openDatabase(f.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
                    try (Cursor c = checkDb.rawQuery("SELECT owner_actor_id, viewer_actor_id FROM envelopes WHERE media_key = ? LIMIT 1", new String[]{albumMediaKey})) {
                        if (c != null && c.moveToFirst()) {
                            isSharedEnvelope = true;
                            String owner = c.getString(0);
                            String viewer = c.getString(1);
                            if (owner != null && viewer != null) {
                                isOwner = owner.equals(viewer);
                            }
                        }
                    } catch (Throwable ignored) {}
                    try { checkDb.close(); } catch (Throwable ignored) {}
                }
            } catch (Throwable ignored) {}

            boolean success = false;
            if (isSharedEnvelope && optionalKey != null) {
                // 1. Shared Envelope: invoke official DeleteSharedCollectionTask synchronously
                // Constructor: DeleteSharedCollectionTask(int accountId, collectionMediaKey, boolean isLeave, boolean isDelete)
                try {
                    boolean isLeave = !isOwner;
                    boolean isDelete = isOwner;
                    Class<?> delTaskClass = Class.forName("com.google.android.apps.photos.album.removealbum.DeleteSharedCollectionTask");
                    Constructor<?> delCtor = delTaskClass.getConstructors()[0];
                    Object delTask = delCtor.newInstance(accountId, optionalKey, isLeave, isDelete);
                    Object res = runTaskSync(context, delTask);
                    if (res != null) {
                        int statusCode = getTaskStatusCode(res);
                        Logger.printInfo(() -> "DeleteSharedCollectionTask synchronous result status: " + statusCode);
                        if (statusCode == 200) success = true;
                    }
                    final boolean fSuccess = success;
                    Logger.printInfo(() -> "Dispatched DeleteSharedCollectionTask for " + albumMediaKey + " (isLeave=" + isLeave + ", isDelete=" + isDelete + "), success=" + fSuccess);
                } catch (Throwable tDel) {
                    Logger.printException(() -> "Error calling DeleteSharedCollectionTask", tDel);
                }
            } else {
                // 2. Private Album: invoke RemoteOptimisticallyDeleteCollectionTask synchronously
                try {
                    Class<?> removeTaskClass = Class.forName("com.google.android.apps.photos.album.removealbum.RemoteOptimisticallyDeleteCollectionTask");
                    Constructor<?> removeCtor = removeTaskClass.getConstructor(int.class, String.class);
                    Object removeTask = removeCtor.newInstance(accountId, albumMediaKey);
                    Object res = runTaskSync(context, removeTask);
                    if (res != null) {
                        int statusCode = getTaskStatusCode(res);
                        Logger.printInfo(() -> "RemoteOptimisticallyDeleteCollectionTask status: " + statusCode);
                        if (statusCode == 200) success = true;
                    }
                } catch (Throwable tRemove) {
                    Logger.printException(() -> "Error calling RemoteOptimisticallyDeleteCollectionTask", tRemove);
                }
            }

            // 3. Local SQLite cleanup: purge local album records so the UI immediately drops the album
            try {
                File dbf = context.getDatabasePath("gphotos" + accountId + ".db");
                if (dbf != null && dbf.exists()) {
                    SQLiteDatabase localDb = SQLiteDatabase.openDatabase(dbf.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
                    try {
                        localDb.delete("collections", "collection_media_key = ?", new String[]{albumMediaKey});
                        localDb.delete("envelopes", "media_key = ?", new String[]{albumMediaKey});
                        ContentValues nullCv = new ContentValues();
                        nullCv.putNull("collection_id");
                        localDb.update("remote_media", nullCv, "collection_id = ?", new String[]{albumMediaKey});
                        localDb.update("shared_media", nullCv, "collection_id = ?", new String[]{albumMediaKey});
                        success = true;
                    } finally {
                        localDb.close();
                    }
                }
            } catch (Throwable tDb) {
                Logger.printException(() -> "Error cleaning up local album SQLite rows", tDb);
            }

            return success;
        } catch (Throwable t) {
            Logger.printException(() -> "Error in deleteCloudAlbum", t);
        }
        return false;
    }

    private static List<String> resolveRemoteMediaKeys(Context context, int accountId, List<MediaItem> items) {
        Set<String> mediaKeys = new LinkedHashSet<>();
        if (items == null || items.isEmpty()) return new ArrayList<>(mediaKeys);

        SQLiteDatabase db = null;
        try {
            File f = context != null ? context.getDatabasePath("gphotos" + accountId + ".db") : null;
            if (f != null && f.exists()) {
                db = SQLiteDatabase.openDatabase(f.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
            }
        } catch (Throwable ignored) {}

        for (MediaItem it : items) {
            String remoteKey = null;

            // 1. Look up remote_media table first by dedupKey (guaranteed backed-up cloud photos)
            if (db != null && it.dedupKey != null && !it.dedupKey.trim().isEmpty() && hasTable(db, "remote_media")) {
                String orderClause = hasTable(db, "collections")
                        ? "ORDER BY (collection_id IN (SELECT collection_media_key FROM collections)) ASC, is_canonical DESC LIMIT 1"
                        : "ORDER BY is_canonical DESC LIMIT 1";
                try (Cursor c = db.rawQuery("SELECT COALESCE(NULLIF(remote_media_key, ''), media_key) FROM remote_media WHERE dedup_key = ? " + orderClause, new String[]{it.dedupKey})) {
                    if (c != null && c.moveToFirst()) {
                        String rk = c.getString(0);
                        if (rk != null && !rk.trim().isEmpty() && !rk.startsWith("local:")) {
                            remoteKey = rk.trim();
                        }
                    }
                } catch (Throwable ignored) {}
            }

            // 2. Look up media table for canonical_media_key if not found yet
            if (remoteKey == null && db != null && it.dedupKey != null && !it.dedupKey.trim().isEmpty() && hasTable(db, "media") && hasColumn(db, "media", "canonical_media_key")) {
                try (Cursor c = db.rawQuery("SELECT canonical_media_key FROM media WHERE dedup_key = ? AND canonical_media_key IS NOT NULL AND canonical_media_key != '' AND canonical_media_key NOT LIKE 'local:%' LIMIT 1", new String[]{it.dedupKey})) {
                    if (c != null && c.moveToFirst()) {
                        String rk = c.getString(0);
                        if (rk != null && !rk.trim().isEmpty()) {
                            remoteKey = rk.trim();
                        }
                    }
                } catch (Throwable ignored) {}
            }

            // 3. Look up shared_media table if not found yet
            if (remoteKey == null && db != null && it.dedupKey != null && !it.dedupKey.trim().isEmpty() && hasTable(db, "shared_media")) {
                try (Cursor c = db.rawQuery("SELECT remote_media_key FROM shared_media WHERE dedup_key = ? AND remote_media_key IS NOT NULL AND remote_media_key != '' AND remote_media_key NOT LIKE 'local:%' LIMIT 1", new String[]{it.dedupKey})) {
                    if (c != null && c.moveToFirst()) {
                        String rk = c.getString(0);
                        if (rk != null && !rk.trim().isEmpty()) {
                            remoteKey = rk.trim();
                        }
                    }
                } catch (Throwable ignored) {}
            }

            // 4. Look up remote_locked_media table if not found yet
            if (remoteKey == null && db != null && it.dedupKey != null && !it.dedupKey.trim().isEmpty() && hasTable(db, "remote_locked_media")) {
                try (Cursor c = db.rawQuery("SELECT COALESCE(NULLIF(remote_media_key, ''), media_key) FROM remote_locked_media WHERE dedup_key = ? LIMIT 1", new String[]{it.dedupKey})) {
                    if (c != null && c.moveToFirst()) {
                        String rk = c.getString(0);
                        if (rk != null && !rk.trim().isEmpty() && !rk.startsWith("local:")) {
                            remoteKey = rk.trim();
                        }
                    }
                } catch (Throwable ignored) {}
            }

            // 5. Fallback: only if item.mediaKey exists, is not local, AND is verified present in remote_media or remote_locked_media
            if (remoteKey == null && it.mediaKey != null && !it.mediaKey.trim().isEmpty() && !it.mediaKey.startsWith("local:")) {
                if (db != null) {
                    try {
                        String checkSql = (hasTable(db, "remote_media") && hasTable(db, "remote_locked_media"))
                                ? "SELECT 1 FROM remote_media WHERE media_key = ? OR remote_media_key = ? UNION SELECT 1 FROM remote_locked_media WHERE media_key = ? OR remote_media_key = ? LIMIT 1"
                                : (hasTable(db, "remote_media") ? "SELECT 1 FROM remote_media WHERE media_key = ? OR remote_media_key = ? LIMIT 1" : "SELECT 1 FROM remote_locked_media WHERE media_key = ? OR remote_media_key = ? LIMIT 1");
                        String[] checkArgs = (hasTable(db, "remote_media") && hasTable(db, "remote_locked_media"))
                                ? new String[]{it.mediaKey, it.mediaKey, it.mediaKey, it.mediaKey}
                                : new String[]{it.mediaKey, it.mediaKey};
                        try (Cursor c = db.rawQuery(checkSql, checkArgs)) {
                            if (c != null && c.moveToFirst()) {
                                remoteKey = it.mediaKey.trim();
                            }
                        }
                    } catch (Throwable ignored) {}
                }
            }

            if (remoteKey != null && !remoteKey.isEmpty()) {
                mediaKeys.add(remoteKey);
            }
        }

        if (db != null) {
            try { db.close(); } catch (Throwable ignored) {}
        }
        return new ArrayList<>(mediaKeys);
    }

    private static List<String> resolveRemoteMediaKeys(AccountInfo account, List<MediaItem> items) {
        if (items == null || items.isEmpty()) return new ArrayList<>();
        Context ctx = app.morphe.extension.shared.Utils.getContext();
        int accId = account != null ? account.accountId : 0;
        return resolveRemoteMediaKeys(ctx, accId, items);
    }

    private static Object createMediaCollectionForKeys(int accountId, List<String> mediaKeys) {
        if (mediaKeys == null || mediaKeys.isEmpty()) return null;
        // 1. Static factory f(int accountId, List mediaKeys)
        for (String[] pair : ToolkitMappings.KEYS_COLLECTION_FACTORIES) {
            try {
                Class<?> clazz = ReflectionCache.findClassOrNull(pair[0]);
                if (clazz != null) {
                    Method m = ReflectionCache.getMethodOrNull(clazz, pair[1], int.class, List.class);
                    if (m != null) {
                        return m.invoke(null, accountId, mediaKeys);
                    }
                }
            } catch (Throwable ignored) {}
        }

        // 2. Builder classes
        for (String bName : ToolkitMappings.KEYS_COLLECTION_BUILDERS) {
            try {
                Class<?> bClass = ReflectionCache.findClassOrNull(bName);
                if (bClass != null) {
                    Object builder = bClass.getConstructor().newInstance();
                    bClass.getField("a").setInt(builder, accountId);
                    bClass.getField("b").set(builder, mediaKeys);
                    bClass.getField("d").setBoolean(builder, true);
                    bClass.getField("e").setBoolean(builder, true);
                    Method buildMethod = bClass.getMethod("a");
                    return buildMethod.invoke(builder);
                }
            } catch (Throwable ignored) {}
        }
        return null;
    }

    private static volatile Class<?> sCoreMediaLoaderClass = null;
    private static volatile Object sDefaultFeaturesRequest = null;
    private static volatile boolean sCoreLoaderResolved = false;

    private static boolean isValidCoreLoader(Class<?> c) {
        if (c == null) return false;
        for (Method m : c.getMethods()) {
            if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) &&
                List.class.isAssignableFrom(m.getReturnType()) &&
                m.getParameterCount() >= 2 &&
                m.getParameterTypes()[0] == Context.class) {
                return true;
            }
        }
        return false;
    }

    private static synchronized void resolveCoreLoader() {
        if (sCoreLoaderResolved) return;
        for (String name : ToolkitMappings.CORE_MEDIA_LOADER_CLASSES) {
            Class<?> c = ReflectionCache.findClassOrNull(name);
            if (c != null && isValidCoreLoader(c)) {
                sCoreMediaLoaderClass = c;
                Logger.printInfo(() -> "Resolved sCoreMediaLoaderClass via: " + name);
                break;
            }
        }

        if (sCoreMediaLoaderClass != null) {
            for (Method m : sCoreMediaLoaderClass.getMethods()) {
                if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) &&
                    List.class.isAssignableFrom(m.getReturnType()) &&
                    m.getParameterCount() >= 3 &&
                    m.getParameterTypes()[0] == Context.class) {
                    Class<?> pClass = m.getParameterTypes()[2];
                    try {
                        Field f = pClass.getField("a");
                        Object val = f.get(null);
                        if (val != null) {
                            sDefaultFeaturesRequest = val;
                            Logger.printInfo(() -> "Resolved sDefaultFeaturesRequest via loader parameter: " + pClass.getName());
                            break;
                        }
                    } catch (Throwable ignored) {}
                }
            }
        }

        if (sDefaultFeaturesRequest == null) {
            for (String name : new String[]{"ytc", "yyr", "wqb", "yvp"}) {
                Class<?> c = ReflectionCache.findClassOrNull(name);
                if (c != null && android.os.Parcelable.class.isAssignableFrom(c)) {
                    try {
                        Field f = c.getField("a");
                        Object val = f.get(null);
                        if (val != null) {
                            sDefaultFeaturesRequest = val;
                            Logger.printInfo(() -> "Resolved sDefaultFeaturesRequest via candidate: " + name);
                            break;
                        }
                    } catch (Throwable ignored) {}
                }
            }
        }
        sCoreLoaderResolved = true;
    }

    private static List<?> loadMediaCollection(Context context, Object mediaCollection) {
        if (context == null || mediaCollection == null) return Collections.emptyList();
        resolveCoreLoader();
        Class<?> loaderClass = sCoreMediaLoaderClass;
        Object featuresRequest = sDefaultFeaturesRequest;

        if (loaderClass != null) {
            // 1. Try 3-arg static method: (Context, MediaCollection, FeaturesRequest) -> List
            if (featuresRequest != null) {
                for (Method m : loaderClass.getMethods()) {
                    if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) &&
                        List.class.isAssignableFrom(m.getReturnType()) &&
                        m.getParameterCount() == 3 &&
                        m.getParameterTypes()[0] == Context.class &&
                        m.getParameterTypes()[1].isAssignableFrom(mediaCollection.getClass()) &&
                        m.getParameterTypes()[2].isAssignableFrom(featuresRequest.getClass())) {
                        try {
                            List<?> res = (List<?>) m.invoke(null, context, mediaCollection, featuresRequest);
                            if (res != null) return res;
                        } catch (Throwable t) {
                            Logger.printInfo(() -> "3-arg loader invocation error: " + t.getMessage());
                        }
                    }
                }
            }
            // 2. Try any static method on loader taking (Context, MediaCollection, ...)
            for (Method m : loaderClass.getMethods()) {
                if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) &&
                    List.class.isAssignableFrom(m.getReturnType()) &&
                    m.getParameterCount() >= 2 &&
                    m.getParameterTypes()[0] == Context.class &&
                    m.getParameterTypes()[1].isAssignableFrom(mediaCollection.getClass())) {
                    try {
                        Object[] args = new Object[m.getParameterCount()];
                        args[0] = context;
                        args[1] = mediaCollection;
                        for (int i = 2; i < args.length; i++) {
                            Class<?> pClass = m.getParameterTypes()[i];
                            if (featuresRequest != null && pClass.isAssignableFrom(featuresRequest.getClass())) {
                                args[i] = featuresRequest;
                            } else {
                                try {
                                    Field fa = pClass.getField("a");
                                    args[i] = fa.get(null);
                                } catch (Throwable ignored) {}
                            }
                        }
                        List<?> res = (List<?>) m.invoke(null, args);
                        if (res != null) return res;
                    } catch (Throwable ignored) {}
                }
            }
        }
        return Collections.emptyList();
    }

    private static Object buildCoreFeaturesRequest(Context context) {
        try {
            Class<?> wqaClass = null;
            Class<?> wqbClass = null;
            for (String[] pair : ToolkitMappings.FEATURES_REQUEST_PAIRS) {
                Class<?> b = ReflectionCache.findClassOrNull(pair[0]);
                Class<?> r = ReflectionCache.findClassOrNull(pair[1]);
                if (b != null && r != null) {
                    wqaClass = b;
                    wqbClass = r;
                    break;
                }
            }
            if (wqaClass == null || wqbClass == null) {
                return sDefaultFeaturesRequest;
            }
            Constructor<?> wqaCtor = wqaClass.getConstructor(boolean.class);
            Object builder = wqaCtor.newInstance(true);
            Method dMethod = wqaClass.getMethod("d", wqbClass);

            // Add DedupKeyFeature and RemoteMediaKeyFeature directly to builder
            try {
                Method bMethod = wqaClass.getMethod("b", Class.class);
                for (String featName : ToolkitMappings.DEDUP_KEY_FEATURE_CLASSES) {
                    Class<?> fc = ReflectionCache.findClassOrNull(featName);
                    if (fc != null) {
                        bMethod.invoke(builder, fc);
                        break;
                    }
                }
                for (String featName : ToolkitMappings.REMOTE_MEDIA_KEY_FEATURE_CLASSES) {
                    Class<?> fc = ReflectionCache.findClassOrNull(featName);
                    if (fc != null) {
                        bMethod.invoke(builder, fc);
                        break;
                    }
                }
            } catch (Throwable tFeat) {
                Logger.printInfo(() -> "Could not add direct feature classes: " + tFeat.getMessage());
            }

            // 1. Core Trash Features: neb.a (contains zon, bams, Axdq, Laflw)
            try {
                Class<?> nebClass = Class.forName("neb");
                Field f = nebClass.getField("a");
                Object fVal = f.get(null);
                if (fVal != null) dMethod.invoke(builder, fVal);
            } catch (Throwable t) {
                Logger.printInfo(() -> "neb.a not resolved: " + t.getMessage());
            }

            // 2. Favorites Features: FavoritesTask.c (contains bfwt, bfwu, Axdq, bams)
            try {
                Class<?> favClass = Class.forName("com.google.android.apps.photos.favorites.FavoritesTask");
                Field f = favClass.getDeclaredField("c");
                f.setAccessible(true);
                Object fVal = f.get(null);
                if (fVal != null) dMethod.invoke(builder, fVal);
            } catch (Throwable t) {
                Logger.printInfo(() -> "FavoritesTask.c not resolved: " + t.getMessage());
            }

            // 3. Restore Features: bjiq.a (contains bams, zon)
            try {
                Class<?> bjiqClass = Class.forName("bjiq");
                Field f = bjiqClass.getField("a");
                Object fVal = f.get(null);
                if (fVal != null) dMethod.invoke(builder, fVal);
            } catch (Throwable t) {
                Logger.printInfo(() -> "bjiq.a not resolved: " + t.getMessage());
            }

            // 4. Delete Label features: out.a(context)
            if (context != null) {
                try {
                    Class<?> outClass = Class.forName("out");
                    Method aMethod = outClass.getMethod("a", Context.class);
                    Object outVal = aMethod.invoke(null, context);
                    if (outVal != null) dMethod.invoke(builder, outVal);
                } catch (Throwable t) {
                    Logger.printInfo(() -> "out.a not resolved: " + t.getMessage());
                }
            }

            // 5. Archive Features
            for (String psuCandidate : ToolkitMappings.ARCHIVE_SERVICE_CLASSES) {
                try {
                    Class<?> psuClass = Class.forName(psuCandidate);
                    Field f = psuClass.getField("a");
                    Object fVal = f.get(null);
                    if (fVal != null) {
                        dMethod.invoke(builder, fVal);
                        break;
                    }
                } catch (Throwable ignored) {}
            }

            // 6. Core Mars Features: ajbk.b (contains bams, Lakka, Laflw, Lrkz, Lzon, Lankt)
            try {
                Class<?> ajbkClass = Class.forName("ajbk");
                Field f = ajbkClass.getField("b");
                Object fVal = f.get(null);
                if (fVal != null) dMethod.invoke(builder, fVal);
            } catch (Throwable t) {
                Logger.printInfo(() -> "ajbk.b not resolved: " + t.getMessage());
            }

            Method aMethod = wqaClass.getMethod("a");
            return aMethod.invoke(builder);
        } catch (Throwable t) {
            Logger.printException(() -> "Error constructing composite FeaturesRequest", t);
            return sDefaultFeaturesRequest;
        }
    }

    private static Object createMediaCollectionForIds(int accountId, List<Long> mediaIds) {
        if (mediaIds == null || mediaIds.isEmpty()) return null;
        try {
            Class<?> ahnjClass = null;
            for (String name : new String[]{"ahnj", "ahed", "ahdy"}) {
                ahnjClass = ReflectionCache.findClassOrNull(name);
                if (ahnjClass != null) break;
            }
            List<Object> idList = new ArrayList<>(mediaIds.size());
            if (ahnjClass != null) {
                Constructor<?> ctor = ahnjClass.getConstructor(long.class);
                for (Long id : mediaIds) {
                    idList.add(ctor.newInstance(id));
                }
            } else {
                idList.addAll(mediaIds);
            }
            for (String name : new String[]{"pfr", "pda", "pgw", "nbw"}) {
                Class<?> collClass = ReflectionCache.findClassOrNull(name);
                if (collClass != null) {
                    try {
                        Constructor<?> ctor = collClass.getConstructor(int.class, List.class);
                        return ctor.newInstance(accountId, idList);
                    } catch (Throwable ignored) {}
                }
            }
        } catch (Throwable t) {
            Logger.printInfo(() -> "Error building media collection for ids: " + t.getMessage());
        }
        return null;
    }

    private static List<Long> resolveMediaIds(Context context, int accountId, List<MediaItem> items) {
        List<Long> ids = new ArrayList<>();
        if (items == null || items.isEmpty()) return ids;
        File dbf = context != null ? context.getDatabasePath("gphotos" + accountId + ".db") : null;
        if (dbf == null || !dbf.exists()) return ids;
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(dbf.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING)) {
            String[] candidateTables = new String[]{"media", "account_local_locked_media", "remote_locked_media"};
            for (MediaItem it : items) {
                if (it.dedupKey == null || it.dedupKey.trim().isEmpty()) continue;
                for (String tbl : candidateTables) {
                    if (!hasTable(db, tbl)) continue;
                    try (Cursor c = db.rawQuery("SELECT _id FROM " + tbl + " WHERE dedup_key = ? LIMIT 1", new String[]{it.dedupKey.trim()})) {
                        if (c != null && c.moveToFirst()) {
                            ids.add(c.getLong(0));
                            break;
                        }
                    } catch (Throwable ignored) {}
                }
            }
        } catch (Throwable t) {
            Log.w("morphe: StorageScanner", "Error resolving media ids from database", t);
        }
        return ids;
    }

    private static List<?> loadCoreMediaItems(Context context, int accountId, List<MediaItem> items) {
        List<Object> result = new ArrayList<>();
        if (context == null || items == null || items.isEmpty()) return result;

        // Strategy 1: Remote media keys via dynamic KeysMediaCollection
        List<String> keys = resolveRemoteMediaKeys(context, accountId, items);
        if (!keys.isEmpty()) {
            int chunkSize = 100;
            for (int i = 0; i < keys.size(); i += chunkSize) {
                List<String> chunkKeys = keys.subList(i, Math.min(i + chunkSize, keys.size()));
                try {
                    Object mediaCollection = createMediaCollectionForKeys(accountId, chunkKeys);
                    if (mediaCollection == null) continue;
                    List<?> loaded = loadMediaCollection(context, mediaCollection);
                    if (loaded != null && !loaded.isEmpty()) {
                        result.addAll(loaded);
                    }
                } catch (Throwable t) {
                    Log.e("morphe: StorageScanner", "Error loading core media items chunk (" + chunkKeys.size() + " keys)", t);
                }
            }
        }

        // Strategy 2: For any local-only items or items not loaded by remote keys, load via MediaIdCollection
        if (result.size() < items.size()) {
            List<Long> mediaIds = resolveMediaIds(context, accountId, items);
            if (!mediaIds.isEmpty()) {
                int chunkSize = 100;
                for (int i = 0; i < mediaIds.size(); i += chunkSize) {
                    List<Long> chunkIds = mediaIds.subList(i, Math.min(i + chunkSize, mediaIds.size()));
                    try {
                        Object idCollection = createMediaCollectionForIds(accountId, chunkIds);
                        if (idCollection == null) continue;
                        List<?> loaded = loadMediaCollection(context, idCollection);
                        if (loaded != null && !loaded.isEmpty()) {
                            result.addAll(loaded);
                        }
                    } catch (Throwable t) {
                        Log.e("morphe: StorageScanner", "Error loading core media items by ID chunk (" + chunkIds.size() + " ids)", t);
                    }
                }
            }
        }

        Log.i("morphe: StorageScanner", "Loaded " + result.size() + " core media items for " + items.size() + " requested items");
        return result;
    }

    public static void syncPendingLocalTrash(Context context, int accountId) {
        if (context == null) return;
        new Thread(() -> {
            SQLiteDatabase db = null;
            try {
                File dbf = context.getDatabasePath("gphotos" + accountId + ".db");
                if (dbf == null || !dbf.exists()) {
                    List<AccountInfo> accounts = getAvailableAccounts(context);
                    for (AccountInfo a : accounts) {
                        if (a.accountId == accountId) {
                            dbf = new File(a.dbPath);
                            break;
                        }
                    }
                }
                if (dbf == null || !dbf.exists()) return;

                // Self-healing: clear trash_timestamp on items marked as archived
                try {
                    SQLiteDatabase healDb = SQLiteDatabase.openDatabase(dbf.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
                    try {
                        healDb.execSQL("UPDATE remote_media SET trash_timestamp = 0 WHERE is_archived = 1 AND trash_timestamp > 0;");
                        if (hasTable(healDb, "media")) {
                            healDb.execSQL("UPDATE media SET trash_timestamp = 0, is_deleted = 0 WHERE is_archived = 1 AND trash_timestamp > 0;");
                        }
                        // Keep all rows sharing the same dedup_key consistent with archived state
                        ensureArchiveSyncTriggers(healDb);
                        if (hasTable(healDb, "collections")) {
                            healDb.execSQL("UPDATE remote_media SET is_archived = 1 WHERE is_archived = 0 AND dedup_key IN (SELECT dedup_key FROM remote_media WHERE is_archived = 1 AND collection_id NOT IN (SELECT collection_media_key FROM collections));");
                            if (hasTable(healDb, "media")) {
                                healDb.execSQL("UPDATE media SET is_archived = 1 WHERE (is_archived IS NULL OR is_archived = 0) AND dedup_key IN (SELECT dedup_key FROM remote_media WHERE is_archived = 1 AND collection_id NOT IN (SELECT collection_media_key FROM collections));");
                            }
                        } else {
                            healDb.execSQL("UPDATE remote_media SET is_archived = 1 WHERE is_archived = 0 AND dedup_key IN (SELECT dedup_key FROM remote_media WHERE is_archived = 1);");
                            if (hasTable(healDb, "media")) {
                                healDb.execSQL("UPDATE media SET is_archived = 1 WHERE (is_archived IS NULL OR is_archived = 0) AND dedup_key IN (SELECT dedup_key FROM remote_media WHERE is_archived = 1);");
                            }
                        }
                        // Self-healing: purge ghost local media rows from media table where local file no longer exists in local_media
                        if (hasTable(healDb, "media") && hasTable(healDb, "local_media")) {
                            healDb.execSQL("DELETE FROM media WHERE has_local = 1 AND dedup_key NOT IN (SELECT dedup_key FROM local_media);");
                            // Self-healing: resync in_camera_folder state from local_media to media table so non-camera items never linger in home feed
                            healDb.execSQL("UPDATE media SET in_camera_folder = (SELECT l.in_camera_folder FROM local_media l WHERE l.dedup_key = media.dedup_key) WHERE has_local = 1 AND dedup_key IN (SELECT dedup_key FROM local_media) AND in_camera_folder != (SELECT l.in_camera_folder FROM local_media l WHERE l.dedup_key = media.dedup_key);");
                        }
                    } finally {
                        healDb.close();
                    }
                } catch (Throwable tHeal) {
                    Logger.printInfo(() -> "Heal query skipped: " + tHeal.getMessage());
                }

                db = SQLiteDatabase.openDatabase(dbf.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
                if (!hasTable(db, "remote_media")) return;

                List<MediaItem> pendingItems = new ArrayList<>();
                String remoteKeyExpr = hasColumn(db, "remote_media", "remote_media_key") ? "COALESCE(NULLIF(remote_media_key, ''), media_key) AS media_key" : "media_key";
                String sql = "SELECT DISTINCT r.dedup_key, r.media_key, r.filename, r.size_bytes FROM (" +
                        "SELECT dedup_key, " + remoteKeyExpr + ", filename, size_bytes FROM remote_media WHERE (state = 2 OR (trash_timestamp IS NOT NULL AND trash_timestamp > 0)) AND (is_archived IS NULL OR is_archived = 0) " +
                        (hasTable(db, "media") ? "UNION SELECT dedup_key, '' AS media_key, '' as filename, 0 as size_bytes FROM media WHERE (is_deleted = 1 OR (trash_timestamp IS NOT NULL AND trash_timestamp > 0)) AND (is_archived IS NULL OR is_archived = 0)" : "") +
                        ") r LIMIT 500";
                try (Cursor c = db.rawQuery(sql, null)) {
                    while (c != null && c.moveToNext()) {
                        String dKey = c.getString(0);
                        String mKey = c.getString(1);
                        String fname = c.getString(2);
                        long sz = c.getLong(3);
                        if (dKey != null && !dKey.isEmpty()) {
                            pendingItems.add(new MediaItem(dKey, mKey, fname, sz, 0, 0, "", 1, 0, 0, 0, false, false, false, "", 0, 0, ""));
                        }
                    }
                }

                if (!pendingItems.isEmpty()) {
                    Logger.printInfo(() -> "syncPendingLocalTrash: Found " + pendingItems.size() + " locally trashed items pending cloud sync. Syncing...");
                    executeOnlineTrashTask(context, accountId, pendingItems);
                }
            } catch (Throwable t) {
                Logger.printException(() -> "Error in syncPendingLocalTrash", t);
            } finally {
                if (db != null) {
                    try { db.close(); } catch (Throwable ignored) {}
                }
            }
        }).start();
    }

    private static boolean executeOnlineTrashTask(Context context, int accountId, List<MediaItem> items) {
        if (context == null || items == null || items.isEmpty()) return false;
        Log.i("morphe: StorageScanner", "executeOnlineTrashTask: starting for " + items.size() + " items");

        int chunkSize = 100;
        int totalChunks = (items.size() + chunkSize - 1) / chunkSize;
        int successCount = 0;

        for (int i = 0; i < items.size(); i += chunkSize) {
            int chunkIndex = (i / chunkSize) + 1;
            List<MediaItem> chunk = items.subList(i, Math.min(i + chunkSize, items.size()));
            boolean chunkSuccess = false;

            // Strategy 1: MoveToTrashActionWrapper (Official TaskRunner task with akjz.b REMOTE_ONLY)
            try {
                List<?> coreItems = loadCoreMediaItems(context, accountId, chunk);
                if (!coreItems.isEmpty()) {
                    Class<?> wrapperClass = Class.forName("com.google.android.apps.photos.trash.MoveToTrashActionWrapper");
                    Constructor<?> wrapperCtor = wrapperClass.getConstructors()[0];
                    Class<?>[] pTypes = wrapperCtor.getParameterTypes();
                    Class<?> mediaGroupClass = pTypes[1];
                    Object mediaGroup = mediaGroupClass.getConstructor(Collection.class).newInstance(coreItems);

                    Class<?> targetModeClass = pTypes[2];
                    Object targetMode = targetModeClass.getField("b").get(null);

                    Class<?> sourceClass = pTypes[3];
                    Object cjizSource = null;
                    for (String helperName : new String[]{"ttk", "trf", "two", "rom", "tpk", "trn"}) {
                        Class<?> helper = ReflectionCache.findClassOrNull(helperName);
                        if (helper != null) {
                            for (Method m : helper.getMethods()) {
                                if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) && m.getParameterTypes().length == 1 &&
                                    Context.class.isAssignableFrom(m.getParameterTypes()[0]) &&
                                    m.getReturnType().equals(sourceClass)) {
                                    cjizSource = m.invoke(null, context);
                                    break;
                                }
                            }
                        }
                        if (cjizSource != null) break;
                    }

                    Object task = wrapperCtor.newInstance(accountId, mediaGroup, targetMode, cjizSource);
                    Object res = runTaskSync(context, task);
                    if (res != null) {
                        int statusCode = getTaskStatusCode(res);
                        if (statusCode == 200) chunkSuccess = true;
                    }
                    if (chunkSuccess) {
                        Log.i("morphe: StorageScanner", "MoveToTrashActionWrapper succeeded for chunk " + chunkIndex + "/" + totalChunks);
                    }
                }
            } catch (Throwable t) {
                Log.w("morphe: StorageScanner", "MoveToTrashActionWrapper failed for chunk " + chunkIndex, t);
            }

            // Strategy 2: bjir with CORRECT keys (col2 = remote mediaKeys, col3 = dedupKeys)
            if (!chunkSuccess) {
                try {
                    List<String> chunkMediaKeys = resolveRemoteMediaKeys(context, accountId, chunk);
                    LinkedHashSet<String> uniqueChunkDedupKeys = new LinkedHashSet<>();
                    for (MediaItem it : chunk) {
                        if (it.dedupKey != null && !it.dedupKey.trim().isEmpty()) {
                            uniqueChunkDedupKeys.add(it.dedupKey.trim());
                        }
                    }
                    List<String> chunkDedupKeys = new ArrayList<>(uniqueChunkDedupKeys);

                    if (!chunkMediaKeys.isEmpty() || !chunkDedupKeys.isEmpty()) {
                        Class<?> bjirClass = null;
                        for (String cand : ToolkitMappings.MOVE_TO_TRASH_ACTION_CLASSES) {
                            bjirClass = ReflectionCache.findClassOrNull(cand);
                            if (bjirClass != null) break;
                        }
                        if (bjirClass == null) {
                            throw new ClassNotFoundException("MoveToTrashAction class not found");
                        }
                        Class<?> cjizClass = Class.forName("cjiz");
                        Class<?> romClass = Class.forName("rom");
                        Method romMethod = romClass.getMethod("b", Context.class);
                        Object cjizSource = romMethod.invoke(null, context);

                        Collection<?> ahnrCol = null;
                        Collection<String> keyStrings = !chunkMediaKeys.isEmpty() ? chunkMediaKeys : chunkDedupKeys;
                        try {
                            Class<?> ahnsClass = Class.forName("ahns");
                            Method aColMethod = ahnsClass.getMethod("a", Collection.class);
                            ahnrCol = (Collection<?>) aColMethod.invoke(null, keyStrings);
                        } catch (Throwable ignored) {}

                        Collection<?> col1 = ahnrCol != null ? ahnrCol : Collections.emptyList();
                        Collection<String> col2 = chunkMediaKeys; // Remote media keys for PhotosDeleteItemsRequest!
                        Collection<String> col3 = chunkDedupKeys; // Dedup keys for local tombstone!
                        Collection<?> col4 = ahnrCol != null ? ahnrCol : Collections.emptyList();

                        Method rMethod = bjirClass.getMethod("r", int.class, Collection.class, Collection.class, Collection.class, Collection.class, cjizClass);
                        Object bjirAction = rMethod.invoke(null, accountId, col1, col2, col3, col4, cjizSource);

                        try {
                            Method aMethod = bjirClass.getMethod("a", Context.class);
                            aMethod.invoke(bjirAction, context);
                        } catch (Throwable ignored) {}

                        Method dMethod = bjirClass.getMethod("d", Context.class, int.class);
                        Object ltvRes = dMethod.invoke(bjirAction, context, 0);
                        if (ltvRes != null && ltvRes.toString().contains("SUCCESS")) {
                            chunkSuccess = true;
                            Log.i("morphe: StorageScanner", "bjir.d direct RPC succeeded for chunk " + chunkIndex);
                        }
                    }
                } catch (Throwable tBjir) {
                    Log.w("morphe: StorageScanner", "bjir fallback failed for chunk " + chunkIndex, tBjir);
                }
            }

            if (chunkSuccess) successCount++;
        }

        Log.i("morphe: StorageScanner", "executeOnlineTrashTask finished: " + successCount + "/" + totalChunks + " chunks successful");
        return successCount > 0;
    }

    private static Object getMediaFeature(Object media, Class<?> featureClass) {
        if (media == null || featureClass == null) return null;
        try {
            Method bMethod = ReflectionCache.getMethod(media.getClass(), "b", Class.class);
            return bMethod.invoke(media, featureClass);
        } catch (Throwable t) {
            try {
                Method cMethod = ReflectionCache.getMethod(media.getClass(), "c", Class.class);
                return cMethod.invoke(media, featureClass);
            } catch (Throwable ignored) {}
        }
        return null;
    }

    private static String extractDedupKey(Object media, Class<?> zonClass) {
        if (media == null || zonClass == null) return null;
        try {
            Object feat = getMediaFeature(media, zonClass);
            if (feat != null) {
                try {
                    Method aM = ReflectionCache.getMethodOrNull(feat.getClass(), "a");
                    if (aM != null && aM.getReturnType() == String.class) {
                        String s = (String) aM.invoke(feat);
                        if (s != null && !s.isEmpty()) return s;
                    }
                } catch (Throwable ignored) {}
                Field af = ReflectionCache.getDeclaredField(feat.getClass(), "a");
                Object opt = af.get(feat);
                if (opt != null) {
                    try {
                        Method isPresent = ReflectionCache.getMethod(opt.getClass(), "isPresent");
                        if (Boolean.TRUE.equals(isPresent.invoke(opt))) {
                            Object val = ReflectionCache.getMethod(opt.getClass(), "get").invoke(opt);
                            if (val != null) {
                                try {
                                    Field bField = ReflectionCache.getDeclaredField(val.getClass(), "b");
                                    Object bVal = bField.get(val);
                                    if (bVal != null) return bVal.toString();
                                } catch (Throwable ignored) {
                                    return val.toString();
                                }
                            }
                        }
                    } catch (Throwable ignored) {
                        return opt.toString();
                    }
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static List<String> extractMediaKeys(Object media, Class<?> bamsClass) {
        List<String> res = new ArrayList<>();
        if (media == null || bamsClass == null) return res;
        try {
            Object feat = getMediaFeature(media, bamsClass);
            if (feat != null) {
                Field af = ReflectionCache.getDeclaredField(feat.getClass(), "a");
                Object val = af.get(feat);
                if (val instanceof List) {
                    for (Object k : (List<?>) val) {
                        if (k != null) {
                            res.add(k.toString());
                        }
                    }
                } else if (val instanceof String) {
                    res.add((String) val);
                } else if (val != null) {
                    res.add(val.toString());
                }
            }
        } catch (Throwable ignored) {}
        return res;
    }

    private static Object createTrashMediaCollection(int accountId) {
        try {
            Class<?> fClass = ReflectionCache.findClassOrNull(ToolkitMappings.TRASH_FACTORY_CLASS);
            if (fClass != null) {
                Method m = fClass.getMethod(ToolkitMappings.TRASH_FACTORY_METHOD, int.class);
                Object coll = m.invoke(null, accountId);
                if (coll != null) return coll;
            }
        } catch (Throwable ignored) {}

        for (String tName : ToolkitMappings.TRASH_COLLECTION_CLASSES) {
            try {
                Class<?> tClass = ReflectionCache.findClassOrNull(tName);
                if (tClass != null) {
                    try {
                        Constructor<?> ctor = tClass.getConstructor(int.class);
                        Object coll = ctor.newInstance(accountId);
                        if (coll != null) return coll;
                    } catch (Throwable ignored) {}
                    try {
                        Method m = tClass.getMethod("a", int.class);
                        Object coll = m.invoke(null, accountId);
                        if (coll != null) return coll;
                    } catch (Throwable ignored) {}
                    try {
                        Method m = tClass.getMethod("b", int.class);
                        Object coll = m.invoke(null, accountId);
                        if (coll != null) return coll;
                    } catch (Throwable ignored) {}
                }
            } catch (Throwable ignored) {}
        }
        return null;
    }

    private static void syncCloudTrashToLocalDb(Context context, AccountInfo account) {
        if (context == null || account == null) return;
        try {
            Object trashCollectionRef = createTrashMediaCollection(account.accountId);
            if (trashCollectionRef == null) {
                Log.w("morphe: StorageScanner", "syncCloudTrashToLocalDb: Trash collection ref not found");
                return;
            }

            List<?> allTrashMedia = loadMediaCollection(context, trashCollectionRef);
            if (allTrashMedia == null || allTrashMedia.isEmpty()) {
                Log.i("morphe: StorageScanner", "syncCloudTrashToLocalDb: Trash collection returned 0 items");
                return;
            }

            Log.i("morphe: StorageScanner", "syncCloudTrashToLocalDb: Loaded " + allTrashMedia.size() + " items from trash collection");

            String[] zonCandidates = ToolkitMappings.DEDUP_KEY_FEATURE_CLASSES;
            Class<?> zonClass = null;
            for (String zc : zonCandidates) {
                try { zonClass = Class.forName(zc); break; } catch (Throwable ignored) {}
            }
            String[] bamsCandidates = ToolkitMappings.REMOTE_MEDIA_KEY_FEATURE_CLASSES;
            Class<?> bamsClass = null;
            for (String bc : bamsCandidates) {
                try { bamsClass = Class.forName(bc); break; } catch (Throwable ignored) {}
            }

            List<String> dedupKeys = new ArrayList<>();
            List<String> mediaKeys = new ArrayList<>();
            for (Object m : allTrashMedia) {
                String d = (zonClass != null) ? extractDedupKey(m, zonClass) : null;
                if (d != null && !d.isEmpty()) dedupKeys.add(d);
                if (bamsClass != null) {
                    List<String> mks = extractMediaKeys(m, bamsClass);
                    mediaKeys.addAll(mks);
                }
            }

            File dbf = new File(account.dbPath);
            if (!dbf.exists()) return;

            SQLiteDatabase db = SQLiteDatabase.openDatabase(dbf.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
            try {
                db.beginTransaction();
                long now = System.currentTimeMillis();
                int updated = 0;
                for (String dk : dedupKeys) {
                    ContentValues cv = new ContentValues();
                    if (hasColumn(db, "remote_media", "state")) cv.put("state", 2);
                    cv.put("trash_timestamp", now);
                    updated += db.update("remote_media", cv, "dedup_key = ? AND (state != 2 OR trash_timestamp IS NULL OR trash_timestamp = 0)", new String[]{dk});
                    if (hasTable(db, "media")) {
                        ContentValues mCv = new ContentValues();
                        mCv.put("trash_timestamp", now);
                        mCv.put("is_deleted", 1);
                        db.update("media", mCv, "dedup_key = ?", new String[]{dk});
                    }
                }
                for (String mk : mediaKeys) {
                    ContentValues cv = new ContentValues();
                    if (hasColumn(db, "remote_media", "state")) cv.put("state", 2);
                    cv.put("trash_timestamp", now);
                    updated += db.update("remote_media", cv, "media_key = ? AND (state != 2 OR trash_timestamp IS NULL OR trash_timestamp = 0)", new String[]{mk});
                }
                db.setTransactionSuccessful();
                Log.i("morphe: StorageScanner", "syncCloudTrashToLocalDb: Marked " + updated + " cloud trash items as state=2 locally");
            } finally {
                db.endTransaction();
                db.close();
            }
        } catch (Throwable t) {
            Log.w("morphe: StorageScanner", "syncCloudTrashToLocalDb failed: " + t.getMessage());
        }
    }

    private static List<?> loadTrashMediaItems(Context context, int accountId, List<MediaItem> items) {
        List<Object> result = new ArrayList<>();
        if (context == null || items == null || items.isEmpty()) return result;

        try {
            Object trashCollectionRef = createTrashMediaCollection(accountId);
            if (trashCollectionRef == null) {
                Log.w("morphe: StorageScanner", "loadTrashMediaItems: Failed to create TrashMediaCollection");
                return result;
            }

            List<?> allTrashMedia = loadMediaCollection(context, trashCollectionRef);
            if (allTrashMedia == null || allTrashMedia.isEmpty()) {
                Log.w("morphe: StorageScanner", "loadTrashMediaItems: Trash collection returned 0 items");
                return result;
            }

            Log.i("morphe: StorageScanner", "loadTrashMediaItems: Loaded " + allTrashMedia.size() + " items from trash collection");

            // Filter for matching items by dedupKey or mediaKey
            Set<String> targetDedupKeys = new HashSet<>();
            Set<String> targetMediaKeys = new HashSet<>();
            for (MediaItem it : items) {
                if (it.dedupKey != null && !it.dedupKey.trim().isEmpty()) {
                    targetDedupKeys.add(it.dedupKey.trim().toLowerCase());
                }
                if (it.mediaKey != null && !it.mediaKey.trim().isEmpty()) {
                    targetMediaKeys.add(it.mediaKey.trim().toLowerCase());
                }
            }

            String[] zonCandidates = ToolkitMappings.DEDUP_KEY_FEATURE_CLASSES;
            Class<?> zonClass = null;
            for (String zc : zonCandidates) {
                try { zonClass = Class.forName(zc); break; } catch (Throwable ignored) {}
            }
            String[] bamsCandidates = ToolkitMappings.REMOTE_MEDIA_KEY_FEATURE_CLASSES;
            Class<?> bamsClass = null;
            for (String bc : bamsCandidates) {
                try { bamsClass = Class.forName(bc); break; } catch (Throwable ignored) {}
            }

            for (Object media : allTrashMedia) {
                if (media == null) continue;
                boolean match = false;

                String dKey = (zonClass != null) ? extractDedupKey(media, zonClass) : null;
                if (dKey != null && !dKey.isEmpty()) {
                    String lower = dKey.toLowerCase();
                    for (String target : targetDedupKeys) {
                        if (lower.contains(target) || target.contains(lower)) {
                            match = true;
                            break;
                        }
                    }
                }

                if (!match && bamsClass != null) {
                    List<String> mKeys = extractMediaKeys(media, bamsClass);
                    for (String k : mKeys) {
                        String lower = k.toLowerCase();
                        for (String target : targetMediaKeys) {
                            if (lower.contains(target) || target.contains(lower)) {
                                match = true;
                                break;
                            }
                        }
                        if (match) break;
                    }
                }

                if (match) {
                    result.add(media);
                }
            }

            // Fallback: If feature matching returned 0 but trash collection has items, take all items
            if (result.isEmpty() && !allTrashMedia.isEmpty()) {
                Log.i("morphe: StorageScanner", "loadTrashMediaItems: feature matching empty, using all " + allTrashMedia.size() + " trash collection items");
                result.addAll(allTrashMedia);
            }
        } catch (Throwable t) {
            Log.e("morphe: StorageScanner", "Error in loadTrashMediaItems", t);
        }

        Log.i("morphe: StorageScanner", "loadTrashMediaItems: Returning " + result.size() + " items for restore");
        return result;
    }

    private static boolean executeOnlineRestoreTask(Context context, int accountId, List<MediaItem> items) {
        if (context == null || items == null || items.isEmpty()) return false;
        Log.i("morphe: StorageScanner", "executeOnlineRestoreTask: starting for " + items.size() + " items");

        int chunkSize = 100;
        int totalChunks = (items.size() + chunkSize - 1) / chunkSize;
        int successCount = 0;

        for (int i = 0; i < items.size(); i += chunkSize) {
            int chunkIndex = (i / chunkSize) + 1;
            List<MediaItem> chunk = items.subList(i, Math.min(i + chunkSize, items.size()));
            boolean chunkSuccess = false;

            try {
                // 1. Primary: load CoreMedia from the official Trash collection
                List<?> coreItems = loadTrashMediaItems(context, accountId, chunk);
                if (coreItems.isEmpty()) {
                    // Fallback to library loader if items were somehow already untrashed locally
                    coreItems = loadCoreMediaItems(context, accountId, chunk);
                }

                if (!coreItems.isEmpty()) {
                    Class<?> restoreClass = Class.forName("com.google.android.apps.photos.trash.restore.RestoreActionTask");
                    Constructor<?> restoreCtor = restoreClass.getConstructors()[0];
                    Class<?> mediaGroupClass = restoreCtor.getParameterTypes()[1];
                    Object mediaGroup = mediaGroupClass.getConstructor(Collection.class).newInstance(coreItems);

                    // Strategy 1: RestoreActionTask via runTaskSync
                    try {
                        Object task = restoreCtor.newInstance(accountId, mediaGroup, true);
                        Object res = runTaskSync(context, task);
                        if (res != null) {
                            int statusCode = getTaskStatusCode(res);
                            if (statusCode == 200) {
                                chunkSuccess = true;
                            } else {
                                try {
                                    Object exc = res.getClass().getField("e").get(res);
                                    String msg = (String) res.getClass().getField("f").get(res);
                                    Log.w("morphe: StorageScanner", "RestoreActionTask returned status " + statusCode + ", msg: " + msg, (Throwable) exc);
                                } catch (Throwable ignored) {}
                            }
                        }
                    } catch (Throwable tTask) {
                        Log.w("morphe: StorageScanner", "RestoreActionTask failed for chunk " + chunkIndex, tTask);
                    }

                    // Strategy 2: Direct bjim.a + wqx.a RPC fallback
                    if (!chunkSuccess) {
                        try {
                            Class<?> bjimClass = Class.forName("bjim");
                            Object bjimImpl = getServiceLocator(context, bjimClass);

                            Class<?> cjizClass = Class.forName("cjiz");
                            Class<?> romClass = Class.forName("rom");
                            Method romMethod = romClass.getMethod("b", Context.class);
                            Object cjizSource = romMethod.invoke(null, context);

                            Method aMethod = bjimClass.getMethod("a", int.class, Collection.class, boolean.class, cjizClass);
                            Object wqxAction = aMethod.invoke(bjimImpl, accountId, coreItems, false, cjizSource);
                            if (wqxAction != null) {
                                Method execMethod = Class.forName("wqx").getMethod("a");
                                Object execRes = execMethod.invoke(wqxAction);
                                Log.i("morphe: StorageScanner", "Direct bjim.a restore returned: " + execRes);
                                chunkSuccess = true;
                            }
                        } catch (Throwable tBjim) {
                            Log.w("morphe: StorageScanner", "Direct bjim restore fallback failed for chunk " + chunkIndex, tBjim);
                        }
                    }

                    if (chunkSuccess) {
                        Log.i("morphe: StorageScanner", "Online restore succeeded for chunk " + chunkIndex + "/" + totalChunks);
                    }
                } else {
                    Log.w("morphe: StorageScanner", "RestoreActionTask chunk " + chunkIndex + ": 0 core items loaded");
                }
            } catch (Throwable t) {
                Log.w("morphe: StorageScanner", "RestoreActionTask chunk " + chunkIndex + " failed", t);
            }

            if (chunkSuccess) successCount++;
        }

        Log.i("morphe: StorageScanner", "executeOnlineRestoreTask finished: " + successCount + "/" + totalChunks + " chunks successful");
        return successCount > 0;
    }

    private static boolean executeOnlineArchiveTask(Context context, int accountId, List<MediaItem> items, boolean archive) {
        if (context == null || items == null || items.isEmpty()) return false;
        Log.i("morphe: StorageScanner", "executeOnlineArchiveTask: starting for " + items.size() + " items, archive=" + archive);

        int chunkSize = 100;
        int totalChunks = (items.size() + chunkSize - 1) / chunkSize;
        int successCount = 0;

        for (int i = 0; i < items.size(); i += chunkSize) {
            int chunkIndex = (i / chunkSize) + 1;
            List<MediaItem> chunk = items.subList(i, Math.min(i + chunkSize, items.size()));
            boolean chunkSuccess = false;

            try {
                List<String> chunkRemoteKeys = resolveRemoteMediaKeys(context, accountId, chunk);
                List<?> coreItems = loadCoreMediaItems(context, accountId, chunk);

                // 1. Dispatch official TaskRunner MediaUndoActionTask
                if (!coreItems.isEmpty()) {
                    try {
                        Class<?> taskClass = Class.forName("com.google.android.apps.photos.undoaction.MediaUndoActionTask");
                        Constructor<?> taskCtor = taskClass.getConstructors()[0];
                        Class<?> actionInterface = taskCtor.getParameterTypes()[1];

                        Constructor<?> archiveActionCtor = null;
                        for (String name : new String[]{"rxq", "rvh", "rzl", "ptf"}) {
                            Class<?> c = ReflectionCache.findClassOrNull(name);
                            if (c != null && actionInterface.isAssignableFrom(c) && c.getConstructors().length > 0) {
                                archiveActionCtor = c.getConstructors()[0];
                                break;
                            }
                        }
                        if (archiveActionCtor != null) {
                            Class<?> mediaGroupClass = archiveActionCtor.getParameterTypes()[3];
                            Object mediaGroup = mediaGroupClass.getConstructor(Collection.class).newInstance(coreItems);
                            Object ptfInst = archiveActionCtor.newInstance(accountId, archive, 2, mediaGroup, "UndoableActionManager-Act");
                            Object undoTask = taskCtor.newInstance("UndoableActionManager-Act", ptfInst, false, true);
                            Object res = runTaskSync(context, undoTask);
                            if (res != null) {
                                int statusCode = getTaskStatusCode(res);
                                if (statusCode == 200) chunkSuccess = true;
                            } else {
                                chunkSuccess = true;
                            }
                            Log.i("morphe: StorageScanner", "Dispatched MediaUndoActionTask chunk " + chunkIndex + "/" + totalChunks);
                        }
                    } catch (Throwable tTask) {
                        Log.w("morphe: StorageScanner", "Error running MediaUndoActionTask chunk " + chunkIndex + ": " + tTask.getMessage());
                        // Fallback: direct archive service invocation (rsr.a / psu.a)
                        for (String psuCandidate : ToolkitMappings.ARCHIVE_SERVICE_CLASSES) {
                            try {
                                Class<?> psuClass = Class.forName(psuCandidate);
                                Object psuInst = getServiceLocator(context, psuClass);
                                if (psuInst != null) {
                                    Method aMethod = psuClass.getMethod("a", int.class, List.class, boolean.class, int.class);
                                    Object res = aMethod.invoke(psuInst, accountId, coreItems, archive, 2);
                                    if (res != null) {
                                        chunkSuccess = true;
                                        break;
                                    }
                                }
                            } catch (Throwable tPsu) {
                                Log.w("morphe: StorageScanner", "Error in " + psuCandidate + ".a fallback: " + tPsu.getMessage());
                            }
                        }
                    }
                }

                // 2. Dispatch online mutation RPC and ActionQueue via psz
                if (!chunkRemoteKeys.isEmpty()) {
                    try {
                        Class<?> psyClass = null;
                        for (String psyCandidate : ToolkitMappings.ARCHIVE_BUILDER_CLASSES) {
                            try {
                                psyClass = Class.forName(psyCandidate);
                                if (psyClass != null) break;
                            } catch (Throwable ignored) {}
                        }
                        if (psyClass == null) {
                            throw new ClassNotFoundException("Archive builder class not found");
                        }
                        Object builder = psyClass.getConstructor().newInstance();
                        Method dMethod = psyClass.getMethod("d", int.class);
                        dMethod.invoke(builder, accountId);
                        psyClass.getField("b").setBoolean(builder, archive);
                        psyClass.getField("c").setInt(builder, 2);
                        Method cMethod = psyClass.getMethod("c", List.class);
                        cMethod.invoke(builder, chunkRemoteKeys);
                        Method buildMethod = psyClass.getMethod("a");
                        Object pszInst = buildMethod.invoke(builder);

                        // Direct synchronous RPC (BatchSetArchiveStateRequest)
                        try {
                            Method hMethod = pszInst.getClass().getMethod("h", Context.class, int.class);
                            Object future = hMethod.invoke(pszInst, context, 0);
                            if (future instanceof Future) {
                                try {
                                    ((Future<?>) future).get(15, TimeUnit.SECONDS);
                                    chunkSuccess = true;
                                    Log.i("morphe: StorageScanner", "Direct archive RPC confirmed chunk " + chunkIndex + "/" + totalChunks);
                                } catch (Throwable tWait) {
                                    Log.w("morphe: StorageScanner", "Direct archive RPC wait chunk " + chunkIndex + ": " + tWait.getMessage());
                                }
                            }
                        } catch (Throwable tRpc) {
                            Log.w("morphe: StorageScanner", "Error invoking psz.h RPC chunk " + chunkIndex + ": " + tRpc.getMessage());
                        }

                        // Enqueue via ActionWrapper & flush with flusher
                        try {
                            Class<?> wrapperClass = Class.forName("com.google.android.apps.photos.actionqueue.ActionWrapper");
                            Class<?> ltyClass = Class.forName("lty");
                            Constructor<?> wrapperCtor = wrapperClass.getConstructor(int.class, ltyClass);
                            Object actionWrapper = wrapperCtor.newInstance(accountId, pszInst);

                            Object res = runTaskSync(context, actionWrapper);

                            if (res != null) {
                                Bundle bundle = getTaskResultBundle(res);
                                long actionId = bundle != null ? bundle.getLong("LocalResult__action_id", -1L) : -1L;
                                if (actionId != -1L) {
                                    flushActionQueue(context, accountId, actionId);
                                    chunkSuccess = true;
                                    Log.i("morphe: StorageScanner", "ActionQueue flushed chunk " + chunkIndex + "/" + totalChunks);
                                }
                            }
                        } catch (Throwable tQueue) {
                            Log.w("morphe: StorageScanner", "Error in ActionWrapper/flusher chunk " + chunkIndex + ": " + tQueue.getMessage());
                        }
                    } catch (Throwable tPsz) {
                        Log.w("morphe: StorageScanner", "Error constructing psz chunk " + chunkIndex + ": " + tPsz.getMessage());
                    }
                }
            } catch (Throwable tChunk) {
                Log.e("morphe: StorageScanner", "Error processing chunk " + chunkIndex + "/" + totalChunks, tChunk);
            }

            if (chunkSuccess) successCount++;
        }

        Log.i("morphe: StorageScanner", "executeOnlineArchiveTask finished: " + successCount + "/" + totalChunks + " chunks successful");
        return successCount > 0;
    }

    private static boolean executeOnlineFavoriteTask(Context context, int accountId, List<MediaItem> items, boolean favorite) {
        if (context == null || items == null || items.isEmpty()) return false;
        Log.i("morphe: StorageScanner", "executeOnlineFavoriteTask: starting for " + items.size() + " items, favorite=" + favorite);

        int chunkSize = 100;
        int totalChunks = (items.size() + chunkSize - 1) / chunkSize;
        int successCount = 0;

        for (int i = 0; i < items.size(); i += chunkSize) {
            int chunkIndex = (i / chunkSize) + 1;
            List<MediaItem> chunk = items.subList(i, Math.min(i + chunkSize, items.size()));
            boolean chunkSuccess = false;

            try {
                List<?> coreItems = loadCoreMediaItems(context, accountId, chunk);
                if (!coreItems.isEmpty()) {
                    Class<?> favClass = Class.forName("com.google.android.apps.photos.favorites.FavoritesTask");
                    Constructor<?> favCtor = favClass.getConstructors()[0];
                    Class<?> reasonClass = favCtor.getParameterTypes()[3];
                    Object reason = null;
                    try {
                        reason = reasonClass.getField("a").get(null);
                    } catch (Throwable t) {
                        if (reasonClass.getEnumConstants() != null && reasonClass.getEnumConstants().length > 0) {
                            reason = reasonClass.getEnumConstants()[0];
                        }
                    }

                    Object task = favCtor.newInstance(accountId, coreItems, favorite, reason);
                    Object res = runTaskSync(context, task);
                    if (res != null) {
                        int statusCode = getTaskStatusCode(res);
                        if (statusCode == 200) chunkSuccess = true;
                    }
                    if (chunkSuccess) {
                        Log.i("morphe: StorageScanner", "FavoritesTask chunk " + chunkIndex + "/" + totalChunks + " succeeded");
                    }
                } else {
                    Log.w("morphe: StorageScanner", "FavoritesTask chunk " + chunkIndex + ": 0 core items loaded");
                }
            } catch (Throwable t) {
                Log.w("morphe: StorageScanner", "Error invoking FavoritesTask chunk " + chunkIndex, t);
            }

            if (chunkSuccess) successCount++;
        }

        Log.i("morphe: StorageScanner", "executeOnlineFavoriteTask finished: " + successCount + "/" + totalChunks + " chunks successful");
        return successCount > 0;
    }

    private static Object createMarsMoveTask(Context context, int accountId, Collection<?> coreItems) {
        try {
            String basePhotosPkg = "com.google." + "android.apps.photos";
            String taskName = basePhotosPkg + ".mars.actionhandler.impl.MarsMoveTask";
            Class<?> taskClass;
            try {
                taskClass = context.getClassLoader().loadClass(taskName);
            } catch (Throwable tCl) {
                taskClass = Class.forName(taskName);
            }
            for (Constructor<?> ctor : taskClass.getDeclaredConstructors()) {
                ctor.setAccessible(true);
                Class<?>[] params = ctor.getParameterTypes();
                if (params.length == 3 && params[0] == Context.class && params[1] == int.class && Collection.class.isAssignableFrom(params[2])) {
                    return ctor.newInstance(context, accountId, coreItems);
                }
                if (params.length == 2 && params[0] == int.class && Collection.class.isAssignableFrom(params[1])) {
                    return ctor.newInstance(accountId, coreItems);
                }
                if (params.length == 1 && params[0] == String.class) {
                    Object task = ctor.newInstance("mars_move_result");
                    for (Field f : taskClass.getDeclaredFields()) {
                        f.setAccessible(true);
                        if (f.getType() == int.class && !java.lang.reflect.Modifier.isStatic(f.getModifiers())) {
                            f.setInt(task, accountId);
                        } else if (Collection.class.isAssignableFrom(f.getType())) {
                            f.set(task, coreItems);
                        }
                    }
                    return task;
                }
            }
        } catch (Throwable t) {
            Logger.printException(() -> "createMarsMoveTask error", t);
        }
        return null;
    }

    private static boolean executeOnlineMarsMoveTask(Context context, int accountId, List<MediaItem> items) {
        if (context == null || items == null || items.isEmpty()) return false;
        Log.i("morphe: StorageScanner", "executeOnlineMarsMoveTask: starting for " + items.size() + " items");

        int chunkSize = 5;
        int totalChunks = (items.size() + chunkSize - 1) / chunkSize;
        int successCount = 0;
        int totalMovedCount = 0;

        for (int i = 0; i < items.size(); i += chunkSize) {
            int chunkIndex = (i / chunkSize) + 1;
            List<MediaItem> chunk = items.subList(i, Math.min(i + chunkSize, items.size()));
            boolean chunkSuccess = false;

            java.util.function.Consumer<String> cb = sActionProgressCallback;
            if (cb != null) {
                cb.accept("Encrypting & moving items (" + (i + 1) + "–" + Math.min(i + chunkSize, items.size()) + " of " + items.size() + ")...");
            }

            try {
                List<?> coreItems = loadCoreMediaItems(context, accountId, chunk);
                if (!coreItems.isEmpty()) {
                    Object task = createMarsMoveTask(context, accountId, coreItems);
                    if (task != null) {
                        Object res = runTaskSync(context, task);
                        if (res != null) {
                            try {
                                Bundle bundle = getTaskResultBundle(res);
                                if (bundle != null) {
                                    bundle.setClassLoader(context.getClassLoader());
                                    Object moveResult = bundle.getParcelable("mars_move_result");
                                    if (moveResult != null) {
                                        Field fieldA = moveResult.getClass().getField("a");
                                        Object movedObj = fieldA.get(moveResult);
                                        int moved = (movedObj instanceof Collection) ? ((Collection<?>) movedObj).size() : 0;

                                        Field fieldB = moveResult.getClass().getField("b");
                                        Object failedObj = fieldB.get(moveResult);
                                        int failed = (failedObj instanceof Collection) ? ((Collection<?>) failedObj).size() : 0;

                                        Field fieldC = moveResult.getClass().getField("c");
                                        Object cancelledObj = fieldC.get(moveResult);
                                        int cancelled = (cancelledObj instanceof Collection) ? ((Collection<?>) cancelledObj).size() : 0;

                                        int rCode = 0;
                                        try {
                                            rCode = moveResult.getClass().getField("d").getInt(moveResult);
                                        } catch (Throwable ignored) {}

                                        Log.i("morphe: StorageScanner", "MarsMoveTask chunk " + chunkIndex + ": moved=" + moved + ", failed=" + failed + ", cancelled=" + cancelled + ", code=" + rCode);
                                        if (moved > 0) {
                                            chunkSuccess = true;
                                            totalMovedCount += moved;
                                        }
                                    }
                                }
                            } catch (Throwable tBundle) {
                                Log.w("morphe: StorageScanner", "Error reading mars_move_result bundle: " + tBundle.getMessage());
                            }
                            if (!chunkSuccess && totalMovedCount == 0) {
                                try {
                                    int statusCode = res.getClass().getField("d").getInt(res);
                                    if (statusCode == 200) {
                                        Log.i("morphe: StorageScanner", "MarsMoveTask returned statusCode 200 (fallback check)");
                                    }
                                } catch (Throwable ignored) {}
                            }
                        }
                    } else {
                        Log.w("morphe: StorageScanner", "createMarsMoveTask returned null for chunk " + chunkIndex);
                    }
                } else {
                    Log.w("morphe: StorageScanner", "loadCoreMediaItems returned 0 items for chunk " + chunkIndex);
                }
            } catch (Throwable t) {
                Log.w("morphe: StorageScanner", "Error invoking MarsMoveTask chunk " + chunkIndex, t);
            }

            if (chunkSuccess) successCount++;
        }

        Log.i("morphe: StorageScanner", "executeOnlineMarsMoveTask finished: " + successCount + "/" + totalChunks + " chunks successful, moved " + totalMovedCount + " items");
        return totalMovedCount > 0;
    }

    public static volatile List<MediaItem> sPendingUnlockItems = null;
    public static volatile int sPendingUnlockAccountId = -1;
    public static volatile Runnable sPendingUnlockCallback = null;
    public static volatile java.util.function.Consumer<String> sActionProgressCallback = null;

    public static void onMarsGridActivityCreated(final Activity activity) {
        Log.i("morphe: StorageScanner", "onMarsGridActivityCreated called: activity=" + activity + " pendingItems=" + sPendingUnlockItems + " accountId=" + sPendingUnlockAccountId);
        if (activity == null) return;
        final List<MediaItem> itemsToUnlock = sPendingUnlockItems;
        final int accountId = sPendingUnlockAccountId;
        final Runnable onDoneCallback = sPendingUnlockCallback;
        if (itemsToUnlock == null || itemsToUnlock.isEmpty()) {
            Log.w("morphe: StorageScanner", "onMarsGridActivityCreated: no pending items — skipping unlock");
            return;
        }
        sPendingUnlockItems = null;
        sPendingUnlockAccountId = -1;
        sPendingUnlockCallback = null;

        Log.i("morphe: StorageScanner", "onMarsGridActivityCreated: starting auto-unlock for " + itemsToUnlock.size() + " items");

        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            Toast.makeText(activity, "Unlocking " + itemsToUnlock.size() + " item(s) from Locked Folder...", Toast.LENGTH_SHORT).show();

            new Thread(() -> {
                boolean ok = false;
                try {
                    ok = executeOnlineMarsRemoveTask(activity, accountId, itemsToUnlock);
                } catch (Throwable t) {
                    Log.e("morphe: StorageScanner", "Error in auto-unlock thread", t);
                }
                final boolean finalOk = ok;
                activity.runOnUiThread(() -> {
                    Toast.makeText(activity, finalOk ? "Successfully unlocked " + itemsToUnlock.size() + " item(s)!" : "Failed to unlock items.", Toast.LENGTH_SHORT).show();
                    triggerOnlineSync(activity, accountId);
                    notifyUiChanges(activity, accountId);
                    if (onDoneCallback != null) onDoneCallback.run();
                    activity.finish();
                });
            }).start();
        }, 600);
    }

    private static List<?> loadDirectMarsMedia(Context context, int accountId, List<MediaItem> items) {
        List<Object> matched = new ArrayList<>();
        try {
            String[] marsCollClasses = ToolkitMappings.MARS_COLLECTION_CLASSES;
            Object marsColl = null;
            for (String cn : marsCollClasses) {
                try {
                    Class<?> clazz = Class.forName(cn);
                    Constructor<?> ctor = clazz.getConstructor(int.class);
                    ctor.setAccessible(true);
                    marsColl = ctor.newInstance(accountId);
                    if (marsColl != null) {
                        Logger.printInfo(() -> "Resolved MarsCollection via: " + cn);
                        break;
                    }
                } catch (Throwable ignored) {}
            }

            if (marsColl != null) {
                List<?> allLoaded = loadMediaCollection(context, marsColl);
                if (allLoaded != null && !allLoaded.isEmpty()) {
                    Logger.printInfo(() -> "loadDirectMarsMedia: loaded " + allLoaded.size() + " items from MarsCollection");
                    if (items == null || items.isEmpty() || items.size() == allLoaded.size()) {
                        matched.addAll(allLoaded);
                    } else {
                        Set<String> targetKeys = new HashSet<>();
                        for (MediaItem mi : items) {
                            if (mi.dedupKey != null && !mi.dedupKey.isEmpty()) targetKeys.add(mi.dedupKey);
                            if (mi.mediaKey != null && !mi.mediaKey.isEmpty()) targetKeys.add(mi.mediaKey);
                        }
                        String[] zonCandidates = ToolkitMappings.DEDUP_KEY_FEATURE_CLASSES;
                        Class<?> zonClass = null;
                        for (String zc : zonCandidates) {
                            try { zonClass = Class.forName(zc); break; } catch (Throwable ignored) {}
                        }
                        for (Object media : allLoaded) {
                            String dKey = (zonClass != null) ? extractDedupKey(media, zonClass) : null;
                            if (dKey != null && targetKeys.contains(dKey)) {
                                matched.add(media);
                            }
                        }
                        if (matched.isEmpty()) {
                            matched.addAll(allLoaded);
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Logger.printException(() -> "loadDirectMarsMedia error", t);
        }
        return matched;
    }

    private static boolean executeOnlineMarsRemoveTask(Context context, int accountId, List<MediaItem> items) {
        if (context == null || items == null || items.isEmpty()) return false;
        Log.i("morphe: StorageScanner", "executeOnlineMarsRemoveTask: starting for " + items.size() + " items");

        List<?> allCoreMedia = loadDirectMarsMedia(context, accountId, items);
        if (allCoreMedia == null || allCoreMedia.isEmpty()) {
            allCoreMedia = loadCoreMediaItems(context, accountId, items);
        }

        if (allCoreMedia == null || allCoreMedia.isEmpty()) {
            Log.w("morphe: StorageScanner", "executeOnlineMarsRemoveTask: could not load core media for " + items.size() + " items");
            return false;
        }

        int chunkSize = 25;
        int totalItems = allCoreMedia.size();
        int totalChunks = (totalItems + chunkSize - 1) / chunkSize;
        int successCount = 0;
        int totalRemovedCount = 0;

        for (int i = 0; i < totalItems; i += chunkSize) {
            int chunkIndex = (i / chunkSize) + 1;
            List<?> chunkCore = allCoreMedia.subList(i, Math.min(i + chunkSize, totalItems));
            List<MediaItem> chunkItems = (i < items.size())
                    ? items.subList(i, Math.min(i + chunkSize, items.size()))
                    : Collections.emptyList();
            boolean chunkSuccess = false;

            java.util.function.Consumer<String> cb = sActionProgressCallback;
            if (cb != null) {
                cb.accept("Decrypting & moving items (" + (i + 1) + "–" + Math.min(i + chunkSize, totalItems) + " of " + totalItems + ")...");
            }

            try {
                Object immutableList = null;
                try {
                    Class<?> ccrgClass = Class.forName("ccrg");
                    Method copyOfMethod = ccrgClass.getMethod("h", Collection.class);
                    immutableList = copyOfMethod.invoke(null, chunkCore);
                } catch (Throwable tCcrg) {
                    try {
                        Class<?> ccrgClass = Class.forName("com.google.common.collect.ImmutableList");
                        Method copyOfMethod = ccrgClass.getMethod("copyOf", Collection.class);
                        immutableList = copyOfMethod.invoke(null, chunkCore);
                    } catch (Throwable ignored) {}
                }
                if (immutableList == null) immutableList = chunkCore;

                String taskName = "com.google." + "android.apps.photos.mars.actionhandler.impl.MarsMoveHandlerImpl.MarsRemoveTask";

                Object task = null;
                String[][] configs = ToolkitMappings.MARS_REMOVE_CONFIGS;

                for (String[] cfg : configs) {
                    try {
                        Class<?> argClass = Class.forName(cfg[0]);
                        Constructor<?> argCtor = null;
                        try {
                            argCtor = argClass.getConstructor(Object.class, int.class, int.class);
                        } catch (Throwable t1) {
                            for (Constructor<?> c : argClass.getDeclaredConstructors()) {
                                if (c.getParameterTypes().length == 3) {
                                    argCtor = c;
                                    break;
                                }
                            }
                        }
                        if (argCtor == null) continue;
                        argCtor.setAccessible(true);
                        Object argInstance = null;
                        Class<?>[] ctorParams = argCtor.getParameterTypes();
                        if (ctorParams[0] == int.class) {
                            argInstance = argCtor.newInstance(accountId, immutableList, 7);
                        } else {
                            argInstance = argCtor.newInstance(immutableList, accountId, 7);
                        }

                        Class<?> enumClass = Class.forName(cfg[1]);
                        Object enumVal = enumClass.getField(cfg[2]).get(null);

                        Class<?> builderClass = Class.forName(cfg[3]);
                        Method builderMethod = null;
                        for (Method m : builderClass.getMethods()) {
                            if (m.getName().equals(cfg[4]) && m.getParameterTypes().length == 4) {
                                builderMethod = m;
                                break;
                            }
                        }
                        if (builderMethod == null) continue;
                        builderMethod.setAccessible(true);
                        Object qdp = builderMethod.invoke(null, taskName, enumVal, "mars_remove_result", argInstance);
                        if (qdp != null) {
                            Object qdn = qdp.getClass().getMethod("b").invoke(qdp);
                            task = qdn.getClass().getMethod("a").invoke(qdn);
                            if (task != null) {
                                Logger.printInfo(() -> "Created MarsRemoveTask via: " + cfg[0] + " / " + cfg[3]);
                                break;
                            }
                        }
                    } catch (Throwable ignored) {}
                }

                if (task != null) {
                    Object res = runTaskSync(context, task);

                    if (res != null) {
                        try {
                            Bundle bundle = getTaskResultBundle(res);
                            if (bundle != null) {
                                bundle.setClassLoader(context.getClassLoader());
                                Object removeResult = bundle.getParcelable("mars_remove_result");
                                if (removeResult != null) {
                                    Field fieldA = removeResult.getClass().getField("a");
                                    Object removedObj = fieldA.get(removeResult);
                                    int removed = (removedObj instanceof Collection) ? ((Collection<?>) removedObj).size() : 0;
                                    Log.i("morphe: StorageScanner", "MarsRemoveTask chunk " + chunkIndex + ": removed=" + removed);
                                    if (removed > 0) {
                                        chunkSuccess = true;
                                        totalRemovedCount += removed;
                                    }
                                }
                            }
                        } catch (Throwable tBundle) {
                            Log.w("morphe: StorageScanner", "Error reading mars_remove_result bundle: " + tBundle.getMessage());
                        }
                        if (!chunkSuccess) {
                            try {
                                int statusCode = res.getClass().getField("d").getInt(res);
                                if (statusCode == 200) {
                                    Log.i("morphe: StorageScanner", "MarsRemoveTask returned statusCode 200 for chunk " + chunkIndex);
                                    chunkSuccess = true;
                                    totalRemovedCount += chunkCore.size();
                                }
                            } catch (Throwable ignored) {}
                        }
                    }
                }

                // Fallback to direct ajac.a if rga.l did not complete
                if (!chunkSuccess) {
                    try {
                        Class<?> ajacClass = Class.forName("ajac");
                        Object ajac = getServiceLocator(context, ajacClass);
                        if (ajac != null) {
                            Method aMethod = ajacClass.getMethod("a", int.class, Collection.class, java.util.concurrent.Executor.class);
                            java.util.concurrent.Executor directExecutor = Runnable::run;
                            Object future = aMethod.invoke(ajac, accountId, immutableList, directExecutor);
                            if (future instanceof java.util.concurrent.Future) {
                                Object removeResult = ((java.util.concurrent.Future<?>) future).get(15, java.util.concurrent.TimeUnit.SECONDS);
                                if (removeResult != null) {
                                    Log.i("morphe: StorageScanner", "MarsRemoveAction (ajac.a) returned " + removeResult + " for chunk " + chunkIndex);
                                    chunkSuccess = true;
                                    totalRemovedCount += chunkCore.size();
                                }
                            }
                        }
                    } catch (Throwable tAjac) {
                        Log.w("morphe: StorageScanner", "ajac.a fallback failed for chunk " + chunkIndex, tAjac);
                    }
                }
            } catch (Throwable t) {
                Log.w("morphe: StorageScanner", "Error invoking MarsRemoveTask chunk " + chunkIndex, t);
            }

            if (chunkSuccess) {
                successCount++;
                File dbf = context != null ? context.getDatabasePath("gphotos" + accountId + ".db") : null;
                if (dbf != null && dbf.exists()) {
                    try (SQLiteDatabase db = SQLiteDatabase.openDatabase(dbf.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING)) {
                        db.beginTransaction();
                        try {
                            for (MediaItem it : chunkItems) {
                                boolean existsInRemoteMars = false;
                                ContentValues remoteMediaValues = new ContentValues();
                                if (hasTable(db, "remote_locked_media") && hasTable(db, "remote_media")) {
                                    String sel = "dedup_key = ?";
                                    List<String> selArgs = new ArrayList<>();
                                    selArgs.add(it.dedupKey);
                                    if (it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                                        sel = "(dedup_key = ? OR media_key = ?)";
                                        selArgs.add(it.mediaKey);
                                    }
                                    try (Cursor rmc = db.query("remote_locked_media", null, sel, selArgs.toArray(new String[0]), null, null, null, "1")) {
                                        if (rmc != null && rmc.moveToFirst()) {
                                            existsInRemoteMars = true;
                                            for (int ci = 0; ci < rmc.getColumnCount(); ci++) {
                                                String col = rmc.getColumnName(ci);
                                                if ("_id".equalsIgnoreCase(col)) continue;
                                                if (hasColumn(db, "remote_media", col)) {
                                                    switch (rmc.getType(ci)) {
                                                        case Cursor.FIELD_TYPE_INTEGER:
                                                            remoteMediaValues.put(col, rmc.getLong(ci));
                                                            break;
                                                        case Cursor.FIELD_TYPE_FLOAT:
                                                            remoteMediaValues.put(col, rmc.getDouble(ci));
                                                            break;
                                                        case Cursor.FIELD_TYPE_STRING:
                                                            remoteMediaValues.put(col, rmc.getString(ci));
                                                            break;
                                                        case Cursor.FIELD_TYPE_BLOB:
                                                            remoteMediaValues.put(col, rmc.getBlob(ci));
                                                            break;
                                                        case Cursor.FIELD_TYPE_NULL:
                                                            remoteMediaValues.putNull(col);
                                                            break;
                                                    }
                                                }
                                            }
                                        }
                                    } catch (Throwable tQuery) {
                                        Log.w("morphe: StorageScanner", "Failed to read remote_locked_media row for " + it.dedupKey, tQuery);
                                    }
                                }

                                if (existsInRemoteMars || it.isCloudBackedUp) {
                                    if (hasTable(db, "remote_media")) {
                                        if (hasColumn(db, "remote_media", "state")) remoteMediaValues.put("state", 0);
                                        if (hasColumn(db, "remote_media", "is_archived")) remoteMediaValues.put("is_archived", 0);
                                        if (hasColumn(db, "remote_media", "trash_timestamp")) remoteMediaValues.put("trash_timestamp", 0);
                                        if (!remoteMediaValues.containsKey("dedup_key") && it.dedupKey != null) {
                                            remoteMediaValues.put("dedup_key", it.dedupKey);
                                        }
                                        if (!remoteMediaValues.containsKey("media_key") && it.mediaKey != null) {
                                            remoteMediaValues.put("media_key", it.mediaKey);
                                        }
                                        if (!remoteMediaValues.containsKey("capture_timestamp") && it.captureTimestamp > 0) {
                                            remoteMediaValues.put("capture_timestamp", it.captureTimestamp);
                                        }
                                        if (!remoteMediaValues.containsKey("utc_timestamp") && it.captureTimestamp > 0) {
                                            remoteMediaValues.put("utc_timestamp", it.captureTimestamp);
                                        }
                                        if (!remoteMediaValues.containsKey("filename") && it.filename != null) {
                                            remoteMediaValues.put("filename", it.filename);
                                        }
                                        if (!remoteMediaValues.containsKey("size_bytes") && it.sizeBytes > 0) {
                                            remoteMediaValues.put("size_bytes", it.sizeBytes);
                                        }
                                        if (!remoteMediaValues.containsKey("type")) {
                                            remoteMediaValues.put("type", (it.duration > 0 || (it.mimeType != null && it.mimeType.startsWith("video/"))) ? 2 : 1);
                                        }
                                        if (!remoteMediaValues.containsKey("mime_type") && it.mimeType != null && !it.mimeType.isEmpty()) {
                                            remoteMediaValues.put("mime_type", it.mimeType);
                                        }
                                        if (!remoteMediaValues.containsKey("quota_charged_bytes") && it.quotaBytes >= 0 && hasColumn(db, "remote_media", "quota_charged_bytes")) {
                                            remoteMediaValues.put("quota_charged_bytes", it.quotaBytes);
                                        }
                                        db.insertWithOnConflict("remote_media", null, remoteMediaValues, SQLiteDatabase.CONFLICT_REPLACE);
                                        Log.i("morphe: StorageScanner", "Restored unlocked item into remote_media: " + it.dedupKey);
                                    }
                                } else {
                                    if (hasTable(db, "remote_media")) {
                                        ContentValues cv = new ContentValues();
                                        if (hasColumn(db, "remote_media", "state")) cv.put("state", 0);
                                        if (hasColumn(db, "remote_media", "is_archived")) cv.put("is_archived", 0);
                                        if (hasColumn(db, "remote_media", "trash_timestamp")) cv.put("trash_timestamp", 0);
                                        String whereRemote = "dedup_key = ?";
                                        List<String> argsRemote = new ArrayList<>();
                                        argsRemote.add(it.dedupKey);
                                        if (hasColumn(db, "remote_media", "media_key") && it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                                            whereRemote = "(dedup_key = ? OR media_key = ?)";
                                            argsRemote.add(it.mediaKey);
                                        }
                                        db.update("remote_media", cv, whereRemote, argsRemote.toArray(new String[0]));
                                    }
                                }

                                if (hasTable(db, "remote_locked_media")) {
                                    String where = "dedup_key = ?";
                                    List<String> args = new ArrayList<>();
                                    args.add(it.dedupKey);
                                    if (it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                                        where = "(dedup_key = ? OR media_key = ?)";
                                        args.add(it.mediaKey);
                                    }
                                    db.delete("remote_locked_media", where, args.toArray(new String[0]));
                                }
                                if (hasTable(db, "account_local_locked_media") && it.dedupKey != null && !it.dedupKey.isEmpty()) {
                                    db.delete("account_local_locked_media", "dedup_key = ?", new String[]{it.dedupKey});
                                }
                                if (hasTable(db, "media")) {
                                    ContentValues mCv = new ContentValues();
                                    mCv.put("is_archived", 0);
                                    mCv.put("trash_timestamp", 0);
                                    mCv.put("is_deleted", 0);
                                    String whereMedia = "dedup_key = ?";
                                    List<String> argsMedia = new ArrayList<>();
                                    argsMedia.add(it.dedupKey);
                                    if (hasColumn(db, "media", "canonical_media_key") && it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                                        whereMedia = "(dedup_key = ? OR canonical_media_key = ?)";
                                        argsMedia.add(it.mediaKey);
                                    }
                                    db.update("media", mCv, whereMedia, argsMedia.toArray(new String[0]));
                                }
                            }
                            db.setTransactionSuccessful();
                        } finally {
                            db.endTransaction();
                        }
                    } catch (Throwable tDb) {
                        Log.w("morphe: StorageScanner", "Error syncing local locked media DB tables", tDb);
                    }
                }
            }
        }

        Log.i("morphe: StorageScanner", "executeOnlineMarsRemoveTask finished: " + successCount + "/" + totalChunks + " chunks successful, removed " + totalRemovedCount + " items");
        return successCount > 0;
    }

    public static boolean isItemCloudBackedUp(MediaItem item) {
        if (item == null) return false;
        if (item.isCloudBackedUp) return true;
        if (item.quotaBytes > 0) return true;
        if (item.remoteUrl != null && !item.remoteUrl.trim().isEmpty()) {
            String u = item.remoteUrl.trim();
            if (u.startsWith("http://") || u.startsWith("https://") || u.startsWith("//")) {
                return true;
            }
        }
        if (item.mediaKey != null && !item.mediaKey.trim().isEmpty()) {
            String k = item.mediaKey.trim();
            if (!k.startsWith("local:") && !k.startsWith("/") && !k.startsWith("file:") && !k.equals(item.dedupKey)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isLockedFolderBackupEnabled(Context context, int accountId) {
        if (context == null) return false;
        try {
            SharedPreferences backupSp = context.getSharedPreferences("photos.backup.backup_prefs", Context.MODE_PRIVATE);
            if (backupSp != null) {
                if (backupSp.getBoolean("photos.backup.back_up_mars", false)) {
                    return true;
                }
                int backupAccountId = backupSp.getInt("backup_prefs_account_id", -1);
                if (backupAccountId != -1 && (accountId < 0 || backupAccountId == accountId)) {
                    if (backupSp.getBoolean("photos.backup.back_up_mars", false)) {
                        return true;
                    }
                }
            }
        } catch (Throwable ignored) {}

        // Fallback: Check if remote_locked_media has records in gphotos<accountId>.db
        if (accountId >= 0) {
            try {
                File dbf = context.getDatabasePath("gphotos" + accountId + ".db");
                if (dbf != null && dbf.exists()) {
                    try (SQLiteDatabase db = SQLiteDatabase.openDatabase(dbf.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING)) {
                        if (hasTable(db, "remote_locked_media")) {
                            long count = DatabaseUtils.queryNumEntries(db, "remote_locked_media");
                            if (count > 0) return true;
                        }
                    }
                }
            } catch (Throwable ignored) {}
        }

        return false;
    }

    public static boolean launchMarsUnlockIntent(Context context, int accountId) {
        if (context == null) return false;
        try {
            // Use split literal to prevent GmsCoreSupport bytecode renamer from rewriting official class paths
            String basePhotosPkg = "com.google." + "android.apps.photos";
            ClassLoader cl = context.getClassLoader();
            Class<?> marsGridClass;
            try {
                marsGridClass = cl.loadClass(basePhotosPkg + ".mars.grid.MarsGridActivity");
            } catch (Throwable t) {
                marsGridClass = Class.forName(basePhotosPkg + ".mars.grid.MarsGridActivity");
            }

            Intent gridIntent = new Intent(context, marsGridClass);
            gridIntent.putExtra("account_id", accountId);
            gridIntent.putExtra("is_mars_screen", true);
            if (!(context instanceof Activity)) {
                gridIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }

            Intent targetIntent;
            try {
                Class<?> reauthClass;
                try {
                    reauthClass = cl.loadClass(basePhotosPkg + ".mars.auth.MarsReauthActivity");
                } catch (Throwable t) {
                    reauthClass = Class.forName(basePhotosPkg + ".mars.auth.MarsReauthActivity");
                }
                Intent reauthIntent = new Intent(context, reauthClass);
                reauthIntent.putExtra("account_id", accountId);
                reauthIntent.putExtra("pass_through_intent", gridIntent);
                if (!(context instanceof Activity)) {
                    reauthIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                }
                targetIntent = reauthIntent;
            } catch (Throwable tReauth) {
                Logger.printInfo(() -> "MarsReauth fallback directly to MarsGridActivity: " + tReauth.getMessage());
                targetIntent = gridIntent;
            }

            final Intent launchIntent = targetIntent;
            if (context instanceof Activity) {
                ((Activity) context).runOnUiThread(() -> {
                    try {
                        context.startActivity(launchIntent);
                    } catch (Throwable t) {
                        Logger.printException(() -> "Error starting Mars activity on UI thread", t);
                    }
                });
            } else {
                context.startActivity(launchIntent);
            }
            return true;
        } catch (Throwable t) {
            Logger.printException(() -> "Failed to launch Locked Folder authentication", t);
            return false;
        }
    }

    private static Object createLocalId(String key) {
        if (key == null || key.isEmpty()) return null;
        String[] candidates = new String[]{"ajzv", "ahnr", "ahnl", "aijl"};
        for (String cName : candidates) {
            try {
                Class<?> clazz = Class.forName(cName);
                Method m = clazz.getMethod("a", String.class);
                Object res = m.invoke(null, key);
                if (res != null) return res;
            } catch (Throwable ignored) {}
        }
        return null;
    }

    private static Object getEmptyFeatureSet() {
        String[] candidates = new String[]{"yxd", "wrr"};
        for (String cName : candidates) {
            try {
                Class<?> clazz = Class.forName(cName);
                Field f = clazz.getField("a");
                Object res = f.get(null);
                if (res != null) return res;
            } catch (Throwable ignored) {}
        }
        return null;
    }

    private static Object createAlbumCollection(Context context, int accountId, String albumMediaKey) {
        if (albumMediaKey == null || albumMediaKey.isEmpty()) return null;
        long envelopeId = 0L;
        long collectionId = 0L;
        if (context != null) {
            try {
                File dbf = context.getDatabasePath("gphotos" + accountId + ".db");
                if (dbf != null && dbf.exists()) {
                    try (SQLiteDatabase db = SQLiteDatabase.openDatabase(dbf.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING)) {
                        if (hasTable(db, "envelopes")) {
                            try (Cursor c = db.rawQuery("SELECT _id FROM envelopes WHERE media_key = ? LIMIT 1", new String[]{albumMediaKey})) {
                                if (c != null && c.moveToFirst()) {
                                    envelopeId = c.getLong(0);
                                }
                            }
                        }
                        if (hasTable(db, "collections")) {
                            try (Cursor c = db.rawQuery("SELECT _id FROM collections WHERE collection_media_key = ? LIMIT 1", new String[]{albumMediaKey})) {
                                if (c != null && c.moveToFirst()) {
                                    collectionId = c.getLong(0);
                                }
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {}
        }

        Object localId = createLocalId(albumMediaKey);
        Object emptyFeatures = getEmptyFeatureSet();

        // 1. Try qcs(int accountId, LocalId localId, FeatureSet features) [Google Photos 7.97]
        if (localId != null && emptyFeatures != null) {
            try {
                Class<?> qcsClass = Class.forName("qcs");
                Constructor<?> ctor = qcsClass.getConstructor(int.class, localId.getClass(), emptyFeatures.getClass());
                ctor.setAccessible(true);
                Object res = ctor.newInstance(accountId, localId, emptyFeatures);
                if (res != null) return res;
            } catch (Throwable ignored) {}
        }

        // 2. Try bjld(int accountId, long albumId, LocalId localId, FeatureSet features) [Google Photos 7.97 collections]
        if (localId != null && emptyFeatures != null && collectionId != 0L) {
            try {
                Class<?> bjldClass = Class.forName("bjld");
                Constructor<?> ctor = bjldClass.getConstructor(int.class, long.class, localId.getClass(), emptyFeatures.getClass());
                ctor.setAccessible(true);
                Object res = ctor.newInstance(accountId, collectionId, localId, emptyFeatures);
                if (res != null) return res;
            } catch (Throwable ignored) {}
        }

        // 3. Shared album via bfqo(int, long, LocalId, FeatureSet) [Google Photos 7.96]
        if (envelopeId != 0L && localId != null && emptyFeatures != null) {
            try {
                Class<?> bfqoClass = Class.forName("bfqo");
                Constructor<?> ctor = bfqoClass.getConstructor(int.class, long.class, localId.getClass(), emptyFeatures.getClass());
                ctor.setAccessible(true);
                Object res = ctor.newInstance(accountId, envelopeId, localId, emptyFeatures);
                if (res != null) return res;
            } catch (Throwable ignored) {}
        }

        // 4. Try dyu.x / dyu.w
        try {
            Class<?> dyuClass = Class.forName("dyu");
            Method xMethod = dyuClass.getMethod("x", int.class, String.class);
            Object res = xMethod.invoke(null, accountId, albumMediaKey);
            if (res != null) return res;
        } catch (Throwable ignored) {}

        try {
            Class<?> dyuClass = Class.forName("dyu");
            Method wMethod = dyuClass.getMethod("w", int.class, String.class);
            Object res = wMethod.invoke(null, accountId, albumMediaKey);
            if (res != null) return res;
        } catch (Throwable ignored) {}

        return null;
    }

    private static List<?> loadAlbumMediaItems(Context context, int accountId, String albumMediaKey, List<MediaItem> items) {
        List<Object> matched = new ArrayList<>();
        if (context == null || albumMediaKey == null || albumMediaKey.isEmpty() || items == null || items.isEmpty()) return matched;
        try {
            Object collection = createAlbumCollection(context, accountId, albumMediaKey);
            if (collection != null) {
                List<?> allLoaded = loadMediaCollection(context, collection);
                if (allLoaded != null && !allLoaded.isEmpty()) {
                    if (items.size() == allLoaded.size()) {
                        matched.addAll(allLoaded);
                    } else {
                        Set<String> targetKeys = new HashSet<>();
                        for (MediaItem mi : items) {
                            if (mi.dedupKey != null && !mi.dedupKey.isEmpty()) targetKeys.add(mi.dedupKey);
                            if (mi.mediaKey != null && !mi.mediaKey.isEmpty()) targetKeys.add(mi.mediaKey);
                        }
                        String[] zonCandidates = new String[] {"zon", "zoi", "zog", "zkr"};
                        Class<?> zonClass = null;
                        for (String zc : zonCandidates) {
                            try { zonClass = Class.forName(zc); break; } catch (Throwable ignored) {}
                        }
                        for (Object media : allLoaded) {
                            String dKey = (zonClass != null) ? extractDedupKey(media, zonClass) : null;
                            if (dKey != null && targetKeys.contains(dKey)) {
                                matched.add(media);
                            }
                        }
                        if (matched.isEmpty()) {
                            matched.addAll(allLoaded);
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.w("morphe: StorageScanner", "loadAlbumMediaItems error: " + t.getMessage());
        }
        return matched;
    }

    private static boolean executeOnlineRemoveFromAlbumTask(Context context, int accountId, String albumMediaKey, List<MediaItem> items) {
        if (context == null || albumMediaKey == null || albumMediaKey.isEmpty() || items == null || items.isEmpty()) return false;
        Log.i("morphe: StorageScanner", "executeOnlineRemoveFromAlbumTask: starting for " + items.size() + " items from " + albumMediaKey);

        int chunkSize = 50;
        int totalChunks = (items.size() + chunkSize - 1) / chunkSize;
        int successCount = 0;

        for (int i = 0; i < items.size(); i += chunkSize) {
            int chunkIndex = (i / chunkSize) + 1;
            List<MediaItem> chunk = items.subList(i, Math.min(i + chunkSize, items.size()));
            boolean chunkSuccess = false;

            try {
                List<?> coreItems = loadAlbumMediaItems(context, accountId, albumMediaKey, chunk);
                if (coreItems.isEmpty()) {
                    coreItems = loadCoreMediaItems(context, accountId, chunk);
                }
                if (!coreItems.isEmpty()) {
                    Object collection = createAlbumCollection(context, accountId, albumMediaKey);
                    Object task = null;

                    // Strategy 1: Static task factory via ToolkitMappings.PRIVATE_ALBUM_REMOVE_CLASSES (omn.a / osi.c / iyo.r)
                    if (collection != null) {
                        for (String rClassCandidate : ToolkitMappings.PRIVATE_ALBUM_REMOVE_CLASSES) {
                            try {
                                Class<?> rClazz = ReflectionCache.findClassOrNull(rClassCandidate);
                                if (rClazz != null) {
                                    for (Method m : rClazz.getMethods()) {
                                        if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) &&
                                            m.getParameterTypes().length == 3 &&
                                            m.getParameterTypes()[0] == int.class &&
                                            (m.getParameterTypes()[2] == List.class || m.getParameterTypes()[2] == Collection.class)) {
                                            task = m.invoke(null, accountId, collection, coreItems);
                                            if (task != null) {
                                                Log.i("morphe: StorageScanner", "Created RemoveMediaFromPrivateAlbumTask via " + rClassCandidate + "." + m.getName() + ": " + task);
                                                break;
                                            }
                                        }
                                    }
                                    if (task != null) break;
                                }
                            } catch (Throwable tRemove) {
                                Log.w("morphe: StorageScanner", rClassCandidate + " reflection failed: " + tRemove.getMessage());
                            }
                        }
                    }

                    // Try 3: Task worker orj / mom with rga.h
                    if (task == null) {
                        Object localId = createLocalId(albumMediaKey);
                        String[] workerCandidates = new String[]{"orj", "mom"};
                        for (String wName : workerCandidates) {
                            try {
                                Class<?> wClass = Class.forName(wName);
                                Constructor<?> wCtor = wClass.getConstructor(int.class, Object.class, Object.class, int.class);
                                wCtor.setAccessible(true);
                                Object worker = (localId != null)
                                        ? wCtor.newInstance(accountId, localId, coreItems, 1)
                                        : (collection != null ? wCtor.newInstance(accountId, collection, coreItems, 0) : null);
                                if (worker != null) {
                                    Class<?> rgaClass = Class.forName("rga");
                                    Object priority = null;
                                    String[] enumCandidates = new String[]{"bdft", "azlk"};
                                    for (String eName : enumCandidates) {
                                        try {
                                            Class<?> eClass = Class.forName(eName);
                                            priority = eClass.getField("yK").get(null);
                                            if (priority != null) break;
                                        } catch (Throwable ignored) {}
                                    }
                                    for (Method m : rgaClass.getMethods()) {
                                        if ("h".equals(m.getName()) && m.getParameterTypes().length == 3) {
                                            Object qdpInst = m.invoke(null, "RemoveMediaFromPrivateAlbumTask", priority, worker);
                                            Method bMethod = qdpInst.getClass().getMethod("b");
                                            Object qdnInst = bMethod.invoke(qdpInst);
                                            Method aMethod = qdnInst.getClass().getMethod("a");
                                            task = aMethod.invoke(qdnInst);
                                            Log.i("morphe: StorageScanner", "Created RemoveMediaFromPrivateAlbumTask via " + wName + ": " + task);
                                            break;
                                        }
                                    }
                                    if (task != null) break;
                                }
                            } catch (Throwable ignored) {}
                        }
                    }

                    // Try 4: RemoveFromCollectionTask (Shared collections)
                    if (task == null && collection != null) {
                        try {
                            Class<?> taskClass = Class.forName("com.google.android.apps.photos.album.removefromalbum.RemoveFromCollectionTask");
                            Class<?> colClass = null;
                            for (String cName : new String[]{"camh", "bwpg"}) {
                                try { colClass = Class.forName(cName); break; } catch (Throwable ignored) {}
                            }
                            if (colClass != null) {
                                Constructor<?> ctor = taskClass.getConstructor(int.class, Collection.class, colClass);
                                task = ctor.newInstance(accountId, coreItems, collection);
                                Log.i("morphe: StorageScanner", "Created RemoveFromCollectionTask: " + task);
                            }
                        } catch (Throwable tTask) {
                            Log.w("morphe: StorageScanner", "RemoveFromCollectionTask reflection failed: " + tTask.getMessage());
                        }
                    }

                    if (task != null) {
                        Object res = runTaskSync(context, task);
                        if (res != null) {
                            try {
                                int statusCode = getTaskStatusCode(res);
                                Log.i("morphe: StorageScanner", "Remove task chunk " + chunkIndex + " status: " + statusCode);
                                if (statusCode == 200) {
                                    chunkSuccess = true;
                                } else {
                                    try {
                                        Object exc = res.getClass().getField("e").get(res);
                                        Log.w("morphe: StorageScanner", "Remove task returned error status " + statusCode, (Throwable) exc);
                                    } catch (Throwable ignored) {}
                                }
                            } catch (Throwable ignored) {
                                chunkSuccess = true;
                            }
                        }
                    }
                } else {
                    Log.w("morphe: StorageScanner", "loadAlbumMediaItems returned 0 items for chunk " + chunkIndex);
                }
            } catch (Throwable t) {
                Log.w("morphe: StorageScanner", "Error invoking Remove task chunk " + chunkIndex, t);
            }

            if (chunkSuccess) successCount++;
        }

        // Optimistic purge in local tables (remote_media, shared_media, item_collection_data) with WAL enabled
        int localDeletedRows = 0;
        try {
            File dbf = context.getDatabasePath("gphotos" + accountId + ".db");
            if (dbf != null && dbf.exists()) {
                try (SQLiteDatabase db = SQLiteDatabase.openDatabase(dbf.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING)) {
                    for (MediaItem it : items) {
                        String mKey = it.mediaKey != null && !it.mediaKey.isEmpty() ? it.mediaKey : it.dedupKey;
                        if (hasTable(db, "remote_media")) {
                            localDeletedRows += db.delete("remote_media", "(dedup_key = ? OR media_key = ?) AND collection_id = ?", new String[]{it.dedupKey, mKey, albumMediaKey});
                        }
                        if (hasTable(db, "shared_media")) {
                            localDeletedRows += db.delete("shared_media", "(dedup_key = ? OR media_key = ?) AND collection_id = ?", new String[]{it.dedupKey, mKey, albumMediaKey});
                        }
                        if (hasTable(db, "item_collection_data")) {
                            localDeletedRows += db.delete("item_collection_data", "(canonical_id = ? OR canonical_id = ? OR icd_id LIKE ? OR icd_id LIKE ?) AND collection_id = ?",
                                    new String[]{mKey, it.dedupKey, "%" + mKey + "%", "%" + it.dedupKey + "%", albumMediaKey});
                        }
                    }
                    if (hasTable(db, "collections")) {
                        db.execSQL("UPDATE collections SET total_items = MAX(0, total_items - " + items.size() + ") WHERE collection_media_key = ?", new Object[]{albumMediaKey});
                    }
                    if (hasTable(db, "envelopes")) {
                        db.execSQL("UPDATE envelopes SET total_items = MAX(0, total_items - " + items.size() + ") WHERE media_key = ?", new Object[]{albumMediaKey});
                    }
                }
            }
        } catch (Throwable ignored) {}

        Log.i("morphe: StorageScanner", "executeOnlineRemoveFromAlbumTask finished: " + successCount + "/" + totalChunks + " chunks successful, localDeletedRows=" + localDeletedRows);
        return successCount > 0 || localDeletedRows > 0;
    }

    public static Long parseDateFromFilename(String filename) {
        if (filename == null || filename.trim().isEmpty()) return null;
        String baseName = new File(filename).getName();
        int dot = baseName.lastIndexOf('.');
        if (dot > 0) baseName = baseName.substring(0, dot);

        // Pattern 1: YYYYMMDD_HHMMSS or YYYYMMDD-HHMMSS or YYYYMMDDTHHMMSS
        Pattern p1 = Pattern.compile(".*?(20\\d{2}|19\\d{2})[-_]?([01]\\d)[-_]?([0-3]\\d)[_T -]?([0-2]\\d)[-_:.]?([0-5]\\d)[-_:.]?([0-5]\\d).*");
        Matcher m1 = p1.matcher(baseName);
        if (m1.matches()) {
            try {
                int y = Integer.parseInt(m1.group(1));
                int mo = Integer.parseInt(m1.group(2));
                int d = Integer.parseInt(m1.group(3));
                int h = Integer.parseInt(m1.group(4));
                int mi = Integer.parseInt(m1.group(5));
                int s = Integer.parseInt(m1.group(6));
                if (mo >= 1 && mo <= 12 && d >= 1 && d <= 31 && h <= 23 && mi <= 59 && s <= 59) {
                    java.util.Calendar cal = java.util.Calendar.getInstance();
                    cal.set(y, mo - 1, d, h, mi, s);
                    cal.set(java.util.Calendar.MILLISECOND, 0);
                    return cal.getTimeInMillis();
                }
            } catch (Throwable ignored) {}
        }

        // Pattern 2: YYYYMMDD or YYYY-MM-DD or YYYY_MM_DD
        Pattern p2 = Pattern.compile(".*?(20\\d{2}|19\\d{2})[-_]?([01]\\d)[-_]?([0-3]\\d).*");
        Matcher m2 = p2.matcher(baseName);
        if (m2.matches()) {
            try {
                int y = Integer.parseInt(m2.group(1));
                int mo = Integer.parseInt(m2.group(2));
                int d = Integer.parseInt(m2.group(3));
                if (mo >= 1 && mo <= 12 && d >= 1 && d <= 31) {
                    java.util.Calendar cal = java.util.Calendar.getInstance();
                    cal.set(y, mo - 1, d, 12, 0, 0);
                    cal.set(java.util.Calendar.MILLISECOND, 0);
                    return cal.getTimeInMillis();
                }
            } catch (Throwable ignored) {}
        }

        return null;
    }

    private static ActionResult executeSetDateFromFilename(Context context, AccountInfo account, List<MediaItem> items) {
        if (context == null || account == null || items == null || items.isEmpty()) {
            return new ActionResult(false, 0, "No items to process");
        }

        int updatedCount = 0;
        int skippedCount = 0;

        File dbFile = new File(account.dbPath);
        SQLiteDatabase db = null;
        try {
            if (dbFile.exists()) {
                db = SQLiteDatabase.openDatabase(dbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
                db.beginTransaction();
            }

            Class<?> bwzeClass = ReflectionCache.findClassOrNull("bwze");
            Constructor<?> bwzeCtor = (bwzeClass != null) ? ReflectionCache.getConstructorOrNull(bwzeClass, long.class, long.class) : null;
            Class<?> ccrgClass = ReflectionCache.findClassOrNull("ccrg");
            Method copyOfMethod = (ccrgClass != null) ? ReflectionCache.getMethodOrNull(ccrgClass, "h", Collection.class) : null;
            Class<?> ajwaClass = ReflectionCache.findClassOrNull("ajwa");
            Constructor<?> ajwaCtor = (ajwaClass != null && bwzeClass != null && ccrgClass != null)
                    ? ReflectionCache.getConstructorOrNull(ajwaClass, int.class, ccrgClass, bwzeClass, bwzeClass, int.class) : null;
            Class<?> azlkClass = ReflectionCache.findClassOrNull("azlk");
            Field muField = (azlkClass != null) ? ReflectionCache.getDeclaredFieldOrNull(azlkClass, "mu") : null;
            Object azlkMu = null;
            try {
                if (muField != null) azlkMu = muField.get(null);
            } catch (Throwable ignored) {}
            Class<?> rgaClass = ReflectionCache.findClassOrNull("rga");
            Class<?> azllClass = ReflectionCache.findClassOrNull("azll");
            Class<?> qdoClass = ReflectionCache.findClassOrNull("qdo");
            Method gMethod = (rgaClass != null && azllClass != null && qdoClass != null)
                    ? ReflectionCache.getMethodOrNull(rgaClass, "g", String.class, azllClass, qdoClass) : null;

            for (MediaItem item : items) {
                Long parsedDate = parseDateFromFilename(item.filename);
                if (parsedDate == null) {
                    skippedCount++;
                    continue;
                }

                long oldUtc = item.captureTimestamp > 0 ? item.captureTimestamp : System.currentTimeMillis();
                long newUtc = parsedDate;

                // 1. Dispatch EditDateTimeTask
                try {
                    List<?> coreItems = loadCoreMediaItems(context, account.accountId, Collections.singletonList(item));
                    if (!coreItems.isEmpty() && bwzeCtor != null && copyOfMethod != null && ajwaCtor != null && gMethod != null) {
                        Object oldBwze = bwzeCtor.newInstance(oldUtc, 0L);
                        Object newBwze = bwzeCtor.newInstance(newUtc, 0L);
                        Object immutableList = copyOfMethod.invoke(null, coreItems);
                        Object ajwaInstance = ajwaCtor.newInstance(account.accountId, immutableList, oldBwze, newBwze, 1);
                        Object qdp = gMethod.invoke(null, "com.google.android.photos.mediadetails.datetime.EditDateTimeTask", azlkMu, ajwaInstance);
                        if (qdp != null) {
                            Object qdn = ReflectionCache.getMethod(qdp.getClass(), "b").invoke(qdp);
                            Object task = ReflectionCache.getMethod(qdn.getClass(), "a").invoke(qdn);
                            runTaskSync(context, task);
                        }
                    }
                } catch (Throwable tTask) {
                    Log.w("morphe: StorageScanner", "EditDateTimeTask error for " + item.filename, tTask);
                }

                // 2. Local database update
                if (db != null) {
                    try {
                        ContentValues cv = new ContentValues();
                        cv.put("capture_timestamp", newUtc);
                        cv.put("utc_timestamp", newUtc);
                        db.update("remote_media", cv, "dedup_key = ?", new String[]{item.dedupKey});
                        if (hasTable(db, "media")) db.update("media", cv, "dedup_key = ?", new String[]{item.dedupKey});
                        if (hasTable(db, "local_media")) db.update("local_media", cv, "dedup_key = ?", new String[]{item.dedupKey});
                    } catch (Throwable tDb) {
                        Log.w("morphe: StorageScanner", "Local db date update error for " + item.filename, tDb);
                    }
                }

                updatedCount++;
            }

            if (db != null) {
                db.setTransactionSuccessful();
            }
        } finally {
            if (db != null) {
                try { db.endTransaction(); } catch (Throwable ignored) {}
                try { db.close(); } catch (Throwable ignored) {}
            }
        }

        triggerOnlineSync(context, account.accountId);
        notifyUiChanges(context, account.accountId);

        if (updatedCount == 0 && skippedCount > 0) {
            return new ActionResult(false, 0, "No parseable timestamps found in filenames (" + skippedCount + " skipped)");
        }
        return new ActionResult(true, updatedCount, "Successfully updated dates for " + updatedCount + " items" + (skippedCount > 0 ? " (" + skippedCount + " skipped)" : ""));
    }

    private static void triggerOnlineSync(Context context, int accountId) {
        if (context == null) return;
        try {
            Class<?> syncTaskClass = Class.forName("com.google.android.apps.photos.metasync.actionqueue.block.SyncActionQueueBlock$SyncBackgroundTask");
            Constructor<?> syncCtor = syncTaskClass.getConstructor(int.class);
            Object syncTask = syncCtor.newInstance(accountId);
            try {
                runTaskSync(context, syncTask);
                Logger.printInfo(() -> "Successfully executed SyncActionQueueBlock synchronously for account " + accountId);
            } catch (Throwable tSync) {
                runTaskAsync(context, syncTask);
                Logger.printInfo(() -> "Scheduled SyncActionQueueBlock asynchronously for account " + accountId);
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Could not run SyncActionQueueBlock", t);
        }

        try {
            Class<?> userMediaSyncTaskClass = Class.forName("com.google.android.apps.photos.assistant.remote.provider.PerformSyncUserMediaBackgroundTask");
            Constructor<?> userMediaCtor = userMediaSyncTaskClass.getConstructor(int.class);
            Object userMediaTask = userMediaCtor.newInstance(accountId);
            runTaskAsync(context, userMediaTask);
            Logger.printInfo(() -> "Scheduled PerformSyncUserMediaBackgroundTask for account " + accountId);
        } catch (Throwable t) {
            try {
                Class<?> deltaSyncClass = Class.forName("com.google.android.apps.photos.metasync.fetcher.PerformDeltaSyncBackgroundTask");
                Constructor<?> deltaCtor = deltaSyncClass.getConstructor(int.class);
                Object deltaTask = deltaCtor.newInstance(accountId);
                runTaskAsync(context, deltaTask);
                Logger.printInfo(() -> "Scheduled PerformDeltaSyncBackgroundTask for account " + accountId);
            } catch (Throwable ignored) {}
        }
    }

    private static void notifyUiChanges(Context context, int accountId) {
        if (context == null) return;
        try {
            Class<?> bbphClass = Class.forName("bbph");
            Constructor<?> ctor = bbphClass.getConstructor(Context.class);
            Object monitor = ctor.newInstance(context);
            bbphClass.getMethod("c", int.class).invoke(monitor, accountId);
            bbphClass.getMethod("d", int.class).invoke(monitor, accountId);
            Log.i("morphe: StorageScanner", "Notified bbph UI monitor for account " + accountId);
        } catch (Throwable t) {
            Log.w("morphe: StorageScanner", "Error in bbph UI notification: " + t.getMessage());
        }

        // Notify Google Photos native MediaMonitor to reload photo feeds and archive screens
        try {
            Class<?> bybjClass = Class.forName("bybj");
            Constructor<?> bybjCtor = bybjClass.getConstructor(Context.class);
            Object bybjInst = bybjCtor.newInstance(context);
            bybjClass.getMethod("a").invoke(bybjInst);
            Log.i("morphe: StorageScanner", "Notified bybj MediaMonitor for account " + accountId);
        } catch (Throwable t) {
            Log.w("morphe: StorageScanner", "Error in bybj MediaMonitor: " + t.getMessage());
        }

        try {
            Intent fireAlarm = new Intent("com.google.android.libraries.social.mediamonitor.FIRE_ALARM");
            fireAlarm.setPackage(context.getPackageName());
            context.sendBroadcast(fireAlarm);
        } catch (Throwable ignored) {}

        try {
            ContentResolver cr = context.getContentResolver();
            cr.notifyChange(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, null);
            cr.notifyChange(MediaStore.Video.Media.EXTERNAL_CONTENT_URI, null);

            String pkg = context.getPackageName();
            String[] authorities = new String[]{
                pkg + ".contentprovider",
                "com.google.android.apps.photos.contentprovider",
                "GPhotos"
            };
            for (String auth : authorities) {
                try {
                    cr.notifyChange(Uri.parse("content://" + auth + "/media"), null);
                    cr.notifyChange(Uri.parse("content://" + auth + "/all_media"), null);
                    cr.notifyChange(Uri.parse("content://" + auth + "/remote_media"), null);
                    cr.notifyChange(Uri.parse("content://" + auth + "/archive"), null);
                    cr.notifyChange(Uri.parse("content://" + auth + "/trash"), null);
                    cr.notifyChange(Uri.parse("content://" + auth + "/collections"), null);
                } catch (Throwable ignored) {}
            }
        } catch (Throwable ignored) {}
    }

    public static ActionResult executeDatabaseAction(Context context, AccountInfo account, String actionId, List<MediaItem> items, String param) {
        if (account == null) return new ActionResult(false, 0, "No account selected");
        if ((items == null || items.isEmpty()) && !("toTrash".equals(actionId) && param != null && !param.trim().isEmpty())) {
            return new ActionResult(false, 0, "No items selected");
        }

        // Native Cloud Album handling (runs via Google Photos TaskRunner and syncs to cloud)
        if ("toNewAlbum".equals(actionId)) {
            String newAlbumName = param != null && !param.trim().isEmpty() ? param.trim() : "New Album";
            List<String> mediaKeys = resolveRemoteMediaKeys(account, items);
            int[] outAdded = new int[1];
            String cloudAlbumKey = createNativeCloudAlbum(context, account.accountId, newAlbumName, mediaKeys, outAdded);
            if (cloudAlbumKey == null) {
                return new ActionResult(false, 0, "Failed to create cloud album on Google Photos servers. Please check your internet connection.");
            }
            int count = outAdded[0];
            if (mediaKeys.isEmpty() && items != null && !items.isEmpty()) {
                return new ActionResult(true, count, "Created album '" + newAlbumName + "'. Note: Selected local item(s) must be backed up to cloud before adding to album.");
            }
            return new ActionResult(true, count, "Successfully created album '" + newAlbumName + "' with " + count + " items");
        }

        if ("toExistingAlbum".equals(actionId)) {
            if (param == null || param.trim().isEmpty()) {
                return new ActionResult(false, 0, "No album selected");
            }
            String existingColKey = param.trim();
            List<String> mediaKeys = resolveRemoteMediaKeys(account, items);
            if (mediaKeys.isEmpty()) {
                return new ActionResult(false, 0, "None of the selected items are backed up to cloud yet. Google Photos albums require backed-up photos.");
            }
            int added = addMediaToCloudAlbum(context, account.accountId, existingColKey, mediaKeys);
            if (added <= 0) {
                return new ActionResult(false, 0, "Failed to add items to cloud album on Google Photos servers.");
            }
            return new ActionResult(true, added, "Successfully added " + added + " items to album");
        }

        if ("lock".equals(actionId)) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && !Environment.isExternalStorageManager()) {
                try {
                    Intent intent = new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION);
                    intent.setData(Uri.parse("package:" + context.getPackageName()));
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    context.startActivity(intent);
                    return new ActionResult(false, 0, "All files access is required to move local camera media to Locked Folder. Please allow access in Settings.");
                } catch (Throwable tSettings) {
                    try {
                        Intent intent = new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION);
                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        context.startActivity(intent);
                        return new ActionResult(false, 0, "All files access is required to move local camera media to Locked Folder. Please allow access in Settings.");
                    } catch (Throwable ignored) {}
                }
            }

            boolean dispatched = executeOnlineMarsMoveTask(context, account.accountId, items);
            Logger.printInfo(() -> "executeOnlineMarsMoveTask result: " + dispatched);
            triggerOnlineSync(context, account.accountId);
            notifyUiChanges(context, account.accountId);
            int count = (items != null) ? items.size() : 0;
            return new ActionResult(dispatched, count, dispatched ? "Successfully moved " + count + " items to Locked Folder" : "Failed to move items to Locked Folder");
        }

        if ("unLock".equals(actionId)) {
            java.util.function.Consumer<String> cb = sActionProgressCallback;
            if (cb != null) {
                cb.accept("Unlocking " + ((items != null) ? items.size() : 0) + " items from Locked Folder...");
            }
            boolean ok = executeOnlineMarsRemoveTask(context, account.accountId, items);
            Logger.printInfo(() -> "executeOnlineMarsRemoveTask result: " + ok);
            triggerOnlineSync(context, account.accountId);
            notifyUiChanges(context, account.accountId);
            int count = (items != null) ? items.size() : 0;
            return new ActionResult(ok, count, ok
                    ? "Successfully moved " + count + " items out of Locked Folder to Cloud Library"
                    : "Failed to unlock items from Locked Folder");
        }

        if ("removeFromAlbum".equals(actionId)) {
            String albumKeyParam = param != null && !param.trim().isEmpty() ? param.trim() : null;
            if (albumKeyParam == null) {
                return new ActionResult(false, 0, "No album specified to remove items from");
            }
            boolean dispatched = false;
            String[] albumKeys = albumKeyParam.split(",");
            for (String key : albumKeys) {
                String k = key.trim();
                if (!k.isEmpty()) {
                    if (executeOnlineRemoveFromAlbumTask(context, account.accountId, k, items)) {
                        dispatched = true;
                    }
                }
            }
            final boolean finalDispatched = dispatched;
            Logger.printInfo(() -> "executeOnlineRemoveFromAlbumTask result: " + finalDispatched);
            triggerOnlineSync(context, account.accountId);
            notifyUiChanges(context, account.accountId);
            int count = (items != null) ? items.size() : 0;
            return new ActionResult(dispatched, count, dispatched ? "Successfully removed " + count + " items from album" : "Failed to remove items from album");
        }

        if ("setDateFromFilename".equals(actionId)) {
            ActionResult res = executeSetDateFromFilename(context, account, items);
            triggerOnlineSync(context, account.accountId);
            notifyUiChanges(context, account.accountId);
            return res;
        }

        if ("toTrash".equals(actionId)) {
            // 1. Invoke official Google Photos MoveToTrashActionWrapper synchronously FIRST
            boolean dispatchedOnlineTrash = executeOnlineTrashTask(context, account.accountId, items);
            Logger.printInfo(() -> "Executed official online trash task: " + dispatchedOnlineTrash);


            // 2. Invoke official Google Photos DeleteSharedCollectionTask / mne synchronously SECOND while envelopes/collections are intact
            int deletedAlbums = 0;
            if (param != null && !param.trim().isEmpty()) {
                String[] albumKeys = param.split(",");
                for (String albKey : albumKeys) {
                    String key = albKey.trim();
                    if (key.isEmpty()) continue;
                    boolean albSuccess = deleteCloudAlbum(context, account.accountId, key);
                    Logger.printInfo(() -> "deleteCloudAlbum(" + key + ") result: " + albSuccess);
                    deletedAlbums++;
                }
            }

            // 3. Optimistic local database update on media, remote_media, local_media
            if (items != null && !items.isEmpty()) {
                File dbFile = new File(account.dbPath);
                if (dbFile.exists()) {
                    SQLiteDatabase localDb = null;
                    try {
                        localDb = SQLiteDatabase.openDatabase(dbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
                        localDb.beginTransaction();
                        long now = System.currentTimeMillis();
                        for (MediaItem it : items) {
                            ContentValues cv = new ContentValues();
                            cv.put("trash_timestamp", now);
                            if (hasColumn(localDb, "remote_media", "state")) cv.put("state", 2);
                            cv.put("is_archived", 0);
                            localDb.update("remote_media", cv, "dedup_key = ?", new String[]{it.dedupKey});
                            if (hasTable(localDb, "media")) {
                                ContentValues mCv = new ContentValues();
                                mCv.put("trash_timestamp", now);
                                mCv.put("is_deleted", 1);
                                mCv.put("is_archived", 0);
                                localDb.update("media", mCv, "dedup_key = ?", new String[]{it.dedupKey});
                            }
                            // Do not modify local_media.trash_timestamp directly: local disk files must only be
                            // trashed via Android MediaStore, otherwise Google Photos app restore will conflict with OS MediaStore.
                        }
                        localDb.setTransactionSuccessful();
                        localDb.endTransaction();
                    } catch (Throwable tLocal) {
                        Logger.printException(() -> "Error in local trash update", tLocal);
                    } finally {
                        if (localDb != null) {
                            try { localDb.close(); } catch (Throwable ignored) {}
                        }
                    }
                }
            }

            // 4. Trigger MetaSync & ActionQueue sync to flush to Google Photos servers
            triggerOnlineSync(context, account.accountId);
            notifyUiChanges(context, account.accountId);

            int count = (items != null) ? items.size() : 0;
            if (deletedAlbums > 0) {
                return new ActionResult(true, count, "Moved " + count + " items to Trash & deleted " + deletedAlbums + " album(s)");
            }
            return new ActionResult(true, count, "Successfully moved " + count + " items to Trash");
        }

        File dbFile = new File(account.dbPath);
        if (!dbFile.exists()) return new ActionResult(false, 0, "Database file not found");

        int count = (items != null) ? items.size() : 0;
        long now = System.currentTimeMillis();

        // Dispatch online RPC tasks first, before opening a local database transaction,
        // so background/worker tasks and psu.a do not experience SQLite lock contention.
        if ("restoreTrash".equals(actionId)) {
            boolean dispatchedOnlineRestore = executeOnlineRestoreTask(context, account.accountId, items);
            Logger.printInfo(() -> "Dispatched official online restore task: " + dispatchedOnlineRestore);
            if (!dispatchedOnlineRestore) {
                return new ActionResult(false, 0, "Cloud restore failed: unable to resolve trash items from Google Photos servers");
            }
        } else if ("toArchive".equals(actionId)) {
            boolean dispatchedOnlineArchive = executeOnlineArchiveTask(context, account.accountId, items, true);
            Logger.printInfo(() -> "Dispatched official online archive task: " + dispatchedOnlineArchive);
        } else if ("unArchive".equals(actionId)) {
            boolean dispatchedOnlineUnarchive = executeOnlineArchiveTask(context, account.accountId, items, false);
            Logger.printInfo(() -> "Dispatched official online unarchive task: " + dispatchedOnlineUnarchive);
        } else if ("toFavorite".equals(actionId)) {
            boolean dispatchedOnlineFav = executeOnlineFavoriteTask(context, account.accountId, items, true);
            Logger.printInfo(() -> "Dispatched official online favorite task: " + dispatchedOnlineFav);
        } else if ("unFavorite".equals(actionId)) {
            boolean dispatchedOnlineUnfav = executeOnlineFavoriteTask(context, account.accountId, items, false);
            Logger.printInfo(() -> "Dispatched official online unfavorite task: " + dispatchedOnlineUnfav);
        }

        SQLiteDatabase db = null;
        try {
            db = SQLiteDatabase.openDatabase(dbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
            db.beginTransaction();

            switch (actionId) {
                case "restoreTrash":
                    for (MediaItem it : items) {
                        ContentValues cv = new ContentValues();
                        cv.put("trash_timestamp", 0);
                        if (hasColumn(db, "remote_media", "state")) cv.put("state", 0);
                        db.update("remote_media", cv, "dedup_key = ?", new String[]{it.dedupKey});
                        if (hasTable(db, "media")) {
                            ContentValues mCv = new ContentValues();
                            mCv.put("trash_timestamp", 0);
                            mCv.put("is_deleted", 0);
                            db.update("media", mCv, "dedup_key = ?", new String[]{it.dedupKey});
                        }
                        if (hasTable(db, "local_media")) {
                            ContentValues lCv = new ContentValues();
                            lCv.put("trash_timestamp", 0);
                            if (hasColumn(db, "local_media", "state")) lCv.put("state", 0);
                            if (hasColumn(db, "local_media", "desired_state")) lCv.put("desired_state", 0);
                            db.update("local_media", lCv, "dedup_key = ?", new String[]{it.dedupKey});
                        }
                    }

                    db.setTransactionSuccessful();
                    db.endTransaction();
                    try { db.close(); db = null; } catch (Throwable ignored) {}

                    triggerOnlineSync(context, account.accountId);
                    notifyUiChanges(context, account.accountId);

                    return new ActionResult(true, count, "Successfully restored " + count + " items from Trash");

                case "toArchive":
                    boolean hasRemoteArchiveOrigin = hasColumn(db, "remote_media", "last_archive_origin");
                    boolean hasMediaArchiveOrigin = hasTable(db, "media") && hasColumn(db, "media", "last_archive_origin");
                    boolean hasLocalArchiveOrigin = hasTable(db, "local_media") && hasColumn(db, "local_media", "last_archive_origin");
                    boolean hasRemoteMediaKey = hasColumn(db, "remote_media", "media_key");
                    boolean hasRemoteRemoteMediaKey = hasColumn(db, "remote_media", "remote_media_key");
                    boolean hasMediaCanonical = hasTable(db, "media") && hasColumn(db, "media", "canonical_media_key");

                    for (MediaItem it : items) {
                        ContentValues cv = new ContentValues();
                        cv.put("is_archived", 1);
                        cv.put("trash_timestamp", 0);
                        if (hasRemoteArchiveOrigin) cv.put("last_archive_origin", 1);
                        if (hasColumn(db, "remote_media", "state")) cv.put("state", 0);

                        String whereRemote;
                        List<String> argsRemote = new ArrayList<>();
                        if (it.dedupKey != null && !it.dedupKey.isEmpty()) {
                            if (it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                                if (hasRemoteRemoteMediaKey && hasRemoteMediaKey) {
                                    whereRemote = "(dedup_key = ? OR media_key = ? OR remote_media_key = ?)";
                                    argsRemote.add(it.dedupKey);
                                    argsRemote.add(it.mediaKey);
                                    argsRemote.add(it.mediaKey);
                                } else if (hasRemoteRemoteMediaKey) {
                                    whereRemote = "(dedup_key = ? OR remote_media_key = ?)";
                                    argsRemote.add(it.dedupKey);
                                    argsRemote.add(it.mediaKey);
                                } else if (hasRemoteMediaKey) {
                                    whereRemote = "(dedup_key = ? OR media_key = ?)";
                                    argsRemote.add(it.dedupKey);
                                    argsRemote.add(it.mediaKey);
                                } else {
                                    whereRemote = "dedup_key = ?";
                                    argsRemote.add(it.dedupKey);
                                }
                            } else {
                                whereRemote = "dedup_key = ?";
                                argsRemote.add(it.dedupKey);
                            }
                        } else if (it.mediaKey != null && !it.mediaKey.isEmpty()) {
                            if (hasRemoteRemoteMediaKey && hasRemoteMediaKey) {
                                whereRemote = "(media_key = ? OR remote_media_key = ?)";
                                argsRemote.add(it.mediaKey);
                                argsRemote.add(it.mediaKey);
                            } else if (hasRemoteRemoteMediaKey) {
                                whereRemote = "remote_media_key = ?";
                                argsRemote.add(it.mediaKey);
                            } else {
                                whereRemote = "media_key = ?";
                                argsRemote.add(it.mediaKey);
                            }
                        } else {
                            continue;
                        }

                        db.update("remote_media", cv, whereRemote, argsRemote.toArray(new String[0]));

                        if (hasTable(db, "media")) {
                            ContentValues mCv = new ContentValues();
                            mCv.put("is_archived", 1);
                            mCv.put("trash_timestamp", 0);
                            mCv.put("is_deleted", 0);
                            if (hasMediaArchiveOrigin) mCv.put("last_archive_origin", 1);

                            String whereMedia;
                            List<String> argsMedia = new ArrayList<>();
                            if (it.dedupKey != null && !it.dedupKey.isEmpty()) {
                                if (hasMediaCanonical && it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                                    whereMedia = "(dedup_key = ? OR canonical_media_key = ?)";
                                    argsMedia.add(it.dedupKey);
                                    argsMedia.add(it.mediaKey);
                                } else {
                                    whereMedia = "dedup_key = ?";
                                    argsMedia.add(it.dedupKey);
                                }
                            } else if (hasMediaCanonical && it.mediaKey != null && !it.mediaKey.isEmpty()) {
                                whereMedia = "canonical_media_key = ?";
                                argsMedia.add(it.mediaKey);
                            } else {
                                whereMedia = null;
                            }
                            if (whereMedia != null) {
                                db.update("media", mCv, whereMedia, argsMedia.toArray(new String[0]));
                            }
                        }
                        if (hasTable(db, "local_media") && it.dedupKey != null && !it.dedupKey.isEmpty()) {
                            ContentValues lCv = new ContentValues();
                            lCv.put("is_archived", 1);
                            lCv.put("trash_timestamp", 0);
                            if (hasLocalArchiveOrigin) lCv.put("last_archive_origin", 1);
                            if (hasColumn(db, "local_media", "state")) lCv.put("state", 0);
                            if (hasColumn(db, "local_media", "desired_state")) lCv.put("desired_state", 0);
                            db.update("local_media", lCv, "dedup_key = ?", new String[]{it.dedupKey});
                        }
                    }

                    ensureArchiveSyncTriggers(db);
                    if (hasTable(db, "remote_media") && hasTable(db, "media") && hasTable(db, "collections")) {
                        db.execSQL("UPDATE remote_media SET is_archived = 1 WHERE is_archived = 0 AND dedup_key IN (SELECT dedup_key FROM remote_media WHERE is_archived = 1 AND collection_id NOT IN (SELECT collection_media_key FROM collections));");
                        db.execSQL("UPDATE media SET is_archived = 1 WHERE (is_archived IS NULL OR is_archived = 0) AND dedup_key IN (SELECT dedup_key FROM remote_media WHERE is_archived = 1 AND collection_id NOT IN (SELECT collection_media_key FROM collections));");
                    }

                    db.setTransactionSuccessful();
                    db.endTransaction();
                    try { db.close(); db = null; } catch (Throwable ignored) {}

                    triggerOnlineSync(context, account.accountId);
                    notifyUiChanges(context, account.accountId);

                    return new ActionResult(true, count, "Successfully archived " + count + " items");

                case "unArchive":
                    boolean hasRemoteUnarchiveOrigin = hasColumn(db, "remote_media", "last_archive_origin");
                    boolean hasMediaUnarchiveOrigin = hasTable(db, "media") && hasColumn(db, "media", "last_archive_origin");
                    boolean hasLocalUnarchiveOrigin = hasTable(db, "local_media") && hasColumn(db, "local_media", "last_archive_origin");
                    boolean hasRemoteUnarchiveMediaKey = hasColumn(db, "remote_media", "media_key");
                    boolean hasRemoteUnarchiveRemoteMediaKey = hasColumn(db, "remote_media", "remote_media_key");
                    boolean hasMediaUnarchiveCanonical = hasTable(db, "media") && hasColumn(db, "media", "canonical_media_key");

                    for (MediaItem it : items) {
                        ContentValues cv = new ContentValues();
                        cv.put("is_archived", 0);
                        cv.put("trash_timestamp", 0);
                        if (hasRemoteUnarchiveOrigin) cv.put("last_archive_origin", 0);
                        if (hasColumn(db, "remote_media", "state")) cv.put("state", 0);

                        String whereRemote;
                        List<String> argsRemote = new ArrayList<>();
                        if (it.dedupKey != null && !it.dedupKey.isEmpty()) {
                            if (it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                                if (hasRemoteUnarchiveRemoteMediaKey && hasRemoteUnarchiveMediaKey) {
                                    whereRemote = "(dedup_key = ? OR media_key = ? OR remote_media_key = ?)";
                                    argsRemote.add(it.dedupKey);
                                    argsRemote.add(it.mediaKey);
                                    argsRemote.add(it.mediaKey);
                                } else if (hasRemoteUnarchiveRemoteMediaKey) {
                                    whereRemote = "(dedup_key = ? OR remote_media_key = ?)";
                                    argsRemote.add(it.dedupKey);
                                    argsRemote.add(it.mediaKey);
                                } else if (hasRemoteUnarchiveMediaKey) {
                                    whereRemote = "(dedup_key = ? OR media_key = ?)";
                                    argsRemote.add(it.dedupKey);
                                    argsRemote.add(it.mediaKey);
                                } else {
                                    whereRemote = "dedup_key = ?";
                                    argsRemote.add(it.dedupKey);
                                }
                            } else {
                                whereRemote = "dedup_key = ?";
                                argsRemote.add(it.dedupKey);
                            }
                        } else if (it.mediaKey != null && !it.mediaKey.isEmpty()) {
                            if (hasRemoteUnarchiveRemoteMediaKey && hasRemoteUnarchiveMediaKey) {
                                whereRemote = "(media_key = ? OR remote_media_key = ?)";
                                argsRemote.add(it.mediaKey);
                                argsRemote.add(it.mediaKey);
                            } else if (hasRemoteUnarchiveRemoteMediaKey) {
                                whereRemote = "remote_media_key = ?";
                                argsRemote.add(it.mediaKey);
                            } else {
                                whereRemote = "media_key = ?";
                                argsRemote.add(it.mediaKey);
                            }
                        } else {
                            continue;
                        }

                        db.update("remote_media", cv, whereRemote, argsRemote.toArray(new String[0]));

                        if (hasTable(db, "media")) {
                            ContentValues mCv = new ContentValues();
                            mCv.put("is_archived", 0);
                            mCv.put("trash_timestamp", 0);
                            mCv.put("is_deleted", 0);
                            if (hasMediaUnarchiveOrigin) mCv.put("last_archive_origin", 0);

                            String whereMedia;
                            List<String> argsMedia = new ArrayList<>();
                            if (it.dedupKey != null && !it.dedupKey.isEmpty()) {
                                if (hasMediaUnarchiveCanonical && it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                                    whereMedia = "(dedup_key = ? OR canonical_media_key = ?)";
                                    argsMedia.add(it.dedupKey);
                                    argsMedia.add(it.mediaKey);
                                } else {
                                    whereMedia = "dedup_key = ?";
                                    argsMedia.add(it.dedupKey);
                                }
                            } else if (hasMediaUnarchiveCanonical && it.mediaKey != null && !it.mediaKey.isEmpty()) {
                                whereMedia = "canonical_media_key = ?";
                                argsMedia.add(it.mediaKey);
                            } else {
                                whereMedia = null;
                            }
                            if (whereMedia != null) {
                                db.update("media", mCv, whereMedia, argsMedia.toArray(new String[0]));
                            }
                        }
                        if (hasTable(db, "local_media") && it.dedupKey != null && !it.dedupKey.isEmpty()) {
                            ContentValues lCv = new ContentValues();
                            lCv.put("is_archived", 0);
                            lCv.put("trash_timestamp", 0);
                            if (hasLocalUnarchiveOrigin) lCv.put("last_archive_origin", 0);
                            if (hasColumn(db, "local_media", "state")) lCv.put("state", 0);
                            if (hasColumn(db, "local_media", "desired_state")) lCv.put("desired_state", 0);
                            db.update("local_media", lCv, "dedup_key = ?", new String[]{it.dedupKey});
                        }
                    }

                    ensureArchiveSyncTriggers(db);
                    if (hasTable(db, "remote_media") && hasTable(db, "media") && hasTable(db, "collections")) {
                        db.execSQL("UPDATE remote_media SET is_archived = 0 WHERE is_archived = 1 AND dedup_key IN (SELECT dedup_key FROM remote_media WHERE is_archived = 0 AND collection_id NOT IN (SELECT collection_media_key FROM collections));");
                        db.execSQL("UPDATE media SET is_archived = 0 WHERE is_archived = 1 AND dedup_key IN (SELECT dedup_key FROM remote_media WHERE is_archived = 0 AND collection_id NOT IN (SELECT collection_media_key FROM collections));");
                    }

                    db.setTransactionSuccessful();
                    db.endTransaction();
                    try { db.close(); db = null; } catch (Throwable ignored) {}

                    triggerOnlineSync(context, account.accountId);
                    notifyUiChanges(context, account.accountId);

                    return new ActionResult(true, count, "Successfully un-archived " + count + " items");

                case "toFavorite":
                    boolean hasRemoteFavMediaKey = hasColumn(db, "remote_media", "media_key");
                    boolean hasRemoteFavRemoteMediaKey = hasColumn(db, "remote_media", "remote_media_key");
                    boolean hasMediaFavCanonical = hasTable(db, "media") && hasColumn(db, "media", "canonical_media_key");

                    for (MediaItem it : items) {
                        ContentValues cv = new ContentValues();
                        cv.put("is_favorite", 1);

                        String whereRemote = "dedup_key = ?";
                        List<String> argsRemote = new ArrayList<>();
                        argsRemote.add(it.dedupKey);
                        if (it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                            if (hasRemoteFavRemoteMediaKey && hasRemoteFavMediaKey) {
                                whereRemote = "(dedup_key = ? OR media_key = ? OR remote_media_key = ?)";
                                argsRemote.add(it.mediaKey);
                                argsRemote.add(it.mediaKey);
                            } else if (hasRemoteFavRemoteMediaKey) {
                                whereRemote = "(dedup_key = ? OR remote_media_key = ?)";
                                argsRemote.add(it.mediaKey);
                            } else if (hasRemoteFavMediaKey) {
                                whereRemote = "(dedup_key = ? OR media_key = ?)";
                                argsRemote.add(it.mediaKey);
                            }
                        }
                        db.update("remote_media", cv, whereRemote, argsRemote.toArray(new String[0]));

                        if (hasTable(db, "media")) {
                            String whereMedia = "dedup_key = ?";
                            List<String> argsMedia = new ArrayList<>();
                            argsMedia.add(it.dedupKey);
                            if (hasMediaFavCanonical && it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                                whereMedia = "(dedup_key = ? OR canonical_media_key = ?)";
                                argsMedia.add(it.mediaKey);
                            }
                            db.update("media", cv, whereMedia, argsMedia.toArray(new String[0]));
                        }
                        if (hasTable(db, "local_media") && it.dedupKey != null && !it.dedupKey.isEmpty()) {
                            db.update("local_media", cv, "dedup_key = ?", new String[]{it.dedupKey});
                        }
                    }

                    db.setTransactionSuccessful();
                    db.endTransaction();
                    try { db.close(); db = null; } catch (Throwable ignored) {}

                    triggerOnlineSync(context, account.accountId);
                    notifyUiChanges(context, account.accountId);

                    return new ActionResult(true, count, "Successfully added " + count + " items to favorites");

                case "unFavorite":
                    boolean hasRemoteUnfavMediaKey = hasColumn(db, "remote_media", "media_key");
                    boolean hasRemoteUnfavRemoteMediaKey = hasColumn(db, "remote_media", "remote_media_key");
                    boolean hasMediaUnfavCanonical = hasTable(db, "media") && hasColumn(db, "media", "canonical_media_key");

                    for (MediaItem it : items) {
                        ContentValues cv = new ContentValues();
                        cv.put("is_favorite", 0);

                        String whereRemote = "dedup_key = ?";
                        List<String> argsRemote = new ArrayList<>();
                        argsRemote.add(it.dedupKey);
                        if (it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                            if (hasRemoteUnfavRemoteMediaKey && hasRemoteUnfavMediaKey) {
                                whereRemote = "(dedup_key = ? OR media_key = ? OR remote_media_key = ?)";
                                argsRemote.add(it.mediaKey);
                                argsRemote.add(it.mediaKey);
                            } else if (hasRemoteUnfavRemoteMediaKey) {
                                whereRemote = "(dedup_key = ? OR remote_media_key = ?)";
                                argsRemote.add(it.mediaKey);
                            } else if (hasRemoteUnfavMediaKey) {
                                whereRemote = "(dedup_key = ? OR media_key = ?)";
                                argsRemote.add(it.mediaKey);
                            }
                        }
                        db.update("remote_media", cv, whereRemote, argsRemote.toArray(new String[0]));

                        if (hasTable(db, "media")) {
                            String whereMedia = "dedup_key = ?";
                            List<String> argsMedia = new ArrayList<>();
                            argsMedia.add(it.dedupKey);
                            if (hasMediaUnfavCanonical && it.mediaKey != null && !it.mediaKey.isEmpty() && !it.mediaKey.equals(it.dedupKey)) {
                                whereMedia = "(dedup_key = ? OR canonical_media_key = ?)";
                                argsMedia.add(it.mediaKey);
                            }
                            db.update("media", cv, whereMedia, argsMedia.toArray(new String[0]));
                        }
                        if (hasTable(db, "local_media") && it.dedupKey != null && !it.dedupKey.isEmpty()) {
                            db.update("local_media", cv, "dedup_key = ?", new String[]{it.dedupKey});
                        }
                    }

                    db.setTransactionSuccessful();
                    db.endTransaction();
                    try { db.close(); db = null; } catch (Throwable ignored) {}

                    triggerOnlineSync(context, account.accountId);
                    notifyUiChanges(context, account.accountId);

                    return new ActionResult(true, count, "Successfully removed " + count + " items from favorites");

                case "copyDescFromOther":
                    db.endTransaction();
                    return new ActionResult(false, 0, "Action 'copyDescFromOther' deprecated to prevent cloud desynchronization");

                default:
                    db.endTransaction();
                    return new ActionResult(false, 0, "Action " + actionId + " not supported directly");
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Error executing database action " + actionId, t);
            if (db != null && db.inTransaction()) {
                try { db.endTransaction(); } catch (Throwable ignored) {}
            }
            return new ActionResult(false, 0, "Error: " + t.getMessage());
        } finally {
            if (db != null) {
                try { db.close(); } catch (Throwable ignored) {}
            }
        }
    }

    public static String exportToCsv(List<MediaItem> items) {
        StringBuilder sb = new StringBuilder();
        sb.append("mediaKey,dedupKey,fileName,takenAt,width,height,durationMs,sizeBytes,takesUpSpace,spaceTakenBytes,isArchived,isFavorite,latitude,longitude,caption,thumbnailUrl\n");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US);

        for (MediaItem item : items) {
            sb.append(escapeCsv(item.mediaKey)).append(",");
            sb.append(escapeCsv(item.dedupKey)).append(",");
            sb.append(escapeCsv(item.filename)).append(",");
            sb.append(item.captureTimestamp > 0 ? sdf.format(new Date(item.captureTimestamp)) : "").append(",");
            sb.append(item.width).append(",");
            sb.append(item.height).append(",");
            sb.append(item.duration).append(",");
            sb.append(item.sizeBytes).append(",");
            sb.append(item.quotaBytes > 0 ? "true" : "false").append(",");
            sb.append(item.quotaBytes).append(",");
            sb.append(item.isArchived).append(",");
            sb.append(item.isFavorite).append(",");
            sb.append(item.latitude).append(",");
            sb.append(item.longitude).append(",");
            sb.append(escapeCsv(item.caption)).append(",");
            sb.append(escapeCsv(item.remoteUrl)).append("\n");
        }
        return sb.toString();
    }

    private static String escapeCsv(String val) {
        if (val == null) return "";
        if (val.contains(",") || val.contains("\"") || val.contains("\n")) {
            return "\"" + val.replace("\"", "\"\"") + "\"";
        }
        return val;
    }

    private static final Map<String, Boolean> TABLE_EXISTS_CACHE = new ConcurrentHashMap<>();
    private static final Map<String, Set<String>> TABLE_COLUMN_CACHE = new ConcurrentHashMap<>();
    private static final Map<String, Pattern> PATTERN_CACHE = new ConcurrentHashMap<>();

    public static void clearSchemaCache() {
        TABLE_EXISTS_CACHE.clear();
        TABLE_COLUMN_CACHE.clear();
    }

    public static Pattern getCachedPattern(String regex) {
        if (regex == null || regex.isEmpty()) return null;
        return PATTERN_CACHE.computeIfAbsent(regex, r -> {
            try {
                return Pattern.compile(r, Pattern.CASE_INSENSITIVE);
            } catch (Throwable t) {
                return null;
            }
        });
    }

    private static boolean hasTable(SQLiteDatabase db, String tableName) {
        if (db == null || tableName == null) return false;
        String key = db.getPath() + ":" + tableName.toLowerCase();
        Boolean cached = TABLE_EXISTS_CACHE.get(key);
        if (cached != null) return cached;

        try (Cursor c = db.rawQuery(
                "SELECT 1 FROM sqlite_master WHERE type IN ('table','view') AND name=?", new String[]{tableName})) {
            boolean exists = (c != null && c.moveToFirst());
            TABLE_EXISTS_CACHE.put(key, exists);
            return exists;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static int getTableRowCount(SQLiteDatabase db, String tableName) {
        try (Cursor c = db.rawQuery("SELECT count(*) FROM " + tableName, null)) {
            if (c != null && c.moveToFirst()) {
                return c.getInt(0);
            }
        } catch (Throwable ignored) {}
        return 0;
    }

    private static boolean hasColumn(SQLiteDatabase db, String table, String col) {
        if (db == null || table == null || col == null) return false;
        String key = db.getPath() + ":" + table.toLowerCase();
        Set<String> columns = TABLE_COLUMN_CACHE.get(key);
        if (columns == null) {
            columns = new HashSet<>();
            try (Cursor c = db.rawQuery("PRAGMA table_info(" + table + ")", null)) {
                while (c != null && c.moveToNext()) {
                    String colName = c.getString(1);
                    if (colName != null) {
                        columns.add(colName.toLowerCase());
                    }
                }
            } catch (Throwable ignored) {}
            TABLE_COLUMN_CACHE.put(key, columns);
        }
        return columns.contains(col.toLowerCase());
    }

    public static byte[] buildCollectionProtobuf(String colKey, String title, String albumId, String gaiaId) {
        try {
            ByteArrayOutputStream f1 = new ByteArrayOutputStream();
            writeStringField(f1, 1, colKey);

            ByteArrayOutputStream f2Inner = new ByteArrayOutputStream();
            writeStringField(f2Inner, 5, title);
            ByteArrayOutputStream f2 = new ByteArrayOutputStream();
            writeMsgField(f2, 2, f2Inner.toByteArray());

            ByteArrayOutputStream f4Sub = new ByteArrayOutputStream();
            if (albumId != null && !albumId.isEmpty()) {
                writeStringField(f4Sub, 3, albumId);
            }
            if (gaiaId != null && !gaiaId.isEmpty()) {
                writeStringField(f4Sub, 1, gaiaId);
            }
            ByteArrayOutputStream f4Inner = new ByteArrayOutputStream();
            writeStringField(f4Inner, 1, colKey);
            writeMsgField(f4Inner, 2, f4Sub.toByteArray());
            ByteArrayOutputStream f4 = new ByteArrayOutputStream();
            writeMsgField(f4, 4, f4Inner.toByteArray());

            ByteArrayOutputStream out = new ByteArrayOutputStream();
            out.write(f1.toByteArray());
            out.write(f2.toByteArray());
            out.write(f4.toByteArray());
            return out.toByteArray();
        } catch (Throwable t) {
            return new byte[0];
        }
    }

    private static void writeVarint(OutputStream os, long val) throws IOException {
        while ((val & ~0x7FL) != 0) {
            os.write((int) ((val & 0x7F) | 0x80));
            val >>>= 7;
        }
        os.write((int) val);
    }

    private static void writeStringField(OutputStream os, int fieldNum, String s) throws IOException {
        if (s == null) return;
        byte[] b = s.getBytes(StandardCharsets.UTF_8);
        writeVarint(os, (fieldNum << 3) | 2);
        writeVarint(os, b.length);
        os.write(b);
    }

    private static void writeMsgField(OutputStream os, int fieldNum, byte[] body) throws IOException {
        if (body == null) return;
        writeVarint(os, (fieldNum << 3) | 2);
        writeVarint(os, body.length);
        os.write(body);
    }

    public static String resolveLocalFilePath(AccountInfo account, String dedupKey) {
        if (account == null || dedupKey == null || dedupKey.isEmpty()) return null;
        File dbFile = new File(account.dbPath);
        if (!dbFile.exists()) return null;
        SQLiteDatabase db = null;
        try {
            db = SQLiteDatabase.openDatabase(dbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
            if (hasTable(db, "local_media")) {
                String pathCol = null;
                if (hasColumn(db, "local_media", "content_uri")) pathCol = "content_uri";
                else if (hasColumn(db, "local_media", "filepath")) pathCol = "filepath";
                else if (hasColumn(db, "local_media", "_data")) pathCol = "_data";
                else if (hasColumn(db, "local_media", "file_path")) pathCol = "file_path";

                if (pathCol != null) {
                    try (Cursor c = db.rawQuery("SELECT " + pathCol + " FROM local_media WHERE dedup_key = ? LIMIT 1", new String[]{dedupKey})) {
                        if (c != null && c.moveToFirst()) {
                            String p = c.getString(0);
                            if (p != null && !p.isEmpty()) return p;
                        }
                    }
                }
            }
            if (hasTable(db, "synced_folder_media_metadata")) {
                try (Cursor c = db.rawQuery("SELECT file_path FROM synced_folder_media_metadata WHERE dedup_key = ? LIMIT 1", new String[]{dedupKey})) {
                    if (c != null && c.moveToFirst()) {
                        String p = c.getString(0);
                        if (p != null && !p.isEmpty()) return p;
                    }
                }
            }
        } catch (Throwable ignored) {
        } finally {
            if (db != null) try { db.close(); } catch (Throwable ignored) {}
        }
        return null;
    }

    public static String formatBytes(long bytes) {
        if (bytes <= 0) return "0 B";
        if (bytes < 1024) return bytes + " B";
        if (bytes < 1024 * 1024) return String.format(Locale.US, "%.1f KB", bytes / 1024.0);
        if (bytes < 1024 * 1024 * 1024) return String.format(Locale.US, "%.2f MB", bytes / (1024.0 * 1024.0));
        return String.format(Locale.US, "%.2f GB", bytes / (1024.0 * 1024.0 * 1024.0));
    }
}

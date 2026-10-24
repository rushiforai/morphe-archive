package app.template.extension.pdb;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.SystemClock;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Read-only access to the SQLite databases Pdb keeps in its own data directory.
 *
 * <p>Nothing is opened through the app's (obfuscated, per-release) Room classes: the
 * files are opened directly with {@link SQLiteDatabase#openDatabase}, read-only, so
 * this keeps working across Pdb releases and cannot corrupt anything.
 *
 * <p>Database file names and table names are <em>discovered</em> rather than
 * hard-coded: the databases directory is listed and probed for the table a tool
 * needs. On 2.134.6 that finds {@code pdb_app_go.db} (Pdb's own store) and the IM
 * store holding {@code messages}, {@code channels}, {@code users} and
 * {@code profile_view_record}.
 */
public final class PdbDatabase {

    private static final int MAX_CHARS = 12000;

    private PdbDatabase() {}

    /* ── discovery ── */

    public static File databasesDir(Context ctx) {
        return new File(ctx.getApplicationInfo().dataDir, "databases");
    }

    /** Every {@code *.db} file in the app's databases directory, WAL side files excluded. */
    public static List<File> dbFiles(Context ctx) {
        List<File> out = new ArrayList<>();
        File dir = databasesDir(ctx);
        File[] files = dir.listFiles();
        if (files == null) return out;
        Arrays.sort(files, Comparator.comparing(File::getName));
        for (File f : files) {
            String name = f.getName();
            if (!f.isFile()) continue;
            if (!name.endsWith(".db")) continue;
            // Firebase's local measurement store also happens to contain a
            // `messages` table; it is analytics, not Pdb chat data.
            if (name.startsWith("google_app_measurement")) continue;
            out.add(f);
        }
        return out;
    }

    public static SQLiteDatabase open(File file) {
        return SQLiteDatabase.openDatabase(file.getPath(), null, SQLiteDatabase.OPEN_READONLY);
    }

    public static List<String> tables(SQLiteDatabase db) {
        List<String> out = new ArrayList<>();
        Cursor c = null;
        try {
            c = db.rawQuery(
                "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'"
                    + " AND name NOT LIKE 'room_%' ORDER BY name",
                null);
            while (c.moveToNext()) out.add(c.getString(0));
        } catch (Throwable ignored) {
        } finally {
            if (c != null) c.close();
        }
        return out;
    }

    public static long rowCount(SQLiteDatabase db, String table) {
        Cursor c = null;
        try {
            c = db.rawQuery("SELECT COUNT(*) FROM `" + table + "`", null);
            if (c.moveToFirst()) return c.getLong(0);
        } catch (Throwable ignored) {
        } finally {
            if (c != null) c.close();
        }
        return -1L;
    }

    /** The database file containing {@code table}, or {@code null}. */
    public static File dbWith(Context ctx, String table) {
        for (File f : dbFiles(ctx)) {
            SQLiteDatabase db = null;
            try {
                db = open(f);
                if (tables(db).contains(table)) return f;
            } catch (Throwable ignored) {
            } finally {
                if (db != null) db.close();
            }
        }
        return null;
    }

    /* ── tools ── */

    /** Database files, their tables and row counts. */
    public static String stats(Context ctx) {
        StringBuilder sb = new StringBuilder();
        sb.append("Databases in ").append(databasesDir(ctx).getAbsolutePath()).append('\n');
        List<File> files = dbFiles(ctx);
        if (files.isEmpty()) sb.append("  (none readable)\n");
        for (File f : files) {
            sb.append("\n").append(f.getName())
                .append("  (")
                .append(f.length() / 1024)
                .append(" KiB)\n");
            SQLiteDatabase db = null;
            try {
                db = open(f);
                for (String table : tables(db)) {
                    long count = rowCount(db, table);
                    sb.append("  ").append(table).append(": ")
                        .append(count < 0 ? "?" : String.valueOf(count)).append('\n');
                }
            } catch (Throwable t) {
                sb.append("  open failed: ").append(t).append('\n');
            } finally {
                if (db != null) db.close();
            }
        }
        return truncate(sb.toString());
    }

    /** CREATE TABLE SQL for every app database, to diagnose schema mismatches. */
    public static String schema(Context ctx) {
        StringBuilder sb = new StringBuilder();
        for (File f : dbFiles(ctx)) {
            sb.append("\n").append(f.getName()).append('\n');
            SQLiteDatabase db = null;
            Cursor c = null;
            try {
                db = open(f);
                c = db.rawQuery(
                    "SELECT name, sql FROM sqlite_master WHERE type='table'"
                        + " AND name NOT LIKE 'sqlite_%' AND name NOT LIKE 'room_%'"
                        + " ORDER BY name", null);
                while (c.moveToNext()) {
                    sb.append("\n-- ").append(c.getString(0)).append('\n')
                        .append(c.getString(1) == null ? "(no schema)" : c.getString(1))
                        .append('\n');
                }
            } catch (Throwable t) {
                sb.append("  open failed: ").append(t).append('\n');
            } finally {
                if (c != null) c.close();
                if (db != null) db.close();
            }
        }
        if (sb.length() == 0) sb.append("No app database files found.");
        return truncate(sb.toString());
    }

    /**
     * Most recent chat messages, newest first.
     *
     * @param query optional {@code LIKE} filter on the message text; empty for everything.
     */
    public static String chats(Context ctx, String query, int limit) {
        File file = dbWith(ctx, "messages");
        if (file == null) {
            return channels(ctx, query, limit);
        }
        SQLiteDatabase db = null;
        Cursor c = null;
        try {
            db = open(file);
            String filter = query == null || query.trim().isEmpty()
                ? "m.text IS NOT NULL AND m.text != ''"
                : "m.text LIKE ?";
            String[] args = query == null || query.trim().isEmpty()
                ? new String[]{String.valueOf(limit)}
                : new String[]{"%" + query.trim() + "%", String.valueOf(limit)};

            boolean hasUsers = tables(db).contains("users");
            String sql = "SELECT m.createDate, m.channelId, m.creator, m.text,"
                + (hasUsers
                    ? " (SELECT u.username FROM users u WHERE u.id = m.creator) AS uname,"
                    : " NULL AS uname,")
                + " m.isActive"
                + " FROM messages m WHERE " + filter
                + " ORDER BY m.createDate DESC LIMIT ?";

            c = db.rawQuery(sql, args);
            StringBuilder sb = new StringBuilder();
            sb.append(file.getName())
                .append(query == null || query.trim().isEmpty()
                    ? " — latest messages" : " — matches for \"" + query.trim() + "\"")
                .append('\n');
            int n = 0;
            while (c.moveToNext()) {
                n++;
                String uname = c.getString(4);
                if (uname == null) uname = usernameFor(ctx, c.getString(2));
                sb.append('\n')
                    .append('[').append(date(c.getLong(0))).append("] ")
                    .append(uname != null ? "@" + uname : shortId(c.getString(2)))
                    .append(c.getInt(5) == 0 ? " (deleted)" : "")
                    .append('\n')
                    .append(c.getString(3))
                    .append("\n  channel ").append(shortId(c.getString(1)))
                    .append("  sender ").append(shortId(c.getString(2)))
                    .append('\n');
            }
            if (n == 0) sb.append("\n(no messages)\n");
            else sb.append("\n").append(n).append(" message(s)\n");
            return truncate(sb.toString());
        } catch (Throwable t) {
            return "Chat read failed: " + t;
        } finally {
            if (c != null) c.close();
            if (db != null) db.close();
        }
    }

    /**
     * Local profile-view records — the app's own record of who opened a profile.
     * Not exposed anywhere in the stock UI beyond the server-side visitor page.
     */
    public static String visitorLog(Context ctx, int limit) {
        File file = dbWith(ctx, "profile_view_record");
        if (file == null) return "No database with a `profile_view_record` table was found.";
        SQLiteDatabase db = null;
        Cursor c = null;
        try {
            db = open(file);
            c = db.rawQuery(
                "SELECT r.created_at, r.uid, r.target_uid, r.type"
                    + " FROM profile_view_record r ORDER BY r.created_at DESC LIMIT ?",
                new String[]{String.valueOf(limit)});
            StringBuilder sb = new StringBuilder(file.getName() + " — profile views\n");
            Map<String, Integer> byViewer = new HashMap<>();
            int n = 0;
            while (c.moveToNext()) {
                n++;
                String uid = c.getString(1);
                String uname = usernameFor(ctx, uid);
                sb.append('\n')
                    .append('[').append(date(c.getLong(0))).append("] ")
                    .append(uname != null ? "@" + uname : shortId(uid))
                    .append("  type ").append(c.getInt(3))
                    .append("\n  viewer ").append(shortId(uid))
                    .append("  profile ").append(shortId(c.getString(2)))
                    .append('\n');
                Integer seen = byViewer.get(uid);
                byViewer.put(uid, seen == null ? 1 : seen + 1);
            }
            if (n == 0) return "No profile views recorded locally.";
            sb.append('\n').append(n).append(" view event(s), ")
                .append(byViewer.size()).append(" distinct viewer(s)\n");
            sb.append("Most frequent:\n");
            List<Map.Entry<String, Integer>> entries = new ArrayList<>(byViewer.entrySet());
            entries.sort((a, b) -> b.getValue() - a.getValue());
            for (int i = 0; i < Math.min(10, entries.size()); i++) {
                Map.Entry<String, Integer> e = entries.get(i);
                sb.append("  ").append(shortId(e.getKey())).append(" × ").append(e.getValue()).append('\n');
            }
            return truncate(sb.toString());
        } catch (Throwable t) {
            return "Visitor log read failed: " + t;
        } finally {
            if (c != null) c.close();
            if (db != null) db.close();
        }
    }

    /* ── cached user index ── */

    private static volatile Map<String, String> idToName;   // user id → username
    private static volatile java.util.Set<String> knownIds; // user id set
    private static volatile long cacheAt;
    private static final long CACHE_TTL = 10 * 60 * 1000L;

    /** Loads/refreshes the local users index (id → username). Safe to call often. */
    private static void loadCache(Context ctx) {
        long now = SystemClock.uptimeMillis();
        if (idToName != null && now - cacheAt < CACHE_TTL) return;
        synchronized (PdbDatabase.class) {
            if (idToName != null && now - cacheAt < CACHE_TTL) return;
            Map<String, String> map = new HashMap<>();
            java.util.Set<String> ids = new java.util.HashSet<>();
            File file = dbWith(ctx, "users");
            if (file != null) {
                SQLiteDatabase db = null;
                Cursor c = null;
                try {
                    db = open(file);
                    c = db.rawQuery("SELECT id, username FROM users", null);
                    while (c.moveToNext()) {
                        String id = c.getString(0);
                        String name = c.getString(1);
                        if (id != null) {
                            ids.add(id);
                            map.put(id, name);
                        }
                    }
                } catch (Throwable ignored) {
                } finally {
                    if (c != null) c.close();
                    if (db != null) db.close();
                }
            }
            idToName = map;
            knownIds = ids;
            cacheAt = now;
        }
    }

    /** username for a local user id, or {@code null}. */
    public static String usernameFor(Context ctx, String id) {
        if (id == null) return null;
        loadCache(ctx);
        Map<String, String> map = idToName;
        return map == null ? null : map.get(id);
    }

    /** user id for a local username, or {@code null}. */
    public static String idForUsername(Context ctx, String username) {
        if (username == null) return null;
        loadCache(ctx);
        Map<String, String> map = idToName;
        if (map == null) return null;
        for (Map.Entry<String, String> e : map.entrySet()) {
            if (username.equalsIgnoreCase(e.getValue())) return e.getKey();
        }
        return null;
    }

    /** All locally-known user ids (used by the row-hook id detection). */
    public static java.util.Set<String> knownUserIds(Context ctx) {
        loadCache(ctx);
        java.util.Set<String> ids = knownIds;
        return ids == null ? new java.util.HashSet<String>() : ids;
    }

    /** Resolves loose input (id or @username) to a user id, or {@code null}. */
    public static String resolveUserId(Context ctx, String input) {
        if (input == null) return null;
        String value = input.trim().replaceFirst("^@", "").replaceFirst("^#", "");
        if (value.isEmpty()) return null;
        if (knownUserIds(ctx).contains(value)) return value;
        // Pdb user ids are numeric. The local `users` table only contains people
        // you have chatted with, so a valid id may not be in the cache yet; pass
        // numeric ids straight through so profile/chat navigation still works.
        if (value.matches("\\d{3,}")) return value;
        return idForUsername(ctx, value);
    }

    /* ── power-user reads ── */

    /**
     * Everything the local database knows about one user — id or @username.
     * Shows fields the stock UI hides behind premium or deep menus (pro state,
     * online visibility, last active, streak, your saved note).
     */
    public static String userById(Context ctx, String input) {
        String id = resolveUserId(ctx, input);
        if (id == null) return "Not found locally: \"" + input + "\"";
        File file = dbWith(ctx, "users");
        if (file == null) {
            return "No local users table.\n\nPdb's SQLite store on this build has no "
                + "`users` cache; use Open profile / Instant-chat with a numeric id instead.";
        }
        SQLiteDatabase db = null;
        Cursor c = null;
        try {
            db = open(file);
            c = db.rawQuery(
                "SELECT username, isPro, showOnline, lastActive, chatStreakProgress,"
                    + " note, locationDisplay, bio, gender, isMod, isActive"
                    + " FROM users WHERE id = ? LIMIT 1",
                new String[]{id});
            if (!c.moveToFirst()) return "Not found locally: \"" + input + "\"";
            StringBuilder sb = new StringBuilder();
            String name = c.getString(0);
            sb.append(name != null ? "@" + name : "(no name)").append("  #").append(id).append('\n');
            sb.append("Pro: ").append(c.getInt(1) != 0 ? "yes" : "no")
                .append("   Online visible: ").append(c.getInt(2) != 0 ? "yes" : "hidden")
                .append("   Active: ").append(c.getInt(10) != 0 ? "yes" : "deleted");
            if (c.getInt(9) != 0) sb.append("   Mod");
            sb.append('\n');
            long last = c.getLong(3);
            if (last > 0) sb.append("Last active: ").append(date(last)).append('\n');
            String streak = c.getString(4);
            if (streak != null && !streak.isEmpty()) sb.append("Streak: ").append(streak).append('\n');
            String location = c.getString(6);
            if (location != null && !location.isEmpty()) sb.append("Location: ").append(location).append('\n');
            String gender = c.getString(8);
            if (gender != null && !gender.isEmpty()) sb.append("Gender: ").append(gender).append('\n');
            String bio = c.getString(7);
            if (bio != null && !bio.isEmpty()) sb.append("Bio: ").append(bio, 0, Math.min(300, bio.length())).append('\n');
            String note = c.getString(5);
            if (note != null && !note.isEmpty()) sb.append("Your note: ").append(note).append('\n');
            sb.append("\nOpen profile: ").append(PdbNav.PROFILE_DETAIL).append(" (extra \"id\")");
            return sb.toString();
        } catch (Throwable t) {
            return "User lookup failed: " + t;
        } finally {
            if (c != null) c.close();
            if (db != null) db.close();
        }
    }

    /**
     * Local channel table ({@code channel_info} in {@code pdb_app_go.db}).
     * On this build the message text itself is not stored in SQLite; what is here
     * is one row per conversation: its draft, streak id and read-receipt flags.
     */
    public static String channels(Context ctx, String query, int limit) {
        File file = dbWith(ctx, "channel_info");
        if (file == null) return "No local channel table found.";
        SQLiteDatabase db = null;
        Cursor c = null;
        try {
            db = open(file);
            String filter = query == null || query.trim().isEmpty()
                ? ""
                : " WHERE (cid LIKE ? OR draft_text LIKE ?)";
            String[] args = query == null || query.trim().isEmpty()
                ? new String[]{String.valueOf(limit)}
                : new String[]{"%" + query.trim() + "%", "%" + query.trim() + "%",
                               String.valueOf(limit)};
            c = db.rawQuery(
                "SELECT cid, streak_id, back_prompt_time, request_reply_tracked,"
                    + " request_reply_any_tracked, draft_text FROM channel_info"
                    + filter + " ORDER BY back_prompt_time DESC, cid LIMIT ?", args);
            StringBuilder sb = new StringBuilder(file.getName() + " — local channels\n");
            sb.append("(message text is not stored locally; draft / streak / flags only)\n");
            int n = 0;
            while (c.moveToNext()) {
                n++;
                sb.append('\n').append(c.getString(0))
                    .append("  #").append(shortId(c.getString(0)));
                String streak = c.getString(1);
                if (streak != null && !streak.isEmpty()) sb.append("  streak ").append(streak);
                sb.append("\n  read-tracked ").append(c.getInt(3) != 0 ? "yes" : "no")
                    .append("   any-tracked ").append(c.getInt(4) != 0 ? "yes" : "no");
                long back = c.getLong(2);
                if (back > 0) sb.append("   back-prompt ").append(date(back));
                String draft = c.getString(5);
                if (draft != null && !draft.isEmpty()) {
                    sb.append("\n  draft: ").append(draft.replace('\n', ' '));
                }
                sb.append('\n');
            }
            if (n == 0) return query == null || query.trim().isEmpty()
                ? "No local channels recorded yet."
                : "No local channels match \"" + query.trim() + "\".";
            sb.append('\n').append(n).append(" channel(s)");
            return truncate(sb.toString());
        } catch (Throwable t) {
            return "Channel read failed: " + t;
        } finally {
            if (c != null) c.close();
            if (db != null) db.close();
        }
    }

    /** Unsent message drafts per conversation (never surfaced by the stock app). */
    public static String drafts(Context ctx, int limit) {
        File file = dbWith(ctx, "channel_info");
        if (file != null) {
            SQLiteDatabase db = null;
            Cursor c = null;
            try {
                db = open(file);
                c = db.rawQuery(
                    "SELECT cid, draft_text, back_prompt_time FROM channel_info"
                        + " WHERE draft_text IS NOT NULL AND draft_text != ''"
                        + " ORDER BY back_prompt_time DESC LIMIT ?",
                    new String[]{String.valueOf(limit)});
                StringBuilder sb = new StringBuilder(file.getName() + " — unsent drafts\n");
                int n = 0;
                while (c.moveToNext()) {
                    n++;
                    sb.append('\n').append("channel ").append(shortId(c.getString(0)))
                        .append("  [").append(date(c.getLong(2))).append("]\n  ")
                        .append(c.getString(1)).append('\n');
                }
                if (n == 0) return "No unsent drafts stored locally.";
                sb.append('\n').append(n).append(" draft(s)");
                return truncate(sb.toString());
            } catch (Throwable t) {
                return "Draft read failed: " + t;
            } finally {
                if (c != null) c.close();
                if (db != null) db.close();
            }
        }
        // Older builds kept drafts in an IM-store table.
        file = dbWith(ctx, "channel_local_configs");
        if (file == null) return "No local channel table with drafts was found.";
        SQLiteDatabase db = null;
        Cursor c = null;
        try {
            db = open(file);
            c = db.rawQuery(
                "SELECT channelId, draft, updatedAt FROM channel_local_configs"
                    + " WHERE draft IS NOT NULL AND draft != ''"
                    + " ORDER BY updatedAt DESC LIMIT ?",
                new String[]{String.valueOf(limit)});
            StringBuilder sb = new StringBuilder(file.getName() + " — unsent drafts\n");
            int n = 0;
            while (c.moveToNext()) {
                n++;
                sb.append('\n').append("channel ").append(shortId(c.getString(0)))
                    .append("  [").append(date(c.getLong(2))).append("]\n  ")
                    .append(c.getString(1)).append('\n');
            }
            if (n == 0) return "No unsent drafts stored locally.";
            sb.append('\n').append(n).append(" draft(s)");
            return truncate(sb.toString());
        } catch (Throwable t) {
            return "Draft read failed: " + t;
        } finally {
            if (c != null) c.close();
            if (db != null) db.close();
        }
    }

    /** Conversations ranked by chat streak (who is about to break one). */
    public static String streaks(Context ctx, int limit) {
        File file = dbWith(ctx, "channel_info");
        if (file != null) {
            SQLiteDatabase db = null;
            Cursor c = null;
            try {
                db = open(file);
                c = db.rawQuery(
                    "SELECT cid, streak_id, back_prompt_time, request_reply_tracked"
                        + " FROM channel_info WHERE streak_id IS NOT NULL AND streak_id != ''",
                    null);
                List<String[]> rows = new ArrayList<>();
                while (c.moveToNext()) rows.add(new String[]{
                    c.getString(0), c.getString(1), String.valueOf(c.getLong(2)),
                    String.valueOf(c.getInt(3))});
                rows.sort((a, b) -> Long.compare(streakValue(b[1]), streakValue(a[1])));
                StringBuilder sb = new StringBuilder("Streak radar (local channel table)\n");
                int n = 0;
                for (String[] r : rows) {
                    if (n++ >= limit) break;
                    sb.append('\n').append("channel ").append(shortId(r[0]))
                        .append("\n  streak ").append(r[1])
                        .append("  read-tracked ").append(r[3].equals("1") ? "yes" : "no");
                    long back = 0;
                    try {
                        back = Long.parseLong(r[2]);
                    } catch (NumberFormatException ignored) {
                    }
                    if (back > 0) sb.append("\n  back-prompt ").append(date(back));
                    sb.append('\n');
                }
                if (n == 0) return "No chat streaks recorded locally yet.";
                return truncate(sb.toString());
            } catch (Throwable t) {
                return "Streak read failed: " + t;
            } finally {
                if (c != null) c.close();
                if (db != null) db.close();
            }
        }
        // Older builds cached streaks per user.
        file = dbWith(ctx, "users");
        if (file == null) {
            return "No local channel table.\n\nPdb's SQLite store on this build has no "
                + "`users` cache; use Open profile / Instant-chat with a numeric id instead.";
        }
        SQLiteDatabase db = null;
        Cursor c = null;
        try {
            db = open(file);
            c = db.rawQuery(
                "SELECT id, username, chatStreakProgress, lastActive, isPro, showOnline"
                    + " FROM users WHERE chatStreakProgress IS NOT NULL AND chatStreakProgress != ''",
                null);
            List<long[]> byStreak = new ArrayList<>();
            List<String[]> rows = new ArrayList<>();
            while (c.moveToNext()) rows.add(new String[]{
                c.getString(0), c.getString(1), c.getString(2), String.valueOf(c.getLong(3)),
                String.valueOf(c.getInt(4)), String.valueOf(c.getInt(5))});
            for (int i = 0; i < rows.size(); i++) {
                byStreak.add(new long[]{streakValue(rows.get(i)[2]), i});
            }
            byStreak.sort((a, b) -> Long.compare(b[0], a[0]));
            StringBuilder sb = new StringBuilder("Streak radar (from the local users table)\n");
            int n = 0;
            for (long[] entry : byStreak) {
                if (n++ >= limit) break;
                String[] r = rows.get((int) entry[1]);
                sb.append('\n')
                    .append(r[1] != null ? "@" + r[1] : shortId(r[0]))
                    .append("  #").append(shortId(r[0]))
                    .append("\n  streak ").append(r[2])
                    .append(r[4].equals("1") ? "  PRO" : "")
                    .append("  online ").append(r[5].equals("1") ? "shown" : "hidden")
                    .append('\n');
            }
            if (n == 0) return "No chat streaks recorded locally yet.";
            return truncate(sb.toString());
        } catch (Throwable t) {
            return "Streak read failed: " + t;
        } finally {
            if (c != null) c.close();
            if (db != null) db.close();
        }
    }

    /** Aggregate statistics over whatever local store exists. */
    public static String chatStats(Context ctx) {
        File file = dbWith(ctx, "messages");
        if (file == null) {
            File channels = dbWith(ctx, "channel_info");
            if (channels == null) {
                return "No local SQLite message table found.\n\n"
                    + "Pdb keeps this account's chat history outside SQLite; use the "
                    + "app's own chat UI for messages.";
            }
            SQLiteDatabase db = null;
            Cursor c = null;
            try {
                db = open(channels);
                c = db.rawQuery(
                    "SELECT COUNT(*),"
                        + " SUM(CASE WHEN draft_text != '' THEN 1 ELSE 0 END),"
                        + " SUM(CASE WHEN streak_id != '' THEN 1 ELSE 0 END),"
                        + " SUM(CASE WHEN request_reply_tracked != 0 THEN 1 ELSE 0 END)"
                        + " FROM channel_info", null);
                if (!c.moveToFirst()) return "No local channels recorded yet.";
                return "SQLite message store: none (message text is not kept locally).\n"
                    + "Local channel table: " + c.getLong(0) + " channel(s)\n"
                    + "  drafts: " + c.getLong(1) + "\n"
                    + "  streaks: " + c.getLong(2) + "\n"
                    + "  read-receipt tracking: " + c.getLong(3) + "\n\n"
                    + "Use Recent chats for the channel list and Unsent drafts for drafts.";
            } catch (Throwable t) {
                return "Stats failed: " + t;
            } finally {
                if (c != null) c.close();
                if (db != null) db.close();
            }
        }
        SQLiteDatabase db = null;
        Cursor c = null;
        try {
            db = open(file);
            StringBuilder sb = new StringBuilder(file.getName() + " — chat statistics\n");
            c = db.rawQuery(
                "SELECT COUNT(*), COUNT(DISTINCT creator), COUNT(DISTINCT channelId),"
                    + " MIN(createDate), MAX(createDate) FROM messages", null);
            if (c.moveToFirst()) {
                sb.append("Messages: ").append(c.getLong(0))
                    .append("\nDistinct senders: ").append(c.getLong(1))
                    .append("\nConversations: ").append(c.getLong(2));
                if (c.getLong(3) > 0) sb.append("\nFirst: ").append(date(c.getLong(3)));
                if (c.getLong(4) > 0) sb.append("\nLatest: ").append(date(c.getLong(4)));
                sb.append('\n');
            }
            c.close();
            boolean hasUsers = tables(db).contains("users");
            c = db.rawQuery(
                "SELECT creator, COUNT(*) AS n,"
                    + (hasUsers
                        ? " (SELECT u.username FROM users u WHERE u.id = creator) AS uname"
                        : " NULL AS uname")
                    + " FROM messages GROUP BY creator ORDER BY n DESC LIMIT 10", null);
            sb.append("\nTop partners\n");
            int n = 0;
            while (c.moveToNext()) {
                n++;
                String name = c.getString(2);
                if (name == null) name = usernameFor(ctx, c.getString(0));
                sb.append("  ").append(name != null ? "@" + name : shortId(c.getString(0)))
                    .append(" — ").append(c.getLong(1)).append(" message(s)\n");
            }
            if (n == 0) sb.append("  (no messages)\n");
            return truncate(sb.toString());
        } catch (Throwable t) {
            return "Stats failed: " + t;
        } finally {
            if (c != null) c.close();
            if (db != null) db.close();
        }
    }

    /** First rows of any local table (read-only schema/values inspector). */
    public static String table(Context ctx, String name, int limit) {
        if (name == null || name.trim().isEmpty()) return "Enter a table name.";
        String table = name.trim();
        if (!table.matches("[A-Za-z0-9_]+")) {
            return "Invalid table name (letters, digits and _ only).";
        }
        File file = dbWith(ctx, table);
        if (file == null) {
            return "No app database has a table named `" + table + "`.\n"
                + "Use Dump database schema to see the tables that exist.";
        }
        SQLiteDatabase db = null;
        Cursor c = null;
        try {
            db = open(file);
            c = db.rawQuery("SELECT * FROM `" + table + "` LIMIT " + Math.max(1, limit), null);
            StringBuilder sb = new StringBuilder(file.getName() + " → " + table + "\n");
            String[] cols = c.getColumnNames();
            int n = 0;
            while (c.moveToNext()) {
                n++;
                sb.append('\n').append("row ").append(n).append('\n');
                for (int i = 0; i < cols.length; i++) {
                    String value;
                    try {
                        value = c.getString(i);
                    } catch (Throwable t) {
                        value = "(unreadable)";
                    }
                    if (value == null) value = "NULL";
                    if (value.length() > 240) value = value.substring(0, 240) + "…";
                    sb.append("  ").append(cols[i]).append(" = ").append(value).append('\n');
                }
            }
            if (n == 0) sb.append("(table is empty)\n");
            else sb.append('\n').append(n).append(" row(s) shown");
            return truncate(sb.toString());
        } catch (Throwable t) {
            return "Table read failed: " + t;
        } finally {
            if (c != null) c.close();
            if (db != null) db.close();
        }
    }

    /** Locally cached profile-feed items (who was shown, and whether it was missed). */
    public static String feed(Context ctx, int limit) {
        File file = dbWith(ctx, "profile_feed");
        if (file == null) return "No profile_feed table found.";
        SQLiteDatabase db = null;
        Cursor c = null;
        try {
            db = open(file);
            c = db.rawQuery(
                "SELECT created_at, user_id, target_user_id, missed_timestamp, source_json"
                    + " FROM profile_feed ORDER BY created_at DESC LIMIT ?",
                new String[]{String.valueOf(limit)});
            StringBuilder sb = new StringBuilder(file.getName() + " — profile feed\n");
            int n = 0;
            while (c.moveToNext()) {
                n++;
                String source = c.getString(4);
                sb.append('\n').append('[').append(date(c.getLong(0))).append("] ")
                    .append("user ").append(shortId(c.getString(1)))
                    .append(" → target ").append(shortId(c.getString(2)))
                    .append("  missed ").append(c.getLong(3) > 0 ? "yes" : "no");
                if (source != null && !source.isEmpty()) {
                    sb.append("\n  ").append(source.length() > 200
                        ? source.substring(0, 200) + "…" : source);
                }
                sb.append('\n');
            }
            if (n == 0) return "No profile-feed rows recorded locally.";
            return truncate(sb.toString());
        } catch (Throwable t) {
            return "Feed read failed: " + t;
        } finally {
            if (c != null) c.close();
            if (db != null) db.close();
        }
    }

    /** Visitor digest: who looked at your profile, grouped per viewer with counts. */
    public static String visitorDigest(Context ctx, int limit) {
        File file = dbWith(ctx, "profile_view_record");
        if (file == null) return "No database with a `profile_view_record` table was found.";
        SQLiteDatabase db = null;
        Cursor c = null;
        try {
            db = open(file);
            c = db.rawQuery(
                "SELECT r.uid, COUNT(*) AS n, MAX(r.created_at) AS last_at"
                    + " FROM profile_view_record r GROUP BY r.uid"
                    + " ORDER BY n DESC LIMIT ?",
                new String[]{String.valueOf(limit)});
            StringBuilder sb = new StringBuilder("Visitor digest (grouped from local records)\n");
            int n = 0;
            while (c.moveToNext()) {
                n++;
                String uid = c.getString(0);
                String name = usernameFor(ctx, uid);
                sb.append('\n')
                    .append(name != null ? "@" + name : shortId(uid))
                    .append("  #").append(shortId(uid))
                    .append("\n  ").append(c.getLong(1)).append(" view(s), last ")
                    .append(date(c.getLong(2))).append('\n');
            }
            if (n == 0) return "No profile views recorded locally.";
            sb.append('\n').append(n).append(" visitor(s)");
            return truncate(sb.toString());
        } catch (Throwable t) {
            return "Visitor digest failed: " + t;
        } finally {
            if (c != null) c.close();
            if (db != null) db.close();
        }
    }

    /** Numeric prefix of a streak text value ("4/7" → 4). */
    private static long streakValue(String raw) {
        if (raw == null) return 0;
        StringBuilder digits = new StringBuilder();
        for (int i = 0; i < raw.length(); i++) {
            char ch = raw.charAt(i);
            if (Character.isDigit(ch)) digits.append(ch);
            else if (digits.length() > 0) break;
        }
        try {
            return Long.parseLong(digits.toString());
        } catch (NumberFormatException ignored) {
            return 0;
        }
    }

    /* ── formatting ── */

    static String shortId(String id) {
        if (id == null) return "?";
        return id.length() <= 10 ? id : id.substring(0, 8) + "…";
    }

    static String date(long value) {
        long millis = value;
        if (millis > 0 && millis < 100000000000L) millis *= 1000L; // seconds → millis
        try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.US).format(new Date(millis));
        } catch (Throwable ignored) {
            return String.valueOf(value);
        }
    }

    static String truncate(String text) {
        if (text.length() <= MAX_CHARS) return text;
        return text.substring(0, MAX_CHARS) + "\n… (truncated)";
    }
}

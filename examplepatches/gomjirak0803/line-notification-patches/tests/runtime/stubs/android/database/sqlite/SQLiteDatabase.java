package android.database.sqlite;

import android.database.Cursor;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import testenv.FakeLineEnv;

public final class SQLiteDatabase implements Closeable {
    public static final int OPEN_READONLY = 1;

    private final String dbName;

    private SQLiteDatabase(String dbName) {
        this.dbName = dbName;
    }

    public static SQLiteDatabase openDatabase(String path, Object factory, int flags) {
        return new SQLiteDatabase(path == null ? "" : path);
    }

    public Cursor rawQuery(String sql, String[] args) {
        List<Object[]> rows = new ArrayList<Object[]>();
        synchronized (FakeLineEnv.class) {
            FakeLineEnv.QUERIES.add(sql);
            if (FakeLineEnv.throwOnMessageQuery && sql.contains("chat_history")) {
                throw new RuntimeException("Simulated SQLite query failure");
            }
            if (dbName.endsWith("contact")) {
                String mid = args != null && args.length > 0 ? args[0] : "";
                FakeLineEnv.ContactRow contact = FakeLineEnv.CONTACTS.get(mid);
                if (contact != null) {
                    if (sql.contains("picture_path")) {
                        if (contact.picturePath != null) rows.add(new Object[]{contact.picturePath});
                    } else {
                        rows.add(new Object[]{contact.displayName});
                    }
                }
                return new Cursor(rows);
            }
            if (sql.contains("SELECT 1 FROM chat_history")) {
                String chat = args[0], sid = args[1], account = args[2];
                for (FakeLineEnv.MessageRow m : FakeLineEnv.MESSAGES) {
                    if (chat.equals(m.chatId) && sid.equals(m.serverId)
                            && m.fromMid != null && !account.equals(m.fromMid)) {
                        rows.add(new Object[]{Integer.valueOf(1)});
                        break;
                    }
                }
                return new Cursor(rows);
            }
            if (sql.contains("SELECT parameter FROM chat_history")) {
                String chat = args[0], sid = args[1], account = args[2];
                for (FakeLineEnv.MessageRow m : FakeLineEnv.MESSAGES) {
                    if (chat.equals(m.chatId) && sid.equals(m.serverId)
                            && m.fromMid != null && !account.equals(m.fromMid)) {
                        rows.add(new Object[]{m.parameter});
                        break;
                    }
                }
                return new Cursor(rows);
            }
            if (sql.contains("FROM chat_history WHERE chat_id = ? ORDER BY")) {
                String chat = args[0];
                List<FakeLineEnv.MessageRow> matched = new ArrayList<FakeLineEnv.MessageRow>();
                for (FakeLineEnv.MessageRow m : FakeLineEnv.MESSAGES) {
                    if (chat.equals(m.chatId)) matched.add(m);
                }
                Collections.sort(matched, new Comparator<FakeLineEnv.MessageRow>() {
                    @Override public int compare(FakeLineEnv.MessageRow a, FakeLineEnv.MessageRow b) {
                        int t = Long.compare(b.createdTime, a.createdTime);
                        return t != 0 ? t : Long.compare(b.id, a.id);
                    }
                });
                if (!matched.isEmpty()) {
                    FakeLineEnv.MessageRow m = matched.get(0);
                    rows.add(new Object[]{
                            Integer.valueOf(m.type), Long.valueOf(m.createdTime), m.content,
                            m.attType, m.parameter, m.locationName, m.locationAddress
                    });
                }
                return new Cursor(rows);
            }
            if (sql.contains("WHERE chat_id = ? AND server_id = ?")) {
                String chat = args[0], sid = args[1], account = args[2];
                for (FakeLineEnv.MessageRow m : FakeLineEnv.MESSAGES) {
                    if (chat.equals(m.chatId) && sid.equals(m.serverId)
                            && m.fromMid != null && !account.equals(m.fromMid)) {
                        rows.add(new Object[]{m.content, m.attType, m.parameter, m.locationName, m.locationAddress});
                        break;
                    }
                }
                return new Cursor(rows);
            }
            if (sql.contains("AND CAST(server_id AS INTEGER) > ?")) {
                String chat = args[0], account = args[1];
                long lower = Long.parseLong(args[2]);
                int limit = Integer.parseInt(args[3]);
                List<FakeLineEnv.MessageRow> matched = new ArrayList<FakeLineEnv.MessageRow>();
                for (FakeLineEnv.MessageRow m : FakeLineEnv.MESSAGES) {
                    if (!chat.equals(m.chatId) || m.fromMid == null || account.equals(m.fromMid)) continue;
                    try {
                        if (Long.parseLong(m.serverId) > lower) matched.add(m);
                    } catch (NumberFormatException ignored) { }
                }
                Collections.sort(matched, new Comparator<FakeLineEnv.MessageRow>() {
                    @Override public int compare(FakeLineEnv.MessageRow a, FakeLineEnv.MessageRow b) {
                        int t = Long.compare(b.createdTime, a.createdTime);
                        if (t != 0) return t;
                        return Long.compare(Long.parseLong(b.serverId), Long.parseLong(a.serverId));
                    }
                });
                int end = Math.min(limit, matched.size());
                for (int i = 0; i < end; i++) {
                    FakeLineEnv.MessageRow m = matched.get(i);
                    rows.add(new Object[]{
                            m.serverId, Long.valueOf(m.createdTime), m.fromMid, m.content,
                            m.attType, m.parameter, m.locationName, m.locationAddress,
                            Long.valueOf(m.id), m.localUri
                    });
                }
                return new Cursor(rows);
            }
        }
        throw new IllegalArgumentException("Unexpected query: " + sql);
    }

    @Override public void close() {}
}

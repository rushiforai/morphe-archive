package dev.utaa.linimal.extension.features.readers;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * LINE がこの端末に保存した記録を、読み取り専用の別接続で参照します。
 *
 * <ul>
 *   <li>{@code read_notification} の {@code read_message_range}: メンバーごとの既読範囲。
 *       NOTIFIED_READ_MESSAGE の受信と getMessageReadRange の同期で LINE 自身が書き込みます。</li>
 *   <li>{@code naver_line} の {@code membership}（グループ）と {@code chat_member}（複数人トーク）。</li>
 *   <li>{@code contact} の {@code contacts}: 表示名と profile 画像の path。</li>
 * </ul>
 *
 * <p>単一の worker thread からだけ呼び出します。table が無い・開けない場合は空の結果を返し、
 * 呼び出し側は表示を省きます。</p>
 */
final class LineDatabaseReadersSource implements ReadersDataSource {
    private static final String READ_COUNT_DATABASE = "read_notification";
    private static final String MAIN_DATABASE = "naver_line";
    private static final String CONTACT_DATABASE = "contact";

    /** SQLite の bind 変数の上限（999）より十分小さい単位で IN 句を分けます。 */
    private static final int IN_CLAUSE_CHUNK = 400;

    private final Context context;
    private final Map<String, SQLiteDatabase> connections = new HashMap<>();

    LineDatabaseReadersSource(Context context) {
        this.context = context.getApplicationContext();
    }

    @Override
    public List<String> readerMids(String chatId, long messageId) {
        String messageIdText = Long.toString(messageId);
        List<String> mids = new ArrayList<>();
        readStrings(READ_COUNT_DATABASE,
                "SELECT DISTINCT member_id FROM read_message_range"
                        + " WHERE chat_id=? AND from_msg_id<? AND to_msg_id>=?",
                new String[] {chatId, messageIdText, messageIdText}, mids);
        return mids;
    }

    @Override
    public List<String> memberMids(String chatId) {
        Set<String> mids = new LinkedHashSet<>();
        boolean anyTable = false;
        if (chatId.charAt(0) == 'c') {
            anyTable |= collect(mids, MAIN_DATABASE,
                    "SELECT m_id FROM membership WHERE id=? AND is_accepted=1", chatId);
        }
        anyTable |= collect(mids, MAIN_DATABASE,
                "SELECT mid FROM chat_member WHERE chat_id=?", chatId);
        return anyTable && !mids.isEmpty() ? new ArrayList<>(mids) : null;
    }

    @Override
    public Map<String, Profile> profiles(Collection<String> mids) {
        Map<String, Profile> profiles = new HashMap<>();
        List<String> all = new ArrayList<>(mids);
        for (int start = 0; start < all.size(); start += IN_CLAUSE_CHUNK) {
            List<String> chunk = all.subList(start, Math.min(all.size(), start + IN_CLAUSE_CHUNK));
            StringBuilder sql = new StringBuilder(
                    "SELECT mid, overridden_name, profile_name, picture_path FROM contacts WHERE mid IN (");
            for (int i = 0; i < chunk.size(); i++) {
                sql.append(i == 0 ? "?" : ",?");
            }
            sql.append(')');
            Cursor cursor = query(CONTACT_DATABASE, sql.toString(), chunk.toArray(new String[0]));
            if (cursor == null) {
                return profiles;
            }
            try {
                while (cursor.moveToNext()) {
                    String overridden = cursor.getString(1);
                    String name = overridden != null && !overridden.trim().isEmpty()
                            ? overridden : cursor.getString(2);
                    profiles.put(cursor.getString(0), new Profile(name, cursor.getString(3)));
                }
            } catch (RuntimeException exception) {
                close(CONTACT_DATABASE);
                return profiles;
            } finally {
                closeQuietly(cursor);
            }
        }
        return profiles;
    }

    private boolean collect(Set<String> into, String database, String sql, String chatId) {
        return readStrings(database, sql, new String[] {chatId}, into);
    }

    /**
     * 1 列目の文字列を読み取ります。cursor は読み終えたらすぐ閉じ、LINE 側の書き込みを長く待たせません。
     * 読み取りの途中で失敗した場合は接続を破棄し、false を返します。
     */
    private boolean readStrings(String database, String sql, String[] arguments, java.util.Collection<String> into) {
        Cursor cursor = query(database, sql, arguments);
        if (cursor == null) {
            return false;
        }
        try {
            while (cursor.moveToNext()) {
                into.add(cursor.getString(0));
            }
            return true;
        } catch (RuntimeException exception) {
            close(database);
            return false;
        } finally {
            closeQuietly(cursor);
        }
    }

    private static void closeQuietly(Cursor cursor) {
        try {
            cursor.close();
        } catch (RuntimeException ignored) {
            // 接続ごと破棄済みの場合があります。
        }
    }

    /** 失敗した接続は閉じ、次の呼び出しで開き直します。 */
    private Cursor query(String database, String sql, String[] arguments) {
        SQLiteDatabase connection = connection(database);
        if (connection == null) {
            return null;
        }
        try {
            return connection.rawQuery(sql, arguments);
        } catch (RuntimeException exception) {
            close(database);
            return null;
        }
    }

    private SQLiteDatabase connection(String database) {
        SQLiteDatabase connection = connections.get(database);
        if (connection != null && connection.isOpen()) {
            return connection;
        }
        File file = context.getDatabasePath(database);
        if (!file.isFile()) {
            return null;
        }
        try {
            connection = SQLiteDatabase.openDatabase(
                    file.getPath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.NO_LOCALIZED_COLLATORS);
            connections.put(database, connection);
            return connection;
        } catch (RuntimeException exception) {
            return null;
        }
    }

    private void close(String database) {
        SQLiteDatabase connection = connections.remove(database);
        if (connection != null) {
            try {
                connection.close();
            } catch (RuntimeException ignored) {
                // 次回は新しい接続を開きます。
            }
        }
    }
}

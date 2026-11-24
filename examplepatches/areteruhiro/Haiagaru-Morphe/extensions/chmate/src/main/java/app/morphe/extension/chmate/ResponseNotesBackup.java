package app.morphe.extension.chmate;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.net.URI;
import java.util.HashSet;
import java.util.Set;

/** Logical rows keep backups independent of the live SQLite and journal files. */
final class ResponseNotesBackup {
    static final String KEY = "responseNotes";
    private static final String[] TEXT_COLUMNS = {"id", "url", "title", "text", "source"};
    private static final int[] TEXT_LIMITS = {36, 8192, 160, 30000, 4000};
    private static final String[] COLUMNS = {"id", "url", "title", "text", "source", "number", "updated"};

    private ResponseNotesBackup() {}

    static JSONArray capture(Context context) throws Exception {
        JSONArray rows = new JSONArray();
        SQLiteDatabase db = ResponseNotesStore.get(context).getReadableDatabase();
        try (Cursor cursor = db.query("notes", COLUMNS, null, null, null, null, "id")) {
            while (cursor.moveToNext()) {
                JSONObject row = new JSONObject();
                for (int i = 0; i < TEXT_COLUMNS.length; i++) row.put(TEXT_COLUMNS[i], cursor.getString(i));
                row.put("number", cursor.getInt(5));
                row.put("updated", cursor.getLong(6));
                rows.put(row);
            }
        }
        return rows;
    }

    static void validate(JSONArray rows) throws Exception {
        if (rows == null) throw new IOException("Haiagaruのメモデータが不正です");
        Set<String> ids = new HashSet<>();
        Set<String> urls = new HashSet<>();
        for (int i = 0; i < rows.length(); i++) {
            JSONObject row = rows.getJSONObject(i);
            for (int j = 0; j < TEXT_COLUMNS.length; j++) {
                Object value = row.opt(TEXT_COLUMNS[j]);
                if (!(value instanceof String) || ((String) value).length() > TEXT_LIMITS[j])
                    throw new IOException("Haiagaruのメモ項目が不正です");
            }
            String id = row.getString("id");
            String url = row.getString("url");
            if (!id.matches("[a-f0-9-]{36}") || !ids.add(id)
                    || (!url.isEmpty() && (!validUrl(url) || !urls.add(url)))
                    || !integer(row.opt("number")) || row.getLong("number") < 0
                    || row.getLong("number") > Integer.MAX_VALUE
                    || !integer(row.opt("updated")) || row.getLong("updated") < 0) {
                throw new IOException("Haiagaruのメモデータが不正です");
            }
        }
    }

    private static boolean integer(Object value) {
        return value instanceof Integer || value instanceof Long;
    }

    private static boolean validUrl(String value) {
        try {
            URI uri = URI.create(value);
            return ("http".equalsIgnoreCase(uri.getScheme()) || "https".equalsIgnoreCase(uri.getScheme()))
                    && uri.getHost() != null && uri.getUserInfo() == null;
        } catch (IllegalArgumentException invalid) {
            return false;
        }
    }

    static void restore(Context context, JSONArray rows, boolean merge) throws Exception {
        if (rows == null || rows.length() == 0) return;
        ResponseNotesStore store = ResponseNotesStore.get(context);
        SQLiteDatabase db = store.getWritableDatabase();
        db.beginTransaction();
        try {
            for (int i = 0; i < rows.length(); i++) {
                JSONObject row = rows.getJSONObject(i);
                String id = row.getString("id");
                ResponseNotesStore.Note existing = store.response(row.getString("url"));
                if (existing == null) existing = store.find(id);
                if (merge && existing != null) continue;
                ContentValues values = new ContentValues();
                for (String column : TEXT_COLUMNS) values.put(column, row.getString(column));
                values.put("number", row.getInt("number"));
                values.put("updated", row.getLong("updated"));
                if (existing == null) db.insertOrThrow("notes", null, values);
                else {
                    values.remove("id");
                    db.update("notes", values, "id=?", new String[]{existing.id});
                }
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
        ResponseNoteIndicator.changed(context);
    }
}

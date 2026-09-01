package defpackage;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class obg extends SQLiteOpenHelper {
    public static final int a = Integer.parseInt(muc.v0(tuc.L("18.9.1", ".", ""), "-"));
    public static final String b = "cesdb".concat(muc.s0("18.9.1", "-", ""));
    public static obg c;

    public final void B(List list) throws IOException {
        if (list.isEmpty()) {
            return;
        }
        getWritableDatabase().delete("ce", "id IN ".concat(bu1.F0(list, ", ", "(", ")", cy9.c, 24)), null);
    }

    public final void f(tbg tbgVar) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("ss", tbgVar.a);
        contentValues.put("ts", Long.valueOf(tbgVar.b));
        getWritableDatabase().insert("ce", null, contentValues);
    }

    public final int m() {
        Cursor cursorRawQuery = getReadableDatabase().rawQuery("SELECT COUNT(*) FROM ce", null);
        int i = -1;
        try {
            if (cursorRawQuery.moveToNext()) {
                i = cursorRawQuery.getInt(0);
            }
        } catch (Exception unused) {
        } catch (Throwable th) {
            cursorRawQuery.close();
            throw th;
        }
        cursorRawQuery.close();
        return i;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("CREATE TABLE ce (id INTEGER PRIMARY KEY,ts BIGINT NOT NULL,ss TEXT NOT NULL)");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onDowngrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS ce");
        sQLiteDatabase.execSQL("CREATE TABLE ce (id INTEGER PRIMARY KEY,ts BIGINT NOT NULL,ss TEXT NOT NULL)");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS ce");
        sQLiteDatabase.execSQL("CREATE TABLE ce (id INTEGER PRIMARY KEY,ts BIGINT NOT NULL,ss TEXT NOT NULL)");
    }

    public final List p() {
        Cursor cursorQuery = getReadableDatabase().query("ce", null, null, null, null, null, "ts ASC");
        List arrayList = new ArrayList();
        while (cursorQuery.moveToNext()) {
            try {
                try {
                    int i = cursorQuery.getInt(cursorQuery.getColumnIndexOrThrow("id"));
                    String string = cursorQuery.getString(cursorQuery.getColumnIndexOrThrow("ss"));
                    long j = cursorQuery.getLong(cursorQuery.getColumnIndexOrThrow("ts"));
                    string.getClass();
                    arrayList.add(new tbg(string, i, j));
                } catch (Exception unused) {
                    arrayList = ey3.a;
                }
            } finally {
                cursorQuery.close();
            }
        }
        return arrayList;
    }
}

package com.apm.insight.e.a;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import java.util.HashMap;

/* loaded from: classes.dex */
public final class b extends a<com.apm.insight.d.a> {
    public b() {
        super("duplicatelog");
    }

    @Override // com.apm.insight.e.a.a
    public final /* synthetic */ ContentValues a(com.apm.insight.d.a aVar) {
        com.apm.insight.d.a aVar2 = aVar;
        ContentValues contentValues = new ContentValues();
        contentValues.put("path", aVar2.f21534a);
        contentValues.put("insert_time", Long.valueOf(aVar2.f21535b));
        return contentValues;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x002e A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(SQLiteDatabase sQLiteDatabase, String str) {
        Throwable th2;
        int count;
        if (sQLiteDatabase != null && !TextUtils.isEmpty(str)) {
            try {
                Cursor cursorQuery = sQLiteDatabase.query(this.f21564a, null, "path=?", new String[]{str}, null, null, null);
                count = cursorQuery.getCount();
                try {
                    cursorQuery.close();
                } catch (Throwable th3) {
                    th2 = th3;
                    com.apm.insight.a.b(th2);
                    if (count <= 0) {
                        return false;
                    }
                }
            } catch (Throwable th4) {
                th2 = th4;
                count = 0;
            }
            if (count <= 0) {
                return true;
            }
        }
        return false;
    }

    @Override // com.apm.insight.e.a.a
    public final void a(SQLiteDatabase sQLiteDatabase, com.apm.insight.d.a aVar) throws SQLException {
        if (aVar == null || a(sQLiteDatabase, aVar.f21534a)) {
            return;
        }
        super.a(sQLiteDatabase, (SQLiteDatabase) aVar);
        try {
            sQLiteDatabase.execSQL("delete from " + this.f21564a + " where _id in (select _id from " + this.f21564a + " order by insert_time desc limit 1000 offset 500)");
        } catch (Exception e3) {
            com.apm.insight.a.b((Throwable) e3);
        }
    }

    @Override // com.apm.insight.e.a.a
    public final HashMap<String, String> a() {
        HashMap<String, String> map = new HashMap<>();
        map.put("path", "TEXT");
        map.put("insert_time", "INTEGER");
        map.put("ext1", "TEXT");
        map.put("ext2", "TEXT");
        return map;
    }
}

package defpackage;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class cnb implements dnb {
    public final /* synthetic */ long a;
    public final /* synthetic */ kk0 b;

    public /* synthetic */ cnb(long j, kk0 kk0Var) {
        this.a = j;
        this.b = kk0Var;
    }

    @Override // defpackage.dnb
    public final Object apply(Object obj) {
        SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) obj;
        ContentValues contentValues = new ContentValues();
        contentValues.put("next_request_ms", Long.valueOf(this.a));
        kk0 kk0Var = this.b;
        String str = kk0Var.a;
        z0a z0aVar = kk0Var.c;
        if (sQLiteDatabase.update("transport_contexts", contentValues, "backend_name = ? and priority = ?", new String[]{str, String.valueOf(c1a.a(z0aVar))}) < 1) {
            contentValues.put("backend_name", str);
            contentValues.put("priority", Integer.valueOf(c1a.a(z0aVar)));
            sQLiteDatabase.insert("transport_contexts", null, contentValues);
        }
        return null;
    }
}

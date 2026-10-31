package be;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;

/* loaded from: classes3.dex */
public final /* synthetic */ class e implements i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f17834a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ td.i f17835b;

    public /* synthetic */ e(long j11, td.i iVar) {
        this.f17834a = j11;
        this.f17835b = iVar;
    }

    @Override // be.i
    public final Object apply(Object obj) {
        SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) obj;
        ContentValues contentValues = new ContentValues();
        contentValues.put("next_request_ms", Long.valueOf(this.f17834a));
        td.i iVar = this.f17835b;
        String str = iVar.f88985a;
        qd.d dVar = iVar.f88987c;
        if (sQLiteDatabase.update("transport_contexts", contentValues, "backend_name = ? and priority = ?", new String[]{str, String.valueOf(ee.a.a(dVar))}) < 1) {
            contentValues.put("backend_name", str);
            contentValues.put("priority", Integer.valueOf(ee.a.a(dVar)));
            sQLiteDatabase.insert("transport_contexts", null, contentValues);
        }
        return null;
    }
}

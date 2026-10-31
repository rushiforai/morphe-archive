package ae;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import h6.c1;

/* loaded from: classes3.dex */
public final /* synthetic */ class j implements ce.a, be.i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f12763a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f12764b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f12765c;

    public /* synthetic */ j(long j11, Object obj, Object obj2) {
        this.f12764b = obj;
        this.f12765c = obj2;
        this.f12763a = j11;
    }

    @Override // be.i
    public Object apply(Object obj) throws SQLException {
        String str = (String) this.f12764b;
        SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) obj;
        int i5 = ((wd.c) this.f12765c).f94199a;
        Cursor cursorRawQuery = sQLiteDatabase.rawQuery("SELECT 1 FROM log_event_dropped WHERE log_source = ? AND reason = ?", new String[]{str, Integer.toString(i5)});
        try {
            boolean z11 = cursorRawQuery.getCount() > 0;
            cursorRawQuery.close();
            long j11 = this.f12763a;
            if (z11) {
                sQLiteDatabase.execSQL(c1.o(j11, "UPDATE log_event_dropped SET events_dropped_count = events_dropped_count + ", " WHERE log_source = ? AND reason = ?"), new String[]{str, Integer.toString(i5)});
                return null;
            }
            ContentValues contentValues = new ContentValues();
            contentValues.put("log_source", str);
            contentValues.put("reason", Integer.valueOf(i5));
            contentValues.put("events_dropped_count", Long.valueOf(j11));
            sQLiteDatabase.insert("log_event_dropped", null, contentValues);
            return null;
        } catch (Throwable th2) {
            cursorRawQuery.close();
            throw th2;
        }
    }

    @Override // ce.a
    public Object l() {
        com.google.android.gms.internal.consent_sdk.d dVar = (com.google.android.gms.internal.consent_sdk.d) this.f12764b;
        td.i iVar = (td.i) this.f12765c;
        be.d dVar2 = (be.d) dVar.f32028c;
        long time = ((de.a) dVar.f32032g).getTime() + this.f12763a;
        be.k kVar = (be.k) dVar2;
        kVar.getClass();
        kVar.c(new be.e(time, iVar));
        return null;
    }
}

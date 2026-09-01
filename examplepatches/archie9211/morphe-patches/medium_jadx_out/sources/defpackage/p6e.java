package defpackage;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class p6e implements v5d {
    public final /* synthetic */ int a;
    public final /* synthetic */ fnb b;

    public /* synthetic */ p6e(fnb fnbVar, int i) {
        this.a = i;
        this.b = fnbVar;
    }

    @Override // defpackage.v5d
    public final Object c() {
        SQLiteDatabase sQLiteDatabaseF;
        int i = this.a;
        fnb fnbVar = this.b;
        switch (i) {
            case 0:
                fnbVar.getClass();
                int i2 = yo1.e;
                n0c n0cVar = new n0c(8);
                n0cVar.c = null;
                n0cVar.d = new ArrayList();
                n0cVar.e = null;
                n0cVar.b = "";
                HashMap map = new HashMap();
                sQLiteDatabaseF = fnbVar.f();
                sQLiteDatabaseF.beginTransaction();
                try {
                    yo1 yo1Var = (yo1) fnb.N(sQLiteDatabaseF.rawQuery("SELECT log_source, reason, events_dropped_count FROM log_event_dropped", new String[0]), new mt(fnbVar, map, n0cVar, 11));
                    sQLiteDatabaseF.setTransactionSuccessful();
                    return yo1Var;
                } finally {
                }
            default:
                long jE = fnbVar.b.e() - fnbVar.d.d;
                sQLiteDatabaseF = fnbVar.f();
                sQLiteDatabaseF.beginTransaction();
                try {
                    String[] strArr = {String.valueOf(jE)};
                    Cursor cursorRawQuery = sQLiteDatabaseF.rawQuery("SELECT COUNT(*), transport_name FROM events WHERE timestamp_ms < ? GROUP BY transport_name", strArr);
                    while (cursorRawQuery.moveToNext()) {
                        try {
                            fnbVar.D(cursorRawQuery.getInt(0), v77.MESSAGE_TOO_OLD, cursorRawQuery.getString(1));
                        } catch (Throwable th) {
                            cursorRawQuery.close();
                            throw th;
                        }
                    }
                    cursorRawQuery.close();
                    int iDelete = sQLiteDatabaseF.delete("events", "timestamp_ms < ?", strArr);
                    sQLiteDatabaseF.setTransactionSuccessful();
                    sQLiteDatabaseF.endTransaction();
                    return Integer.valueOf(iDelete);
                } finally {
                }
        }
    }
}

package defpackage;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.util.concurrent.Callable;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class e43 implements j43, v5d {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ long c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ e43(sj0 sj0Var, Iterable iterable, kk0 kk0Var, long j) {
        this.a = 2;
        this.b = sj0Var;
        this.e = iterable;
        this.d = kk0Var;
        this.c = j;
    }

    @Override // defpackage.j43
    public ScheduledFuture a(zm7 zm7Var) {
        int i = this.a;
        Object obj = this.d;
        long j = this.c;
        Object obj2 = this.e;
        i43 i43Var = (i43) this.b;
        switch (i) {
            case 0:
                return i43Var.b.schedule(new g43(i43Var, (Runnable) obj2, zm7Var, 1), j, (TimeUnit) obj);
            default:
                return i43Var.b.schedule(new h43(i43Var, (Callable) obj2, zm7Var, 0), j, (TimeUnit) obj);
        }
    }

    @Override // defpackage.v5d
    public Object c() {
        sj0 sj0Var = (sj0) this.b;
        Iterable iterable = (Iterable) this.e;
        kk0 kk0Var = (kk0) this.d;
        fnb fnbVar = (fnb) sj0Var.c;
        fnbVar.getClass();
        if (iterable.iterator().hasNext()) {
            String strConcat = "UPDATE events SET num_attempts = num_attempts + 1 WHERE _id in ".concat(fnb.L(iterable));
            SQLiteDatabase sQLiteDatabaseF = fnbVar.f();
            sQLiteDatabaseF.beginTransaction();
            try {
                sQLiteDatabaseF.compileStatement(strConcat).execute();
                Cursor cursorRawQuery = sQLiteDatabaseF.rawQuery("SELECT COUNT(*), transport_name FROM events WHERE num_attempts >= 16 GROUP BY transport_name", null);
                while (cursorRawQuery.moveToNext()) {
                    try {
                        fnbVar.D(cursorRawQuery.getInt(0), v77.MAX_RETRIES_REACHED, cursorRawQuery.getString(1));
                    } catch (Throwable th) {
                        cursorRawQuery.close();
                        throw th;
                    }
                }
                cursorRawQuery.close();
                sQLiteDatabaseF.compileStatement("DELETE FROM events WHERE num_attempts >= 16").execute();
                sQLiteDatabaseF.setTransactionSuccessful();
            } finally {
                sQLiteDatabaseF.endTransaction();
            }
        }
        fnbVar.p(new cnb(((dp1) sj0Var.g).e() + this.c, kk0Var));
        return null;
    }

    public /* synthetic */ e43(i43 i43Var, Object obj, long j, TimeUnit timeUnit, int i) {
        this.a = i;
        this.b = i43Var;
        this.e = obj;
        this.c = j;
        this.d = timeUnit;
    }
}

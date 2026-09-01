package defpackage;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class oc2 implements m33, dnb, v5d {
    public final /* synthetic */ Object a;
    public final /* synthetic */ long b;
    public final /* synthetic */ Object c;

    public /* synthetic */ oc2(long j, Object obj, Object obj2) {
        this.a = obj;
        this.c = obj2;
        this.b = j;
    }

    @Override // defpackage.dnb
    public Object apply(Object obj) {
        String str = (String) this.a;
        v77 v77Var = (v77) this.c;
        SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) obj;
        boolean zBooleanValue = ((Boolean) fnb.N(sQLiteDatabase.rawQuery("SELECT 1 FROM log_event_dropped WHERE log_source = ? AND reason = ?", new String[]{str, Integer.toString(v77Var.getNumber())}), new lg8(28))).booleanValue();
        long j = this.b;
        if (zBooleanValue) {
            sQLiteDatabase.execSQL(b09.x("UPDATE log_event_dropped SET events_dropped_count = events_dropped_count + ", " WHERE log_source = ? AND reason = ?", j), new String[]{str, Integer.toString(v77Var.getNumber())});
        } else {
            ContentValues contentValues = new ContentValues();
            contentValues.put("log_source", str);
            contentValues.put("reason", Integer.valueOf(v77Var.getNumber()));
            contentValues.put("events_dropped_count", Long.valueOf(j));
            sQLiteDatabase.insert("log_event_dropped", null, contentValues);
        }
        return null;
    }

    @Override // defpackage.v5d
    public Object c() {
        sj0 sj0Var = (sj0) this.a;
        kk0 kk0Var = (kk0) this.c;
        fnb fnbVar = (fnb) sj0Var.c;
        long jE = ((dp1) sj0Var.g).e() + this.b;
        fnbVar.getClass();
        fnbVar.p(new cnb(jE, kk0Var));
        return null;
    }

    @Override // defpackage.m33
    public void e(h8a h8aVar) {
        ((pc2) h8aVar.get()).d((String) this.a, this.b, (fk0) this.c);
    }

    public /* synthetic */ oc2(String str, long j, fk0 fk0Var) {
        this.a = str;
        this.b = j;
        this.c = fk0Var;
    }
}

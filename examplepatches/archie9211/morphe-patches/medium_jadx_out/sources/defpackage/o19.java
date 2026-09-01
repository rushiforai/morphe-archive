package defpackage;

import android.content.Context;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ScheduledFuture;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class o19 implements s72, z51, yp8, v5d, o92, xq8, u2d {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ o19(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.xq8
    public void N(jrg jrgVar) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 13:
                g76.S((Intent) obj);
                break;
            case 14:
                ((y6f) obj).b.d(null);
                break;
            default:
                ((ScheduledFuture) obj).cancel(false);
                break;
        }
    }

    @Override // defpackage.yp8
    public z4f W(View view, z4f z4fVar) {
        l6d l6dVar = (l6d) this.b;
        ArrayList arrayList = l6dVar.b;
        w4f w4fVar = z4fVar.a;
        b36 b36VarB = b36.b(w4fVar.i(519), w4fVar.i(64));
        b36 b36VarB2 = b36.b(w4fVar.j(519), w4fVar.j(64));
        if (!b36VarB.equals(l6dVar.c) || !b36VarB2.equals(l6dVar.d)) {
            l6dVar.c = b36VarB;
            l6dVar.d = b36VarB2;
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                a5a a5aVar = (a5a) arrayList.get(size);
                a5aVar.c = b36VarB;
                a5aVar.d = b36VarB2;
                a5aVar.c();
            }
        }
        return z4fVar;
    }

    public Object a(Object obj) {
        c29 c29Var = (c29) this.b;
        obj.getClass();
        return (l09) c29Var.invoke(obj);
    }

    @Override // defpackage.s72
    public void accept(Object obj) {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                ((iu) obj2).invoke(obj);
                break;
            case 1:
                ((hb8) obj2).invoke(obj);
                break;
            case 2:
                ((s7) obj2).invoke(obj);
                break;
            case 3:
                ((hb8) obj2).invoke(obj);
                break;
            case 4:
            default:
                ((hb8) obj2).invoke(obj);
                break;
            case 5:
                ((kg9) obj2).invoke(obj);
                break;
        }
    }

    public void b() {
        b55 b55Var = (b55) this.b;
        synchronized (uic.c) {
            uic.h = bu1.N0(uic.h, b55Var);
        }
    }

    @Override // defpackage.v5d
    public Object c() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 11:
                fnb fnbVar = (fnb) ((sj0) obj).i;
                SQLiteDatabase sQLiteDatabaseF = fnbVar.f();
                sQLiteDatabaseF.beginTransaction();
                try {
                    sQLiteDatabaseF.compileStatement("DELETE FROM log_event_dropped").execute();
                    sQLiteDatabaseF.compileStatement("UPDATE global_log_event_state SET last_metrics_upload_ms=" + fnbVar.b.e()).execute();
                    sQLiteDatabaseF.setTransactionSuccessful();
                    return null;
                } finally {
                    sQLiteDatabaseF.endTransaction();
                }
            default:
                o2b o2bVar = (o2b) obj;
                Iterator it2 = ((Iterable) ((fnb) o2bVar.c).p(new lg8(27))).iterator();
                while (it2.hasNext()) {
                    ((ku3) o2bVar.d).I((kk0) it2.next(), 1, false);
                }
                return null;
        }
    }

    public float d(float f) {
        return ((qpc) this.b).k.b() * f;
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) {
        ((CountDownLatch) this.b).countDown();
        return null;
    }

    @Override // defpackage.z51
    public void onCancel() {
        ((blc) this.b).a();
    }

    @Override // defpackage.u2d
    public v2d y(zdc zdcVar) {
        Context context = (Context) this.b;
        String str = (String) zdcVar.d;
        ad adVar = (ad) zdcVar.e;
        adVar.getClass();
        if (str != null && str.length() != 0) {
            return new f35(context, str, adVar, true, true);
        }
        ay0.e("Must set a non-null database name to a configuration that uses the no backup directory.");
        return null;
    }
}

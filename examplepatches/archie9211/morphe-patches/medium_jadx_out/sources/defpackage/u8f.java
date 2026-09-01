package defpackage;

import android.content.Context;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.yX.VrhD;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class u8f {
    public final c8f a;
    public final Context b;
    public final String c;
    public final vwa d;
    public final q7f e;
    public final r32 f;
    public final i2a g;
    public final WorkDatabase h;
    public final g8f i;
    public final v73 j;
    public final ArrayList k;
    public final String l;
    public final wa6 m;

    public final void a(int i) {
        j7f j7fVar = j7f.ENQUEUED;
        g8f g8fVar = this.i;
        String str = this.c;
        g8fVar.j(j7fVar, str);
        g8fVar.i(System.currentTimeMillis(), str);
        g8fVar.h(this.a.v, str);
        g8fVar.g(-1L, str);
        g8fVar.k(i, str);
    }

    public final void b() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        g8f g8fVar = this.i;
        String str = this.c;
        g8fVar.i(jCurrentTimeMillis, str);
        g8fVar.j(j7f.ENQUEUED, str);
        elb elbVar = g8fVar.a;
        ((Number) n01.c0(elbVar, false, true, new nmc(str, 18))).intValue();
        g8fVar.h(this.a.v, str);
        n01.c0(elbVar, false, true, new nmc(str, 19));
        g8fVar.g(-1L, str);
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x00d8  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0279  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(defpackage.p92 r23) {
        /*
            Method dump skipped, instruction units count: 666
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.u8f.c(p92):java.lang.Object");
    }

    public final void d(j37 j37Var) {
        String str = this.c;
        ArrayList arrayListT = d46.T(str);
        while (true) {
            boolean zIsEmpty = arrayListT.isEmpty();
            g8f g8fVar = this.i;
            if (zIsEmpty) {
                dt2 dt2Var = ((g37) j37Var).a;
                dt2Var.getClass();
                g8fVar.h(this.a.v, str);
                n01.c0(g8fVar.a, false, true, new vrd(dt2Var, 22, str));
                return;
            }
            String str2 = (String) bu1.U0(arrayListT);
            if (g8fVar.d(str2) != j7f.CANCELLED) {
                g8fVar.j(j7f.FAILED, str2);
            }
            arrayListT.addAll(this.j.a(str2));
        }
    }

    public u8f(iv2 iv2Var) {
        c8f c8fVar = (c8f) iv2Var.e;
        this.a = c8fVar;
        this.b = (Context) iv2Var.g;
        String str = c8fVar.a;
        this.c = str;
        this.d = (vwa) iv2Var.h;
        this.e = (q7f) iv2Var.b;
        this.f = (r32) iv2Var.a;
        this.g = (i2a) iv2Var.c;
        WorkDatabase workDatabase = (WorkDatabase) iv2Var.d;
        this.h = workDatabase;
        this.i = workDatabase.x();
        this.j = workDatabase.s();
        ArrayList arrayList = (ArrayList) iv2Var.f;
        this.k = arrayList;
        this.l = ka1.v(lv8.u("Work [ id=", str, ", tags={ "), bu1.F0(arrayList, VrhD.jXsJZO, null, null, null, 62), " } ]");
        this.m = bo.q();
    }
}

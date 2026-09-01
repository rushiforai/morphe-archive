package defpackage;

import android.os.Trace;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class az9 implements fu6 {
    public final int a;
    public final ku3 b;
    public final x45 c;
    public f72 d;
    public ivc e;
    public hvc f;
    public boolean g;
    public boolean h;
    public boolean i;
    public Object j;
    public boolean k;
    public zy9 l;
    public boolean m;
    public long n;
    public long o;
    public long p = e38.a();
    public boolean q;
    public final /* synthetic */ zf3 r;

    public az9(zf3 zf3Var, int i, ku3 ku3Var, x45 x45Var) {
        this.r = zf3Var;
        this.a = i;
        this.b = ku3Var;
        this.c = x45Var;
    }

    @Override // defpackage.fu6
    public final void a() {
        this.m = true;
    }

    public final void b() {
        hvc hvcVar = this.f;
        if (hvcVar != null) {
            hvcVar.cancel();
        }
        this.f = null;
        ivc ivcVar = this.e;
        if (ivcVar != null) {
            ivcVar.dispose();
        }
        this.e = null;
        this.l = null;
    }

    public final boolean c(ur urVar) {
        boolean zD;
        if (!this.r.c) {
            return false;
        }
        if (this.m) {
            Trace.beginSection("compose:lazy:prefetch:execute:urgent");
            try {
                zD = d(urVar);
            } finally {
                Trace.endSection();
            }
        } else {
            zD = d(urVar);
        }
        nm.N(-1L, "compose:lazy:prefetch:execute:item");
        return zD;
    }

    @Override // defpackage.fu6
    public final void cancel() {
        if (this.h) {
            return;
        }
        this.h = true;
        b();
    }

    /* JADX WARN: Removed duplicated region for block: B:107:0x01de  */
    /* JADX WARN: Type inference failed for: r12v5 */
    /* JADX WARN: Type inference failed for: r12v6, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r12v7 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean d(defpackage.ur r22) {
        /*
            Method dump skipped, instruction units count: 743
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.az9.d(ur):boolean");
    }

    public final boolean e() {
        hvc hvcVar;
        return this.i || ((hvcVar = this.f) != null && hvcVar.Q());
    }

    public final void f(Object obj, Object obj2, il0 il0Var) {
        hvc hx4Var;
        hvc hvcVar = this.f;
        if (hvcVar == null) {
            zf3 zf3Var = this.r;
            b55 b55VarA = ((ut6) zf3Var.d).a(obj, this.a, obj2);
            nq6 nq6VarA = ((kvc) zf3Var.b).a();
            if (nq6VarA.a.H()) {
                nq6VarA.k(obj, b55VarA, true);
                hx4Var = new hx4(nq6VarA, 11, obj);
            } else {
                hx4Var = new gg5(nq6VarA, 8, obj);
            }
            hvcVar = hx4Var;
            this.f = hvcVar;
            this.j = obj;
        }
        this.q = false;
        while (!hvcVar.Q() && !this.q) {
            hvcVar.b(new lt(this, 13, il0Var));
        }
        h();
        boolean z = this.q;
        long j = this.o;
        if (z) {
            il0Var.b = il0.a(j, il0Var.b);
        } else {
            il0Var.a = il0.a(j, il0Var.a);
        }
    }

    public final boolean g(long j, long j2) {
        if (this.m) {
            j2 = 0;
        }
        return j > j2;
    }

    public final void h() {
        long jA = e38.a();
        long jE = in3.e(cmd.b(jA, this.p));
        this.o = jE;
        long j = this.n - jE;
        this.n = j;
        this.p = jA;
        nm.N(j, "compose:lazy:prefetch:available_time_nanos");
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("HandleAndRequestImpl { index = ");
        sb.append(this.a);
        sb.append(", constraints = ");
        sb.append(this.d);
        sb.append(", isComposed = ");
        sb.append(e());
        sb.append(", isMeasured = ");
        sb.append(this.g);
        sb.append(", isCanceled = ");
        return lv8.t(sb, this.h, " }");
    }
}

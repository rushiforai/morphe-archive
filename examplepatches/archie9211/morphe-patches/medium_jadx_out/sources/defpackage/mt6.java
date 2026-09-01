package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mt6 {
    public final sb2 a;
    public final lf5 b;
    public final em4 c;
    public tj4 d;
    public tj4 e;
    public tj4 f;
    public boolean g;
    public final k49 h;
    public final k49 i;
    public final k49 j;
    public final k49 k;
    public long l;
    public long m;
    public of5 n;
    public final ou o;
    public final ou p;
    public final k49 q;
    public long r;

    public mt6(sb2 sb2Var, lf5 lf5Var, em4 em4Var) {
        this.a = sb2Var;
        this.b = lf5Var;
        this.c = em4Var;
        Boolean bool = Boolean.FALSE;
        this.h = qo7.u(bool);
        this.i = qo7.u(bool);
        this.j = qo7.u(bool);
        this.k = qo7.u(bool);
        this.l = 9223372034707292159L;
        this.m = 0L;
        this.n = lf5Var != null ? lf5Var.b() : null;
        this.o = new ou(new k46(0L), d46.o, null, 12);
        this.p = new ou(Float.valueOf(1.0f), d46.i, null, 12);
        this.q = qo7.u(new k46(0L));
        this.r = 9223372034707292159L;
    }

    public final void a() {
        of5 of5Var = this.n;
        tj4 tj4Var = this.d;
        k49 k49Var = this.i;
        boolean zBooleanValue = ((Boolean) k49Var.getValue()).booleanValue();
        sb2 sb2Var = this.a;
        n92 n92Var = null;
        if (zBooleanValue || tj4Var == null || of5Var == null) {
            if (c()) {
                if (of5Var != null) {
                    of5Var.g(1.0f);
                }
                vx0.c0(sb2Var, null, null, new jt6(this, n92Var, 0), 3);
                return;
            }
            return;
        }
        k49Var.setValue(Boolean.TRUE);
        boolean zC = c();
        boolean z = !zC;
        if (!zC) {
            of5Var.g(0.0f);
        }
        vx0.c0(sb2Var, null, null, new qa(z, this, tj4Var, of5Var, (n92) null), 3);
    }

    public final void b() {
        if (((Boolean) this.h.getValue()).booleanValue()) {
            vx0.c0(this.a, null, null, new jt6(this, null, 1), 3);
        }
    }

    public final boolean c() {
        return ((Boolean) this.j.getValue()).booleanValue();
    }

    public final void d() {
        lf5 lf5Var;
        k49 k49Var = this.h;
        boolean zBooleanValue = ((Boolean) k49Var.getValue()).booleanValue();
        int i = 3;
        sb2 sb2Var = this.a;
        n92 n92Var = null;
        if (zBooleanValue) {
            k49Var.setValue(Boolean.FALSE);
            vx0.c0(sb2Var, null, null, new jt6(this, n92Var, 2), 3);
        }
        k49 k49Var2 = this.i;
        if (((Boolean) k49Var2.getValue()).booleanValue()) {
            k49Var2.setValue(Boolean.FALSE);
            vx0.c0(sb2Var, null, null, new jt6(this, n92Var, i), 3);
        }
        if (c()) {
            this.j.setValue(Boolean.FALSE);
            vx0.c0(sb2Var, null, null, new jt6(this, n92Var, 4), 3);
        }
        this.g = false;
        e(0L);
        this.l = 9223372034707292159L;
        of5 of5Var = this.n;
        if (of5Var != null && (lf5Var = this.b) != null) {
            lf5Var.a(of5Var);
        }
        this.n = null;
        this.d = null;
        this.f = null;
        this.e = null;
    }

    public final void e(long j) {
        this.q.setValue(new k46(j));
    }
}

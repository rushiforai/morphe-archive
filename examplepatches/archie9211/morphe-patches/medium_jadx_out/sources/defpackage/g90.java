package defpackage;

import android.os.Trace;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g90 extends c09 implements p3b {
    public static final nx v = new nx(4);
    public bs0 h;
    public boolean i;
    public va6 j;
    public sb2 l;
    public x45 n;
    public k90 q;
    public a90 r;
    public final xpc s;
    public final xpc t;
    public final wua u;
    public final k49 f = qo7.u(null);
    public float g = 1.0f;
    public long k = 9205357640488583168L;
    public x45 m = v;
    public w82 o = v82.b;
    public int p = 1;

    public g90(a90 a90Var) {
        this.r = a90Var;
        this.s = vv2.j(a90Var);
        xpc xpcVarJ = vv2.j(b90.a);
        this.t = xpcVarJ;
        this.u = bo.A(xpcVarJ);
    }

    @Override // defpackage.c09
    public final boolean a(float f) {
        this.g = f;
        return true;
    }

    @Override // defpackage.p3b
    public final void b() {
        va6 va6Var = this.j;
        if (va6Var != null) {
            va6Var.m(null);
        }
        this.j = null;
        Object obj = (c09) this.f.getValue();
        p3b p3bVar = obj instanceof p3b ? (p3b) obj : null;
        if (p3bVar != null) {
            p3bVar.b();
        }
        this.i = false;
    }

    @Override // defpackage.p3b
    public final void c() {
        va6 va6Var = this.j;
        if (va6Var != null) {
            va6Var.m(null);
        }
        this.j = null;
        Object obj = (c09) this.f.getValue();
        p3b p3bVar = obj instanceof p3b ? (p3b) obj : null;
        if (p3bVar != null) {
            p3bVar.c();
        }
        this.i = false;
    }

    @Override // defpackage.p3b
    public final void d() {
        Trace.beginSection("AsyncImagePainter.onRemembered");
        try {
            Object obj = (c09) this.f.getValue();
            p3b p3bVar = obj instanceof p3b ? (p3b) obj : null;
            if (p3bVar != null) {
                p3bVar.d();
            }
            j();
            this.i = true;
        } finally {
            Trace.endSection();
        }
    }

    @Override // defpackage.c09
    public final boolean e(bs0 bs0Var) {
        this.h = bs0Var;
        return true;
    }

    @Override // defpackage.c09
    public final long h() {
        c09 c09Var = (c09) this.f.getValue();
        if (c09Var != null) {
            return c09Var.h();
        }
        return 9205357640488583168L;
    }

    @Override // defpackage.c09
    public final void i(zl3 zl3Var) {
        long jF = zl3Var.f();
        if (!dfc.a(this.k, jF)) {
            this.k = jF;
        }
        c09 c09Var = (c09) this.f.getValue();
        if (c09Var != null) {
            c09Var.g(zl3Var, zl3Var.f(), this.g, this.h);
        }
    }

    public final void j() {
        a90 a90Var = this.r;
        if (a90Var == null) {
            return;
        }
        sb2 sb2Var = this.l;
        n92 n92Var = null;
        if (sb2Var == null) {
            g76.g0("scope");
            throw null;
        }
        l0 l0Var = new l0(this, a90Var, n92Var, 13);
        ib2 ib2VarQ = sb2Var.Q();
        int i = ppe.b;
        kb2 kb2Var = (kb2) ib2VarQ.o0(kb2.b);
        enc encVarB0 = (kb2Var == null || kb2Var.equals(xg3.b)) ? vx0.b0(sb2Var, xg3.b, wb2.UNDISPATCHED, l0Var) : vx0.b0(o7f.c(new p33(sb2Var.Q())), new q33(kb2Var), wb2.UNDISPATCHED, l0Var);
        va6 va6Var = this.j;
        if (va6Var != null) {
            va6Var.m(null);
        }
        this.j = encVarB0;
    }

    public final void k(a90 a90Var) {
        if (g76.L(this.r, a90Var)) {
            return;
        }
        this.r = a90Var;
        if (a90Var == null) {
            va6 va6Var = this.j;
            if (va6Var != null) {
                va6Var.m(null);
            }
            this.j = null;
        } else if (this.i) {
            j();
        }
        if (a90Var != null) {
            this.s.m(null, a90Var);
        }
    }

    public final rx5 l(rx5 rx5Var, boolean z) {
        nx5 nx5VarA = rx5.a(rx5Var);
        nx5VarA.d = new s26(rx5Var, 9, this);
        px5 px5Var = rx5Var.u;
        if (px5Var.i == null) {
            nx5VarA.q = lfc.a;
        }
        if (px5Var.j == null) {
            w82 w82Var = this.o;
            int i = ppe.b;
            nx5VarA.r = (g76.L(w82Var, v82.b) || g76.L(w82Var, v82.e)) ? dqb.FIT : dqb.FILL;
        }
        if (px5Var.k == null) {
            nx5VarA.s = ux9.INEXACT;
        }
        if (z) {
            zx3 zx3Var = zx3.a;
            nx5VarA.h = zx3Var;
            nx5VarA.i = zx3Var;
            nx5VarA.j = zx3Var;
        }
        return nx5VarA.a();
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:44:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void m(defpackage.f90 r11) {
        /*
            r10 = this;
            xpc r0 = r10.t
            java.lang.Object r1 = r0.getValue()
            f90 r1 = (defpackage.f90) r1
            x45 r2 = r10.m
            java.lang.Object r11 = r2.invoke(r11)
            f90 r11 = (defpackage.f90) r11
            r0.l(r11)
            w82 r5 = r10.o
            boolean r0 = r11 instanceof defpackage.e90
            r9 = 0
            if (r0 == 0) goto L20
            r0 = r11
            e90 r0 = (defpackage.e90) r0
            w0d r0 = r0.b
            goto L29
        L20:
            boolean r0 = r11 instanceof defpackage.c90
            if (r0 == 0) goto L6f
            r0 = r11
            c90 r0 = (defpackage.c90) r0
            r14 r0 = r0.b
        L29:
            rx5 r2 = r0.b()
            q84 r3 = defpackage.wx5.a
            java.lang.Object r2 = defpackage.k40.b0(r2, r3)
            yrd r2 = (defpackage.yrd) r2
            h90 r3 = defpackage.rv8.a
            csd r2 = r2.a(r3, r0)
            boolean r3 = r2 instanceof defpackage.oj2
            if (r3 == 0) goto L6f
            c09 r3 = r1.a()
            boolean r4 = r1 instanceof defpackage.d90
            if (r4 == 0) goto L48
            goto L49
        L48:
            r3 = r9
        L49:
            c09 r4 = r11.a()
            int r6 = defpackage.in3.d
            oj2 r2 = (defpackage.oj2) r2
            int r2 = r2.c
            mn3 r6 = defpackage.mn3.MILLISECONDS
            long r6 = defpackage.hlg.T(r2, r6)
            boolean r2 = r0 instanceof defpackage.w0d
            if (r2 == 0) goto L67
            w0d r0 = (defpackage.w0d) r0
            boolean r0 = r0.g
            if (r0 != 0) goto L64
            goto L67
        L64:
            r0 = 0
        L65:
            r8 = r0
            goto L69
        L67:
            r0 = 1
            goto L65
        L69:
            mj2 r2 = new mj2
            r2.<init>(r3, r4, r5, r6, r8)
            goto L70
        L6f:
            r2 = r9
        L70:
            if (r2 == 0) goto L73
            goto L77
        L73:
            c09 r2 = r11.a()
        L77:
            k49 r0 = r10.f
            r0.setValue(r2)
            c09 r0 = r1.a()
            c09 r2 = r11.a()
            if (r0 == r2) goto La7
            c09 r0 = r1.a()
            boolean r1 = r0 instanceof defpackage.p3b
            if (r1 == 0) goto L91
            p3b r0 = (defpackage.p3b) r0
            goto L92
        L91:
            r0 = r9
        L92:
            if (r0 == 0) goto L97
            r0.c()
        L97:
            c09 r0 = r11.a()
            boolean r1 = r0 instanceof defpackage.p3b
            if (r1 == 0) goto La2
            r9 = r0
            p3b r9 = (defpackage.p3b) r9
        La2:
            if (r9 == 0) goto La7
            r9.d()
        La7:
            x45 r10 = r10.n
            if (r10 == 0) goto Lae
            r10.invoke(r11)
        Lae:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g90.m(f90):void");
    }
}

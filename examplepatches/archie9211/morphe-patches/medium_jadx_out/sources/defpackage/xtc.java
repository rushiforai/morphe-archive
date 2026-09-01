package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xtc {
    public final sv0 a;
    public final fb6 b;
    public final g9f c;
    public final xtc[] d;
    public final fa4 e;
    public boolean f;
    public String g;
    public String h;

    public xtc(sv0 sv0Var, fb6 fb6Var, g9f g9fVar, xtc[] xtcVarArr) {
        sv0Var.getClass();
        this.a = sv0Var;
        this.b = fb6Var;
        this.c = g9fVar;
        this.d = xtcVarArr;
        this.e = fb6Var.b;
        int iOrdinal = g9fVar.ordinal();
        if (xtcVarArr != null) {
            xtc xtcVar = xtcVarArr[iOrdinal];
            if (xtcVar == null && xtcVar == this) {
                return;
            }
            xtcVarArr[iOrdinal] = this;
        }
    }

    public final xtc a(xzb xzbVar) {
        xtc xtcVar;
        xzbVar.getClass();
        fb6 fb6Var = this.b;
        g9f g9fVarE0 = vn7.e0(fb6Var, xzbVar);
        char c = g9fVarE0.begin;
        sv0 sv0Var = this.a;
        if (c != 0) {
            sv0Var.d(c);
            sv0Var.b = true;
        }
        String str = this.g;
        if (str != null) {
            String strA = this.h;
            if (strA == null) {
                strA = xzbVar.a();
            }
            sv0Var.a();
            sv0Var.h(str);
            sv0Var.d(':');
            r(strA);
            this.g = null;
            this.h = null;
        }
        if (this.c == g9fVarE0) {
            return this;
        }
        xtc[] xtcVarArr = this.d;
        return (xtcVarArr == null || (xtcVar = xtcVarArr[g9fVarE0.ordinal()]) == null) ? new xtc(sv0Var, fb6Var, g9fVarE0, xtcVarArr) : xtcVar;
    }

    public final void b(boolean z) {
        if (this.f) {
            r(String.valueOf(z));
        } else {
            ((ad) this.a.c).x(String.valueOf(z));
        }
    }

    public final void c(byte b) {
        if (this.f) {
            r(String.valueOf((int) b));
        } else {
            this.a.c(b);
        }
    }

    public final void d(char c) {
        r(String.valueOf(c));
    }

    public final void e(double d) {
        boolean z = this.f;
        sv0 sv0Var = this.a;
        if (z) {
            r(String.valueOf(d));
        } else {
            ((ad) sv0Var.c).x(String.valueOf(d));
        }
        if (Double.isInfinite(d) || Double.isNaN(d)) {
            throw m40.q(Double.valueOf(d), ((ad) sv0Var.c).toString());
        }
    }

    public final void f(xzb xzbVar, int i) {
        xzbVar.getClass();
        int i2 = wtc.a[this.c.ordinal()];
        sv0 sv0Var = this.a;
        boolean z = true;
        if (i2 == 1) {
            if (!sv0Var.b) {
                sv0Var.d(',');
            }
            sv0Var.a();
            return;
        }
        if (i2 == 2) {
            if (sv0Var.b) {
                this.f = true;
                sv0Var.a();
                return;
            }
            if (i % 2 == 0) {
                sv0Var.d(',');
                sv0Var.a();
            } else {
                sv0Var.d(':');
                sv0Var.i();
                z = false;
            }
            this.f = z;
            return;
        }
        if (i2 != 3) {
            if (!sv0Var.b) {
                sv0Var.d(',');
            }
            sv0Var.a();
            bgf.D(this.b, xzbVar);
            r(xzbVar.f(i));
            sv0Var.d(':');
            sv0Var.i();
            return;
        }
        if (i == 0) {
            this.f = true;
        }
        if (i == 1) {
            sv0Var.d(',');
            sv0Var.i();
            this.f = false;
        }
    }

    public final void g(float f) {
        boolean z = this.f;
        sv0 sv0Var = this.a;
        if (z) {
            r(String.valueOf(f));
        } else {
            ((ad) sv0Var.c).x(String.valueOf(f));
        }
        if (Float.isInfinite(f) || Float.isNaN(f)) {
            throw m40.q(Float.valueOf(f), ((ad) sv0Var.c).toString());
        }
    }

    public final xtc h(xzb xzbVar) {
        xzbVar.getClass();
        boolean zA = ytc.a(xzbVar);
        g9f g9fVar = this.c;
        fb6 fb6Var = this.b;
        sv0 z12Var = this.a;
        if (zA) {
            if (!(z12Var instanceof a22)) {
                z12Var = new a22((ad) z12Var.c, this.f);
            }
            return new xtc(z12Var, fb6Var, g9fVar, null);
        }
        if (xzbVar.isInline() && xzbVar.equals(ec6.a)) {
            if (!(z12Var instanceof z12)) {
                z12Var = new z12((ad) z12Var.c, this.f);
            }
            return new xtc(z12Var, fb6Var, g9fVar, null);
        }
        if (this.g != null) {
            this.h = xzbVar.a();
        }
        return this;
    }

    public final xtc i(p0a p0aVar, int i) {
        f(p0aVar, i);
        return h(p0aVar.h(i));
    }

    public final void j(int i) {
        if (this.f) {
            r(String.valueOf(i));
        } else {
            this.a.e(i);
        }
    }

    public final void k(long j) {
        if (this.f) {
            r(String.valueOf(j));
        } else {
            this.a.f(j);
        }
    }

    public final void l(xzb xzbVar, int i, long j) {
        xzbVar.getClass();
        f(xzbVar, i);
        k(j);
    }

    public final void m() {
        sv0 sv0Var = this.a;
        sv0Var.getClass();
        ((ad) sv0Var.c).x("null");
    }

    public final void n(xzb xzbVar, int i, pj6 pj6Var, Object obj) {
        xzbVar.getClass();
        pj6Var.getClass();
        xzbVar.getClass();
        pj6Var.getClass();
        f(xzbVar, i);
        if (pj6Var.a().c()) {
            p(pj6Var, obj);
        } else if (obj == null) {
            m();
        } else {
            p(pj6Var, obj);
        }
    }

    public final void o(xzb xzbVar, int i, pj6 pj6Var, Object obj) {
        xzbVar.getClass();
        pj6Var.getClass();
        f(xzbVar, i);
        p(pj6Var, obj);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x003e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void p(defpackage.pj6 r6, java.lang.Object r7) {
        /*
            r5 = this;
            r6.getClass()
            fb6 r0 = r5.b
            ku3 r1 = r0.a
            boolean r2 = r6 instanceof defpackage.dc9
            java.lang.Object r1 = r1.d
            in1 r1 = (defpackage.in1) r1
            r3 = 0
            if (r2 == 0) goto L15
            in1 r4 = defpackage.in1.NONE
            if (r1 == r4) goto L4b
            goto L3e
        L15:
            int[] r4 = defpackage.cc9.a
            int r1 = r1.ordinal()
            r1 = r4[r1]
            r4 = 1
            if (r1 == r4) goto L4b
            r4 = 2
            if (r1 == r4) goto L4b
            r4 = 3
            if (r1 != r4) goto L47
            xzb r1 = r6.a()
            mo7 r1 = r1.j()
            wuc r4 = defpackage.wuc.e
            boolean r4 = defpackage.g76.L(r1, r4)
            if (r4 != 0) goto L3e
            wuc r4 = defpackage.wuc.h
            boolean r1 = defpackage.g76.L(r1, r4)
            if (r1 == 0) goto L4b
        L3e:
            xzb r1 = r6.a()
            java.lang.String r0 = defpackage.gr7.f(r0, r1)
            goto L4c
        L47:
            defpackage.ygf.a()
            return
        L4b:
            r0 = r3
        L4c:
            if (r2 == 0) goto L67
            dc9 r6 = (defpackage.dc9) r6
            if (r7 != 0) goto L5e
            xzb r5 = r6.a()
            java.lang.String r6 = " should always be non-null. Please report issue to the kotlinx.serialization tracker."
            java.lang.String r7 = "Value for serializer "
            defpackage.rd6.v(r7, r5, r6)
            return
        L5e:
            r7.getClass()
            fa4 r5 = r5.e
            r5.getClass()
            throw r3
        L67:
            if (r0 == 0) goto L75
            xzb r1 = r6.a()
            java.lang.String r1 = r1.a()
            r5.g = r0
            r5.h = r1
        L75:
            r6.b(r5, r7)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xtc.p(pj6, java.lang.Object):void");
    }

    public final void q(short s) {
        if (this.f) {
            r(String.valueOf((int) s));
        } else {
            this.a.g(s);
        }
    }

    public final void r(String str) {
        str.getClass();
        this.a.h(str);
    }

    public final void s(xzb xzbVar) {
        xzbVar.getClass();
        g9f g9fVar = this.c;
        if (g9fVar.end != 0) {
            sv0 sv0Var = this.a;
            sv0Var.getClass();
            sv0Var.b = false;
            sv0Var.d(g9fVar.end);
        }
    }

    public final boolean t(xzb xzbVar) {
        return false;
    }
}

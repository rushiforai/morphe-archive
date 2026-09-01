package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pr5 extends m3f {
    public static final int[] k = new int[2];

    public static void m(int[] iArr, int i, int i2, int i3, int i4, float f, int i5) {
        int i6 = i2 - i;
        int i7 = i4 - i3;
        if (i5 != -1) {
            if (i5 == 0) {
                iArr[0] = (int) ((i7 * f) + 0.5f);
                iArr[1] = i7;
                return;
            } else {
                if (i5 != 1) {
                    return;
                }
                iArr[0] = i6;
                iArr[1] = (int) ((i6 * f) + 0.5f);
                return;
            }
        }
        int i8 = (int) ((i7 * f) + 0.5f);
        int i9 = (int) ((i6 / f) + 0.5f);
        if (i8 <= i6) {
            iArr[0] = i8;
            iArr[1] = i7;
        } else if (i9 <= i7) {
            iArr[0] = i6;
            iArr[1] = i9;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:115:0x0262  */
    @Override // defpackage.t73
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(defpackage.t73 r23) {
        /*
            Method dump skipped, instruction units count: 892
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pr5.a(t73):void");
    }

    @Override // defpackage.m3f
    public final void d() {
        b72 b72Var;
        c72 c72Var;
        a72 a72Var;
        c72 c72Var2;
        c72 c72Var3;
        a72 a72Var2;
        b72 b72Var2 = this.b;
        boolean z = b72Var2.a;
        ye3 ye3Var = this.e;
        if (z) {
            ye3Var.d(b72Var2.r());
        }
        boolean z2 = ye3Var.j;
        ArrayList arrayList = ye3Var.k;
        ArrayList arrayList2 = ye3Var.l;
        y73 y73Var = this.i;
        y73 y73Var2 = this.h;
        if (z2) {
            a72 a72Var3 = this.d;
            a72 a72Var4 = a72.MATCH_PARENT;
            if (a72Var3 == a72Var4 && (c72Var = (b72Var = this.b).V) != null && ((a72Var = c72Var.U[0]) == a72.FIXED || a72Var == a72Var4)) {
                m3f.b(y73Var2, c72Var.d.h, b72Var.J.e());
                m3f.b(y73Var, c72Var.d.i, -this.b.L.e());
                return;
            }
        } else {
            b72 b72Var3 = this.b;
            a72 a72Var5 = b72Var3.U[0];
            this.d = a72Var5;
            if (a72Var5 != a72.MATCH_CONSTRAINT) {
                a72 a72Var6 = a72.MATCH_PARENT;
                if (a72Var5 == a72Var6 && (c72Var3 = b72Var3.V) != null && ((a72Var2 = c72Var3.U[0]) == a72.FIXED || a72Var2 == a72Var6)) {
                    int iR = (c72Var3.r() - this.b.J.e()) - this.b.L.e();
                    m3f.b(y73Var2, c72Var3.d.h, this.b.J.e());
                    m3f.b(y73Var, c72Var3.d.i, -this.b.L.e());
                    ye3Var.d(iR);
                    return;
                }
                if (a72Var5 == a72.FIXED) {
                    ye3Var.d(b72Var3.r());
                }
            }
        }
        if (ye3Var.j) {
            b72 b72Var4 = this.b;
            if (b72Var4.a) {
                l52[] l52VarArr = b72Var4.R;
                l52 l52Var = l52VarArr[0];
                l52 l52Var2 = l52Var.f;
                if (l52Var2 != null && l52VarArr[1].f != null) {
                    boolean zY = b72Var4.y();
                    b72 b72Var5 = this.b;
                    if (zY) {
                        y73Var2.f = b72Var5.R[0].e();
                        y73Var.f = -this.b.R[1].e();
                        return;
                    }
                    y73 y73VarH = m3f.h(b72Var5.R[0]);
                    if (y73VarH != null) {
                        m3f.b(y73Var2, y73VarH, this.b.R[0].e());
                    }
                    y73 y73VarH2 = m3f.h(this.b.R[1]);
                    if (y73VarH2 != null) {
                        m3f.b(y73Var, y73VarH2, -this.b.R[1].e());
                    }
                    y73Var2.b = true;
                    y73Var.b = true;
                    return;
                }
                if (l52Var2 != null) {
                    y73 y73VarH3 = m3f.h(l52Var);
                    if (y73VarH3 != null) {
                        m3f.b(y73Var2, y73VarH3, this.b.R[0].e());
                        m3f.b(y73Var, y73Var2, ye3Var.g);
                        return;
                    }
                    return;
                }
                l52 l52Var3 = l52VarArr[1];
                if (l52Var3.f != null) {
                    y73 y73VarH4 = m3f.h(l52Var3);
                    if (y73VarH4 != null) {
                        m3f.b(y73Var, y73VarH4, -this.b.R[1].e());
                        m3f.b(y73Var2, y73Var, -ye3Var.g);
                        return;
                    }
                    return;
                }
                if ((b72Var4 instanceof jj5) || b72Var4.V == null || b72Var4.j(k52.CENTER).f != null) {
                    return;
                }
                b72 b72Var6 = this.b;
                m3f.b(y73Var2, b72Var6.V.d.h, b72Var6.s());
                m3f.b(y73Var, y73Var2, ye3Var.g);
                return;
            }
        }
        if (this.d == a72.MATCH_CONSTRAINT) {
            b72 b72Var7 = this.b;
            int i = b72Var7.s;
            if (i == 2) {
                c72 c72Var4 = b72Var7.V;
                if (c72Var4 != null) {
                    ye3 ye3Var2 = c72Var4.e.e;
                    arrayList2.add(ye3Var2);
                    ye3Var2.k.add(ye3Var);
                    ye3Var.b = true;
                    arrayList.add(y73Var2);
                    arrayList.add(y73Var);
                }
            } else if (i == 3) {
                if (b72Var7.t == 3) {
                    y73Var2.a = this;
                    y73Var.a = this;
                    bte bteVar = b72Var7.e;
                    bteVar.h.a = this;
                    bteVar.i.a = this;
                    ye3Var.a = this;
                    if (b72Var7.z()) {
                        arrayList2.add(this.b.e.e);
                        this.b.e.e.k.add(ye3Var);
                        bte bteVar2 = this.b.e;
                        bteVar2.e.a = this;
                        arrayList2.add(bteVar2.h);
                        arrayList2.add(this.b.e.i);
                        this.b.e.h.k.add(ye3Var);
                        this.b.e.i.k.add(ye3Var);
                    } else {
                        boolean zY2 = this.b.y();
                        b72 b72Var8 = this.b;
                        if (zY2) {
                            b72Var8.e.e.l.add(ye3Var);
                            arrayList.add(this.b.e.e);
                        } else {
                            b72Var8.e.e.l.add(ye3Var);
                        }
                    }
                } else {
                    ye3 ye3Var3 = b72Var7.e.e;
                    arrayList2.add(ye3Var3);
                    ye3Var3.k.add(ye3Var);
                    this.b.e.h.k.add(ye3Var);
                    this.b.e.i.k.add(ye3Var);
                    ye3Var.b = true;
                    arrayList.add(y73Var2);
                    arrayList.add(y73Var);
                    y73Var2.l.add(ye3Var);
                    y73Var.l.add(ye3Var);
                }
            }
        }
        b72 b72Var9 = this.b;
        l52[] l52VarArr2 = b72Var9.R;
        l52 l52Var4 = l52VarArr2[0];
        l52 l52Var5 = l52Var4.f;
        if (l52Var5 != null && l52VarArr2[1].f != null) {
            boolean zY3 = b72Var9.y();
            b72 b72Var10 = this.b;
            if (zY3) {
                y73Var2.f = b72Var10.R[0].e();
                y73Var.f = -this.b.R[1].e();
                return;
            }
            y73 y73VarH5 = m3f.h(b72Var10.R[0]);
            y73 y73VarH6 = m3f.h(this.b.R[1]);
            if (y73VarH5 != null) {
                y73VarH5.b(this);
            }
            if (y73VarH6 != null) {
                y73VarH6.b(this);
            }
            this.j = l3f.CENTER;
            return;
        }
        if (l52Var5 != null) {
            y73 y73VarH7 = m3f.h(l52Var4);
            if (y73VarH7 != null) {
                m3f.b(y73Var2, y73VarH7, this.b.R[0].e());
                c(y73Var, y73Var2, 1, ye3Var);
                return;
            }
            return;
        }
        l52 l52Var6 = l52VarArr2[1];
        if (l52Var6.f != null) {
            y73 y73VarH8 = m3f.h(l52Var6);
            if (y73VarH8 != null) {
                m3f.b(y73Var, y73VarH8, -this.b.R[1].e());
                c(y73Var2, y73Var, -1, ye3Var);
                return;
            }
            return;
        }
        if ((b72Var9 instanceof jj5) || (c72Var2 = b72Var9.V) == null) {
            return;
        }
        m3f.b(y73Var2, c72Var2.d.h, b72Var9.s());
        c(y73Var, y73Var2, 1, ye3Var);
    }

    @Override // defpackage.m3f
    public final void e() {
        y73 y73Var = this.h;
        if (y73Var.j) {
            this.b.a0 = y73Var.g;
        }
    }

    @Override // defpackage.m3f
    public final void f() {
        this.c = null;
        this.h.c();
        this.i.c();
        this.e.c();
        this.g = false;
    }

    @Override // defpackage.m3f
    public final boolean k() {
        return this.d != a72.MATCH_CONSTRAINT || this.b.s == 0;
    }

    public final void n() {
        this.g = false;
        y73 y73Var = this.h;
        y73Var.c();
        y73Var.j = false;
        y73 y73Var2 = this.i;
        y73Var2.c();
        y73Var2.j = false;
        this.e.j = false;
    }

    public final String toString() {
        return "HorizontalRun " + this.b.j0;
    }
}

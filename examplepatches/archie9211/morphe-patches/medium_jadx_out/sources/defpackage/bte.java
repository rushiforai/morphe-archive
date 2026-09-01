package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bte extends m3f {
    public y73 k;
    public ko0 l;

    @Override // defpackage.t73
    public final void a(t73 t73Var) {
        float f;
        float f2;
        float f3;
        int i;
        if (ate.a[this.j.ordinal()] == 3) {
            b72 b72Var = this.b;
            l(b72Var.K, b72Var.M, 1);
            return;
        }
        ye3 ye3Var = this.e;
        if (ye3Var.c && !ye3Var.j && this.d == a72.MATCH_CONSTRAINT) {
            b72 b72Var2 = this.b;
            int i2 = b72Var2.t;
            if (i2 == 2) {
                c72 c72Var = b72Var2.V;
                if (c72Var != null) {
                    if (c72Var.e.e.j) {
                        ye3Var.d((int) ((r1.g * b72Var2.A) + 0.5f));
                    }
                }
            } else if (i2 == 3) {
                ye3 ye3Var2 = b72Var2.d.e;
                if (ye3Var2.j) {
                    int i3 = b72Var2.Z;
                    if (i3 == -1) {
                        f = ye3Var2.g;
                        f2 = b72Var2.Y;
                    } else if (i3 == 0) {
                        f3 = ye3Var2.g * b72Var2.Y;
                        i = (int) (f3 + 0.5f);
                        ye3Var.d(i);
                    } else if (i3 != 1) {
                        i = 0;
                        ye3Var.d(i);
                    } else {
                        f = ye3Var2.g;
                        f2 = b72Var2.Y;
                    }
                    f3 = f / f2;
                    i = (int) (f3 + 0.5f);
                    ye3Var.d(i);
                }
            }
        }
        y73 y73Var = this.h;
        boolean z = y73Var.c;
        ArrayList arrayList = y73Var.l;
        if (z) {
            y73 y73Var2 = this.i;
            boolean z2 = y73Var2.c;
            ArrayList arrayList2 = y73Var2.l;
            if (z2) {
                if (y73Var.j && y73Var2.j && ye3Var.j) {
                    return;
                }
                if (!ye3Var.j && this.d == a72.MATCH_CONSTRAINT) {
                    b72 b72Var3 = this.b;
                    if (b72Var3.s == 0 && !b72Var3.z()) {
                        y73 y73Var3 = (y73) arrayList.get(0);
                        y73 y73Var4 = (y73) arrayList2.get(0);
                        int i4 = y73Var3.g + y73Var.f;
                        int i5 = y73Var4.g + y73Var2.f;
                        y73Var.d(i4);
                        y73Var2.d(i5);
                        ye3Var.d(i5 - i4);
                        return;
                    }
                }
                if (!ye3Var.j && this.d == a72.MATCH_CONSTRAINT && this.a == 1 && arrayList.size() > 0 && arrayList2.size() > 0) {
                    y73 y73Var5 = (y73) arrayList.get(0);
                    int i6 = (((y73) arrayList2.get(0)).g + y73Var2.f) - (y73Var5.g + y73Var.f);
                    int i7 = ye3Var.m;
                    if (i6 < i7) {
                        ye3Var.d(i6);
                    } else {
                        ye3Var.d(i7);
                    }
                }
                if (ye3Var.j && arrayList.size() > 0 && arrayList2.size() > 0) {
                    y73 y73Var6 = (y73) arrayList.get(0);
                    y73 y73Var7 = (y73) arrayList2.get(0);
                    int i8 = y73Var6.g;
                    int i9 = y73Var.f + i8;
                    int i10 = y73Var7.g;
                    int i11 = y73Var2.f + i10;
                    float f4 = this.b.g0;
                    if (y73Var6 == y73Var7) {
                        f4 = 0.5f;
                    } else {
                        i8 = i9;
                        i10 = i11;
                    }
                    y73Var.d((int) ((((i10 - i8) - ye3Var.g) * f4) + i8 + 0.5f));
                    y73Var2.d(y73Var.g + ye3Var.g);
                }
            }
        }
    }

    @Override // defpackage.m3f
    public final void d() {
        b72 b72Var;
        c72 c72Var;
        c72 c72Var2;
        c72 c72Var3;
        y73 y73Var = this.k;
        b72 b72Var2 = this.b;
        boolean z = b72Var2.a;
        ye3 ye3Var = this.e;
        if (z) {
            ye3Var.d(b72Var2.l());
        }
        boolean z2 = ye3Var.j;
        ArrayList arrayList = ye3Var.k;
        ArrayList arrayList2 = ye3Var.l;
        y73 y73Var2 = this.i;
        y73 y73Var3 = this.h;
        if (!z2) {
            b72 b72Var3 = this.b;
            this.d = b72Var3.U[1];
            if (b72Var3.F) {
                this.l = new ko0(this);
            }
            a72 a72Var = this.d;
            if (a72Var != a72.MATCH_CONSTRAINT) {
                if (a72Var == a72.MATCH_PARENT && (c72Var3 = this.b.V) != null && c72Var3.U[1] == a72.FIXED) {
                    int iL = (c72Var3.l() - this.b.K.e()) - this.b.M.e();
                    m3f.b(y73Var3, c72Var3.e.h, this.b.K.e());
                    m3f.b(y73Var2, c72Var3.e.i, -this.b.M.e());
                    ye3Var.d(iL);
                    return;
                }
                if (a72Var == a72.FIXED) {
                    ye3Var.d(this.b.l());
                }
            }
        } else if (this.d == a72.MATCH_PARENT && (c72Var = (b72Var = this.b).V) != null && c72Var.U[1] == a72.FIXED) {
            m3f.b(y73Var3, c72Var.e.h, b72Var.K.e());
            m3f.b(y73Var2, c72Var.e.i, -this.b.M.e());
            return;
        }
        boolean z3 = ye3Var.j;
        if (z3) {
            b72 b72Var4 = this.b;
            if (b72Var4.a) {
                l52[] l52VarArr = b72Var4.R;
                l52 l52Var = l52VarArr[2];
                l52 l52Var2 = l52Var.f;
                if (l52Var2 != null && l52VarArr[3].f != null) {
                    boolean z4 = b72Var4.z();
                    b72 b72Var5 = this.b;
                    if (z4) {
                        y73Var3.f = b72Var5.R[2].e();
                        y73Var2.f = -this.b.R[3].e();
                    } else {
                        y73 y73VarH = m3f.h(b72Var5.R[2]);
                        if (y73VarH != null) {
                            m3f.b(y73Var3, y73VarH, this.b.R[2].e());
                        }
                        y73 y73VarH2 = m3f.h(this.b.R[3]);
                        if (y73VarH2 != null) {
                            m3f.b(y73Var2, y73VarH2, -this.b.R[3].e());
                        }
                        y73Var3.b = true;
                        y73Var2.b = true;
                    }
                    b72 b72Var6 = this.b;
                    if (b72Var6.F) {
                        m3f.b(y73Var, y73Var3, b72Var6.c0);
                        return;
                    }
                    return;
                }
                if (l52Var2 != null) {
                    y73 y73VarH3 = m3f.h(l52Var);
                    if (y73VarH3 != null) {
                        m3f.b(y73Var3, y73VarH3, this.b.R[2].e());
                        m3f.b(y73Var2, y73Var3, ye3Var.g);
                        b72 b72Var7 = this.b;
                        if (b72Var7.F) {
                            m3f.b(y73Var, y73Var3, b72Var7.c0);
                            return;
                        }
                        return;
                    }
                    return;
                }
                l52 l52Var3 = l52VarArr[3];
                if (l52Var3.f != null) {
                    y73 y73VarH4 = m3f.h(l52Var3);
                    if (y73VarH4 != null) {
                        m3f.b(y73Var2, y73VarH4, -this.b.R[3].e());
                        m3f.b(y73Var3, y73Var2, -ye3Var.g);
                    }
                    b72 b72Var8 = this.b;
                    if (b72Var8.F) {
                        m3f.b(y73Var, y73Var3, b72Var8.c0);
                        return;
                    }
                    return;
                }
                l52 l52Var4 = l52VarArr[4];
                if (l52Var4.f != null) {
                    y73 y73VarH5 = m3f.h(l52Var4);
                    if (y73VarH5 != null) {
                        m3f.b(y73Var, y73VarH5, 0);
                        m3f.b(y73Var3, y73Var, -this.b.c0);
                        m3f.b(y73Var2, y73Var3, ye3Var.g);
                        return;
                    }
                    return;
                }
                if ((b72Var4 instanceof jj5) || b72Var4.V == null || b72Var4.j(k52.CENTER).f != null) {
                    return;
                }
                b72 b72Var9 = this.b;
                m3f.b(y73Var3, b72Var9.V.e.h, b72Var9.t());
                m3f.b(y73Var2, y73Var3, ye3Var.g);
                b72 b72Var10 = this.b;
                if (b72Var10.F) {
                    m3f.b(y73Var, y73Var3, b72Var10.c0);
                    return;
                }
                return;
            }
        }
        if (z3 || this.d != a72.MATCH_CONSTRAINT) {
            ye3Var.b(this);
        } else {
            b72 b72Var11 = this.b;
            int i = b72Var11.t;
            if (i == 2) {
                c72 c72Var4 = b72Var11.V;
                if (c72Var4 != null) {
                    ye3 ye3Var2 = c72Var4.e.e;
                    arrayList2.add(ye3Var2);
                    ye3Var2.k.add(ye3Var);
                    ye3Var.b = true;
                    arrayList.add(y73Var3);
                    arrayList.add(y73Var2);
                }
            } else if (i == 3 && !b72Var11.z()) {
                b72 b72Var12 = this.b;
                if (b72Var12.s != 3) {
                    ye3 ye3Var3 = b72Var12.d.e;
                    arrayList2.add(ye3Var3);
                    ye3Var3.k.add(ye3Var);
                    ye3Var.b = true;
                    arrayList.add(y73Var3);
                    arrayList.add(y73Var2);
                }
            }
        }
        b72 b72Var13 = this.b;
        l52[] l52VarArr2 = b72Var13.R;
        l52 l52Var5 = l52VarArr2[2];
        l52 l52Var6 = l52Var5.f;
        if (l52Var6 != null && l52VarArr2[3].f != null) {
            boolean z5 = b72Var13.z();
            b72 b72Var14 = this.b;
            if (z5) {
                y73Var3.f = b72Var14.R[2].e();
                y73Var2.f = -this.b.R[3].e();
            } else {
                y73 y73VarH6 = m3f.h(b72Var14.R[2]);
                y73 y73VarH7 = m3f.h(this.b.R[3]);
                if (y73VarH6 != null) {
                    y73VarH6.b(this);
                }
                if (y73VarH7 != null) {
                    y73VarH7.b(this);
                }
                this.j = l3f.CENTER;
            }
            if (this.b.F) {
                c(y73Var, y73Var3, 1, this.l);
            }
        } else if (l52Var6 != null) {
            y73 y73VarH8 = m3f.h(l52Var5);
            if (y73VarH8 != null) {
                m3f.b(y73Var3, y73VarH8, this.b.R[2].e());
                c(y73Var2, y73Var3, 1, ye3Var);
                if (this.b.F) {
                    c(y73Var, y73Var3, 1, this.l);
                }
                a72 a72Var2 = this.d;
                a72 a72Var3 = a72.MATCH_CONSTRAINT;
                if (a72Var2 == a72Var3) {
                    b72 b72Var15 = this.b;
                    if (b72Var15.Y > 0.0f) {
                        pr5 pr5Var = b72Var15.d;
                        if (pr5Var.d == a72Var3) {
                            pr5Var.e.k.add(ye3Var);
                            arrayList2.add(this.b.d.e);
                            ye3Var.a = this;
                        }
                    }
                }
            }
        } else {
            l52 l52Var7 = l52VarArr2[3];
            if (l52Var7.f != null) {
                y73 y73VarH9 = m3f.h(l52Var7);
                if (y73VarH9 != null) {
                    m3f.b(y73Var2, y73VarH9, -this.b.R[3].e());
                    c(y73Var3, y73Var2, -1, ye3Var);
                    if (this.b.F) {
                        c(y73Var, y73Var3, 1, this.l);
                    }
                }
            } else {
                l52 l52Var8 = l52VarArr2[4];
                if (l52Var8.f != null) {
                    y73 y73VarH10 = m3f.h(l52Var8);
                    if (y73VarH10 != null) {
                        m3f.b(y73Var, y73VarH10, 0);
                        c(y73Var3, y73Var, -1, this.l);
                        c(y73Var2, y73Var3, 1, ye3Var);
                    }
                } else if (!(b72Var13 instanceof jj5) && (c72Var2 = b72Var13.V) != null) {
                    m3f.b(y73Var3, c72Var2.e.h, b72Var13.t());
                    c(y73Var2, y73Var3, 1, ye3Var);
                    if (this.b.F) {
                        c(y73Var, y73Var3, 1, this.l);
                    }
                    a72 a72Var4 = this.d;
                    a72 a72Var5 = a72.MATCH_CONSTRAINT;
                    if (a72Var4 == a72Var5) {
                        b72 b72Var16 = this.b;
                        if (b72Var16.Y > 0.0f) {
                            pr5 pr5Var2 = b72Var16.d;
                            if (pr5Var2.d == a72Var5) {
                                pr5Var2.e.k.add(ye3Var);
                                arrayList2.add(this.b.d.e);
                                ye3Var.a = this;
                            }
                        }
                    }
                }
            }
        }
        if (arrayList2.size() == 0) {
            ye3Var.c = true;
        }
    }

    @Override // defpackage.m3f
    public final void e() {
        y73 y73Var = this.h;
        if (y73Var.j) {
            this.b.b0 = y73Var.g;
        }
    }

    @Override // defpackage.m3f
    public final void f() {
        this.c = null;
        this.h.c();
        this.i.c();
        this.k.c();
        this.e.c();
        this.g = false;
    }

    @Override // defpackage.m3f
    public final boolean k() {
        return this.d != a72.MATCH_CONSTRAINT || this.b.t == 0;
    }

    public final void m() {
        this.g = false;
        y73 y73Var = this.h;
        y73Var.c();
        y73Var.j = false;
        y73 y73Var2 = this.i;
        y73Var2.c();
        y73Var2.j = false;
        y73 y73Var3 = this.k;
        y73Var3.c();
        y73Var3.j = false;
        this.e.j = false;
    }

    public final String toString() {
        return "VerticalRun " + this.b.j0;
    }
}

package defpackage;

import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mr6 implements al7 {
    public final or6 a;
    public final int b;
    public final boolean c;
    public final float d;
    public final al7 e;
    public final float f;
    public final boolean g;
    public final sb2 h;
    public final m73 i;
    public final int j;
    public final x45 k;
    public final x45 l;
    public final List m;
    public final int n;
    public final int o;
    public final int p;
    public final hw8 q;
    public final int r;
    public final int s;

    public mr6(or6 or6Var, int i, boolean z, float f, al7 al7Var, float f2, boolean z2, sb2 sb2Var, m73 m73Var, int i2, x45 x45Var, x45 x45Var2, List list, int i3, int i4, int i5, hw8 hw8Var, int i6, int i7) {
        this.a = or6Var;
        this.b = i;
        this.c = z;
        this.d = f;
        this.e = al7Var;
        this.f = f2;
        this.g = z2;
        this.h = sb2Var;
        this.i = m73Var;
        this.j = i2;
        this.k = x45Var;
        this.l = x45Var2;
        this.m = list;
        this.n = i3;
        this.o = i4;
        this.p = i5;
        this.q = hw8Var;
        this.r = i6;
        this.s = i7;
    }

    @Override // defpackage.al7
    public final int a() {
        return this.e.a();
    }

    @Override // defpackage.al7
    public final int b() {
        return this.e.b();
    }

    @Override // defpackage.al7
    public final Map c() {
        return this.e.c();
    }

    @Override // defpackage.al7
    public final void d() {
        this.e.d();
    }

    @Override // defpackage.al7
    public final x45 e() {
        return this.e.e();
    }

    public final mr6 f(int i, boolean z) {
        or6 or6Var;
        int i2;
        if (this.g) {
            return null;
        }
        List list = this.m;
        if (list.isEmpty() || (or6Var = this.a) == null) {
            return null;
        }
        int i3 = or6Var.g;
        int i4 = this.b - i;
        if (i4 < 0 || i4 >= i3) {
            return null;
        }
        nr6 nr6Var = (nr6) bu1.x0(list);
        nr6 nr6Var2 = (nr6) bu1.H0(list);
        if (nr6Var.w || nr6Var2.w) {
            return null;
        }
        int i5 = this.o;
        int i6 = this.n;
        hw8 hw8Var = this.q;
        if (i < 0) {
            if (Math.min((t40.I(nr6Var, hw8Var) + nr6Var.o) - i6, (t40.I(nr6Var2, hw8Var) + nr6Var2.o) - i5) <= (-i)) {
                return null;
            }
        } else if (Math.min(i6 - t40.I(nr6Var, hw8Var), i5 - t40.I(nr6Var2, hw8Var)) <= i) {
            return null;
        }
        int size = list.size();
        int i7 = 0;
        while (i7 < size) {
            nr6 nr6Var3 = (nr6) list.get(i7);
            nr6Var3.getClass();
            if (!nr6Var3.w) {
                long j = nr6Var3.t;
                nr6Var3.t = (((long) (((int) (j & 4294967295L)) + i)) & 4294967295L) | (((long) ((int) (j >> 32))) << 32);
                if (z) {
                    int size2 = nr6Var3.g.size();
                    int i8 = 0;
                    while (i8 < size2) {
                        mt6 mt6VarA = nr6Var3.j.a(i8, nr6Var3.b);
                        if (mt6VarA != null) {
                            long j2 = mt6VarA.l;
                            i2 = i4;
                            mt6VarA.l = (((long) (((int) (j2 & 4294967295L)) + i)) & 4294967295L) | (((long) ((int) (j2 >> 32))) << 32);
                        } else {
                            i2 = i4;
                        }
                        i8++;
                        i4 = i2;
                    }
                }
            }
            i7++;
            i4 = i4;
        }
        return new mr6(this.a, i4, this.c || i > 0, i, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, list, this.n, this.o, this.p, this.q, this.r, this.s);
    }

    public final long g() {
        al7 al7Var = this.e;
        return (((long) al7Var.b()) << 32) | (((long) al7Var.a()) & 4294967295L);
    }
}

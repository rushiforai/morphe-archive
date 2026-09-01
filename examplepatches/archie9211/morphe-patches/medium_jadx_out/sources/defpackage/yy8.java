package defpackage;

import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yy8 implements al7 {
    public final List a;
    public final int b;
    public final int c;
    public final int d;
    public final hw8 e;
    public final int f;
    public final int g;
    public final int h;
    public final el7 i;
    public final el7 j;
    public final float k;
    public final int l;
    public final boolean m;
    public final hpe n;
    public final al7 o;
    public final boolean p;
    public final List q;
    public final List r;
    public final sb2 s;
    public final m73 t;
    public final long u;

    public yy8(List list, int i, int i2, int i3, hw8 hw8Var, int i4, int i5, int i6, el7 el7Var, el7 el7Var2, float f, int i7, boolean z, hpe hpeVar, al7 al7Var, boolean z2, List list2, List list3, sb2 sb2Var, m73 m73Var, long j) {
        this.a = list;
        this.b = i;
        this.c = i2;
        this.d = i3;
        this.e = hw8Var;
        this.f = i4;
        this.g = i5;
        this.h = i6;
        this.i = el7Var;
        this.j = el7Var2;
        this.k = f;
        this.l = i7;
        this.m = z;
        this.n = hpeVar;
        this.o = al7Var;
        this.p = z2;
        this.q = list2;
        this.r = list3;
        this.s = sb2Var;
        this.t = m73Var;
        this.u = j;
    }

    @Override // defpackage.al7
    public final int a() {
        return this.o.a();
    }

    @Override // defpackage.al7
    public final int b() {
        return this.o.b();
    }

    @Override // defpackage.al7
    public final Map c() {
        return this.o.c();
    }

    @Override // defpackage.al7
    public final void d() {
        this.o.d();
    }

    @Override // defpackage.al7
    public final x45 e() {
        return this.o.e();
    }

    public final yy8 f(int i) {
        int i2;
        int i3 = this.b + this.c;
        if (this.p) {
            return null;
        }
        List list = this.a;
        if (list.isEmpty() || this.i == null || (i2 = this.l - i) < 0 || i2 >= i3) {
            return null;
        }
        float f = this.k - (i3 != 0 ? i / i3 : 0.0f);
        if (this.j == null || f >= 0.5f || f <= -0.5f) {
            return null;
        }
        el7 el7Var = (el7) bu1.x0(list);
        el7 el7Var2 = (el7) bu1.H0(list);
        int i4 = this.g;
        int i5 = this.f;
        if (i < 0) {
            if (Math.min((el7Var.j + i3) - i5, (el7Var2.j + i3) - i4) <= (-i)) {
                return null;
            }
        } else if (Math.min(i5 - el7Var.j, i4 - el7Var2.j) <= i) {
            return null;
        }
        int size = list.size();
        for (int i6 = 0; i6 < size; i6++) {
            ((el7) list.get(i6)).a(i);
        }
        List list2 = this.q;
        int size2 = list2.size();
        for (int i7 = 0; i7 < size2; i7++) {
            ((el7) list2.get(i7)).a(i);
        }
        List list3 = this.r;
        int size3 = list3.size();
        for (int i8 = 0; i8 < size3; i8++) {
            ((el7) list3.get(i8)).a(i);
        }
        return new yy8(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, f, i2, this.m || i > 0, this.n, this.o, this.p, this.q, this.r, this.s, this.t, this.u);
    }

    public final long g() {
        al7 al7Var = this.o;
        return (((long) al7Var.b()) << 32) | (((long) al7Var.a()) & 4294967295L);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ yy8(int i, int i2, int i3, hw8 hw8Var, int i4, int i5, int i6, hpe hpeVar, al7 al7Var, sb2 sb2Var, m73 m73Var, long j) {
        ey3 ey3Var = ey3.a;
        this(ey3Var, i, i2, i3, hw8Var, i4, i5, i6, null, null, 0.0f, 0, false, hpeVar, al7Var, false, ey3Var, ey3Var, sb2Var, m73Var, j);
    }
}

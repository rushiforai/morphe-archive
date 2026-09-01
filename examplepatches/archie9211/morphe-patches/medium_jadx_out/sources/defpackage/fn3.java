package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fn3 implements gd9 {
    public final long a;
    public final m73 b;
    public final int c;
    public final hq d;
    public final ak e;
    public final ak f;
    public final o3f g;
    public final o3f h;
    public final bk i;
    public final bk j;
    public final bk k;
    public final p3f l;
    public final p3f m;

    public fn3(long j, m73 m73Var, hq hqVar) {
        int iI0 = m73Var.i0(48.0f);
        this.a = j;
        this.b = m73Var;
        this.c = iI0;
        this.d = hqVar;
        int iI02 = m73Var.i0(xj3.a(j));
        yq0 yq0Var = z46.p;
        this.e = new ak(yq0Var, yq0Var, iI02);
        yq0 yq0Var2 = z46.r;
        this.f = new ak(yq0Var2, yq0Var2, iI02);
        this.g = new o3f(bo.c);
        this.h = new o3f(bo.d);
        int iI03 = m73Var.i0(xj3.b(j));
        zq0 zq0Var = z46.m;
        zq0 zq0Var2 = z46.o;
        this.i = new bk(zq0Var, zq0Var2, iI03);
        this.j = new bk(zq0Var2, zq0Var, iI03);
        this.k = new bk(z46.n, zq0Var, iI03);
        this.l = new p3f(zq0Var, iI0);
        this.m = new p3f(zq0Var2, iI0);
    }

    @Override // defpackage.gd9
    public final long C(o46 o46Var, long j, ip6 ip6Var, long j2) {
        o46 o46Var2;
        long j3;
        char c;
        int iA;
        int i;
        int i2;
        char c2 = ' ';
        int i3 = (int) (j >> 32);
        boolean z = true;
        List listR = d46.R(this.e, this.f, ((int) (o46Var.a() >> 32)) < i3 / 2 ? this.g : this.h);
        int size = listR.size();
        int i4 = 0;
        while (true) {
            if (i4 >= size) {
                o46Var2 = o46Var;
                j3 = j;
                c = c2;
                iA = 0;
                break;
            }
            hy7 hy7Var = (hy7) listR.get(i4);
            int i5 = (int) (j2 >> c2);
            int i6 = size;
            c = c2;
            j3 = j;
            int i7 = i4;
            o46Var2 = o46Var;
            iA = hy7Var.a(o46Var2, j3, i5, ip6Var);
            if (i7 == listR.size() - 1 || (iA >= 0 && i5 + iA <= i3)) {
                break;
            }
            i4 = i7 + 1;
            size = i6;
            c2 = c;
        }
        int i8 = (int) (j3 & 4294967295L);
        List listR2 = d46.R(this.i, this.j, this.k, ((int) (o46Var2.a() & 4294967295L)) < i8 / 2 ? this.l : this.m);
        int size2 = listR2.size();
        int i9 = 0;
        while (i9 < size2) {
            boolean z2 = z;
            int i10 = (int) (j2 & 4294967295L);
            int iA2 = ((iy7) listR2.get(i9)).a(o46Var2, j3, i10);
            if (i9 == listR2.size() - 1 || (iA2 >= (i2 = this.c) && i10 + iA2 <= i8 - i2)) {
                i = iA2;
                break;
            }
            i9++;
            z = z2;
        }
        i = 0;
        long j4 = (((long) iA) << c) | (((long) i) & 4294967295L);
        this.d.invoke(o46Var2, g76.s(j4, j2));
        return j4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof fn3) {
            fn3 fn3Var = (fn3) obj;
            return this.a == fn3Var.a && g76.L(this.b, fn3Var.b) && this.c == fn3Var.c && this.d == fn3Var.d;
        }
        return false;
    }

    public final int hashCode() {
        long j = this.a;
        return this.d.hashCode() + ((((this.b.hashCode() + (((int) (j ^ (j >>> 32))) * 31)) * 31) + this.c) * 31);
    }

    public final String toString() {
        return "DropdownMenuPositionProvider(contentOffset=" + ((Object) xj3.c(this.a)) + ", density=" + this.b + ", verticalMargin=" + this.c + ", onPositionCalculated=" + this.d + ')';
    }
}

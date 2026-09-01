package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fw6 {
    public final pw6 a;
    public final List b;
    public final aw6 c;
    public final hx4 d;
    public final long e;
    public final boolean f;
    public final yt6 g;
    public final int h;
    public final long i;
    public final int j;
    public final int k;
    public final int l;
    public final sb2 m;
    public final boolean n;
    public final List o;
    public final lf5 p;
    public final ew6 q;
    public final xp r;
    public final int s;

    public fw6(pw6 pw6Var, List list, aw6 aw6Var, hx4 hx4Var, long j, boolean z, yt6 yt6Var, int i, long j2, int i2, int i3, int i4, sb2 sb2Var, boolean z2, List list2, lf5 lf5Var) {
        this.a = pw6Var;
        this.b = list;
        this.c = aw6Var;
        this.d = hx4Var;
        this.e = j;
        this.f = z;
        this.g = yt6Var;
        this.h = i;
        this.i = j2;
        this.j = i2;
        this.k = i3;
        this.l = i4;
        this.m = sb2Var;
        this.n = z2;
        this.o = list2;
        this.p = lf5Var;
        this.q = new ew6(this, z, aw6Var, yt6Var, hx4Var);
        this.r = pw6Var.e;
        this.s = ((int[]) hx4Var.c).length;
    }

    public final long a(aw6 aw6Var, int i, int i2) {
        boolean zN = aw6Var.b.s.N(i);
        int i3 = zN ? this.s : 1;
        if (zN) {
            i2 = 0;
        }
        return (((long) i2) << 32) | (((long) (i3 + i2)) & 4294967295L);
    }
}

package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class p38 implements q38 {
    public final long a;
    public final long b;
    public final sv2 c;
    public final long d;
    public final long e;
    public final long f;
    public final long g;
    public final long h;
    public final long i;
    public final long j;
    public final long k;
    public final long l;
    public final long m;
    public final long n;
    public final long o;
    public final Float p;
    public final List q;
    public final ArrayList r;
    public final ArrayList s;
    public final List t;

    public p38(long j, long j2, sv2 sv2Var, long j3, long j4, long j5, long j6, long j7, long j8, long j9, long j10, long j11, long j12, long j13, long j14, Float f, ArrayList arrayList, ArrayList arrayList2, ArrayList arrayList3, List list) {
        this.a = j;
        this.b = j2;
        this.c = sv2Var;
        this.d = j3;
        this.e = j4;
        this.f = j5;
        this.g = j6;
        this.h = j7;
        this.i = j8;
        this.j = j9;
        this.k = j10;
        this.l = j11;
        this.m = j12;
        this.n = j13;
        this.o = j14;
        this.p = f;
        this.q = arrayList;
        this.r = arrayList2;
        this.s = arrayList3;
        this.t = list;
    }

    @Override // defpackage.q38
    public final long a() {
        return this.a;
    }

    @Override // defpackage.q38
    public final long b() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p38)) {
            return false;
        }
        p38 p38Var = (p38) obj;
        return this.a == p38Var.a && this.b == p38Var.b && this.c.equals(p38Var.c) && this.d == p38Var.d && this.e == p38Var.e && this.f == p38Var.f && this.g == p38Var.g && this.h == p38Var.h && this.i == p38Var.i && this.j == p38Var.j && this.k == p38Var.k && this.l == p38Var.l && this.m == p38Var.m && this.n == p38Var.n && this.o == p38Var.o && g76.L(this.p, p38Var.p) && g76.L(this.q, p38Var.q) && this.r.equals(p38Var.r) && this.s.equals(p38Var.s) && this.t.equals(p38Var.t);
    }

    public final int hashCode() {
        long j = this.a;
        long j2 = this.b;
        int iP = wgd.p(((((int) (j ^ (j >>> 32))) * 31) + ((int) (j2 ^ (j2 >>> 32)))) * 31, 31, this.c.a);
        long j3 = this.d;
        int i = (iP + ((int) (j3 ^ (j3 >>> 32)))) * 31;
        long j4 = this.e;
        int i2 = (i + ((int) (j4 ^ (j4 >>> 32)))) * 31;
        long j5 = this.f;
        int i3 = (i2 + ((int) (j5 ^ (j5 >>> 32)))) * 31;
        long j6 = this.g;
        int i4 = (i3 + ((int) (j6 ^ (j6 >>> 32)))) * 31;
        long j7 = this.h;
        int i5 = (i4 + ((int) (j7 ^ (j7 >>> 32)))) * 31;
        long j8 = this.i;
        int i6 = (i5 + ((int) (j8 ^ (j8 >>> 32)))) * 31;
        long j9 = this.j;
        int i7 = (i6 + ((int) (j9 ^ (j9 >>> 32)))) * 31;
        long j10 = this.k;
        int i8 = (i7 + ((int) (j10 ^ (j10 >>> 32)))) * 31;
        long j11 = this.l;
        int i9 = (i8 + ((int) (j11 ^ (j11 >>> 32)))) * 31;
        long j12 = this.m;
        int i10 = (i9 + ((int) (j12 ^ (j12 >>> 32)))) * 31;
        long j13 = this.n;
        int i11 = (i10 + ((int) (j13 ^ (j13 >>> 32)))) * 31;
        long j14 = this.o;
        int i12 = (i11 + ((int) (j14 ^ (j14 >>> 32)))) * 31;
        Float f = this.p;
        int iHashCode = (i12 + (f == null ? 0 : f.hashCode())) * 31;
        List list = this.q;
        return this.t.hashCode() + b09.p(this.s, b09.p(this.r, (iHashCode + (list != null ? list.hashCode() : 0)) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sbD = b09.D("Success(startTime=", ", endTime=", this.a);
        sbD.append(this.b);
        sbD.append(", dateSelectFieldUiModel=");
        sbD.append(this.c);
        wgd.y(sbD, ", totalViews=", this.d, ", memberViews=");
        sbD.append(this.e);
        wgd.y(sbD, ", nonMemberViews=", this.f, ", totalReads=");
        sbD.append(this.g);
        wgd.y(sbD, ", memberReads=", this.h, ", nonMemberReads=");
        sbD.append(this.i);
        wgd.y(sbD, ", memberReadRatio=", this.j, ", totalClapper=");
        sbD.append(this.k);
        wgd.y(sbD, ", totalHighlighters=", this.l, ", totalFollowers=");
        sbD.append(this.m);
        wgd.y(sbD, ", totalResponders=", this.n, ", totalReposters=");
        sbD.append(this.o);
        sbD.append(", totalEarnings=");
        sbD.append(this.p);
        sbD.append(", earnings=");
        sbD.append(this.q);
        sbD.append(", views=");
        sbD.append(this.r);
        sbD.append(", reads=");
        sbD.append(this.s);
        sbD.append(", engagementPoints=");
        sbD.append(this.t);
        sbD.append(")");
        return sbD.toString();
    }
}

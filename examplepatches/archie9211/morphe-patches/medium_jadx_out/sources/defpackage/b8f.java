package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b8f {
    public final String a;
    public final j7f b;
    public final dt2 c;
    public final long d;
    public final long e;
    public final long f;
    public final e72 g;
    public final int h;
    public final tm0 i;
    public final long j;
    public final long k;
    public final int l;
    public final int m;
    public final long n;
    public final int o;
    public final List p;
    public final List q;

    public b8f(String str, j7f j7fVar, dt2 dt2Var, long j, long j2, long j3, e72 e72Var, int i, tm0 tm0Var, long j4, long j5, int i2, int i3, long j6, int i4, List list, List list2) {
        str.getClass();
        j7fVar.getClass();
        dt2Var.getClass();
        tm0Var.getClass();
        this.a = str;
        this.b = j7fVar;
        this.c = dt2Var;
        this.d = j;
        this.e = j2;
        this.f = j3;
        this.g = e72Var;
        this.h = i;
        this.i = tm0Var;
        this.j = j4;
        this.k = j5;
        this.l = i2;
        this.m = i3;
        this.n = j6;
        this.o = i4;
        this.p = list;
        this.q = list2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b8f)) {
            return false;
        }
        b8f b8fVar = (b8f) obj;
        return g76.L(this.a, b8fVar.a) && this.b == b8fVar.b && g76.L(this.c, b8fVar.c) && this.d == b8fVar.d && this.e == b8fVar.e && this.f == b8fVar.f && this.g.equals(b8fVar.g) && this.h == b8fVar.h && this.i == b8fVar.i && this.j == b8fVar.j && this.k == b8fVar.k && this.l == b8fVar.l && this.m == b8fVar.m && this.n == b8fVar.n && this.o == b8fVar.o && this.p.equals(b8fVar.p) && this.q.equals(b8fVar.q);
    }

    public final int hashCode() {
        int iHashCode = (this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31;
        long j = this.d;
        int i = (iHashCode + ((int) (j ^ (j >>> 32)))) * 31;
        long j2 = this.e;
        int i2 = (i + ((int) (j2 ^ (j2 >>> 32)))) * 31;
        long j3 = this.f;
        int iHashCode2 = (this.i.hashCode() + ((((this.g.hashCode() + ((i2 + ((int) (j3 ^ (j3 >>> 32)))) * 31)) * 31) + this.h) * 31)) * 31;
        long j4 = this.j;
        int i3 = (iHashCode2 + ((int) (j4 ^ (j4 >>> 32)))) * 31;
        long j5 = this.k;
        int i4 = (((((i3 + ((int) (j5 ^ (j5 >>> 32)))) * 31) + this.l) * 31) + this.m) * 31;
        long j6 = this.n;
        return this.q.hashCode() + wgd.p((((i4 + ((int) (j6 ^ (j6 >>> 32)))) * 31) + this.o) * 31, 31, this.p);
    }

    public final String toString() {
        return "WorkInfoPojo(id=" + this.a + ", state=" + this.b + ", output=" + this.c + ", initialDelay=" + this.d + ", intervalDuration=" + this.e + ", flexDuration=" + this.f + ", constraints=" + this.g + ", runAttemptCount=" + this.h + ", backoffPolicy=" + this.i + ", backoffDelayDuration=" + this.j + ", lastEnqueueTime=" + this.k + ", periodCount=" + this.l + ", generation=" + this.m + ", nextScheduleTimeOverride=" + this.n + ", stopReason=" + this.o + ", tags=" + this.p + ", progress=" + this.q + ')';
    }
}

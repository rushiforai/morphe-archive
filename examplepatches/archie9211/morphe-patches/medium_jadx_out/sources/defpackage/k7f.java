package defpackage;

import java.util.HashSet;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k7f {
    public final UUID a;
    public final j7f b;
    public final HashSet c;
    public final dt2 d;
    public final dt2 e;
    public final int f;
    public final int g;
    public final e72 h;
    public final long i;
    public final i7f j;
    public final long k;
    public final int l;

    public k7f(UUID uuid, j7f j7fVar, HashSet hashSet, dt2 dt2Var, dt2 dt2Var2, int i, int i2, e72 e72Var, long j, i7f i7fVar, long j2, int i3) {
        j7fVar.getClass();
        dt2Var.getClass();
        dt2Var2.getClass();
        this.a = uuid;
        this.b = j7fVar;
        this.c = hashSet;
        this.d = dt2Var;
        this.e = dt2Var2;
        this.f = i;
        this.g = i2;
        this.h = e72Var;
        this.i = j;
        this.j = i7fVar;
        this.k = j2;
        this.l = i3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !k7f.class.equals(obj.getClass())) {
            return false;
        }
        k7f k7fVar = (k7f) obj;
        if (this.f == k7fVar.f && this.g == k7fVar.g && this.a.equals(k7fVar.a) && this.b == k7fVar.b && g76.L(this.d, k7fVar.d) && this.h.equals(k7fVar.h) && this.i == k7fVar.i && g76.L(this.j, k7fVar.j) && this.k == k7fVar.k && this.l == k7fVar.l && this.c.equals(k7fVar.c)) {
            return g76.L(this.e, k7fVar.e);
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (this.h.hashCode() + ((((((this.e.hashCode() + ((this.c.hashCode() + ((this.d.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31) + this.f) * 31) + this.g) * 31)) * 31;
        long j = this.i;
        int i = (iHashCode + ((int) (j ^ (j >>> 32)))) * 31;
        i7f i7fVar = this.j;
        int iHashCode2 = (i + (i7fVar != null ? i7fVar.hashCode() : 0)) * 31;
        long j2 = this.k;
        return ((iHashCode2 + ((int) (j2 ^ (j2 >>> 32)))) * 31) + this.l;
    }

    public final String toString() {
        return "WorkInfo{id='" + this.a + "', state=" + this.b + ", outputData=" + this.d + ", tags=" + this.c + ", progress=" + this.e + ", runAttemptCount=" + this.f + ", generation=" + this.g + ", constraints=" + this.h + ", initialDelayMillis=" + this.i + ", periodicityInfo=" + this.j + ", nextScheduleTimeMillis=" + this.k + "}, stopReason=" + this.l;
    }
}

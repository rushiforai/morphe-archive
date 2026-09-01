package defpackage;

import com.drew.imaging.eps.ld.PdtluglzAX;
import com.medium.android.data.notification.YMl.DtuT;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class amd {
    public static final amd e = new amd(0, 0, 0, 0);
    public final long a;
    public final long b;
    public final long c;
    public final long d;

    public amd(long j, long j2, long j3, long j4) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof amd)) {
            return false;
        }
        amd amdVar = (amd) obj;
        return this.a == amdVar.a && this.b == amdVar.b && this.c == amdVar.c && this.d == amdVar.d;
    }

    public final int hashCode() {
        long j = this.a;
        long j2 = this.b;
        int i = ((((int) (j ^ (j >>> 32))) * 31) + ((int) (j2 ^ (j2 >>> 32)))) * 31;
        long j3 = this.c;
        int i2 = (i + ((int) (j3 ^ (j3 >>> 32)))) * 31;
        long j4 = this.d;
        return i2 + ((int) ((j4 >>> 32) ^ j4));
    }

    public final String toString() {
        StringBuilder sbD = b09.D(DtuT.mUXjG, ", serverTimeNs=", this.a);
        sbD.append(this.b);
        wgd.y(sbD, ", serverTimeOffsetNs=", this.c, PdtluglzAX.SDMHZNtAlJdZP);
        return ev6.t(this.d, ")", sbD);
    }
}

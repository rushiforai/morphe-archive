package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class za0 {
    public final long a;
    public final long b;
    public final sv2 c;
    public final ArrayList d;
    public final ArrayList e;

    public za0(long j, long j2, sv2 sv2Var, ArrayList arrayList, ArrayList arrayList2) {
        this.a = j;
        this.b = j2;
        this.c = sv2Var;
        this.d = arrayList;
        this.e = arrayList2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof za0)) {
            return false;
        }
        za0 za0Var = (za0) obj;
        return this.a == za0Var.a && this.b == za0Var.b && this.c.equals(za0Var.c) && this.d.equals(za0Var.d) && this.e.equals(za0Var.e);
    }

    public final int hashCode() {
        long j = this.a;
        long j2 = this.b;
        return this.e.hashCode() + b09.p(this.d, wgd.p(((((int) (j ^ (j >>> 32))) * 31) + ((int) (j2 ^ (j2 >>> 32)))) * 31, 31, this.c.a), 31);
    }

    public final String toString() {
        StringBuilder sbD = b09.D("AudienceGrowthUiModel(startTime=", ", endTime=", this.a);
        sbD.append(this.b);
        sbD.append(", dateSelectFieldUiModel=");
        sbD.append(this.c);
        sbD.append(", followerPoints=");
        sbD.append(this.d);
        sbD.append(", subscriberPoints=");
        sbD.append(this.e);
        sbD.append(")");
        return sbD.toString();
    }
}

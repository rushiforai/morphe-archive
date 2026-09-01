package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class db4 implements fb4 {
    public final long a;
    public final long b;
    public final int c;
    public final String d;
    public final boolean e;
    public final SourceParameter f;

    public db4(long j, long j2, int i, String str, boolean z, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a = j;
        this.b = j2;
        this.c = i;
        this.d = str;
        this.e = z;
        this.f = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof db4)) {
            return false;
        }
        db4 db4Var = (db4) obj;
        return this.a == db4Var.a && this.b == db4Var.b && this.c == db4Var.c && g76.L(this.d, db4Var.d) && this.e == db4Var.e && g76.L(this.f, db4Var.f);
    }

    public final int hashCode() {
        long j = this.a;
        long j2 = this.b;
        return this.f.hashCode() + ((wgd.o(((((((int) (j ^ (j >>> 32))) * 31) + ((int) (j2 ^ (j2 >>> 32)))) * 31) + this.c) * 31, 31, this.d) + (this.e ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbD = b09.D("NoFeaturedPostsAvailable(nextFeaturingTokenRefillTimestamp=", ", featuringTokenRefillInterval=", this.a);
        sbD.append(this.b);
        sbD.append(", featuringTokenCapacity=");
        sbD.append(this.c);
        sbD.append(", publicationId=");
        sbD.append(this.d);
        sbD.append(", areActionsEnabled=");
        sbD.append(this.e);
        sbD.append(", sourceParameter=");
        sbD.append(this.f);
        sbD.append(")");
        return sbD.toString();
    }
}

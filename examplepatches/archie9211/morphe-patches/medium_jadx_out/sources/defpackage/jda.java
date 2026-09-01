package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jda {
    public final int a;
    public final int b;
    public final Long c;
    public final long d;

    public jda(int i, int i2, Long l, long j) {
        this.a = i;
        this.b = i2;
        this.c = l;
        this.d = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jda)) {
            return false;
        }
        jda jdaVar = (jda) obj;
        return this.a == jdaVar.a && this.b == jdaVar.b && g76.L(this.c, jdaVar.c) && this.d == jdaVar.d;
    }

    public final int hashCode() {
        int i = ((this.a * 31) + this.b) * 31;
        Long l = this.c;
        int iHashCode = l == null ? 0 : l.hashCode();
        long j = this.d;
        return ((i + iHashCode) * 31) + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        StringBuilder sbB = ev6.B(this.a, this.b, "PublicationFeaturingTokenBalance(availableFeaturingTokens=", ", featuringTokenCapacity=", ", nextFeaturingTokenRefillTimestamp=");
        sbB.append(this.c);
        sbB.append(", featuringTokenRefillInterval=");
        sbB.append(this.d);
        sbB.append(")");
        return sbB.toString();
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m66 extends gsa {
    public final boolean n;
    public final long o;
    public final long p;
    public final boolean q;
    public final int r;

    public m66(boolean z, long j, long j2, boolean z2, int i) {
        this.n = z;
        this.o = j;
        this.p = j2;
        this.q = z2;
        this.r = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m66)) {
            return false;
        }
        m66 m66Var = (m66) obj;
        return this.n == m66Var.n && this.o == m66Var.o && this.p == m66Var.p && this.q == m66Var.q && this.r == m66Var.r;
    }

    public final int hashCode() {
        int i = this.n ? 1231 : 1237;
        long j = this.o;
        int i2 = ((i * 31) + ((int) (j ^ (j >>> 32)))) * 31;
        long j2 = this.p;
        return ((((((i2 + ((int) (j2 ^ (j2 >>> 32)))) * 31) + (this.q ? 1231 : 1237)) * 31) + 1237) * 31) + this.r;
    }

    public final String toString() {
        StringBuilder sbE = km4.E("Configuration(trackErrors=", this.n, ", batchSize=", this.o);
        wgd.y(sbE, ", batchUploadFrequency=", this.p, ", useProxy=");
        sbE.append(this.q);
        sbE.append(", useLocalEncryption=false, batchProcessingLevel=");
        sbE.append(this.r);
        sbE.append(")");
        return sbE.toString();
    }
}

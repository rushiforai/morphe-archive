package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class n38 implements q38 {
    public final long a;
    public final long b;
    public final b24 c;

    public n38(long j, long j2, b24 b24Var) {
        this.a = j;
        this.b = j2;
        this.c = b24Var;
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
        if (!(obj instanceof n38)) {
            return false;
        }
        n38 n38Var = (n38) obj;
        return this.a == n38Var.a && this.b == n38Var.b && this.c.equals(n38Var.c);
    }

    public final int hashCode() {
        long j = this.a;
        int i = ((int) (j ^ (j >>> 32))) * 31;
        long j2 = this.b;
        return this.c.hashCode() + ((i + ((int) ((j2 >>> 32) ^ j2))) * 31);
    }

    public final String toString() {
        StringBuilder sbD = b09.D("Error(startTime=", ", endTime=", this.a);
        sbD.append(this.b);
        sbD.append(", errorState=");
        sbD.append(this.c);
        sbD.append(")");
        return sbD.toString();
    }
}

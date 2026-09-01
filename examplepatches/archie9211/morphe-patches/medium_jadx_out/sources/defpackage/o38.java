package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class o38 implements q38 {
    public final long a;
    public final long b;

    public o38(long j, long j2) {
        this.a = j;
        this.b = j2;
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
        if (!(obj instanceof o38)) {
            return false;
        }
        o38 o38Var = (o38) obj;
        return this.a == o38Var.a && this.b == o38Var.b;
    }

    public final int hashCode() {
        long j = this.a;
        int i = ((int) (j ^ (j >>> 32))) * 31;
        long j2 = this.b;
        return i + ((int) ((j2 >>> 32) ^ j2));
    }

    public final String toString() {
        return ev6.t(this.b, ")", b09.D("Loading(startTime=", ", endTime=", this.a));
    }
}

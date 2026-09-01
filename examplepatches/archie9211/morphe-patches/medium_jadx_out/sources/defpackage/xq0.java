package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xq0 implements xd {
    public final float a;

    public xq0(float f) {
        this.a = f;
    }

    @Override // defpackage.xd
    public final long a(long j, long j2, ip6 ip6Var) {
        long j3 = (((long) (((int) (j2 >> 32)) - ((int) (j >> 32)))) << 32) | (((long) (((int) (j2 & 4294967295L)) - ((int) (j & 4294967295L)))) & 4294967295L);
        return (((long) Math.round((1.0f + this.a) * (((int) (j3 >> 32)) / 2.0f))) << 32) | (((long) Math.round(0.0f * (((int) (j3 & 4294967295L)) / 2.0f))) & 4294967295L);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof xq0) && Float.compare(this.a, ((xq0) obj).a) == 0 && Float.compare(-1.0f, -1.0f) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(-1.0f) + (Float.floatToIntBits(this.a) * 31);
    }

    public final String toString() {
        return "BiasAbsoluteAlignment(horizontalBias=" + this.a + ", verticalBias=-1.0)";
    }
}

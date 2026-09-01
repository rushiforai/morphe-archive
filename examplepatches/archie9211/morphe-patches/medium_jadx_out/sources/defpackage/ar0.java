package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ar0 implements xd {
    public final float a;
    public final float b;

    public ar0(float f, float f2) {
        this.a = f;
        this.b = f2;
    }

    @Override // defpackage.xd
    public final long a(long j, long j2, ip6 ip6Var) {
        float f = (((int) (j2 >> 32)) - ((int) (j >> 32))) / 2.0f;
        float f2 = (((int) (j2 & 4294967295L)) - ((int) (j & 4294967295L))) / 2.0f;
        ip6 ip6Var2 = ip6.Ltr;
        float f3 = this.a;
        if (ip6Var != ip6Var2) {
            f3 *= -1.0f;
        }
        float f4 = (1.0f + this.b) * f2;
        int iRound = Math.round((f3 + 1.0f) * f);
        return (((long) Math.round(f4)) & 4294967295L) | (((long) iRound) << 32);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ar0)) {
            return false;
        }
        ar0 ar0Var = (ar0) obj;
        return Float.compare(this.a, ar0Var.a) == 0 && Float.compare(this.b, ar0Var.b) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b) + (Float.floatToIntBits(this.a) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("BiasAlignment(horizontalBias=");
        sb.append(this.a);
        sb.append(", verticalBias=");
        return lv8.s(sb, this.b, ')');
    }
}

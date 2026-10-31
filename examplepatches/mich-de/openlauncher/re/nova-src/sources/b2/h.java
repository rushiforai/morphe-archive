package b2;

/* loaded from: classes2.dex */
public final class h implements f {

    /* renamed from: a, reason: collision with root package name */
    public final float f17011a;

    public h(float f11) {
        this.f17011a = f11;
    }

    @Override // b2.f
    public final long a(long j11, long j12, y3.n nVar) {
        long j13 = ((((int) (j12 >> 32)) - ((int) (j11 >> 32))) << 32) | ((((int) (j12 & 4294967295L)) - ((int) (j11 & 4294967295L))) & 4294967295L);
        float f11 = 1;
        float f12 = (this.f17011a + f11) * (((int) (j13 >> 32)) / 2.0f);
        float f13 = (f11 - 1.0f) * (((int) (j13 & 4294967295L)) / 2.0f);
        return (Math.round(f13) & 4294967295L) | (Math.round(f12) << 32);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof h) && Float.compare(this.f17011a, ((h) obj).f17011a) == 0 && Float.compare(-1.0f, -1.0f) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(-1.0f) + (Float.hashCode(this.f17011a) * 31);
    }

    public final String toString() {
        return "BiasAbsoluteAlignment(horizontalBias=" + this.f17011a + ", verticalBias=-1.0)";
    }
}

package b2;

import b.c9;

/* loaded from: classes.dex */
public final class k implements f {

    /* renamed from: a, reason: collision with root package name */
    public final float f17014a;

    /* renamed from: b, reason: collision with root package name */
    public final float f17015b;

    public k(float f11, float f12) {
        this.f17014a = f11;
        this.f17015b = f12;
    }

    @Override // b2.f
    public final long a(long j11, long j12, y3.n nVar) {
        float f11 = (((int) (j12 >> 32)) - ((int) (j11 >> 32))) / 2.0f;
        float f12 = (((int) (j12 & 4294967295L)) - ((int) (j11 & 4294967295L))) / 2.0f;
        y3.n nVar2 = y3.n.f96612a;
        float f13 = this.f17014a;
        if (nVar != nVar2) {
            f13 *= -1;
        }
        float f14 = 1;
        float f15 = (f13 + f14) * f11;
        float f16 = (f14 + this.f17015b) * f12;
        return (Math.round(f16) & 4294967295L) | (Math.round(f15) << 32);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return Float.compare(this.f17014a, kVar.f17014a) == 0 && Float.compare(this.f17015b, kVar.f17015b) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f17015b) + (Float.hashCode(this.f17014a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BiasAlignment(horizontalBias=");
        sb2.append(this.f17014a);
        sb2.append(", verticalBias=");
        return c9.k(sb2, this.f17015b, ')');
    }
}

package b0;

import b.c9;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final float f16044a;

    /* renamed from: b, reason: collision with root package name */
    public final float f16045b;

    public a(float f11, float f12) {
        this.f16044a = f11;
        this.f16045b = f12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Float.compare(this.f16044a, aVar.f16044a) == 0 && Float.compare(this.f16045b, aVar.f16045b) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f16045b) + (Float.hashCode(this.f16044a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("FlingResult(distanceCoefficient=");
        sb2.append(this.f16044a);
        sb2.append(", velocityCoefficient=");
        return c9.k(sb2, this.f16045b, ')');
    }
}

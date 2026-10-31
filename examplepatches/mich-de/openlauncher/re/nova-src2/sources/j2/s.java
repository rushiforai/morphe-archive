package j2;

import b.c9;

/* loaded from: classes.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final float f68727a;

    /* renamed from: b, reason: collision with root package name */
    public final float f68728b;

    public s(float f11, float f12) {
        this.f68727a = f11;
        this.f68728b = f12;
    }

    public final float[] a() {
        float f11 = this.f68727a;
        float f12 = this.f68728b;
        return new float[]{f11 / f12, 1.0f, ((1.0f - f11) - f12) / f12};
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return Float.compare(this.f68727a, sVar.f68727a) == 0 && Float.compare(this.f68728b, sVar.f68728b) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f68728b) + (Float.hashCode(this.f68727a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("WhitePoint(x=");
        sb2.append(this.f68727a);
        sb2.append(", y=");
        return c9.k(sb2, this.f68728b, ')');
    }
}

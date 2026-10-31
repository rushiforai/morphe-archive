package x3;

import b.c9;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: c, reason: collision with root package name */
    public static final p f95026c = new p(1.0f, 0.0f);

    /* renamed from: a, reason: collision with root package name */
    public final float f95027a;

    /* renamed from: b, reason: collision with root package name */
    public final float f95028b;

    public p(float f11, float f12) {
        this.f95027a = f11;
        this.f95028b = f12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return this.f95027a == pVar.f95027a && this.f95028b == pVar.f95028b;
    }

    public final int hashCode() {
        return Float.hashCode(this.f95028b) + (Float.hashCode(this.f95027a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TextGeometricTransform(scaleX=");
        sb2.append(this.f95027a);
        sb2.append(", skewX=");
        return c9.k(sb2, this.f95028b, ')');
    }
}

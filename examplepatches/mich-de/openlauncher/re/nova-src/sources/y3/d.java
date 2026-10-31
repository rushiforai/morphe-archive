package y3;

import b.c9;

/* loaded from: classes.dex */
public final class d implements c {

    /* renamed from: a, reason: collision with root package name */
    public final float f96597a;

    /* renamed from: b, reason: collision with root package name */
    public final float f96598b;

    public d(float f11, float f12) {
        this.f96597a = f11;
        this.f96598b = f12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Float.compare(this.f96597a, dVar.f96597a) == 0 && Float.compare(this.f96598b, dVar.f96598b) == 0;
    }

    @Override // y3.c
    public final float getDensity() {
        return this.f96597a;
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.f96598b;
    }

    public final int hashCode() {
        return Float.hashCode(this.f96598b) + (Float.hashCode(this.f96597a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DensityImpl(density=");
        sb2.append(this.f96597a);
        sb2.append(", fontScale=");
        return c9.k(sb2, this.f96598b, ')');
    }
}

package q3;

import b.c9;

/* loaded from: classes2.dex */
public final class y implements x {

    /* renamed from: a, reason: collision with root package name */
    public final float f83603a;

    public y(float f11) {
        this.f83603a = f11;
    }

    @Override // q3.x
    public final float a() {
        return this.f83603a;
    }

    @Override // q3.x
    public final String b() {
        return "ital";
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof y) && this.f83603a == ((y) obj).f83603a;
    }

    public final int hashCode() {
        return Float.hashCode(this.f83603a) + 100522026;
    }

    public final String toString() {
        return c9.k(new StringBuilder("FontVariation.Setting(axisName='ital', value="), this.f83603a, ')');
    }
}

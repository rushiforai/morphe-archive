package y3;

import b.c9;

/* loaded from: classes.dex */
public final class o implements z3.a {

    /* renamed from: a, reason: collision with root package name */
    public final float f96615a;

    public o(float f11) {
        this.f96615a = f11;
    }

    @Override // z3.a
    public final float a(float f11) {
        return f11 / this.f96615a;
    }

    @Override // z3.a
    public final float b(float f11) {
        return f11 * this.f96615a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof o) && Float.compare(this.f96615a, ((o) obj).f96615a) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f96615a);
    }

    public final String toString() {
        return c9.k(new StringBuilder("LinearFontScaleConverter(fontScale="), this.f96615a, ')');
    }
}

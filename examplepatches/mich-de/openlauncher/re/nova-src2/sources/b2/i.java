package b2;

import b.c9;
import h6.c1;

/* loaded from: classes.dex */
public final class i implements e {

    /* renamed from: a, reason: collision with root package name */
    public final float f17012a;

    public i(float f11) {
        this.f17012a = f11;
    }

    @Override // b2.e
    public final int a(int i5, int i11, y3.n nVar) {
        float f11 = (i11 - i5) / 2.0f;
        y3.n nVar2 = y3.n.f96612a;
        float f12 = this.f17012a;
        if (nVar != nVar2) {
            f12 *= -1;
        }
        return c1.g(1, f12, f11);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof i) && Float.compare(this.f17012a, ((i) obj).f17012a) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f17012a);
    }

    public final String toString() {
        return c9.k(new StringBuilder("Horizontal(bias="), this.f17012a, ')');
    }
}

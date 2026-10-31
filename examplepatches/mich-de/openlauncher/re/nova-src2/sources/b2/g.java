package b2;

import b.c9;
import h6.c1;

/* loaded from: classes2.dex */
public final class g implements e {

    /* renamed from: a, reason: collision with root package name */
    public final float f17010a;

    public g(float f11) {
        this.f17010a = f11;
    }

    @Override // b2.e
    public final int a(int i5, int i11, y3.n nVar) {
        return c1.g(1, this.f17010a, (i11 - i5) / 2.0f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof g) && Float.compare(this.f17010a, ((g) obj).f17010a) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f17010a);
    }

    public final String toString() {
        return c9.k(new StringBuilder("Horizontal(bias="), this.f17010a, ')');
    }
}

package b2;

import b.c9;
import h6.c1;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final float f17013a;

    public j(float f11) {
        this.f17013a = f11;
    }

    public final int a(int i5, int i11) {
        return c1.g(1, this.f17013a, (i11 - i5) / 2.0f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof j) && Float.compare(this.f17013a, ((j) obj).f17013a) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f17013a);
    }

    public final String toString() {
        return c9.k(new StringBuilder("Vertical(bias="), this.f17013a, ')');
    }
}

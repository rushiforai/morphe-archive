package o2;

import b.c9;

/* loaded from: classes2.dex */
public final class n extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79331c;

    public n(float f11) {
        super(3);
        this.f79331c = f11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof n) && Float.compare(this.f79331c, ((n) obj).f79331c) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79331c);
    }

    public final String toString() {
        return c9.k(new StringBuilder("HorizontalTo(x="), this.f79331c, ')');
    }
}

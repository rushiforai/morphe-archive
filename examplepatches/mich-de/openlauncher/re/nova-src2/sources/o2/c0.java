package o2;

import b.c9;

/* loaded from: classes2.dex */
public final class c0 extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79225c;

    public c0(float f11) {
        super(3);
        this.f79225c = f11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c0) && Float.compare(this.f79225c, ((c0) obj).f79225c) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79225c);
    }

    public final String toString() {
        return c9.k(new StringBuilder("VerticalTo(y="), this.f79225c, ')');
    }
}

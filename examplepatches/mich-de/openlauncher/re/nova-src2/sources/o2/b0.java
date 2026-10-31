package o2;

import b.c9;

/* loaded from: classes.dex */
public final class b0 extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79208c;

    public b0(float f11) {
        super(3);
        this.f79208c = f11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b0) && Float.compare(this.f79208c, ((b0) obj).f79208c) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79208c);
    }

    public final String toString() {
        return c9.k(new StringBuilder("RelativeVerticalTo(dy="), this.f79208c, ')');
    }
}

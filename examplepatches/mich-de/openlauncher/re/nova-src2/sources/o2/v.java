package o2;

import b.c9;

/* loaded from: classes.dex */
public final class v extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79372c;

    public v(float f11) {
        super(3);
        this.f79372c = f11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v) && Float.compare(this.f79372c, ((v) obj).f79372c) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79372c);
    }

    public final String toString() {
        return c9.k(new StringBuilder("RelativeHorizontalTo(dx="), this.f79372c, ')');
    }
}

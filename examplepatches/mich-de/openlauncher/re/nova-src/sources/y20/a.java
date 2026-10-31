package y20;

import b.c0;

/* loaded from: classes4.dex */
public final class a implements d {

    /* renamed from: a, reason: collision with root package name */
    public final int f96592a;

    public a(int i5) {
        this.f96592a = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && this.f96592a == ((a) obj).f96592a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f96592a);
    }

    public final String toString() {
        return c0.i(this.f96592a, "Resource(resId=", ")");
    }
}

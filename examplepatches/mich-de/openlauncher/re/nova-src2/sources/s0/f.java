package s0;

import b.c9;
import c3.o2;

/* loaded from: classes.dex */
public final class f implements b, o2 {

    /* renamed from: a, reason: collision with root package name */
    public final float f86510a;

    public f(float f11) {
        this.f86510a = f11;
        if (f11 < 0.0f || f11 > 100.0f) {
            j0.b.a("The percent should be in the range of [0, 100]");
        }
    }

    @Override // s0.b
    public final float a(long j11, y3.c cVar) {
        return (this.f86510a / 100.0f) * h2.e.c(j11);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f) && Float.compare(this.f86510a, ((f) obj).f86510a) == 0;
    }

    @Override // c3.o2
    public final Object getValueOverride() {
        return c9.k(new StringBuilder(), this.f86510a, '%');
    }

    public final int hashCode() {
        return Float.hashCode(this.f86510a);
    }

    public final String toString() {
        return "CornerSize(size = " + this.f86510a + "%)";
    }
}

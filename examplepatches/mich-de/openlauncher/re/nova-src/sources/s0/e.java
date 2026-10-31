package s0;

import c3.o2;

/* loaded from: classes.dex */
public final class e implements b, o2 {

    /* renamed from: a, reason: collision with root package name */
    public final float f86509a;

    public e(float f11) {
        this.f86509a = f11;
    }

    @Override // s0.b
    public final float a(long j11, y3.c cVar) {
        return cVar.mo102toPx0680j_4(this.f86509a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e) && y3.f.a(this.f86509a, ((e) obj).f86509a);
    }

    @Override // c3.o2
    public final Object getValueOverride() {
        return new y3.f(this.f86509a);
    }

    public final int hashCode() {
        return Float.hashCode(this.f86509a);
    }

    public final String toString() {
        return "CornerSize(size = " + this.f86509a + ".dp)";
    }
}

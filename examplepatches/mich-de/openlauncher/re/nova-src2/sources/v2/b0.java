package v2;

/* loaded from: classes.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f91913a;

    public final boolean equals(Object obj) {
        if (obj instanceof b0) {
            return this.f91913a == ((b0) obj).f91913a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f91913a);
    }

    public final String toString() {
        return "PointerKeyboardModifiers(packedValue=" + this.f91913a + ')';
    }
}

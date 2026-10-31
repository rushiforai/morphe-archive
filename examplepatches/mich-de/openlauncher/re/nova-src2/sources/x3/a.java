package x3;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final float f95001a;

    public final boolean equals(Object obj) {
        if (obj instanceof a) {
            return Float.compare(this.f95001a, ((a) obj).f95001a) == 0;
        }
        return false;
    }

    public final int hashCode() {
        return Float.hashCode(this.f95001a);
    }

    public final String toString() {
        return "BaselineShift(multiplier=" + this.f95001a + ')';
    }
}

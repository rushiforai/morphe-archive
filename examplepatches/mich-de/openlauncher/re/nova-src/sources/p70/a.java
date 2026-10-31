package p70;

import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes.dex */
public final class a implements ClosedFloatingPointRange {

    /* renamed from: a, reason: collision with root package name */
    public final float f82410a;

    /* renamed from: b, reason: collision with root package name */
    public final float f82411b;

    public a(float f11, float f12) {
        this.f82410a = f11;
        this.f82411b = f12;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlin.ranges.ClosedFloatingPointRange
    public final boolean b(Comparable comparable, Comparable comparable2) {
        return ((Number) comparable).floatValue() <= ((Number) comparable2).floatValue();
    }

    @Override // kotlin.ranges.ClosedRange
    public final Comparable c() {
        return Float.valueOf(this.f82410a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlin.ranges.ClosedRange
    public final boolean d(Comparable comparable) {
        float fFloatValue = ((Number) comparable).floatValue();
        return fFloatValue >= this.f82410a && fFloatValue <= this.f82411b;
    }

    @Override // kotlin.ranges.ClosedRange
    public final Comparable e() {
        return Float.valueOf(this.f82411b);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof a)) {
            return false;
        }
        if (isEmpty() && ((a) obj).isEmpty()) {
            return true;
        }
        a aVar = (a) obj;
        return this.f82410a == aVar.f82410a && this.f82411b == aVar.f82411b;
    }

    public final int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        return Float.hashCode(this.f82411b) + (Float.hashCode(this.f82410a) * 31);
    }

    @Override // kotlin.ranges.ClosedRange
    public final boolean isEmpty() {
        return this.f82410a > this.f82411b;
    }

    public final String toString() {
        return this.f82410a + ".." + this.f82411b;
    }
}

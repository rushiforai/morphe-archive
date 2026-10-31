package z2;

import b.c9;

/* loaded from: classes.dex */
public final class m implements l {

    /* renamed from: a, reason: collision with root package name */
    public final float f98102a;

    public m(float f11) {
        this.f98102a = f11;
    }

    @Override // z2.l
    public final long a(long j11, long j12) {
        float f11 = this.f98102a;
        return (Float.floatToRawIntBits(f11) << 32) | (4294967295L & Float.floatToRawIntBits(f11));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m) && Float.compare(this.f98102a, ((m) obj).f98102a) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f98102a);
    }

    public final String toString() {
        return c9.k(new StringBuilder("FixedScale(value="), this.f98102a, ')');
    }
}

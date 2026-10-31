package k1;

import b.c9;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final float f70823a;

    /* renamed from: b, reason: collision with root package name */
    public final float f70824b;

    /* renamed from: c, reason: collision with root package name */
    public final float f70825c;

    /* renamed from: d, reason: collision with root package name */
    public final float f70826d;

    public e(float f11, float f12, float f13, float f14) {
        this.f70823a = f11;
        this.f70824b = f12;
        this.f70825c = f13;
        this.f70826d = f14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.f70823a == eVar.f70823a && this.f70824b == eVar.f70824b && this.f70825c == eVar.f70825c && this.f70826d == eVar.f70826d;
    }

    public final int hashCode() {
        return Float.hashCode(this.f70826d) + a80.m.d(this.f70825c, a80.m.d(this.f70824b, Float.hashCode(this.f70823a) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RippleAlpha(draggedAlpha=");
        sb2.append(this.f70823a);
        sb2.append(", focusedAlpha=");
        sb2.append(this.f70824b);
        sb2.append(", hoveredAlpha=");
        sb2.append(this.f70825c);
        sb2.append(", pressedAlpha=");
        return c9.k(sb2, this.f70826d, ')');
    }
}

package o2;

import b.c9;

/* loaded from: classes.dex */
public final class r extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79353c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79354d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79355e;

    /* renamed from: f, reason: collision with root package name */
    public final float f79356f;

    public r(float f11, float f12, float f13, float f14) {
        super(2);
        this.f79353c = f11;
        this.f79354d = f12;
        this.f79355e = f13;
        this.f79356f = f14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return Float.compare(this.f79353c, rVar.f79353c) == 0 && Float.compare(this.f79354d, rVar.f79354d) == 0 && Float.compare(this.f79355e, rVar.f79355e) == 0 && Float.compare(this.f79356f, rVar.f79356f) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79356f) + a80.m.d(this.f79355e, a80.m.d(this.f79354d, Float.hashCode(this.f79353c) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ReflectiveCurveTo(x1=");
        sb2.append(this.f79353c);
        sb2.append(", y1=");
        sb2.append(this.f79354d);
        sb2.append(", x2=");
        sb2.append(this.f79355e);
        sb2.append(", y2=");
        return c9.k(sb2, this.f79356f, ')');
    }
}

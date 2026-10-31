package o2;

import b.c9;

/* loaded from: classes.dex */
public final class m extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79318c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79319d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79320e;

    /* renamed from: f, reason: collision with root package name */
    public final float f79321f;

    /* renamed from: g, reason: collision with root package name */
    public final float f79322g;

    /* renamed from: h, reason: collision with root package name */
    public final float f79323h;

    public m(float f11, float f12, float f13, float f14, float f15, float f16) {
        super(2);
        this.f79318c = f11;
        this.f79319d = f12;
        this.f79320e = f13;
        this.f79321f = f14;
        this.f79322g = f15;
        this.f79323h = f16;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return Float.compare(this.f79318c, mVar.f79318c) == 0 && Float.compare(this.f79319d, mVar.f79319d) == 0 && Float.compare(this.f79320e, mVar.f79320e) == 0 && Float.compare(this.f79321f, mVar.f79321f) == 0 && Float.compare(this.f79322g, mVar.f79322g) == 0 && Float.compare(this.f79323h, mVar.f79323h) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79323h) + a80.m.d(this.f79322g, a80.m.d(this.f79321f, a80.m.d(this.f79320e, a80.m.d(this.f79319d, Float.hashCode(this.f79318c) * 31, 31), 31), 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("CurveTo(x1=");
        sb2.append(this.f79318c);
        sb2.append(", y1=");
        sb2.append(this.f79319d);
        sb2.append(", x2=");
        sb2.append(this.f79320e);
        sb2.append(", y2=");
        sb2.append(this.f79321f);
        sb2.append(", x3=");
        sb2.append(this.f79322g);
        sb2.append(", y3=");
        return c9.k(sb2, this.f79323h, ')');
    }
}

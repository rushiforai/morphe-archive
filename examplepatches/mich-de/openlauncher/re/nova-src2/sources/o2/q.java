package o2;

import b.c9;

/* loaded from: classes.dex */
public final class q extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79349c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79350d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79351e;

    /* renamed from: f, reason: collision with root package name */
    public final float f79352f;

    public q(float f11, float f12, float f13, float f14) {
        super(1);
        this.f79349c = f11;
        this.f79350d = f12;
        this.f79351e = f13;
        this.f79352f = f14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q)) {
            return false;
        }
        q qVar = (q) obj;
        return Float.compare(this.f79349c, qVar.f79349c) == 0 && Float.compare(this.f79350d, qVar.f79350d) == 0 && Float.compare(this.f79351e, qVar.f79351e) == 0 && Float.compare(this.f79352f, qVar.f79352f) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79352f) + a80.m.d(this.f79351e, a80.m.d(this.f79350d, Float.hashCode(this.f79349c) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("QuadTo(x1=");
        sb2.append(this.f79349c);
        sb2.append(", y1=");
        sb2.append(this.f79350d);
        sb2.append(", x2=");
        sb2.append(this.f79351e);
        sb2.append(", y2=");
        return c9.k(sb2, this.f79352f, ')');
    }
}

package o2;

import b.c9;

/* loaded from: classes.dex */
public final class z extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79381c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79382d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79383e;

    /* renamed from: f, reason: collision with root package name */
    public final float f79384f;

    public z(float f11, float f12, float f13, float f14) {
        super(2);
        this.f79381c = f11;
        this.f79382d = f12;
        this.f79383e = f13;
        this.f79384f = f14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z)) {
            return false;
        }
        z zVar = (z) obj;
        return Float.compare(this.f79381c, zVar.f79381c) == 0 && Float.compare(this.f79382d, zVar.f79382d) == 0 && Float.compare(this.f79383e, zVar.f79383e) == 0 && Float.compare(this.f79384f, zVar.f79384f) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79384f) + a80.m.d(this.f79383e, a80.m.d(this.f79382d, Float.hashCode(this.f79381c) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RelativeReflectiveCurveTo(dx1=");
        sb2.append(this.f79381c);
        sb2.append(", dy1=");
        sb2.append(this.f79382d);
        sb2.append(", dx2=");
        sb2.append(this.f79383e);
        sb2.append(", dy2=");
        return c9.k(sb2, this.f79384f, ')');
    }
}

package o2;

import b.c9;

/* loaded from: classes.dex */
public final class y extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79377c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79378d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79379e;

    /* renamed from: f, reason: collision with root package name */
    public final float f79380f;

    public y(float f11, float f12, float f13, float f14) {
        super(1);
        this.f79377c = f11;
        this.f79378d = f12;
        this.f79379e = f13;
        this.f79380f = f14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y)) {
            return false;
        }
        y yVar = (y) obj;
        return Float.compare(this.f79377c, yVar.f79377c) == 0 && Float.compare(this.f79378d, yVar.f79378d) == 0 && Float.compare(this.f79379e, yVar.f79379e) == 0 && Float.compare(this.f79380f, yVar.f79380f) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79380f) + a80.m.d(this.f79379e, a80.m.d(this.f79378d, Float.hashCode(this.f79377c) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RelativeQuadTo(dx1=");
        sb2.append(this.f79377c);
        sb2.append(", dy1=");
        sb2.append(this.f79378d);
        sb2.append(", dx2=");
        sb2.append(this.f79379e);
        sb2.append(", dy2=");
        return c9.k(sb2, this.f79380f, ')');
    }
}

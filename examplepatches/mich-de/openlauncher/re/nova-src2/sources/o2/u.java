package o2;

import b.c9;

/* loaded from: classes.dex */
public final class u extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79366c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79367d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79368e;

    /* renamed from: f, reason: collision with root package name */
    public final float f79369f;

    /* renamed from: g, reason: collision with root package name */
    public final float f79370g;

    /* renamed from: h, reason: collision with root package name */
    public final float f79371h;

    public u(float f11, float f12, float f13, float f14, float f15, float f16) {
        super(2);
        this.f79366c = f11;
        this.f79367d = f12;
        this.f79368e = f13;
        this.f79369f = f14;
        this.f79370g = f15;
        this.f79371h = f16;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return Float.compare(this.f79366c, uVar.f79366c) == 0 && Float.compare(this.f79367d, uVar.f79367d) == 0 && Float.compare(this.f79368e, uVar.f79368e) == 0 && Float.compare(this.f79369f, uVar.f79369f) == 0 && Float.compare(this.f79370g, uVar.f79370g) == 0 && Float.compare(this.f79371h, uVar.f79371h) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79371h) + a80.m.d(this.f79370g, a80.m.d(this.f79369f, a80.m.d(this.f79368e, a80.m.d(this.f79367d, Float.hashCode(this.f79366c) * 31, 31), 31), 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RelativeCurveTo(dx1=");
        sb2.append(this.f79366c);
        sb2.append(", dy1=");
        sb2.append(this.f79367d);
        sb2.append(", dx2=");
        sb2.append(this.f79368e);
        sb2.append(", dy2=");
        sb2.append(this.f79369f);
        sb2.append(", dx3=");
        sb2.append(this.f79370g);
        sb2.append(", dy3=");
        return c9.k(sb2, this.f79371h, ')');
    }
}

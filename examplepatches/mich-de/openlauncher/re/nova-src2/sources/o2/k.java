package o2;

import b.c9;

/* loaded from: classes2.dex */
public final class k extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79309c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79310d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79311e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f79312f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f79313g;

    /* renamed from: h, reason: collision with root package name */
    public final float f79314h;

    /* renamed from: i, reason: collision with root package name */
    public final float f79315i;

    public k(float f11, float f12, float f13, boolean z11, boolean z12, float f14, float f15) {
        super(3);
        this.f79309c = f11;
        this.f79310d = f12;
        this.f79311e = f13;
        this.f79312f = z11;
        this.f79313g = z12;
        this.f79314h = f14;
        this.f79315i = f15;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return Float.compare(this.f79309c, kVar.f79309c) == 0 && Float.compare(this.f79310d, kVar.f79310d) == 0 && Float.compare(this.f79311e, kVar.f79311e) == 0 && this.f79312f == kVar.f79312f && this.f79313g == kVar.f79313g && Float.compare(this.f79314h, kVar.f79314h) == 0 && Float.compare(this.f79315i, kVar.f79315i) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79315i) + a80.m.d(this.f79314h, c9.f(c9.f(a80.m.d(this.f79311e, a80.m.d(this.f79310d, Float.hashCode(this.f79309c) * 31, 31), 31), 31, this.f79312f), 31, this.f79313g), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ArcTo(horizontalEllipseRadius=");
        sb2.append(this.f79309c);
        sb2.append(", verticalEllipseRadius=");
        sb2.append(this.f79310d);
        sb2.append(", theta=");
        sb2.append(this.f79311e);
        sb2.append(", isMoreThanHalf=");
        sb2.append(this.f79312f);
        sb2.append(", isPositiveArc=");
        sb2.append(this.f79313g);
        sb2.append(", arcStartX=");
        sb2.append(this.f79314h);
        sb2.append(", arcStartY=");
        return c9.k(sb2, this.f79315i, ')');
    }
}

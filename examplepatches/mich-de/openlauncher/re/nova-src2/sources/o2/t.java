package o2;

import b.c9;

/* loaded from: classes2.dex */
public final class t extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79359c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79360d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79361e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f79362f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f79363g;

    /* renamed from: h, reason: collision with root package name */
    public final float f79364h;

    /* renamed from: i, reason: collision with root package name */
    public final float f79365i;

    public t(float f11, float f12, float f13, boolean z11, boolean z12, float f14, float f15) {
        super(3);
        this.f79359c = f11;
        this.f79360d = f12;
        this.f79361e = f13;
        this.f79362f = z11;
        this.f79363g = z12;
        this.f79364h = f14;
        this.f79365i = f15;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t)) {
            return false;
        }
        t tVar = (t) obj;
        return Float.compare(this.f79359c, tVar.f79359c) == 0 && Float.compare(this.f79360d, tVar.f79360d) == 0 && Float.compare(this.f79361e, tVar.f79361e) == 0 && this.f79362f == tVar.f79362f && this.f79363g == tVar.f79363g && Float.compare(this.f79364h, tVar.f79364h) == 0 && Float.compare(this.f79365i, tVar.f79365i) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79365i) + a80.m.d(this.f79364h, c9.f(c9.f(a80.m.d(this.f79361e, a80.m.d(this.f79360d, Float.hashCode(this.f79359c) * 31, 31), 31), 31, this.f79362f), 31, this.f79363g), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RelativeArcTo(horizontalEllipseRadius=");
        sb2.append(this.f79359c);
        sb2.append(", verticalEllipseRadius=");
        sb2.append(this.f79360d);
        sb2.append(", theta=");
        sb2.append(this.f79361e);
        sb2.append(", isMoreThanHalf=");
        sb2.append(this.f79362f);
        sb2.append(", isPositiveArc=");
        sb2.append(this.f79363g);
        sb2.append(", arcStartDx=");
        sb2.append(this.f79364h);
        sb2.append(", arcStartDy=");
        return c9.k(sb2, this.f79365i, ')');
    }
}

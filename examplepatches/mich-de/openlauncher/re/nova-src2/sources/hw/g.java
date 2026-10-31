package hw;

import k0.p1;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final float f60729a;

    /* renamed from: b, reason: collision with root package name */
    public final float f60730b;

    /* renamed from: c, reason: collision with root package name */
    public final float f60731c;

    /* renamed from: d, reason: collision with root package name */
    public final float f60732d;

    public g(float f11, float f12, float f13, float f14) {
        this.f60729a = f11;
        this.f60730b = f12;
        this.f60731c = f13;
        this.f60732d = f14;
    }

    public final p1 a() {
        return new p1(this.f60729a, this.f60730b, this.f60731c, this.f60732d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Float.compare(this.f60729a, gVar.f60729a) == 0 && Float.compare(this.f60730b, gVar.f60730b) == 0 && Float.compare(this.f60731c, gVar.f60731c) == 0 && Float.compare(this.f60732d, gVar.f60732d) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f60732d) + a80.m.d(this.f60731c, a80.m.d(this.f60730b, Float.hashCode(this.f60729a) * 31, 31), 31);
    }

    public final String toString() {
        return "FormInsets(start=" + this.f60729a + ", top=" + this.f60730b + ", end=" + this.f60731c + ", bottom=" + this.f60732d + ")";
    }
}

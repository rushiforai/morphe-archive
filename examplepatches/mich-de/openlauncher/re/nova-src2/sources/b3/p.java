package b3;

/* loaded from: classes2.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final float f17307a;

    /* renamed from: b, reason: collision with root package name */
    public final float f17308b;

    /* renamed from: c, reason: collision with root package name */
    public final float f17309c;

    /* renamed from: d, reason: collision with root package name */
    public final float f17310d;

    public p(float f11, float f12, float f13, float f14) {
        this.f17307a = f11;
        this.f17308b = f12;
        this.f17309c = f13;
        this.f17310d = f14;
        if (f11 < 0.0f) {
            y2.a.a("Left must be non-negative");
        }
        if (f12 < 0.0f) {
            y2.a.a("Top must be non-negative");
        }
        if (f13 < 0.0f) {
            y2.a.a("Right must be non-negative");
        }
        if (f14 >= 0.0f) {
            return;
        }
        y2.a.a("Bottom must be non-negative");
    }

    public final long a(y3.c cVar) {
        int i5 = s2.f17340b;
        return io.sentry.hints.i.e(cVar.mo96roundToPx0680j_4(this.f17307a), cVar.mo96roundToPx0680j_4(this.f17308b), cVar.mo96roundToPx0680j_4(this.f17309c), cVar.mo96roundToPx0680j_4(this.f17310d));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return y3.f.a(this.f17307a, pVar.f17307a) && y3.f.a(this.f17308b, pVar.f17308b) && y3.f.a(this.f17309c, pVar.f17309c) && y3.f.a(this.f17310d, pVar.f17310d);
    }

    public final int hashCode() {
        return Boolean.hashCode(true) + a80.m.d(this.f17310d, a80.m.d(this.f17309c, a80.m.d(this.f17308b, Float.hashCode(this.f17307a) * 31, 31), 31), 31);
    }

    public final String toString() {
        return "DpTouchBoundsExpansion(start=" + ((Object) y3.f.b(this.f17307a)) + ", top=" + ((Object) y3.f.b(this.f17308b)) + ", end=" + ((Object) y3.f.b(this.f17309c)) + ", bottom=" + ((Object) y3.f.b(this.f17310d)) + ", isLayoutDirectionAware=true)";
    }
}

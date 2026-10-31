package c0;

/* loaded from: classes.dex */
public final class r extends s {

    /* renamed from: a, reason: collision with root package name */
    public float f18934a;

    /* renamed from: b, reason: collision with root package name */
    public float f18935b;

    /* renamed from: c, reason: collision with root package name */
    public float f18936c;

    /* renamed from: d, reason: collision with root package name */
    public float f18937d;

    public r(float f11, float f12, float f13, float f14) {
        this.f18934a = f11;
        this.f18935b = f12;
        this.f18936c = f13;
        this.f18937d = f14;
    }

    @Override // c0.s
    public final float a(int i5) {
        if (i5 == 0) {
            return this.f18934a;
        }
        if (i5 == 1) {
            return this.f18935b;
        }
        if (i5 == 2) {
            return this.f18936c;
        }
        if (i5 != 3) {
            return 0.0f;
        }
        return this.f18937d;
    }

    @Override // c0.s
    public final int b() {
        return 4;
    }

    @Override // c0.s
    public final s c() {
        return new r(0.0f, 0.0f, 0.0f, 0.0f);
    }

    @Override // c0.s
    public final void d() {
        this.f18934a = 0.0f;
        this.f18935b = 0.0f;
        this.f18936c = 0.0f;
        this.f18937d = 0.0f;
    }

    @Override // c0.s
    public final void e(float f11, int i5) {
        if (i5 == 0) {
            this.f18934a = f11;
            return;
        }
        if (i5 == 1) {
            this.f18935b = f11;
        } else if (i5 == 2) {
            this.f18936c = f11;
        } else {
            if (i5 != 3) {
                return;
            }
            this.f18937d = f11;
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return rVar.f18934a == this.f18934a && rVar.f18935b == this.f18935b && rVar.f18936c == this.f18936c && rVar.f18937d == this.f18937d;
    }

    public final int hashCode() {
        return Float.hashCode(this.f18937d) + a80.m.d(this.f18936c, a80.m.d(this.f18935b, Float.hashCode(this.f18934a) * 31, 31), 31);
    }

    public final String toString() {
        return "AnimationVector4D: v1 = " + this.f18934a + ", v2 = " + this.f18935b + ", v3 = " + this.f18936c + ", v4 = " + this.f18937d;
    }
}

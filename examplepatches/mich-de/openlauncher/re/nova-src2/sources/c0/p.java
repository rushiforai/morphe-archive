package c0;

/* loaded from: classes.dex */
public final class p extends s {

    /* renamed from: a, reason: collision with root package name */
    public float f18914a;

    /* renamed from: b, reason: collision with root package name */
    public float f18915b;

    public p(float f11, float f12) {
        this.f18914a = f11;
        this.f18915b = f12;
    }

    @Override // c0.s
    public final float a(int i5) {
        if (i5 == 0) {
            return this.f18914a;
        }
        if (i5 != 1) {
            return 0.0f;
        }
        return this.f18915b;
    }

    @Override // c0.s
    public final int b() {
        return 2;
    }

    @Override // c0.s
    public final s c() {
        return new p(0.0f, 0.0f);
    }

    @Override // c0.s
    public final void d() {
        this.f18914a = 0.0f;
        this.f18915b = 0.0f;
    }

    @Override // c0.s
    public final void e(float f11, int i5) {
        if (i5 == 0) {
            this.f18914a = f11;
        } else {
            if (i5 != 1) {
                return;
            }
            this.f18915b = f11;
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return pVar.f18914a == this.f18914a && pVar.f18915b == this.f18915b;
    }

    public final int hashCode() {
        return Float.hashCode(this.f18915b) + (Float.hashCode(this.f18914a) * 31);
    }

    public final String toString() {
        return "AnimationVector2D: v1 = " + this.f18914a + ", v2 = " + this.f18915b;
    }
}

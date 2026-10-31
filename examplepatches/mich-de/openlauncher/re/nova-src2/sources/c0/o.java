package c0;

/* loaded from: classes.dex */
public final class o extends s {

    /* renamed from: a, reason: collision with root package name */
    public float f18891a;

    public o(float f11) {
        this.f18891a = f11;
    }

    @Override // c0.s
    public final float a(int i5) {
        if (i5 == 0) {
            return this.f18891a;
        }
        return 0.0f;
    }

    @Override // c0.s
    public final int b() {
        return 1;
    }

    @Override // c0.s
    public final s c() {
        return new o(0.0f);
    }

    @Override // c0.s
    public final void d() {
        this.f18891a = 0.0f;
    }

    @Override // c0.s
    public final void e(float f11, int i5) {
        if (i5 == 0) {
            this.f18891a = f11;
        }
    }

    public final boolean equals(Object obj) {
        return (obj instanceof o) && ((o) obj).f18891a == this.f18891a;
    }

    public final int hashCode() {
        return Float.hashCode(this.f18891a);
    }

    public final String toString() {
        return "AnimationVector1D: value = " + this.f18891a;
    }
}

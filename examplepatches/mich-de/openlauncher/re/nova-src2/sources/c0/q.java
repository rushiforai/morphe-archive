package c0;

/* loaded from: classes.dex */
public final class q extends s {

    /* renamed from: a, reason: collision with root package name */
    public float f18927a;

    /* renamed from: b, reason: collision with root package name */
    public float f18928b;

    /* renamed from: c, reason: collision with root package name */
    public float f18929c;

    public q(float f11, float f12, float f13) {
        this.f18927a = f11;
        this.f18928b = f12;
        this.f18929c = f13;
    }

    @Override // c0.s
    public final float a(int i5) {
        if (i5 == 0) {
            return this.f18927a;
        }
        if (i5 == 1) {
            return this.f18928b;
        }
        if (i5 != 2) {
            return 0.0f;
        }
        return this.f18929c;
    }

    @Override // c0.s
    public final int b() {
        return 3;
    }

    @Override // c0.s
    public final s c() {
        return new q(0.0f, 0.0f, 0.0f);
    }

    @Override // c0.s
    public final void d() {
        this.f18927a = 0.0f;
        this.f18928b = 0.0f;
        this.f18929c = 0.0f;
    }

    @Override // c0.s
    public final void e(float f11, int i5) {
        if (i5 == 0) {
            this.f18927a = f11;
        } else if (i5 == 1) {
            this.f18928b = f11;
        } else {
            if (i5 != 2) {
                return;
            }
            this.f18929c = f11;
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof q)) {
            return false;
        }
        q qVar = (q) obj;
        return qVar.f18927a == this.f18927a && qVar.f18928b == this.f18928b && qVar.f18929c == this.f18929c;
    }

    public final int hashCode() {
        return Float.hashCode(this.f18929c) + a80.m.d(this.f18928b, Float.hashCode(this.f18927a) * 31, 31);
    }

    public final String toString() {
        return "AnimationVector3D: v1 = " + this.f18927a + ", v2 = " + this.f18928b + ", v3 = " + this.f18929c;
    }
}

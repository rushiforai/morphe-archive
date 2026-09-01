package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bx extends dx {
    public float a;
    public float b;
    public float c;

    public bx(float f, float f2, float f3) {
        this.a = f;
        this.b = f2;
        this.c = f3;
    }

    @Override // defpackage.dx
    public final float a(int i) {
        if (i == 0) {
            return this.a;
        }
        if (i == 1) {
            return this.b;
        }
        if (i != 2) {
            return 0.0f;
        }
        return this.c;
    }

    @Override // defpackage.dx
    public final int b() {
        return 3;
    }

    @Override // defpackage.dx
    public final dx c() {
        return new bx(0.0f, 0.0f, 0.0f);
    }

    @Override // defpackage.dx
    public final void d() {
        this.a = 0.0f;
        this.b = 0.0f;
        this.c = 0.0f;
    }

    @Override // defpackage.dx
    public final void e(int i, float f) {
        if (i == 0) {
            this.a = f;
        } else if (i == 1) {
            this.b = f;
        } else {
            if (i != 2) {
                return;
            }
            this.c = f;
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof bx)) {
            return false;
        }
        bx bxVar = (bx) obj;
        return bxVar.a == this.a && bxVar.b == this.b && bxVar.c == this.c;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.c) + km4.p(this.b, Float.floatToIntBits(this.a) * 31, 31);
    }

    public final String toString() {
        return "AnimationVector3D: v1 = " + this.a + ", v2 = " + this.b + ", v3 = " + this.c;
    }
}

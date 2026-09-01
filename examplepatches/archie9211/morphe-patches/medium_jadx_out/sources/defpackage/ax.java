package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ax extends dx {
    public float a;
    public float b;

    public ax(float f, float f2) {
        this.a = f;
        this.b = f2;
    }

    @Override // defpackage.dx
    public final float a(int i) {
        if (i == 0) {
            return this.a;
        }
        if (i != 1) {
            return 0.0f;
        }
        return this.b;
    }

    @Override // defpackage.dx
    public final int b() {
        return 2;
    }

    @Override // defpackage.dx
    public final dx c() {
        return new ax(0.0f, 0.0f);
    }

    @Override // defpackage.dx
    public final void d() {
        this.a = 0.0f;
        this.b = 0.0f;
    }

    @Override // defpackage.dx
    public final void e(int i, float f) {
        if (i == 0) {
            this.a = f;
        } else {
            if (i != 1) {
                return;
            }
            this.b = f;
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ax)) {
            return false;
        }
        ax axVar = (ax) obj;
        return axVar.a == this.a && axVar.b == this.b;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b) + (Float.floatToIntBits(this.a) * 31);
    }

    public final String toString() {
        return "AnimationVector2D: v1 = " + this.a + ", v2 = " + this.b;
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zw extends dx {
    public float a;

    public zw(float f) {
        this.a = f;
    }

    @Override // defpackage.dx
    public final float a(int i) {
        if (i == 0) {
            return this.a;
        }
        return 0.0f;
    }

    @Override // defpackage.dx
    public final int b() {
        return 1;
    }

    @Override // defpackage.dx
    public final dx c() {
        return new zw(0.0f);
    }

    @Override // defpackage.dx
    public final void d() {
        this.a = 0.0f;
    }

    @Override // defpackage.dx
    public final void e(int i, float f) {
        if (i == 0) {
            this.a = f;
        }
    }

    public final boolean equals(Object obj) {
        return (obj instanceof zw) && ((zw) obj).a == this.a;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.a);
    }

    public final String toString() {
        return "AnimationVector1D: value = " + this.a;
    }
}

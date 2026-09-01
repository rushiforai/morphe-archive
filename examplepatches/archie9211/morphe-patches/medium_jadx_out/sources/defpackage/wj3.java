package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wj3 implements fb2 {
    public final float a;

    public wj3(float f) {
        this.a = f;
    }

    @Override // defpackage.fb2
    public final float a(long j, m73 m73Var) {
        return m73Var.Z(this.a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof wj3) && vj3.b(this.a, ((wj3) obj).a);
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.a);
    }

    public final String toString() {
        return "CornerSize(size = " + this.a + ".dp)";
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b89 implements fb2 {
    public final float a;

    public b89(float f) {
        this.a = f;
        if (f < 0.0f || f > 100.0f) {
            e26.a("The percent should be in the range of [0, 100]");
        }
    }

    @Override // defpackage.fb2
    public final float a(long j, m73 m73Var) {
        return (this.a / 100.0f) * dfc.c(j);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b89) && Float.compare(this.a, ((b89) obj).a) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.a);
    }

    public final String toString() {
        return "CornerSize(size = " + this.a + "%)";
    }
}

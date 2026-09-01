package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k3a {
    public static final k3a c = new k3a(0.0f, new hp1(0.0f, 0.0f));
    public final float a;
    public final hp1 b;

    public k3a(float f, hp1 hp1Var) {
        this.a = f;
        this.b = hp1Var;
        if (Float.isNaN(f)) {
            ay0.e("current must not be NaN");
            throw null;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k3a)) {
            return false;
        }
        k3a k3aVar = (k3a) obj;
        return this.a == k3aVar.a && g76.L(this.b, k3aVar.b);
    }

    public final int hashCode() {
        return (this.b.hashCode() + (Float.floatToIntBits(this.a) * 31)) * 31;
    }

    public final String toString() {
        return "ProgressBarRangeInfo(current=" + this.a + ", range=" + this.b + ", steps=0)";
    }
}

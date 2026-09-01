package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hp1 {
    public final float a;
    public final float b;

    public hp1(float f, float f2) {
        this.a = f;
        this.b = f2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static boolean b(Comparable comparable, Comparable comparable2) {
        return ((Number) comparable).floatValue() <= ((Number) comparable2).floatValue();
    }

    public final boolean a() {
        return this.a > this.b;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof hp1)) {
            return false;
        }
        if (a() && ((hp1) obj).a()) {
            return true;
        }
        hp1 hp1Var = (hp1) obj;
        return this.a == hp1Var.a && this.b == hp1Var.b;
    }

    public final int hashCode() {
        if (a()) {
            return -1;
        }
        return Float.floatToIntBits(this.b) + (Float.floatToIntBits(this.a) * 31);
    }

    public final String toString() {
        return this.a + ".." + this.b;
    }
}

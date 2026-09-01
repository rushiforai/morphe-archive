package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g7d {
    public final float a;
    public final float b;

    public g7d(float f, float f2) {
        this.a = f;
        this.b = f2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g7d)) {
            return false;
        }
        g7d g7dVar = (g7d) obj;
        return vj3.b(this.a, g7dVar.a) && vj3.b(this.b, g7dVar.b);
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b) + (Float.floatToIntBits(this.a) * 31);
    }

    public final String toString() {
        float f = this.a;
        String strC = vj3.c(f);
        float f2 = this.b;
        String strC2 = vj3.c(f + f2);
        return ka1.v(y30.u("TabPosition(left=", strC, ", right=", strC2, ", width="), vj3.c(f2), ")");
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mi3 {
    public final float a;
    public final b55 b;
    public final b55 c;

    public mi3(float f, b55 b55Var, int i) {
        f = (i & 2) != 0 ? 1.0f : f;
        b55Var = (i & 4) != 0 ? a0.s : b55Var;
        a0 a0Var = a0.t;
        this.a = f;
        this.b = b55Var;
        this.c = a0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mi3)) {
            return false;
        }
        mi3 mi3Var = (mi3) obj;
        return vj3.b(0.0f, 0.0f) && vj3.b(this.a, mi3Var.a) && this.b.equals(mi3Var.b) && this.c.equals(mi3Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.b.hashCode() + km4.p(this.a, Float.floatToIntBits(0.0f) * 31, 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("DividerUiModel(horizontalMargin=", vj3.c(0.0f), ", thickness=", vj3.c(this.a), ", color=");
        sbU.append(this.b);
        sbU.append(", backgroundColor=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}

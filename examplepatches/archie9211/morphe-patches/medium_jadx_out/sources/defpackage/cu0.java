package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cu0 {
    public final float a;
    public final dkc b;

    public cu0(float f, dkc dkcVar) {
        this.a = f;
        this.b = dkcVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cu0)) {
            return false;
        }
        cu0 cu0Var = (cu0) obj;
        return vj3.b(this.a, cu0Var.a) && this.b.equals(cu0Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (Float.floatToIntBits(this.a) * 31);
    }

    public final String toString() {
        return "BorderStroke(width=" + ((Object) vj3.c(this.a)) + ", brush=" + this.b + ')';
    }
}

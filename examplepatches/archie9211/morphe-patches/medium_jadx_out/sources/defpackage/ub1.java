package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ub1 implements bc1 {
    public final int a;
    public final b24 b;

    public ub1(int i, b24 b24Var) {
        this.a = i;
        this.b = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ub1)) {
            return false;
        }
        ub1 ub1Var = (ub1) obj;
        return this.a == ub1Var.a && this.b.equals(ub1Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a * 31);
    }

    public final String toString() {
        return "UndoClapsFailed(count=" + this.a + ", errorState=" + this.b + ")";
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ob1 implements bc1 {
    public final int a;
    public final b24 b;

    public ob1(int i, b24 b24Var) {
        this.a = i;
        this.b = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ob1)) {
            return false;
        }
        ob1 ob1Var = (ob1) obj;
        return this.a == ob1Var.a && this.b.equals(ob1Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a * 31);
    }

    public final String toString() {
        return "OnClappedFailed(count=" + this.a + ", errorState=" + this.b + ")";
    }
}

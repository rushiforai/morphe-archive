package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nt9 implements ou9 {
    public final int a;
    public final b24 b;

    public nt9(int i, b24 b24Var) {
        this.a = i;
        this.b = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nt9)) {
            return false;
        }
        nt9 nt9Var = (nt9) obj;
        return this.a == nt9Var.a && this.b.equals(nt9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a * 31);
    }

    public final String toString() {
        return "OnClappedFailed(count=" + this.a + ", errorState=" + this.b + ")";
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kk8 implements mk8 {
    public final String a;
    public final bt4 b;

    public kk8(String str, bt4 bt4Var) {
        str.getClass();
        bt4Var.getClass();
        this.a = str;
        this.b = bt4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kk8)) {
            return false;
        }
        kk8 kk8Var = (kk8) obj;
        return g76.L(this.a, kk8Var.a) && this.b == kk8Var.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "UpdateFollowState(userId=" + this.a + ", followState=" + this.b + ")";
    }
}

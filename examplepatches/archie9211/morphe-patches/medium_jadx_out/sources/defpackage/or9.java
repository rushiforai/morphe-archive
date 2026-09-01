package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class or9 implements rr9 {
    public final v53 a;
    public final String b;

    public or9(v53 v53Var, String str) {
        this.a = v53Var;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof or9)) {
            return false;
        }
        or9 or9Var = (or9) obj;
        return this.a.equals(or9Var.a) && this.b.equals(or9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.a.hashCode() * 31);
    }

    public final String toString() {
        return "DeleteRepostConfirmation(uiModel=" + this.a + ", source=" + this.b + ")";
    }
}

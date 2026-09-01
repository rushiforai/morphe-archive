package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lk8 implements mk8 {
    public final String a;
    public final cg8 b;

    public lk8(String str, cg8 cg8Var) {
        str.getClass();
        this.a = str;
        this.b = cg8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lk8)) {
            return false;
        }
        lk8 lk8Var = (lk8) obj;
        return g76.L(this.a, lk8Var.a) && this.b.equals(lk8Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "UpdateNewsletterSubscriptionState(userId=" + this.a + ", newsletterSubscriptionState=" + this.b + ")";
    }
}

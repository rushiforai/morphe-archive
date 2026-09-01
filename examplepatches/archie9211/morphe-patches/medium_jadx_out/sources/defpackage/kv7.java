package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kv7 {
    public final String a;
    public final int b;

    public kv7(String str, int i) {
        str.getClass();
        this.a = str;
        this.b = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kv7)) {
            return false;
        }
        kv7 kv7Var = (kv7) obj;
        return g76.L(this.a, kv7Var.a) && this.b == kv7Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        return ho2.C(this.b, "MembershipCrossoutPlan(referencePlanMembershipPlanId=", this.a, ", units=", ")");
    }
}

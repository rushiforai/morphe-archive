package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xyc {
    public final gcb a;
    public final rj2 b;
    public final ww7 c;

    public xyc(gcb gcbVar, rj2 rj2Var, ww7 ww7Var) {
        gcbVar.getClass();
        rj2Var.getClass();
        this.a = gcbVar;
        this.b = rj2Var;
        this.c = ww7Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xyc)) {
            return false;
        }
        xyc xycVar = (xyc) obj;
        return g76.L(this.a, xycVar.a) && g76.L(this.b, xycVar.b) && g76.L(this.c, xycVar.c);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        ww7 ww7Var = this.c;
        return iHashCode + (ww7Var == null ? 0 : ww7Var.hashCode());
    }

    public final String toString() {
        return "SubscriptionData(config=" + this.a + ", currentUser=" + this.b + ", membershipStatus=" + this.c + ")";
    }
}

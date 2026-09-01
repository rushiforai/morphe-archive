package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i4 {
    public final String a;
    public final j55 b;

    public i4(String str, j55 j55Var) {
        this.a = str;
        this.b = j55Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i4)) {
            return false;
        }
        i4 i4Var = (i4) obj;
        return g76.L(this.a, i4Var.a) && g76.L(this.b, i4Var.b);
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str != null ? str.hashCode() : 0) * 31;
        j55 j55Var = this.b;
        return iHashCode + (j55Var != null ? j55Var.hashCode() : 0);
    }

    public final String toString() {
        return "AccessibilityAction(label=" + this.a + ", action=" + this.b + ')';
    }
}

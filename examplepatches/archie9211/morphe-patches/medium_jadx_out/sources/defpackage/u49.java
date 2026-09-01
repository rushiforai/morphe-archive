package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u49 {
    public final v49 a;

    public u49(v49 v49Var) {
        this.a = v49Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof u49) && this.a == ((u49) obj).a;
    }

    public final int hashCode() {
        v49 v49Var = this.a;
        if (v49Var == null) {
            return 0;
        }
        return v49Var.hashCode();
    }

    public final String toString() {
        return "PartnerProgramEnrollment(status=" + this.a + ")";
    }
}

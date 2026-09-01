package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class se2 implements ue2 {
    public final String a;
    public final String b;
    public final boolean c;
    public final boolean d;

    public se2(String str, String str2, boolean z, boolean z2) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = z;
        this.d = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof se2)) {
            return false;
        }
        se2 se2Var = (se2) obj;
        return g76.L(this.a, se2Var.a) && g76.L(this.b, se2Var.b) && this.c == se2Var.c && this.d == se2Var.d;
    }

    public final int hashCode() {
        return ((wgd.o(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        return b09.C(y30.u("Content(title=", this.a, ", description=", this.b, ", isPrivate="), this.c, ", canSubmit=", this.d, ")");
    }
}

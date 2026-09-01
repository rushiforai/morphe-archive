package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class aab {
    public final String a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final boolean e;

    public aab(String str, boolean z, boolean z2, boolean z3, boolean z4) {
        this.a = str;
        this.b = z;
        this.c = z2;
        this.d = z3;
        this.e = z4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof aab)) {
            return false;
        }
        aab aabVar = (aab) obj;
        return g76.L(this.a, aabVar.a) && this.b == aabVar.b && this.c == aabVar.c && this.d == aabVar.d && this.e == aabVar.e;
    }

    public final int hashCode() {
        String str = this.a;
        return ((((((((str == null ? 0 : str.hashCode()) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbD = ev6.D("MenuOptions(postShareUrl=", this.a, ", canHideNote=", ", canUnhideNote=", this.b);
        ho2.R(sbD, this.c, ", canBlockReposter=", this.d, ", canReportRepost=");
        return lv8.t(sbD, this.e, ")");
    }
}

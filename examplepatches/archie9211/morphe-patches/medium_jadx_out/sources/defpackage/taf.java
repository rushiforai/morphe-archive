package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class taf implements uaf {
    public final List a;
    public final boolean b;
    public final q53 c;
    public final boolean d;

    public taf(List list, boolean z, q53 q53Var, boolean z2) {
        list.getClass();
        this.a = list;
        this.b = z;
        this.c = q53Var;
        this.d = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof taf)) {
            return false;
        }
        taf tafVar = (taf) obj;
        return g76.L(this.a, tafVar.a) && this.b == tafVar.b && g76.L(this.c, tafVar.c) && this.d == tafVar.d;
    }

    public final int hashCode() {
        int iHashCode = ((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31;
        q53 q53Var = this.c;
        return ((iHashCode + (q53Var == null ? 0 : q53Var.hashCode())) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbX = ka1.x("Posts(posts=", this.a, ", isLoadingMore=", this.b, ", deletePostConfirmationDialogState=");
        sbX.append(this.c);
        sbX.append(", isRefreshing=");
        sbX.append(this.d);
        sbX.append(")");
        return sbX.toString();
    }
}

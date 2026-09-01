package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jy4 implements ny4 {
    public final List a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final boolean e;
    public final String f;

    public jy4(List list, boolean z, boolean z2, boolean z3, boolean z4, String str) {
        list.getClass();
        this.a = list;
        this.b = z;
        this.c = z2;
        this.d = z3;
        this.e = z4;
        this.f = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jy4)) {
            return false;
        }
        jy4 jy4Var = (jy4) obj;
        return g76.L(this.a, jy4Var.a) && this.b == jy4Var.b && this.c == jy4Var.c && this.d == jy4Var.d && this.e == jy4Var.e && this.f.equals(jy4Var.f);
    }

    public final int hashCode() {
        return this.f.hashCode() + (((((((((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbX = ka1.x("Content(uiModels=", this.a, ", isRefreshing=", this.b, ", isLoadingMore=");
        ho2.R(sbX, this.c, ", showFindFriendsButton=", this.d, ", hasReadContactsPermission=");
        sbX.append(this.e);
        sbX.append(", screenSource=");
        sbX.append(this.f);
        sbX.append(")");
        return sbX.toString();
    }
}

package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class noc implements roc {
    public final String a;
    public final List b;
    public final boolean c;
    public final boolean d;

    public noc(String str, List list, boolean z, boolean z2) {
        str.getClass();
        this.a = str;
        this.b = list;
        this.c = z;
        this.d = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof noc)) {
            return false;
        }
        noc nocVar = (noc) obj;
        return g76.L(this.a, nocVar.a) && g76.L(this.b, nocVar.b) && this.c == nocVar.c && this.d == nocVar.d;
    }

    public final int hashCode() {
        return ((wgd.p(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        return b09.C(b09.E("Content(categoryName=", this.a, ", cards=", ", isRefreshing=", this.b), this.c, ", isFollowingAll=", this.d, ")");
    }
}

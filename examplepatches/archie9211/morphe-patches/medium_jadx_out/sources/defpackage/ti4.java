package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ti4 implements xi4 {
    public final si4 a;
    public final List b;
    public final boolean c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final boolean g;
    public final String h;

    public ti4(si4 si4Var, List list, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, String str) {
        list.getClass();
        str.getClass();
        this.a = si4Var;
        this.b = list;
        this.c = z;
        this.d = z2;
        this.e = z3;
        this.f = z4;
        this.g = z5;
        this.h = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ti4)) {
            return false;
        }
        ti4 ti4Var = (ti4) obj;
        return this.a.equals(ti4Var.a) && g76.L(this.b, ti4Var.b) && this.c == ti4Var.c && this.d == ti4Var.d && this.e == ti4Var.e && this.f == ti4Var.f && this.g == ti4Var.g && g76.L(this.h, ti4Var.h);
    }

    public final int hashCode() {
        return this.h.hashCode() + ((((((((((wgd.p(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("MatchedContacts(matchedContactCount=");
        sb.append(this.a);
        sb.append(", matchedContacts=");
        sb.append(this.b);
        sb.append(", isRefreshing=");
        ho2.R(sb, this.c, ", isLoadingMore=", this.d, ", showFollowAllMatchedContacts=");
        ho2.R(sb, this.e, ", showFullScreenLoading=", this.f, ", showReSyncContacts=");
        sb.append(this.g);
        sb.append(", source=");
        sb.append(this.h);
        sb.append(")");
        return sb.toString();
    }
}

package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rj2 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final Long g;
    public final Long h;
    public final zw7 i;
    public final Long j;
    public final Long k;
    public final boolean l;
    public final String m;
    public final String n;
    public final bj7 o;
    public final boolean p;
    public final boolean q;
    public final Long r;
    public final ArrayList s;
    public final boolean t;
    public final List u;
    public final u49 v;
    public final Long w;
    public final boolean x;

    public rj2(String str, String str2, String str3, String str4, String str5, String str6, Long l, Long l2, zw7 zw7Var, Long l3, Long l4, boolean z, String str7, String str8, bj7 bj7Var, boolean z2, boolean z3, Long l5, ArrayList arrayList, boolean z4, List list, u49 u49Var, Long l6, boolean z5) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        zw7Var.getClass();
        list.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = str5;
        this.f = str6;
        this.g = l;
        this.h = l2;
        this.i = zw7Var;
        this.j = l3;
        this.k = l4;
        this.l = z;
        this.m = str7;
        this.n = str8;
        this.o = bj7Var;
        this.p = z2;
        this.q = z3;
        this.r = l5;
        this.s = arrayList;
        this.t = z4;
        this.u = list;
        this.v = u49Var;
        this.w = l6;
        this.x = z5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rj2)) {
            return false;
        }
        rj2 rj2Var = (rj2) obj;
        return g76.L(this.a, rj2Var.a) && g76.L(this.b, rj2Var.b) && g76.L(this.c, rj2Var.c) && g76.L(this.d, rj2Var.d) && g76.L(this.e, rj2Var.e) && g76.L(this.f, rj2Var.f) && g76.L(this.g, rj2Var.g) && g76.L(this.h, rj2Var.h) && this.i == rj2Var.i && g76.L(this.j, rj2Var.j) && g76.L(this.k, rj2Var.k) && this.l == rj2Var.l && g76.L(this.m, rj2Var.m) && g76.L(this.n, rj2Var.n) && g76.L(this.o, rj2Var.o) && this.p == rj2Var.p && this.q == rj2Var.q && g76.L(this.r, rj2Var.r) && this.s.equals(rj2Var.s) && this.t == rj2Var.t && g76.L(this.u, rj2Var.u) && g76.L(this.v, rj2Var.v) && g76.L(this.w, rj2Var.w) && this.x == rj2Var.x;
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c);
        String str = this.d;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.e;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Long l = this.g;
        int iHashCode4 = (iHashCode3 + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.h;
        int iHashCode5 = (this.i.hashCode() + ((iHashCode4 + (l2 == null ? 0 : l2.hashCode())) * 31)) * 31;
        Long l3 = this.j;
        int iHashCode6 = (iHashCode5 + (l3 == null ? 0 : l3.hashCode())) * 31;
        Long l4 = this.k;
        int iHashCode7 = (((iHashCode6 + (l4 == null ? 0 : l4.hashCode())) * 31) + (this.l ? 1231 : 1237)) * 31;
        String str4 = this.m;
        int iHashCode8 = (iHashCode7 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.n;
        int iHashCode9 = (iHashCode8 + (str5 == null ? 0 : str5.hashCode())) * 31;
        bj7 bj7Var = this.o;
        int iHashCode10 = (((((iHashCode9 + (bj7Var == null ? 0 : bj7Var.hashCode())) * 31) + (this.p ? 1231 : 1237)) * 31) + (this.q ? 1231 : 1237)) * 31;
        Long l5 = this.r;
        int iP = wgd.p((b09.p(this.s, (iHashCode10 + (l5 == null ? 0 : l5.hashCode())) * 31, 31) + (this.t ? 1231 : 1237)) * 31, 31, this.u);
        u49 u49Var = this.v;
        int iHashCode11 = (iP + (u49Var == null ? 0 : u49Var.hashCode())) * 31;
        Long l6 = this.w;
        return ((iHashCode11 + (l6 != null ? l6.hashCode() : 0)) * 31) + (this.x ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("CurrentUser(id=", this.a, ", name=", this.b, ", username=");
        ka1.C(sbU, this.c, ", profileImageId=", this.d, ", bio=");
        ka1.C(sbU, this.e, ", aboutAsHtml=", this.f, ", followerCount=");
        sbU.append(this.g);
        sbU.append(", followingCount=");
        sbU.append(this.h);
        sbU.append(", membershipType=");
        sbU.append(this.i);
        sbU.append(", memberSince=");
        sbU.append(this.j);
        sbU.append(", friendSince=");
        sbU.append(this.k);
        sbU.append(", isMembershipTrialEligible=");
        sbU.append(this.l);
        sbU.append(", facebookDisplayName=");
        ka1.C(sbU, this.m, ", xDisplayName=", this.n, ", mastodon=");
        sbU.append(this.o);
        sbU.append(", hasLists=");
        sbU.append(this.p);
        sbU.append(", isBookAuthor=");
        sbU.append(this.q);
        sbU.append(", firstOpenedAndroidApp=");
        sbU.append(this.r);
        sbU.append(", adminOfCollections=");
        sbU.append(this.s);
        sbU.append(", allowEmailAddressSharing=");
        sbU.append(this.t);
        sbU.append(", pronouns=");
        sbU.append(this.u);
        sbU.append(", partnerProgramEnrollment=");
        sbU.append(this.v);
        sbU.append(", lastPostCreatedAt=");
        sbU.append(this.w);
        sbU.append(", isSuspended=");
        sbU.append(this.x);
        sbU.append(")");
        return sbU.toString();
    }
}

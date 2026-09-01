package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class che implements ehe {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final List e;
    public final boolean f;
    public final Long g;
    public final Long h;
    public final boolean i;
    public final boolean j;
    public final boolean k;
    public final boolean l;
    public final boolean m;
    public final Boolean n;
    public final Boolean o;
    public final Boolean p;
    public final Boolean q;
    public final String r;
    public final Boolean s;
    public final boolean t;

    public che(String str, String str2, String str3, String str4, List list, boolean z, Long l, Long l2, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, Boolean bool, Boolean bool2, Boolean bool3, Boolean bool4, String str5, Boolean bool5, boolean z7) {
        str.getClass();
        list.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = list;
        this.f = z;
        this.g = l;
        this.h = l2;
        this.i = z2;
        this.j = z3;
        this.k = z4;
        this.l = z5;
        this.m = z6;
        this.n = bool;
        this.o = bool2;
        this.p = bool3;
        this.q = bool4;
        this.r = str5;
        this.s = bool5;
        this.t = z7;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof che)) {
            return false;
        }
        che cheVar = (che) obj;
        return g76.L(this.a, cheVar.a) && g76.L(this.b, cheVar.b) && g76.L(this.c, cheVar.c) && g76.L(this.d, cheVar.d) && g76.L(this.e, cheVar.e) && this.f == cheVar.f && g76.L(this.g, cheVar.g) && g76.L(this.h, cheVar.h) && this.i == cheVar.i && this.j == cheVar.j && this.k == cheVar.k && this.l == cheVar.l && this.m == cheVar.m && g76.L(this.n, cheVar.n) && g76.L(this.o, cheVar.o) && g76.L(this.p, cheVar.p) && g76.L(this.q, cheVar.q) && g76.L(this.r, cheVar.r) && g76.L(this.s, cheVar.s) && this.t == cheVar.t;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.d;
        int iP = (wgd.p((iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31, 31, this.e) + (this.f ? 1231 : 1237)) * 31;
        Long l = this.g;
        int iHashCode4 = (iP + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.h;
        int iHashCode5 = (((((((((((iHashCode4 + (l2 == null ? 0 : l2.hashCode())) * 31) + (this.i ? 1231 : 1237)) * 31) + (this.j ? 1231 : 1237)) * 31) + (this.k ? 1231 : 1237)) * 31) + (this.l ? 1231 : 1237)) * 31) + (this.m ? 1231 : 1237)) * 31;
        Boolean bool = this.n;
        int iHashCode6 = (iHashCode5 + (bool == null ? 0 : bool.hashCode())) * 31;
        Boolean bool2 = this.o;
        int iHashCode7 = (iHashCode6 + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        Boolean bool3 = this.p;
        int iHashCode8 = (iHashCode7 + (bool3 == null ? 0 : bool3.hashCode())) * 31;
        Boolean bool4 = this.q;
        int iHashCode9 = (iHashCode8 + (bool4 == null ? 0 : bool4.hashCode())) * 31;
        String str4 = this.r;
        int iHashCode10 = (iHashCode9 + (str4 == null ? 0 : str4.hashCode())) * 31;
        Boolean bool5 = this.s;
        return ((iHashCode10 + (bool5 != null ? bool5.hashCode() : 0)) * 31) + (this.t ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Success(id=", this.a, ", name=", this.b, ", imageId=");
        ka1.C(sbU, this.c, ", username=", this.d, ", pronouns=");
        sbU.append(this.e);
        sbU.append(", hasSubdomain=");
        sbU.append(this.f);
        sbU.append(", followerCount=");
        sbU.append(this.g);
        sbU.append(", followingCount=");
        sbU.append(this.h);
        sbU.append(", isBlocking=");
        ho2.R(sbU, this.i, ", isFollowing=", this.j, ", isMuting=");
        ho2.R(sbU, this.k, ", isCurrentUser=", this.l, ", hasLists=");
        sbU.append(this.m);
        sbU.append(", isBookAuthor=");
        sbU.append(this.n);
        sbU.append(", isVerifiedAuthor=");
        sbU.append(this.o);
        sbU.append(", hasPosts=");
        sbU.append(this.p);
        sbU.append(", isPremium=");
        sbU.append(this.q);
        sbU.append(", newsletterId=");
        sbU.append(this.r);
        sbU.append(", isSubscribedToNewsletter=");
        sbU.append(this.s);
        sbU.append(", isRefreshing=");
        sbU.append(this.t);
        sbU.append(")");
        return sbU.toString();
    }
}

package defpackage;

import com.medium.android.profile.ui.view.UserProfileTab;
import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jje implements nje {
    public final List a;
    public final UserProfileTab b;
    public final String c;
    public final String d;
    public final String e;
    public final Long f;
    public final Long g;
    public final wu4 h;
    public final d88 i;
    public final ns0 j;
    public final boolean k;
    public final boolean l;
    public final pme m;
    public final boolean n;
    public final boolean o;
    public final boolean p;
    public final List q;
    public final SourceParameter r;
    public final boolean s;
    public final boolean t;
    public final int u;

    public jje(List list, UserProfileTab userProfileTab, String str, String str2, String str3, Long l, Long l2, wu4 wu4Var, d88 d88Var, ns0 ns0Var, boolean z, boolean z2, pme pmeVar, boolean z3, boolean z4, boolean z5, List list2, SourceParameter sourceParameter, boolean z6, boolean z7) {
        userProfileTab.getClass();
        str.getClass();
        d88Var.getClass();
        ns0Var.getClass();
        list2.getClass();
        sourceParameter.getClass();
        this.a = list;
        this.b = userProfileTab;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = l;
        this.g = l2;
        this.h = wu4Var;
        this.i = d88Var;
        this.j = ns0Var;
        this.k = z;
        this.l = z2;
        this.m = pmeVar;
        this.n = z3;
        this.o = z4;
        this.p = z5;
        this.q = list2;
        this.r = sourceParameter;
        this.s = z6;
        this.t = z7;
        int iIndexOf = list.indexOf(userProfileTab);
        Integer numValueOf = iIndexOf < 0 ? null : Integer.valueOf(iIndexOf);
        this.u = numValueOf != null ? numValueOf.intValue() : 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x003c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            Method dump skipped, instruction units count: 218
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jje.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c);
        String str = this.d;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.e;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        Long l = this.f;
        int iHashCode3 = (iHashCode2 + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.g;
        int iHashCode4 = (((((this.j.hashCode() + ((this.i.hashCode() + ((this.h.hashCode() + ((iHashCode3 + (l2 == null ? 0 : l2.hashCode())) * 31)) * 31)) * 31)) * 31) + (this.k ? 1231 : 1237)) * 31) + (this.l ? 1231 : 1237)) * 31;
        pme pmeVar = this.m;
        return ((ev6.o(this.r, wgd.p((((((((iHashCode4 + (pmeVar != null ? pmeVar.hashCode() : 0)) * 31) + (this.n ? 1231 : 1237)) * 31) + (this.o ? 1231 : 1237)) * 31) + (this.p ? 1231 : 1237)) * 31, 31, this.q), 31) + (this.s ? 1231 : 1237)) * 31) + (this.t ? 1231 : 1237);
    }

    public final String toString() {
        String str = this.d;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sb = new StringBuilder("Content(tabs=");
        sb.append(this.a);
        sb.append(", selectedTab=");
        sb.append(this.b);
        sb.append(", userId=");
        ka1.C(sb, this.c, ", imageId=", strA, ", userName=");
        sb.append(this.e);
        sb.append(", followerCount=");
        sb.append(this.f);
        sb.append(", followingCount=");
        sb.append(this.g);
        sb.append(", followSubscribeUiModel=");
        sb.append(this.h);
        sb.append(", muteState=");
        sb.append(this.i);
        sb.append(", blockState=");
        sb.append(this.j);
        sb.append(", canBeReported=");
        ho2.R(sb, this.k, ", canSeeStats=", this.l, ", shareData=");
        sb.append(this.m);
        sb.append(", isBookAuthor=");
        sb.append(this.n);
        sb.append(", isVerifiedAuthor=");
        ho2.R(sb, this.o, ", isPremiumMember=", this.p, ", pronouns=");
        sb.append(this.q);
        sb.append(", sourceParameter=");
        sb.append(this.r);
        sb.append(", isRefreshing=");
        return b09.C(sb, this.s, ", showActivityFeedTooltip=", this.t, ")");
    }
}

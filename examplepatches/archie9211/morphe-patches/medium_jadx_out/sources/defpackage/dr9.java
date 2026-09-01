package defpackage;

import com.medium.android.core.share.PostShareData;
import com.medium.android.data.notification.YMl.DtuT;
import com.medium.proto.event.PostClientVisibilityState;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dr9 implements x27 {
    public final bo4 A;
    public final qq9 B;
    public final String C;
    public final String a;
    public final sw5 b;
    public final String c;
    public final String d;
    public final boolean e;
    public final Long f;
    public final Integer g;
    public final bo4 h;
    public final pq9 i;
    public final rq9 j;
    public final Long k;
    public final Integer l;
    public final Integer m;
    public final boolean n;
    public final bo4 o;
    public final PostClientVisibilityState p;
    public final cr9 q;
    public final wq9 r;
    public final bo4 s;
    public final oq9 t;
    public final sq9 u;
    public final boolean v;
    public final boolean w;
    public final g08 x;
    public final lj3 y;
    public final PostShareData z;

    public dr9(String str, sw5 sw5Var, String str2, String str3, boolean z, Long l, Integer num, bo4 bo4Var, pq9 pq9Var, rq9 rq9Var, Long l2, Integer num2, Integer num3, boolean z2, bo4 bo4Var2, PostClientVisibilityState postClientVisibilityState, cr9 cr9Var, wq9 wq9Var, bo4 bo4Var3, oq9 oq9Var, sq9 sq9Var, boolean z3, boolean z4, g08 g08Var, lj3 lj3Var, PostShareData postShareData, bo4 bo4Var4, qq9 qq9Var) {
        postClientVisibilityState.getClass();
        wq9Var.getClass();
        g08Var.getClass();
        this.a = str;
        this.b = sw5Var;
        this.c = str2;
        this.d = str3;
        this.e = z;
        this.f = l;
        this.g = num;
        this.h = bo4Var;
        this.i = pq9Var;
        this.j = rq9Var;
        this.k = l2;
        this.l = num2;
        this.m = num3;
        this.n = z2;
        this.o = bo4Var2;
        this.p = postClientVisibilityState;
        this.q = cr9Var;
        this.r = wq9Var;
        this.s = bo4Var3;
        this.t = oq9Var;
        this.u = sq9Var;
        this.v = z3;
        this.w = z4;
        this.x = g08Var;
        this.y = lj3Var;
        this.z = postShareData;
        this.A = bo4Var4;
        this.B = qq9Var;
        this.C = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dr9)) {
            return false;
        }
        dr9 dr9Var = (dr9) obj;
        return this.a.equals(dr9Var.a) && g76.L(this.b, dr9Var.b) && g76.L(this.c, dr9Var.c) && g76.L(this.d, dr9Var.d) && this.e == dr9Var.e && g76.L(this.f, dr9Var.f) && g76.L(this.g, dr9Var.g) && this.h.equals(dr9Var.h) && this.i.equals(dr9Var.i) && g76.L(this.j, dr9Var.j) && g76.L(this.k, dr9Var.k) && g76.L(this.l, dr9Var.l) && this.m.equals(dr9Var.m) && this.n == dr9Var.n && this.o.equals(dr9Var.o) && this.p == dr9Var.p && g76.L(this.q, dr9Var.q) && this.r == dr9Var.r && this.s.equals(dr9Var.s) && this.t.equals(dr9Var.t) && this.u.equals(dr9Var.u) && this.v == dr9Var.v && this.w == dr9Var.w && g76.L(this.x, dr9Var.x) && this.y == dr9Var.y && g76.L(this.z, dr9Var.z) && this.A.equals(dr9Var.A) && this.B == dr9Var.B;
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.C;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        sw5 sw5Var = this.b;
        int iHashCode2 = (iHashCode + (sw5Var == null ? 0 : sw5Var.hashCode())) * 31;
        String str = this.c;
        int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.d;
        int iHashCode4 = (((iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31) + (this.e ? 1231 : 1237)) * 31;
        Long l = this.f;
        int iHashCode5 = (iHashCode4 + (l == null ? 0 : l.hashCode())) * 31;
        Integer num = this.g;
        int iHashCode6 = (this.i.hashCode() + ka1.a(this.h, (iHashCode5 + (num == null ? 0 : num.hashCode())) * 31, 31)) * 31;
        rq9 rq9Var = this.j;
        int iHashCode7 = (iHashCode6 + (rq9Var == null ? 0 : rq9Var.hashCode())) * 31;
        Long l2 = this.k;
        int iHashCode8 = (iHashCode7 + (l2 == null ? 0 : l2.hashCode())) * 31;
        Integer num2 = this.l;
        int iHashCode9 = (this.p.hashCode() + ka1.a(this.o, (((this.m.hashCode() + ((iHashCode8 + (num2 == null ? 0 : num2.hashCode())) * 31)) * 31) + (this.n ? 1231 : 1237)) * 31, 31)) * 31;
        cr9 cr9Var = this.q;
        int iHashCode10 = (this.x.hashCode() + ((((((this.u.hashCode() + ((this.t.hashCode() + ka1.a(this.s, (this.r.hashCode() + ((iHashCode9 + (cr9Var == null ? 0 : cr9Var.hashCode())) * 31)) * 31, 31)) * 31)) * 31) + (this.v ? 1231 : 1237)) * 31) + (this.w ? 1231 : 1237)) * 31)) * 31;
        lj3 lj3Var = this.y;
        int iHashCode11 = (iHashCode10 + (lj3Var == null ? 0 : lj3Var.hashCode())) * 31;
        PostShareData postShareData = this.z;
        return this.B.hashCode() + ka1.a(this.A, (iHashCode11 + (postShareData != null ? postShareData.hashCode() : 0)) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("PostUiModel(postId=");
        sb.append(this.a);
        sb.append(", postImageData=");
        sb.append(this.b);
        sb.append(", postTitle=");
        ka1.C(sb, this.c, ", postSubtitle=", this.d, DtuT.LbATuNUTMMGaf);
        sb.append(this.e);
        sb.append(", postPublishedAt=");
        sb.append(this.f);
        sb.append(", postReadingTime=");
        sb.append(this.g);
        sb.append(", isPostViewedStream=");
        sb.append(this.h);
        sb.append(", author=");
        sb.append(this.i);
        sb.append(", collection=");
        sb.append(this.j);
        sb.append(", totalClapCount=");
        sb.append(this.k);
        sb.append(", responsesCount=");
        sb.append(this.l);
        sb.append(", repostCount=");
        sb.append(this.m);
        sb.append(", showPinState=");
        sb.append(this.n);
        sb.append(", pinStateStream=");
        sb.append(this.o);
        sb.append(", postVisibility=");
        sb.append(this.p);
        sb.append(", recommendationReason=");
        sb.append(this.q);
        sb.append(", onClickAction=");
        sb.append(this.r);
        sb.append(", explicitSignalStateStream=");
        sb.append(this.s);
        sb.append(", actions=");
        sb.append(this.t);
        sb.append(", menuOptions=");
        sb.append(this.u);
        sb.append(", showMenu=");
        sb.append(this.v);
        sb.append(", showSocialCounts=");
        sb.append(this.w);
        sb.append(", metricsContext=");
        sb.append(this.x);
        sb.append(", downloadStatus=");
        sb.append(this.y);
        sb.append(", postShareData=");
        sb.append(this.z);
        sb.append(", postPublicationSubmissionStateStream=");
        sb.append(this.A);
        sb.append(", bylinePosition=");
        sb.append(this.B);
        sb.append(")");
        return sb.toString();
    }
}

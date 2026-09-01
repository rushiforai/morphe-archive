package defpackage;

import com.medium.android.core.share.PostShareData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ub0 implements vb0 {
    public final String a;
    public final String b;
    public final sw5 c;
    public final tb0 d;
    public final tb0 e;
    public final String f;
    public final float g;
    public final int h;
    public final boolean i;
    public final float j;
    public final boolean k;
    public final boolean l;
    public final boolean m;
    public final boolean n;
    public final PostShareData o;

    public ub0(String str, String str2, sw5 sw5Var, tb0 tb0Var, tb0 tb0Var2, String str3, float f, int i, boolean z, float f2, boolean z2, boolean z3, boolean z4, boolean z5, PostShareData postShareData) {
        this.a = str;
        this.b = str2;
        this.c = sw5Var;
        this.d = tb0Var;
        this.e = tb0Var2;
        this.f = str3;
        this.g = f;
        this.h = i;
        this.i = z;
        this.j = f2;
        this.k = z2;
        this.l = z3;
        this.m = z4;
        this.n = z5;
        this.o = postShareData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ub0)) {
            return false;
        }
        ub0 ub0Var = (ub0) obj;
        return this.a.equals(ub0Var.a) && g76.L(this.b, ub0Var.b) && g76.L(this.c, ub0Var.c) && g76.L(this.d, ub0Var.d) && g76.L(this.e, ub0Var.e) && g76.L(this.f, ub0Var.f) && Float.compare(this.g, ub0Var.g) == 0 && this.h == ub0Var.h && this.i == ub0Var.i && Float.compare(this.j, ub0Var.j) == 0 && this.k == ub0Var.k && this.l == ub0Var.l && this.m == ub0Var.m && this.n == ub0Var.n && g76.L(this.o, ub0Var.o);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        sw5 sw5Var = this.c;
        int iHashCode3 = (iHashCode2 + (sw5Var == null ? 0 : sw5Var.hashCode())) * 31;
        tb0 tb0Var = this.d;
        int iHashCode4 = (iHashCode3 + (tb0Var == null ? 0 : tb0Var.hashCode())) * 31;
        tb0 tb0Var2 = this.e;
        int iHashCode5 = (iHashCode4 + (tb0Var2 == null ? 0 : tb0Var2.hashCode())) * 31;
        String str2 = this.f;
        int iP = (((((((km4.p(this.j, (((km4.p(this.g, (iHashCode5 + (str2 == null ? 0 : str2.hashCode())) * 31, 31) + this.h) * 31) + (this.i ? 1231 : 1237)) * 31, 31) + (this.k ? 1231 : 1237)) * 31) + (this.l ? 1231 : 1237)) * 31) + (this.m ? 1231 : 1237)) * 31) + (this.n ? 1231 : 1237)) * 31;
        PostShareData postShareData = this.o;
        return iP + (postShareData != null ? postShareData.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("IsPlaying(postId=", this.a, ", mediumUrl=", this.b, ", imageData=");
        sbU.append(this.c);
        sbU.append(", author=");
        sbU.append(this.d);
        sbU.append(", publication=");
        sbU.append(this.e);
        sbU.append(", postTitle=");
        sbU.append(this.f);
        sbU.append(", progress=");
        sbU.append(this.g);
        sbU.append(", numberOfItem=");
        sbU.append(this.h);
        sbU.append(", isPaused=");
        sbU.append(this.i);
        sbU.append(", speechRate=");
        sbU.append(this.j);
        sbU.append(", hasVoices=");
        ho2.R(sbU, this.k, ", canBeReported=", this.l, ", canDisplayShowLessLikeThis=");
        ho2.R(sbU, this.m, ", canBeMuted=", this.n, ", postShareData=");
        sbU.append(this.o);
        sbU.append(")");
        return sbU.toString();
    }
}

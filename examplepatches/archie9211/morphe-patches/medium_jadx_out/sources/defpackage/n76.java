package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class n76 implements s79 {
    public final String a;
    public final String b;
    public final String c;
    public final SourceParameter d;
    public final UpsellInfo e;
    public final String f;
    public final aw7 g;
    public final String h;
    public final String i;
    public final String j;
    public final r79 k;

    public n76(String str, String str2, String str3, SourceParameter sourceParameter, UpsellInfo upsellInfo, String str4, aw7 aw7Var, String str5, String str6, String str7) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = sourceParameter;
        this.e = upsellInfo;
        this.f = str4;
        this.g = aw7Var;
        this.h = str5;
        this.i = str6;
        this.j = str7;
        this.k = r79.INTRO_OFFER;
    }

    @Override // defpackage.s79
    public final SourceParameter a() {
        return this.d;
    }

    @Override // defpackage.s79
    public final String b() {
        return this.a;
    }

    @Override // defpackage.s79
    public final r79 c() {
        return this.k;
    }

    @Override // defpackage.s79
    public final String d() {
        return this.b;
    }

    @Override // defpackage.s79
    public final UpsellInfo e() {
        return this.e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n76)) {
            return false;
        }
        n76 n76Var = (n76) obj;
        return g76.L(this.a, n76Var.a) && g76.L(this.b, n76Var.b) && g76.L(this.c, n76Var.c) && this.d.equals(n76Var.d) && this.e.equals(n76Var.e) && g76.L(this.f, n76Var.f) && this.g == n76Var.g && g76.L(this.h, n76Var.h) && g76.L(this.i, n76Var.i) && g76.L(this.j, n76Var.j);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (this.e.hashCode() + ev6.o(this.d, (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31, 31)) * 31;
        String str3 = this.f;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        aw7 aw7Var = this.g;
        int iHashCode5 = (iHashCode4 + (aw7Var == null ? 0 : aw7Var.hashCode())) * 31;
        String str4 = this.h;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.i;
        int iHashCode7 = (iHashCode6 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.j;
        return iHashCode7 + (str6 != null ? str6.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("IntroOfferPaywallUiModel(postId=", this.a, ", currentUserId=", this.b, ", currentUserName=");
        sbU.append(this.c);
        sbU.append(", sourceParameter=");
        sbU.append(this.d);
        sbU.append(", upsellInfo=");
        sbU.append(this.e);
        sbU.append(", pill=");
        sbU.append(this.f);
        sbU.append(", pillColorScheme=");
        sbU.append(this.g);
        sbU.append(", title=");
        sbU.append(this.h);
        sbU.append(", subtitle=");
        return km4.C(sbU, this.i, ", callToAction=", this.j, ")");
    }
}

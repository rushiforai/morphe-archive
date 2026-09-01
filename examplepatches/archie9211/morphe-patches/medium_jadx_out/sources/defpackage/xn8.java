package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xn8 {
    public final String a;
    public final String b;
    public final String c;
    public final aw7 d;
    public final UpsellInfo e;
    public final SourceParameter f;

    public xn8(String str, String str2, String str3, aw7 aw7Var, UpsellInfo upsellInfo, SourceParameter sourceParameter) {
        upsellInfo.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = aw7Var;
        this.e = upsellInfo;
        this.f = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xn8)) {
            return false;
        }
        xn8 xn8Var = (xn8) obj;
        return g76.L(this.a, xn8Var.a) && g76.L(this.b, xn8Var.b) && g76.L(this.c, xn8Var.c) && this.d == xn8Var.d && g76.L(this.e, xn8Var.e) && g76.L(this.f, xn8Var.f);
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        aw7 aw7Var = this.d;
        return this.f.hashCode() + ((this.e.hashCode() + ((iHashCode3 + (aw7Var != null ? aw7Var.hashCode() : 0)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("OfferBannerUiModel(pill=", this.a, ", tagline=", this.b, ", cta=");
        sbU.append(this.c);
        sbU.append(", colorScheme=");
        sbU.append(this.d);
        sbU.append(", upsellInfo=");
        sbU.append(this.e);
        sbU.append(", sourceParameter=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}

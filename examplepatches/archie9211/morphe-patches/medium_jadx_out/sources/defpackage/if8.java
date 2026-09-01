package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class if8 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final u50 f;
    public final String g;
    public final SourceParameter h;

    public if8(String str, String str2, String str3, String str4, String str5, u50 u50Var, String str6, SourceParameter sourceParameter) {
        ho2.P(sourceParameter, str, str2, str3);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = str5;
        this.f = u50Var;
        this.g = str6;
        this.h = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof if8) {
            if8 if8Var = (if8) obj;
            if (g76.L(this.a, if8Var.a) && g76.L(this.b, if8Var.b) && g76.L(this.c, if8Var.c) && g76.L(this.d, if8Var.d) && g76.L(this.e, if8Var.e) && this.f == if8Var.f && g76.L(this.g, if8Var.g) && g76.L(this.h, if8Var.h)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c);
        String str = this.d;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.e;
        int iHashCode2 = (this.f.hashCode() + ((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31;
        String str3 = this.g;
        return this.h.hashCode() + ((iHashCode2 + (str3 != null ? str3.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("NewsletterItemUiModel(publicationId=", this.a, ", publicationName=", this.b, ", newsletterId=");
        ka1.C(sbU, this.c, ", newsletterName=", this.d, ", newsletterDescription=");
        sbU.append(this.e);
        sbU.append(", newsletterSubscriptionStateFlow=");
        sbU.append(this.f);
        sbU.append(", currentUserEmail=");
        sbU.append(this.g);
        sbU.append(", sourceParameter=");
        sbU.append(this.h);
        sbU.append(")");
        return sbU.toString();
    }
}

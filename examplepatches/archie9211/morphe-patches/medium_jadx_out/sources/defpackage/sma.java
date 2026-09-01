package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sma {
    public final String a;
    public final String b;
    public final String c;
    public final et1 d;
    public final d88 e;
    public final boolean f;
    public final boolean g;
    public final SourceParameter h;

    public sma(String str, String str2, String str3, et1 et1Var, d88 d88Var, boolean z, boolean z2, SourceParameter sourceParameter) {
        str.getClass();
        str2.getClass();
        d88Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = et1Var;
        this.e = d88Var;
        this.f = z;
        this.g = z2;
        this.h = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sma)) {
            return false;
        }
        sma smaVar = (sma) obj;
        return g76.L(this.a, smaVar.a) && g76.L(this.b, smaVar.b) && g76.L(this.c, smaVar.c) && g76.L(this.d, smaVar.d) && this.e == smaVar.e && this.f == smaVar.f && this.g == smaVar.g && this.h.equals(smaVar.h);
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        et1 et1Var = this.d;
        return this.h.hashCode() + ((((((this.e.hashCode() + ((iHashCode + (et1Var != null ? et1Var.hashCode() : 0)) * 31)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PublicationTopBarUiModel(publicationId=", this.a, ", publicationName=", this.b, ", publicationImageId=");
        sbU.append(this.c);
        sbU.append(", publicationShareData=");
        sbU.append(this.d);
        sbU.append(", publicationMuteState=");
        sbU.append(this.e);
        sbU.append(", canSeeStats=");
        sbU.append(this.f);
        sbU.append(", canSeePublicationFeaturedPosts=");
        sbU.append(this.g);
        sbU.append(", sourceParameter=");
        sbU.append(this.h);
        sbU.append(")");
        return sbU.toString();
    }
}

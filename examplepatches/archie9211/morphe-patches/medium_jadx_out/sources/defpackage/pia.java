package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pia {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final Integer e;
    public final az5 f;
    public final bt4 g;
    public final String h;
    public final cg8 i;
    public final SourceParameter j;

    public pia(String str, String str2, String str3, String str4, Integer num, az5 az5Var, bt4 bt4Var, String str5, cg8 cg8Var, SourceParameter sourceParameter) {
        str.getClass();
        str3.getClass();
        az5Var.getClass();
        bt4Var.getClass();
        cg8Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = num;
        this.f = az5Var;
        this.g = bt4Var;
        this.h = str5;
        this.i = cg8Var;
        this.j = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pia)) {
            return false;
        }
        pia piaVar = (pia) obj;
        return g76.L(this.a, piaVar.a) && g76.L(this.b, piaVar.b) && g76.L(this.c, piaVar.c) && g76.L(this.d, piaVar.d) && g76.L(this.e, piaVar.e) && g76.L(this.f, piaVar.f) && this.g == piaVar.g && g76.L(this.h, piaVar.h) && g76.L(this.i, piaVar.i) && this.j.equals(piaVar.j);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iO = wgd.o((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.c);
        String str2 = this.d;
        int iHashCode2 = (iO + (str2 == null ? 0 : str2.hashCode())) * 31;
        Integer num = this.e;
        int iHashCode3 = (this.g.hashCode() + ka1.b(this.f, (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31, 31)) * 31;
        String str3 = this.h;
        int iHashCode4 = str3 != null ? str3.hashCode() : 0;
        return this.j.hashCode() + ((this.i.hashCode() + ((iHashCode3 + iHashCode4) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PublicationHeaderUiModel(publicationId=", this.a, ", publicationImage=", this.b, ", publicationName=");
        ka1.C(sbU, this.c, ", publicationDescription=", this.d, ", publicationFollowerCount=");
        sbU.append(this.e);
        sbU.append(", publicationEditorUrls=");
        sbU.append(this.f);
        sbU.append(", publicationFollowState=");
        sbU.append(this.g);
        sbU.append(", newsletterId=");
        sbU.append(this.h);
        sbU.append(", newsletterSubscriptionState=");
        sbU.append(this.i);
        sbU.append(", sourceParameter=");
        sbU.append(this.j);
        sbU.append(")");
        return sbU.toString();
    }
}

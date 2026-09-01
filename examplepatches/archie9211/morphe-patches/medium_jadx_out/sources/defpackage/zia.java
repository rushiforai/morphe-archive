package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zia implements aja {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;

    public zia(String str, String str2, String str3, String str4, String str5, String str6) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = str5;
        this.f = str6;
    }

    @Override // defpackage.aja
    public final List a() {
        throw new IllegalStateException("Promotion section has no posts");
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zia)) {
            return false;
        }
        zia ziaVar = (zia) obj;
        return g76.L(this.a, ziaVar.a) && g76.L(this.b, ziaVar.b) && g76.L(this.c, ziaVar.c) && g76.L(this.d, ziaVar.d) && g76.L(this.e, ziaVar.e) && g76.L(this.f, ziaVar.f);
    }

    @Override // defpackage.aja
    public final String getId() {
        return this.a;
    }

    @Override // defpackage.aja
    public final String getTitle() {
        throw new IllegalStateException("Promotion section has no title");
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.d;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.e;
        int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f;
        return iHashCode5 + (str5 != null ? str5.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PromotionSection(id=", this.a, ", headlineText=", this.b, ", imageId=");
        ka1.C(sbU, this.c, ", backgroundColor=", this.d, ", buttonText=");
        return km4.C(sbU, this.e, ", buttonActionUrl=", this.f, ")");
    }
}

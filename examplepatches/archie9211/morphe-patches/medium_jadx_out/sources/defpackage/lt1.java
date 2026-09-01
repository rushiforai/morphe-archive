package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lt1 implements x27 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final boolean e;
    public final String f;
    public final vv2 g;
    public final Long h;
    public final SourceParameter i;
    public final String j;

    public lt1(String str, String str2, String str3, String str4, boolean z, String str5, vv2 vv2Var, Long l, SourceParameter sourceParameter) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = z;
        this.f = str5;
        this.g = vv2Var;
        this.h = l;
        this.i = sourceParameter;
        this.j = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lt1)) {
            return false;
        }
        lt1 lt1Var = (lt1) obj;
        return g76.L(this.a, lt1Var.a) && g76.L(this.b, lt1Var.b) && g76.L(this.c, lt1Var.c) && this.d.equals(lt1Var.d) && this.e == lt1Var.e && g76.L(this.f, lt1Var.f) && this.g.equals(lt1Var.g) && g76.L(this.h, lt1Var.h) && this.i.equals(lt1Var.i);
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.j;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iO = (wgd.o((iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.d) + (this.e ? 1231 : 1237)) * 31;
        String str3 = this.f;
        int iHashCode3 = (this.g.hashCode() + ((iO + (str3 == null ? 0 : str3.hashCode())) * 31)) * 31;
        Long l = this.h;
        return this.i.hashCode() + ((iHashCode3 + (l != null ? l.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("CollectionUiModel(collectionId=", this.a, ", imageId=", this.b, ", headerBackgroundImageId=");
        ka1.C(sbU, this.c, ", collectionName=", this.d, ", showPublicationLabel=");
        sbU.append(this.e);
        sbU.append(", collectionBio=");
        sbU.append(this.f);
        sbU.append(", itemAction=");
        sbU.append(this.g);
        sbU.append(", followersCount=");
        sbU.append(this.h);
        sbU.append(", sourceParameter=");
        return y30.r(sbU, this.i, ")");
    }
}

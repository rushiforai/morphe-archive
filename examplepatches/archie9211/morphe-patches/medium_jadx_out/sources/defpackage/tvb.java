package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tvb {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;

    public tvb(String str, String str2, String str3, String str4, String str5) {
        str5.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = str5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tvb)) {
            return false;
        }
        tvb tvbVar = (tvb) obj;
        return this.a.equals(tvbVar.a) && g76.L(this.b, tvbVar.b) && g76.L(this.c, tvbVar.c) && g76.L(this.d, tvbVar.d) && g76.L(this.e, tvbVar.e);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.d;
        return this.e.hashCode() + ((iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("SeeAllFromAuthorAndCollectionUiModel(authorId=", this.a, ", authorName=", this.b, ", collectionId=");
        ka1.C(sbU, this.c, ", collectionName=", this.d, ", source=");
        return ka1.v(sbU, this.e, ")");
    }
}

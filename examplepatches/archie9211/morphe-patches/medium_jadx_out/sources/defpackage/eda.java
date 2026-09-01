package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class eda implements xi8 {
    public final boolean a;
    public final long b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final SourceParameter h;

    public eda(boolean z, long j, String str, String str2, String str3, String str4, String str5, SourceParameter sourceParameter) {
        str.getClass();
        str3.getClass();
        this.a = z;
        this.b = j;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = str4;
        this.g = str5;
        this.h = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof eda)) {
            return false;
        }
        eda edaVar = (eda) obj;
        return this.a == edaVar.a && this.b == edaVar.b && g76.L(this.c, edaVar.c) && this.d.equals(edaVar.d) && g76.L(this.e, edaVar.e) && g76.L(this.f, edaVar.f) && g76.L(this.g, edaVar.g) && this.h.equals(edaVar.h);
    }

    public final int hashCode() {
        int i = this.a ? 1231 : 1237;
        long j = this.b;
        int iO = wgd.o(wgd.o(wgd.o(((i * 31) + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c), 31, this.d), 31, this.e);
        String str = this.f;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.g;
        return this.h.hashCode() + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbE = km4.E("PublicationFeaturedPostNotificationDataItem(isUnread=", this.a, ", timestamp=", this.b);
        ka1.C(sbE, ", postId=", this.c, ", postTitle=", this.d);
        ka1.C(sbE, ", publicationId=", this.e, ", publicationName=", this.f);
        sbE.append(", publicationImageId=");
        sbE.append(this.g);
        sbE.append(", sourceParameter=");
        sbE.append(this.h);
        sbE.append(")");
        return sbE.toString();
    }
}

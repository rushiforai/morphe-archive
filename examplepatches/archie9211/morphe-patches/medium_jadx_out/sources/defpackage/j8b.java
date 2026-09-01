package defpackage;

import com.medium.android.core.share.RepostShareData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j8b {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final boolean e;
    public final boolean f;
    public final Long g;
    public final String h;
    public final dr9 i;
    public final RepostShareData j;
    public final i8b k;

    public j8b(String str, String str2, String str3, String str4, boolean z, boolean z2, Long l, String str5, dr9 dr9Var, RepostShareData repostShareData, i8b i8bVar) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = z;
        this.f = z2;
        this.g = l;
        this.h = str5;
        this.i = dr9Var;
        this.j = repostShareData;
        this.k = i8bVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j8b)) {
            return false;
        }
        j8b j8bVar = (j8b) obj;
        return g76.L(this.a, j8bVar.a) && g76.L(this.b, j8bVar.b) && g76.L(this.c, j8bVar.c) && g76.L(this.d, j8bVar.d) && this.e == j8bVar.e && this.f == j8bVar.f && g76.L(this.g, j8bVar.g) && g76.L(this.h, j8bVar.h) && this.i.equals(j8bVar.i) && g76.L(this.j, j8bVar.j) && this.k.equals(j8bVar.k);
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.d;
        int iHashCode2 = (((((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31;
        Long l = this.g;
        int iHashCode3 = (iHashCode2 + (l == null ? 0 : l.hashCode())) * 31;
        String str3 = this.h;
        int iHashCode4 = (this.i.hashCode() + ((iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31)) * 31;
        RepostShareData repostShareData = this.j;
        return this.k.hashCode() + ((iHashCode4 + (repostShareData != null ? repostShareData.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("RepostItemUiModel(id=", this.a, ", actorUserId=", this.b, ", actorName=");
        ka1.C(sbU, this.c, ", actorImageId=", this.d, ", isCurrentUser=");
        ho2.R(sbU, this.e, ", isActivityBylineClickable=", this.f, ", occurredAt=");
        sbU.append(this.g);
        sbU.append(", note=");
        sbU.append(this.h);
        sbU.append(", postUiModel=");
        sbU.append(this.i);
        sbU.append(", repostShareData=");
        sbU.append(this.j);
        sbU.append(", menuOptions=");
        sbU.append(this.k);
        sbU.append(")");
        return sbU.toString();
    }
}

package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hne implements x27 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final gne e;
    public final zw7 f;
    public final boolean g;
    public final Long h;
    public final SourceParameter i;
    public final String j;

    public hne(String str, String str2, String str3, String str4, gne gneVar, zw7 zw7Var, boolean z, Long l, SourceParameter sourceParameter) {
        str.getClass();
        str3.getClass();
        gneVar.getClass();
        zw7Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = gneVar;
        this.f = zw7Var;
        this.g = z;
        this.h = l;
        this.i = sourceParameter;
        this.j = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hne)) {
            return false;
        }
        hne hneVar = (hne) obj;
        return g76.L(this.a, hneVar.a) && g76.L(this.b, hneVar.b) && g76.L(this.c, hneVar.c) && g76.L(this.d, hneVar.d) && g76.L(this.e, hneVar.e) && this.f == hneVar.f && this.g == hneVar.g && g76.L(this.h, hneVar.h) && this.i.equals(hneVar.i);
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.j;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iO = wgd.o((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.c);
        String str2 = this.d;
        int iHashCode2 = (((this.f.hashCode() + ((this.e.hashCode() + ((iO + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31)) * 31) + (this.g ? 1231 : 1237)) * 31;
        Long l = this.h;
        return this.i.hashCode() + ((iHashCode2 + (l != null ? l.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("UserUiModel(userId=", this.a, ", imageId=", this.b, ", userName=");
        ka1.C(sbU, this.c, ", userBio=", this.d, ", itemAction=");
        sbU.append(this.e);
        sbU.append(", membershipType=");
        sbU.append(this.f);
        sbU.append(", isUserBookAuthor=");
        sbU.append(this.g);
        sbU.append(", followersCount=");
        sbU.append(this.h);
        sbU.append(", sourceParameter=");
        return y30.r(sbU, this.i, ")");
    }
}

package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hae implements boc {
    public final String a;
    public final String b;
    public final String c;
    public final Integer d;
    public final String e;
    public final boolean f;
    public final az5 g;
    public final SourceParameter h;

    public hae(String str, String str2, String str3, Integer num, String str4, boolean z, az5 az5Var, SourceParameter sourceParameter) {
        str.getClass();
        az5Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = num;
        this.e = str4;
        this.f = z;
        this.g = az5Var;
        this.h = sourceParameter;
    }

    @Override // defpackage.boc
    public final SourceParameter a() {
        return this.h;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hae)) {
            return false;
        }
        hae haeVar = (hae) obj;
        return g76.L(this.a, haeVar.a) && this.b.equals(haeVar.b) && g76.L(this.c, haeVar.c) && g76.L(this.d, haeVar.d) && g76.L(this.e, haeVar.e) && this.f == haeVar.f && g76.L(this.g, haeVar.g) && this.h.equals(haeVar.h);
    }

    @Override // defpackage.boc
    public final String getId() {
        return this.a;
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.a;
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        Integer num = this.d;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        String str2 = this.e;
        return this.h.hashCode() + ka1.b(this.g, (((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31) + (this.f ? 1231 : 1237)) * 31, 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("UserCardUiModel(id=", this.a, ", name=", this.b, ", imageId=");
        sbU.append(this.c);
        sbU.append(", followerCount=");
        sbU.append(this.d);
        sbU.append(", bio=");
        ka1.D(sbU, this.e, ", isBookAuthor=", this.f, ", popularPosts=");
        sbU.append(this.g);
        sbU.append(", sourceParameter=");
        sbU.append(this.h);
        sbU.append(")");
        return sbU.toString();
    }
}

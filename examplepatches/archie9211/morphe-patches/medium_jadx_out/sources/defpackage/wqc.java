package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wqc {
    public final String a;
    public final String b;
    public final vqc c;
    public final boolean d;
    public final Long e;
    public final Integer f;
    public final Integer g;
    public final Integer h;
    public final boolean i;
    public final boolean j;
    public final String k;
    public final boolean l;
    public final SourceParameter m;

    public wqc(String str, String str2, vqc vqcVar, boolean z, Long l, Integer num, Integer num2, Integer num3, boolean z2, boolean z3, String str3, boolean z4, SourceParameter sourceParameter) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = vqcVar;
        this.d = z;
        this.e = l;
        this.f = num;
        this.g = num2;
        this.h = num3;
        this.i = z2;
        this.j = z3;
        this.k = str3;
        this.l = z4;
        this.m = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wqc)) {
            return false;
        }
        wqc wqcVar = (wqc) obj;
        return g76.L(this.a, wqcVar.a) && g76.L(this.b, wqcVar.b) && g76.L(this.c, wqcVar.c) && this.d == wqcVar.d && g76.L(this.e, wqcVar.e) && g76.L(this.f, wqcVar.f) && g76.L(this.g, wqcVar.g) && g76.L(this.h, wqcVar.h) && this.i == wqcVar.i && this.j == wqcVar.j && g76.L(this.k, wqcVar.k) && this.l == wqcVar.l && this.m.equals(wqcVar.m);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        vqc vqcVar = this.c;
        int iHashCode3 = (((iHashCode2 + (vqcVar == null ? 0 : vqcVar.hashCode())) * 31) + (this.d ? 1231 : 1237)) * 31;
        Long l = this.e;
        int iHashCode4 = (iHashCode3 + (l == null ? 0 : l.hashCode())) * 31;
        Integer num = this.f;
        int iHashCode5 = (iHashCode4 + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.g;
        int iHashCode6 = (iHashCode5 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.h;
        int iHashCode7 = (((((iHashCode6 + (num3 == null ? 0 : num3.hashCode())) * 31) + (this.i ? 1231 : 1237)) * 31) + (this.j ? 1231 : 1237)) * 31;
        String str2 = this.k;
        return this.m.hashCode() + ((((iHashCode7 + (str2 != null ? str2.hashCode() : 0)) * 31) + (this.l ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("StatsPostUiModel(postId=", this.a, ", postTitle=", this.b, ", authorInfo=");
        sbU.append(this.c);
        sbU.append(", isPostLocked=");
        sbU.append(this.d);
        sbU.append(", publishedAt=");
        sbU.append(this.e);
        sbU.append(", presentationCount=");
        sbU.append(this.f);
        sbU.append(", viewCount=");
        sbU.append(this.g);
        sbU.append(", readCount=");
        sbU.append(this.h);
        sbU.append(", isFeatured=");
        ho2.R(sbU, this.i, ", hasBeenBoosted=", this.j, ", earnings=");
        ka1.D(sbU, this.k, ", isUnlisted=", this.l, ", sourceParameter=");
        return y30.r(sbU, this.m, ")");
    }
}

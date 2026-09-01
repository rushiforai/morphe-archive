package defpackage;

import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y9e implements bae {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final long e;
    public final String f;
    public final String g;
    public final String h;
    public final String i;
    public final int j;
    public final int k;
    public final List l;
    public final SourceParameter m;

    public y9e(String str, String str2, String str3, boolean z, long j, String str4, String str5, String str6, String str7, int i, int i2, List list, SourceParameter sourceParameter) {
        str.getClass();
        str4.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = j;
        this.f = str4;
        this.g = str5;
        this.h = str6;
        this.i = str7;
        this.j = i;
        this.k = i2;
        this.l = list;
        this.m = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y9e)) {
            return false;
        }
        y9e y9eVar = (y9e) obj;
        return g76.L(this.a, y9eVar.a) && g76.L(this.b, y9eVar.b) && g76.L(this.c, y9eVar.c) && this.d == y9eVar.d && this.e == y9eVar.e && g76.L(this.f, y9eVar.f) && this.g.equals(y9eVar.g) && this.h.equals(y9eVar.h) && this.i.equals(y9eVar.i) && this.j == y9eVar.j && this.k == y9eVar.k && this.l.equals(y9eVar.l) && this.m.equals(y9eVar.m);
    }

    @Override // defpackage.bae
    public final String getId() {
        return this.a;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31;
        int i = this.d ? 1231 : 1237;
        long j = this.e;
        return this.m.hashCode() + wgd.p((((wgd.o(wgd.o(wgd.o(wgd.o((((iHashCode3 + i) * 31) + ((int) (j ^ (j >>> 32)))) * 31, 31, this.f), 31, this.g), 31, this.h), 31, this.i) + this.j) * 31) + this.k) * 31, 31, this.l);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("HighlightedPost(id=", this.a, ", actorName=", this.b, ", actorImageId=");
        ka1.D(sbU, this.c, ", isCurrentUser=", this.d, ", occurredAt=");
        sbU.append(this.e);
        sbU.append(", postId=");
        sbU.append(this.f);
        ka1.C(sbU, ", postTitle=", this.g, ", paragraphText=", this.h);
        sbU.append(", paragraphName=");
        sbU.append(this.i);
        sbU.append(", quoteStartOffset=");
        sbU.append(this.j);
        sbU.append(", quoteEndOffset=");
        sbU.append(this.k);
        sbU.append(", markups=");
        sbU.append(this.l);
        sbU.append(", sourceParameter=");
        sbU.append(this.m);
        sbU.append(")");
        return sbU.toString();
    }
}

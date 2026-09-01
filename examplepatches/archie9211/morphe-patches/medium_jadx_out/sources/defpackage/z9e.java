package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z9e implements bae {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final long e;
    public final dr9 f;
    public final String g;
    public final mx h;
    public final SourceParameter i;

    public z9e(String str, String str2, String str3, boolean z, long j, dr9 dr9Var, String str4, mx mxVar, SourceParameter sourceParameter) {
        str.getClass();
        str4.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = j;
        this.f = dr9Var;
        this.g = str4;
        this.h = mxVar;
        this.i = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z9e)) {
            return false;
        }
        z9e z9eVar = (z9e) obj;
        return g76.L(this.a, z9eVar.a) && g76.L(this.b, z9eVar.b) && g76.L(this.c, z9eVar.c) && this.d == z9eVar.d && this.e == z9eVar.e && this.f.equals(z9eVar.f) && g76.L(this.g, z9eVar.g) && this.h.equals(z9eVar.h) && this.i.equals(z9eVar.i);
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
        return this.i.hashCode() + ((this.h.hashCode() + wgd.o((this.f.hashCode() + ((((iHashCode3 + i) * 31) + ((int) (j ^ (j >>> 32)))) * 31)) * 31, 31, this.g)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("ResponseToPost(id=", this.a, ", actorName=", this.b, ", actorImageId=");
        ka1.D(sbU, this.c, ", isCurrentUser=", this.d, ", occurredAt=");
        sbU.append(this.e);
        sbU.append(", postUiModel=");
        sbU.append(this.f);
        sbU.append(", responseId=");
        sbU.append(this.g);
        sbU.append(", responseContent=");
        sbU.append((Object) this.h);
        sbU.append(", sourceParameter=");
        sbU.append(this.i);
        sbU.append(")");
        return sbU.toString();
    }
}

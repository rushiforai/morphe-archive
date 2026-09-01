package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x9e implements bae {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final long e;
    public final dr9 f;

    public x9e(String str, String str2, String str3, boolean z, long j, dr9 dr9Var) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = j;
        this.f = dr9Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x9e)) {
            return false;
        }
        x9e x9eVar = (x9e) obj;
        return g76.L(this.a, x9eVar.a) && g76.L(this.b, x9eVar.b) && g76.L(this.c, x9eVar.c) && this.d == x9eVar.d && this.e == x9eVar.e && this.f.equals(x9eVar.f);
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
        return this.f.hashCode() + ((((iHashCode3 + i) * 31) + ((int) (j ^ (j >>> 32)))) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("ClappedPost(id=", this.a, ", actorName=", this.b, ", actorImageId=");
        ka1.D(sbU, this.c, ", isCurrentUser=", this.d, ", occurredAt=");
        sbU.append(this.e);
        sbU.append(", postUiModel=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}

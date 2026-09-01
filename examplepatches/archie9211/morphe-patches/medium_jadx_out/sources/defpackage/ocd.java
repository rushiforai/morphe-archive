package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ocd implements rcd {
    public final String a;
    public final Integer b;
    public final Integer c;
    public final boolean d;
    public final sbd e;

    public ocd(String str, Integer num, Integer num2, boolean z, sbd sbdVar) {
        this.a = str;
        this.b = num;
        this.c = num2;
        this.d = z;
        this.e = sbdVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ocd)) {
            return false;
        }
        ocd ocdVar = (ocd) obj;
        return this.a.equals(ocdVar.a) && g76.L(this.b, ocdVar.b) && g76.L(this.c, ocdVar.c) && this.d == ocdVar.d && this.e.equals(ocdVar.e);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        Integer num = this.b;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.c;
        return this.e.hashCode() + ((((iHashCode2 + (num2 != null ? num2.hashCode() : 0)) * 31) + (this.d ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "Content(tagName=" + this.a + ", followerCount=" + this.b + ", postCount=" + this.c + ", isFollowingTag=" + this.d + ", tagShareData=" + this.e + ")";
    }
}

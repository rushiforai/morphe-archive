package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class w7d {
    public final String a;
    public final String b;
    public final String c;
    public final Integer d;
    public final Long e;
    public final boolean f;

    public w7d(String str, String str2, String str3, Integer num, Long l, boolean z) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = num;
        this.e = l;
        this.f = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w7d)) {
            return false;
        }
        w7d w7dVar = (w7d) obj;
        return this.a.equals(w7dVar.a) && this.b.equals(w7dVar.b) && this.c.equals(w7dVar.c) && g76.L(this.d, w7dVar.d) && g76.L(this.e, w7dVar.e) && this.f == w7dVar.f;
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c);
        Integer num = this.d;
        int iHashCode = (iO + (num == null ? 0 : num.hashCode())) * 31;
        Long l = this.e;
        return ((iHashCode + (l != null ? l.hashCode() : 0)) * 31) + (this.f ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Tag(id=", this.a, ", slug=", this.b, ", name=");
        sbU.append(this.c);
        sbU.append(", followerCount=");
        sbU.append(this.d);
        sbU.append(", postCount=");
        sbU.append(this.e);
        sbU.append(", isFollowing=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}

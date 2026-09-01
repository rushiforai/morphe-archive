package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g1c {
    public final String a;
    public final String b;
    public final int c;
    public final long d;
    public final jt2 e;
    public final String f;
    public final String g;

    public g1c(String str, String str2, int i, long j, jt2 jt2Var, String str3, String str4) {
        b09.I(str, str2, str4);
        this.a = str;
        this.b = str2;
        this.c = i;
        this.d = j;
        this.e = jt2Var;
        this.f = str3;
        this.g = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g1c)) {
            return false;
        }
        g1c g1cVar = (g1c) obj;
        return g76.L(this.a, g1cVar.a) && g76.L(this.b, g1cVar.b) && this.c == g1cVar.c && this.d == g1cVar.d && this.e.equals(g1cVar.e) && this.f.equals(g1cVar.f) && g76.L(this.g, g1cVar.g);
    }

    public final int hashCode() {
        int iO = (wgd.o(this.a.hashCode() * 31, 31, this.b) + this.c) * 31;
        long j = this.d;
        return this.g.hashCode() + wgd.o((this.e.hashCode() + ((iO + ((int) (j ^ (j >>> 32)))) * 31)) * 31, 31, this.f);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SessionInfo(sessionId=");
        sb.append(this.a);
        sb.append(", firstSessionId=");
        sb.append(this.b);
        sb.append(", sessionIndex=");
        sb.append(this.c);
        sb.append(", eventTimestampUs=");
        sb.append(this.d);
        sb.append(", dataCollectionStatus=");
        sb.append(this.e);
        sb.append(", firebaseInstallationId=");
        sb.append(this.f);
        sb.append(", firebaseAuthenticationToken=");
        return ev6.z(sb, this.g, ')');
    }
}

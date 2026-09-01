package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sla implements ula {
    public final String a;
    public final String b;
    public final az5 c;

    public sla(String str, String str2, az5 az5Var) {
        str.getClass();
        az5Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = az5Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sla)) {
            return false;
        }
        sla slaVar = (sla) obj;
        return g76.L(this.a, slaVar.a) && g76.L(this.b, slaVar.b) && g76.L(this.c, slaVar.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return this.c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PostSectionToLoadState(sectionId=", this.a, ", title=", this.b, ", postIds=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}

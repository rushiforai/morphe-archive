package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rla implements ula {
    public final String a;
    public final String b;
    public final az5 c;

    public rla(String str, String str2, az5 az5Var) {
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
        if (!(obj instanceof rla)) {
            return false;
        }
        rla rlaVar = (rla) obj;
        return g76.L(this.a, rlaVar.a) && g76.L(this.b, rlaVar.b) && g76.L(this.c, rlaVar.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return this.c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PostSectionLoadedState(sectionId=", this.a, ", title=", this.b, ", posts=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}

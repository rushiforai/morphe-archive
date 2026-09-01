package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qla implements ula {
    public final String a;
    public final String b;
    public final az5 c;
    public final b24 d;

    public qla(String str, String str2, az5 az5Var, b24 b24Var) {
        str.getClass();
        az5Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = az5Var;
        this.d = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qla)) {
            return false;
        }
        qla qlaVar = (qla) obj;
        return g76.L(this.a, qlaVar.a) && g76.L(this.b, qlaVar.b) && g76.L(this.c, qlaVar.c) && this.d.equals(qlaVar.d);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return this.d.hashCode() + ka1.b(this.c, (iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PostSectionErrorState(sectionId=", this.a, ", title=", this.b, ", postIds=");
        sbU.append(this.c);
        sbU.append(", errorState=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}

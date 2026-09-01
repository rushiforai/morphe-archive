package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tmc {
    public final boolean a;
    public final String b;
    public final String c;

    public tmc(boolean z, String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a = z;
        this.b = str;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tmc)) {
            return false;
        }
        tmc tmcVar = (tmc) obj;
        return this.a == tmcVar.a && g76.L(this.b, tmcVar.b) && g76.L(this.c, tmcVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o((this.a ? 1231 : 1237) * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Service(isEnabled=");
        sb.append(this.a);
        sb.append(", name=");
        sb.append(this.b);
        sb.append(", value=");
        return ka1.v(sb, this.c, ")");
    }
}

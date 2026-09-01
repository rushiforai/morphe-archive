package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ilc {
    public final String a;
    public final n98 b;
    public final String c;
    public final String d;
    public final String e;

    public ilc(String str, n98 n98Var, String str2, String str3) {
        this.a = str;
        this.b = n98Var;
        this.c = str2;
        this.d = str3;
        this.e = ev6.r('.', str, n98Var + '(' + str2 + ')' + str3);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ilc)) {
            return false;
        }
        ilc ilcVar = (ilc) obj;
        return this.a.equals(ilcVar.a) && this.b.equals(ilcVar.b) && this.c.equals(ilcVar.c) && this.d.equals(ilcVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NameAndSignature(classInternalName=");
        sb.append(this.a);
        sb.append(", name=");
        sb.append(this.b);
        sb.append(", parameters=");
        sb.append(this.c);
        sb.append(", returnType=");
        return ev6.z(sb, this.d, ')');
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l06 {
    public final Object a;
    public final Object b;
    public final Object c;
    public final zz7 d;
    public final String e;

    public l06(Object obj, Object obj2, zz7 zz7Var, zz7 zz7Var2, String str) {
        this.a = obj;
        this.b = obj2;
        this.c = zz7Var;
        this.d = zz7Var2;
        this.e = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l06)) {
            return false;
        }
        l06 l06Var = (l06) obj;
        return this.a.equals(l06Var.a) && g76.L(this.b, l06Var.b) && g76.L(this.c, l06Var.c) && this.d.equals(l06Var.d) && this.e.equals(l06Var.e);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        Object obj = this.b;
        int iHashCode2 = (iHashCode + (obj == null ? 0 : obj.hashCode())) * 31;
        Object obj2 = this.c;
        return this.e.hashCode() + ((this.d.hashCode() + ((iHashCode2 + (obj2 != null ? obj2.hashCode() : 0)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("IncompatibleVersionErrorData(actualVersion=");
        sb.append(this.a);
        sb.append(", compilerVersion=");
        sb.append(this.b);
        sb.append(", languageVersion=");
        sb.append(this.c);
        sb.append(", expectedVersion=");
        sb.append(this.d);
        sb.append(", filePath=");
        return ev6.z(sb, this.e, ')');
    }
}

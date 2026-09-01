package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ml6 extends yl6 {
    public final String a;
    public final String b;

    public ml6(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ml6)) {
            return false;
        }
        ml6 ml6Var = (ml6) obj;
        return g76.L(this.a, ml6Var.a) && g76.L(this.b, ml6Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("EnumValue(");
        sb.append(this.a);
        sb.append('.');
        return ev6.z(sb, this.b, ')');
    }
}

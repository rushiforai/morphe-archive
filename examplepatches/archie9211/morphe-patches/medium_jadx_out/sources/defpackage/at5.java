package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class at5 {
    public final String a;
    public final String b;

    public at5(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof at5)) {
            return false;
        }
        at5 at5Var = (at5) obj;
        return g76.L(this.a, at5Var.a) && g76.L(this.b, at5Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("HttpHeader(name=");
        sb.append(this.a);
        sb.append(", value=");
        return ev6.z(sb, this.b, ')');
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jt9 implements ou9 {
    public final String a;
    public final String b;

    public jt9(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jt9)) {
            return false;
        }
        jt9 jt9Var = (jt9) obj;
        return g76.L(this.a, jt9Var.a) && g76.L(this.b, jt9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("NavigateToUser(userId=", this.a, ", source=", this.b, ")");
    }
}

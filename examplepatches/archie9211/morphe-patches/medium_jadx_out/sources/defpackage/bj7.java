package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bj7 {
    public final String a;
    public final String b;

    public bj7(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bj7)) {
            return false;
        }
        bj7 bj7Var = (bj7) obj;
        return g76.L(this.a, bj7Var.a) && g76.L(this.b, bj7Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("Mastodon(domain=", this.a, ", username=", this.b, ")");
    }
}

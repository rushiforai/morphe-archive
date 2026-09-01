package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class et9 implements ou9 {
    public final String a;
    public final String b;

    public et9(String str, String str2) {
        str.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof et9)) {
            return false;
        }
        et9 et9Var = (et9) obj;
        return g76.L(this.a, et9Var.a) && this.b.equals(et9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("NavigateToShowLessLikeThis(postId=", this.a, ", source=", this.b, ")");
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kf9 implements mf9 {
    public final String a;

    public kf9(String str) {
        str.getClass();
        this.a = str;
    }

    @Override // defpackage.mf9
    public final String b() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof kf9) && g76.L(this.a, ((kf9) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ev6.x("Unreposted(postId=", this.a, ")");
    }
}

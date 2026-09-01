package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lf9 implements mf9 {
    public final String a;

    public lf9(String str) {
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
        return (obj instanceof lf9) && g76.L(this.a, ((lf9) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ev6.x("Updated(postId=", this.a, ")");
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sze implements uze {
    public final String a;
    public final String b;

    public sze(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sze)) {
            return false;
        }
        sze szeVar = (sze) obj;
        return g76.L(this.a, szeVar.a) && g76.L(this.b, szeVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("HighlightResponses(postId=", this.a, ", groupId=", this.b, ")");
    }
}

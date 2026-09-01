package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tze implements uze {
    public final String a;
    public final String b;

    public tze(String str, String str2) {
        str.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tze)) {
            return false;
        }
        tze tzeVar = (tze) obj;
        return g76.L(this.a, tzeVar.a) && g76.L(this.b, tzeVar.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return ev6.y("Post(postId=", this.a, ", highlightId=", this.b, ")");
    }
}

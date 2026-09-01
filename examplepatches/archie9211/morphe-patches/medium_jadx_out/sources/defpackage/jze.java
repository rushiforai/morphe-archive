package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jze implements qze {
    public final String a;
    public final String b;

    public jze(String str, String str2) {
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jze)) {
            return false;
        }
        jze jzeVar = (jze) obj;
        return this.a.equals(jzeVar.a) && this.b.equals(jzeVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("SeeMoreReplies(responseId=", this.a, ", source=", this.b, ")");
    }
}

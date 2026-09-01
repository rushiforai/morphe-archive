package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class r24 implements y24 {
    public final String a;
    public final String b;

    public r24(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r24)) {
            return false;
        }
        r24 r24Var = (r24) obj;
        return g76.L(this.a, r24Var.a) && g76.L(this.b, r24Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("HideResponseSuccess(responseId=", this.a, ", source=", this.b, ")");
    }
}

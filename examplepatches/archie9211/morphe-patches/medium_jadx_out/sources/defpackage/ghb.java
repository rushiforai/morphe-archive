package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ghb implements uhb {
    public final String a;
    public final String b;

    public ghb(String str, String str2) {
        str.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ghb)) {
            return false;
        }
        ghb ghbVar = (ghb) obj;
        return g76.L(this.a, ghbVar.a) && this.b.equals(ghbVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("HideCatalogResponseFailed(responseId=", this.a, ", source=", this.b, ")");
    }
}

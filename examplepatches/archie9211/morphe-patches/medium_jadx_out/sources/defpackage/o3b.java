package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o3b {
    public final String a;
    public final String b;
    public final String c;
    public final l3d d;
    public final String e;

    public o3b(String str, String str2, String str3, l3d l3dVar, String str4) {
        str2.getClass();
        str3.getClass();
        l3dVar.getClass();
        str4.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = l3dVar;
        this.e = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o3b)) {
            return false;
        }
        o3b o3bVar = (o3b) obj;
        return g76.L(this.a, o3bVar.a) && g76.L(this.b, o3bVar.b) && g76.L(this.c, o3bVar.c) && this.d == o3bVar.d && g76.L(this.e, o3bVar.e);
    }

    public final int hashCode() {
        String str = this.a;
        return this.e.hashCode() + ((this.d.hashCode() + wgd.o(wgd.o((str == null ? 0 : str.hashCode()) * 31, 31, this.b), 31, this.c)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("RememberMeAccountHint(imageId=", this.a, ", name=", this.b, ", obfuscatedEmail=");
        sbU.append(this.c);
        sbU.append(", susiMethod=");
        sbU.append(this.d);
        sbU.append(", userId=");
        return ka1.v(sbU, this.e, ")");
    }
}

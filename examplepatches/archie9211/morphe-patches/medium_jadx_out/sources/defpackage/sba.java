package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sba {
    public final String a;
    public final String b;
    public final boolean c;

    public sba(String str, String str2, boolean z) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sba)) {
            return false;
        }
        sba sbaVar = (sba) obj;
        return g76.L(this.a, sbaVar.a) && this.b.equals(sbaVar.b) && this.c == sbaVar.c;
    }

    public final int hashCode() {
        return wgd.o(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(y30.u("PublicationArchiveTag(id=", this.a, ", displayTitle=", this.b, ", isNavigationTag="), this.c, ")");
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w4e {
    public final String a;
    public final String b;
    public final boolean c;

    public w4e(String str, String str2, boolean z) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w4e)) {
            return false;
        }
        w4e w4eVar = (w4e) obj;
        return g76.L(this.a, w4eVar.a) && g76.L(this.b, w4eVar.b) && this.c == w4eVar.c;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return ((iHashCode + (str == null ? 0 : str.hashCode())) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(y30.u("ShowMakeCatalogPrivateConfirmation(title=", this.a, ", description=", this.b, ", isPrivate="), this.c, ")");
    }
}

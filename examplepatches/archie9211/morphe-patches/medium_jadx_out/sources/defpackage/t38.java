package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t38 {
    public final String a;
    public final boolean b;
    public final String c;

    public t38(String str, boolean z, String str2) {
        this.a = str;
        this.b = z;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t38)) {
            return false;
        }
        t38 t38Var = (t38) obj;
        return g76.L(this.a, t38Var.a) && this.b == t38Var.b && g76.L(this.c, t38Var.c);
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (((str == null ? 0 : str.hashCode()) * 31) + (this.b ? 1231 : 1237)) * 31;
        String str2 = this.c;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return ka1.v(ev6.D("MoreFromAuthorAndCollectionUiModel(authorName=", this.a, ", isPostInCollection=", ", collectionName=", this.b), this.c, ")");
    }
}

package defpackage;

import com.google.android.material.internal.It.KLTXZbnQvj;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class p37 {
    public final String a;
    public final int b;
    public final int c;
    public final boolean d;
    public final String e;

    public p37(String str, int i, int i2, boolean z, String str2) {
        str.getClass();
        this.a = str;
        this.b = i;
        this.c = i2;
        this.d = z;
        this.e = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p37)) {
            return false;
        }
        p37 p37Var = (p37) obj;
        return g76.L(this.a, p37Var.a) && this.b == p37Var.b && this.c == p37Var.c && this.d == p37Var.d && g76.L(this.e, p37Var.e);
    }

    public final int hashCode() {
        int iHashCode = ((((((this.a.hashCode() * 31) + this.b) * 31) + this.c) * 31) + (this.d ? 1231 : 1237)) * 31;
        String str = this.e;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sbT = y30.t(this.b, "ListsCatalogDownloadState(id=", this.a, ", downloadedItemCount=", ", totalItemCount=");
        sbT.append(this.c);
        sbT.append(", downloading=");
        sbT.append(this.d);
        sbT.append(KLTXZbnQvj.CNNGoBRh);
        return ka1.v(sbT, this.e, ")");
    }
}

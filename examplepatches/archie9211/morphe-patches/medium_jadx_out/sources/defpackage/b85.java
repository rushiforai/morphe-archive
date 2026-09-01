package defpackage;

import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b85 {
    public final String a;
    public final Uri b;
    public final az5 c;
    public final String d;

    public b85(String str, Uri uri, az5 az5Var, String str2) {
        str.getClass();
        az5Var.getClass();
        this.a = str;
        this.b = uri;
        this.c = az5Var;
        this.d = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b85)) {
            return false;
        }
        b85 b85Var = (b85) obj;
        return g76.L(this.a, b85Var.a) && g76.L(this.b, b85Var.b) && g76.L(this.c, b85Var.c) && g76.L(this.d, b85Var.d);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        Uri uri = this.b;
        int iB = ka1.b(this.c, (iHashCode + (uri == null ? 0 : uri.hashCode())) * 31, 31);
        String str = this.d;
        return iB + (str != null ? str.hashCode() : 0);
    }

    public final String toString() {
        return "GenericMixtapeUiModel(text=" + this.a + ", uri=" + this.b + ", markups=" + this.c + ", thumbnailImageId=" + this.d + ")";
    }
}

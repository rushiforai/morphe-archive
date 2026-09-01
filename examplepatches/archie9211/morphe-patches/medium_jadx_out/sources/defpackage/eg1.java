package defpackage;

import android.net.Uri;
import com.medium.android.core.models.CatalogName;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eg1 {
    public final Uri a;
    public final String b;
    public final CatalogName c;

    public eg1(Uri uri, String str, CatalogName catalogName) {
        uri.getClass();
        str.getClass();
        catalogName.getClass();
        this.a = uri;
        this.b = str;
        this.c = catalogName;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof eg1)) {
            return false;
        }
        eg1 eg1Var = (eg1) obj;
        return g76.L(this.a, eg1Var.a) && g76.L(this.b, eg1Var.b) && g76.L(this.c, eg1Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return "CatalogShareData(shareUri=" + this.a + ", catalogId=" + this.b + ", catalogName=" + this.c + ")";
    }
}

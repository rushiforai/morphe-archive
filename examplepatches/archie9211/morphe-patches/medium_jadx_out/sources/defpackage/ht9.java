package defpackage;

import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ht9 implements ou9 {
    public final Uri a;
    public final String b;

    public ht9(Uri uri, String str) {
        uri.getClass();
        str.getClass();
        this.a = uri;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ht9)) {
            return false;
        }
        ht9 ht9Var = (ht9) obj;
        return g76.L(this.a, ht9Var.a) && g76.L(this.b, ht9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "NavigateToUri(uri=" + this.a + ", source=" + this.b + ")";
    }
}

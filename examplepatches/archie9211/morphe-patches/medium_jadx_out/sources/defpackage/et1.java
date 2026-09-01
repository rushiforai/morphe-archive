package defpackage;

import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class et1 {
    public final Uri a;
    public final String b;
    public final String c;

    public et1(Uri uri, String str, String str2) {
        str.getClass();
        this.a = uri;
        this.b = str;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof et1)) {
            return false;
        }
        et1 et1Var = (et1) obj;
        return this.a.equals(et1Var.a) && g76.L(this.b, et1Var.b) && this.c.equals(et1Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CollectionShareData(shareUri=");
        sb.append(this.a);
        sb.append(", collectionId=");
        sb.append(this.b);
        sb.append(", collectionName=");
        return ka1.v(sb, this.c, ")");
    }
}

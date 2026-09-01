package defpackage;

import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pme {
    public final Uri a;
    public final String b;
    public final String c;

    public pme(Uri uri, String str, String str2) {
        uri.getClass();
        str.getClass();
        str2.getClass();
        this.a = uri;
        this.b = str;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pme)) {
            return false;
        }
        pme pmeVar = (pme) obj;
        return g76.L(this.a, pmeVar.a) && g76.L(this.b, pmeVar.b) && g76.L(this.c, pmeVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("UserShareData(shareUri=");
        sb.append(this.a);
        sb.append(", userId=");
        sb.append(this.b);
        sb.append(", userName=");
        return ka1.v(sb, this.c, ")");
    }
}

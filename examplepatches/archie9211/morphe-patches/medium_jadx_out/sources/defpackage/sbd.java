package defpackage;

import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sbd {
    public final Uri a;
    public final String b;
    public final String c;

    public sbd(Uri uri, String str, String str2) {
        uri.getClass();
        this.a = uri;
        this.b = str;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sbd)) {
            return false;
        }
        sbd sbdVar = (sbd) obj;
        return g76.L(this.a, sbdVar.a) && this.b.equals(sbdVar.b) && this.c.equals(sbdVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("TagShareData(shareUri=");
        sb.append(this.a);
        sb.append(", tagSlug=");
        sb.append(this.b);
        sb.append(", tagName=");
        return ka1.v(sb, this.c, ")");
    }
}

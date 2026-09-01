package defpackage;

import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v09 implements y09 {
    public final String a;
    public final int b;
    public final int c;
    public final Uri d;
    public final Uri e;

    public v09(String str, int i, int i2, Uri uri) {
        str.getClass();
        uri.getClass();
        this.a = str;
        this.b = i;
        this.c = i2;
        this.d = uri;
        this.e = uri;
    }

    @Override // defpackage.y09
    public final Integer a() {
        return Integer.valueOf(this.c);
    }

    @Override // defpackage.y09
    public final Integer b() {
        return Integer.valueOf(this.b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v09)) {
            return false;
        }
        v09 v09Var = (v09) obj;
        return g76.L(this.a, v09Var.a) && this.b == v09Var.b && this.c == v09Var.c && g76.L(this.d, v09Var.d);
    }

    @Override // defpackage.y09
    public final Object getData() {
        return this.e;
    }

    @Override // defpackage.y09
    public final String getParagraphName() {
        return this.a;
    }

    public final int hashCode() {
        return this.d.hashCode() + (((((this.a.hashCode() * 31) + this.b) * 31) + this.c) * 31);
    }

    public final String toString() {
        StringBuilder sbT = y30.t(this.b, "UploadingLocalImage(paragraphName=", this.a, ", width=", ", height=");
        sbT.append(this.c);
        sbT.append(", uri=");
        sbT.append(this.d);
        sbT.append(")");
        return sbT.toString();
    }
}

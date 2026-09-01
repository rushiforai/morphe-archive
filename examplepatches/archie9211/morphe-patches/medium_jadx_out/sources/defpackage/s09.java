package defpackage;

import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s09 implements y09 {
    public final String a;
    public final int b;
    public final int c;
    public final Uri d;
    public final Uri e;

    public s09(String str, int i, int i2, Uri uri) {
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
        if (!(obj instanceof s09)) {
            return false;
        }
        s09 s09Var = (s09) obj;
        return g76.L(this.a, s09Var.a) && this.b == s09Var.b && this.c == s09Var.c && g76.L(this.d, s09Var.d);
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
        StringBuilder sbT = y30.t(this.b, "UploadFailedLocalImage(paragraphName=", this.a, ", width=", ", height=");
        sbT.append(this.c);
        sbT.append(", uri=");
        sbT.append(this.d);
        sbT.append(")");
        return sbT.toString();
    }
}

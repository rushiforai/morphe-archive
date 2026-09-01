package defpackage;

import android.net.Uri;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q {
    public final Uri a;
    public final String b;
    public final String c;
    public final SourceParameter d;

    public q(Uri uri, String str, String str2, SourceParameter sourceParameter) {
        uri.getClass();
        this.a = uri;
        this.b = str;
        this.c = str2;
        this.d = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0021  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L4
            goto L43
        L4:
            boolean r1 = r5 instanceof defpackage.q
            r2 = 0
            if (r1 != 0) goto La
            goto L42
        La:
            q r5 = (defpackage.q) r5
            android.net.Uri r1 = r4.a
            android.net.Uri r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L17
            goto L42
        L17:
            java.lang.String r1 = r5.b
            java.lang.String r3 = r4.b
            if (r3 != 0) goto L23
            if (r1 != 0) goto L21
            r1 = r0
            goto L2a
        L21:
            r1 = r2
            goto L2a
        L23:
            if (r1 != 0) goto L26
            goto L21
        L26:
            boolean r1 = r3.equals(r1)
        L2a:
            if (r1 != 0) goto L2d
            goto L42
        L2d:
            java.lang.String r1 = r4.c
            java.lang.String r3 = r5.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L38
            goto L42
        L38:
            gen.model.SourceParameter r4 = r4.d
            gen.model.SourceParameter r5 = r5.d
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L43
        L42:
            return r2
        L43:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        return this.d.hashCode() + ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.b;
        return "AboutSocialNavigationUiModel(uri=" + this.a + ", image=" + (str == null ? "null" : ax5.a(str)) + ", contentDescription=" + this.c + ", sourceParameter=" + this.d + ")";
    }
}

package defpackage;

import android.net.Uri;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tla implements ula {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final Uri f;
    public final SourceParameter g;

    public tla(String str, String str2, String str3, String str4, String str5, Uri uri, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = str5;
        this.f = uri;
        this.g = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x002c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L4
            return r0
        L4:
            boolean r1 = r5 instanceof defpackage.tla
            r2 = 0
            if (r1 != 0) goto La
            return r2
        La:
            tla r5 = (defpackage.tla) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L17
            return r2
        L17:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L22
            return r2
        L22:
            java.lang.String r1 = r5.c
            java.lang.String r3 = r4.c
            if (r3 != 0) goto L2e
            if (r1 != 0) goto L2c
            r1 = r0
            goto L35
        L2c:
            r1 = r2
            goto L35
        L2e:
            if (r1 != 0) goto L31
            goto L2c
        L31:
            boolean r1 = r3.equals(r1)
        L35:
            if (r1 != 0) goto L38
            return r2
        L38:
            java.lang.String r1 = r4.d
            java.lang.String r3 = r5.d
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L43
            return r2
        L43:
            java.lang.String r1 = r4.e
            java.lang.String r3 = r5.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L4e
            return r2
        L4e:
            android.net.Uri r1 = r4.f
            android.net.Uri r3 = r5.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L59
            return r2
        L59:
            gen.model.SourceParameter r4 = r4.g
            gen.model.SourceParameter r5 = r5.g
            boolean r4 = defpackage.g76.L(r4, r5)
            if (r4 != 0) goto L64
            return r2
        L64:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tla.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.d;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.e;
        int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
        Uri uri = this.f;
        return this.g.hashCode() + ((iHashCode5 + (uri != null ? uri.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("PromotionSectionUiModel(sectionId=", this.a, ", headlineText=", this.b, ", imageId=");
        ka1.C(sbU, strA, ", backgroundColor=", this.d, ", buttonText=");
        sbU.append(this.e);
        sbU.append(", buttonActionUri=");
        sbU.append(this.f);
        sbU.append(", sourceParameter=");
        return y30.r(sbU, this.g, ")");
    }
}

package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rf1 implements xi8 {
    public final boolean a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final SourceParameter g;

    public rf1(boolean z, String str, String str2, String str3, String str4, String str5, SourceParameter sourceParameter) {
        str.getClass();
        str5.getClass();
        this.a = z;
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = str4;
        this.f = str5;
        this.g = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x003f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L5
            goto L61
        L5:
            boolean r1 = r5 instanceof defpackage.rf1
            r2 = 0
            if (r1 != 0) goto Lb
            goto L60
        Lb:
            rf1 r5 = (defpackage.rf1) r5
            boolean r1 = r4.a
            boolean r3 = r5.a
            if (r1 == r3) goto L14
            goto L60
        L14:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L1f
            goto L60
        L1f:
            java.lang.String r1 = r4.c
            java.lang.String r3 = r5.c
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L2a
            goto L60
        L2a:
            java.lang.String r1 = r4.d
            java.lang.String r3 = r5.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L35
            goto L60
        L35:
            java.lang.String r1 = r5.e
            java.lang.String r3 = r4.e
            if (r3 != 0) goto L41
            if (r1 != 0) goto L3f
            r1 = r0
            goto L48
        L3f:
            r1 = r2
            goto L48
        L41:
            if (r1 != 0) goto L44
            goto L3f
        L44:
            boolean r1 = r3.equals(r1)
        L48:
            if (r1 != 0) goto L4b
            goto L60
        L4b:
            java.lang.String r1 = r4.f
            java.lang.String r3 = r5.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L56
            goto L60
        L56:
            gen.model.SourceParameter r4 = r4.g
            gen.model.SourceParameter r5 = r5.g
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L61
        L60:
            return r2
        L61:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rf1.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(wgd.o((this.a ? 1231 : 1237) * 31, 31, this.b), 31, this.c), 31, this.d);
        String str = this.e;
        return this.g.hashCode() + wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.f);
    }

    public final String toString() {
        String str = this.e;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sb = new StringBuilder("CatalogRecommendedRollupItemNotificationDataItem(isUnread=");
        sb.append(this.a);
        sb.append(", actorId=");
        sb.append(this.b);
        sb.append(", actorName=");
        ka1.C(sb, this.c, ", actorBio=", this.d, ", actorImageId=");
        ka1.C(sb, strA, ", catalogId=", this.f, ", sourceParameter=");
        return y30.r(sb, this.g, ")");
    }
}

package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yf1 implements xi8 {
    public final boolean a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final mx g;
    public final SourceParameter h;

    public yf1(boolean z, String str, String str2, String str3, String str4, String str5, mx mxVar, SourceParameter sourceParameter) {
        b09.I(str, str4, str5);
        this.a = z;
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = str4;
        this.f = str5;
        this.g = mxVar;
        this.h = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x002a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L5
            goto L6d
        L5:
            boolean r1 = r5 instanceof defpackage.yf1
            r2 = 0
            if (r1 != 0) goto Lc
            goto L6c
        Lc:
            yf1 r5 = (defpackage.yf1) r5
            boolean r1 = r4.a
            boolean r3 = r5.a
            if (r1 == r3) goto L15
            goto L6c
        L15:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L20
            goto L6c
        L20:
            java.lang.String r1 = r5.c
            java.lang.String r3 = r4.c
            if (r3 != 0) goto L2c
            if (r1 != 0) goto L2a
            r1 = r0
            goto L33
        L2a:
            r1 = r2
            goto L33
        L2c:
            if (r1 != 0) goto L2f
            goto L2a
        L2f:
            boolean r1 = r3.equals(r1)
        L33:
            if (r1 != 0) goto L36
            goto L6c
        L36:
            java.lang.String r1 = r4.d
            java.lang.String r3 = r5.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L41
            goto L6c
        L41:
            java.lang.String r1 = r4.e
            java.lang.String r3 = r5.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L4c
            goto L6c
        L4c:
            java.lang.String r1 = r4.f
            java.lang.String r3 = r5.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L57
            goto L6c
        L57:
            mx r1 = r4.g
            mx r3 = r5.g
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L62
            goto L6c
        L62:
            gen.model.SourceParameter r4 = r4.h
            gen.model.SourceParameter r5 = r5.h
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L6d
        L6c:
            return r2
        L6d:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yf1.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o((this.a ? 1231 : 1237) * 31, 31, this.b);
        String str = this.c;
        int iO2 = wgd.o(wgd.o(wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.d), 31, this.e), 31, this.f);
        mx mxVar = this.g;
        return this.h.hashCode() + ((iO2 + (mxVar != null ? mxVar.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sb = new StringBuilder("CatalogResponseCreatedRollupItemNotificationDataItem(isUnread=");
        sb.append(this.a);
        sb.append(", actorId=");
        sb.append(this.b);
        sb.append(", actorImageId=");
        ka1.C(sb, strA, ", actorName=", this.d, ", catalogId=");
        ka1.C(sb, this.e, ", responseId=", this.f, ", responseContent=");
        sb.append((Object) this.g);
        sb.append(", sourceParameter=");
        sb.append(this.h);
        sb.append(")");
        return sb.toString();
    }
}

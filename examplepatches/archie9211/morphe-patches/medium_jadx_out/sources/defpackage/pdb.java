package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pdb implements xi8 {
    public final boolean a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final mx g;
    public final boolean h;
    public final SourceParameter i;

    public pdb(boolean z, String str, String str2, String str3, String str4, String str5, mx mxVar, boolean z2, SourceParameter sourceParameter) {
        b09.I(str, str4, str5);
        this.a = z;
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = str4;
        this.f = str5;
        this.g = mxVar;
        this.h = z2;
        this.i = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x002b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L5
            goto L75
        L5:
            boolean r1 = r5 instanceof defpackage.pdb
            r2 = 0
            if (r1 != 0) goto Lc
            goto L74
        Lc:
            pdb r5 = (defpackage.pdb) r5
            boolean r1 = r4.a
            boolean r3 = r5.a
            if (r1 == r3) goto L16
            goto L74
        L16:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L21
            goto L74
        L21:
            java.lang.String r1 = r5.c
            java.lang.String r3 = r4.c
            if (r3 != 0) goto L2d
            if (r1 != 0) goto L2b
            r1 = r0
            goto L34
        L2b:
            r1 = r2
            goto L34
        L2d:
            if (r1 != 0) goto L30
            goto L2b
        L30:
            boolean r1 = r3.equals(r1)
        L34:
            if (r1 != 0) goto L37
            goto L74
        L37:
            java.lang.String r1 = r4.d
            java.lang.String r3 = r5.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L42
            goto L74
        L42:
            java.lang.String r1 = r4.e
            java.lang.String r3 = r5.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L4d
            goto L74
        L4d:
            java.lang.String r1 = r4.f
            java.lang.String r3 = r5.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L58
            goto L74
        L58:
            mx r1 = r4.g
            mx r3 = r5.g
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L63
            goto L74
        L63:
            boolean r1 = r4.h
            boolean r3 = r5.h
            if (r1 == r3) goto L6a
            goto L74
        L6a:
            gen.model.SourceParameter r4 = r4.i
            gen.model.SourceParameter r5 = r5.i
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L75
        L74:
            return r2
        L75:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pdb.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o((this.a ? 1231 : 1237) * 31, 31, this.b);
        String str = this.c;
        int iO2 = wgd.o(wgd.o(wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.d), 31, this.e), 31, this.f);
        mx mxVar = this.g;
        return this.i.hashCode() + ((((iO2 + (mxVar != null ? mxVar.hashCode() : 0)) * 31) + (this.h ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sb = new StringBuilder("ResponseCreatedRollupItemNotificationDataItem(isUnread=");
        sb.append(this.a);
        sb.append(", actorId=");
        sb.append(this.b);
        sb.append(", actorImageId=");
        ka1.C(sb, strA, ", actorName=", this.d, ", postId=");
        ka1.C(sb, this.e, ", responseId=", this.f, ", responseContent=");
        sb.append((Object) this.g);
        sb.append(", hasMoreParagraphs=");
        sb.append(this.h);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.i, ")");
    }
}

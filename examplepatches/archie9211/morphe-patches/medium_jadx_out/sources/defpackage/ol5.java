package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ol5 implements xi8 {
    public final boolean a;
    public final long b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final int g;
    public final String h;
    public final SourceParameter i;

    public ol5(boolean z, long j, String str, String str2, String str3, String str4, int i, String str5, SourceParameter sourceParameter) {
        str.getClass();
        str3.getClass();
        this.a = z;
        this.b = j;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = str4;
        this.g = i;
        this.h = str5;
        this.i = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0034  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r8) {
        /*
            r7 = this;
            r0 = 1
            if (r7 != r8) goto L5
            goto L73
        L5:
            boolean r1 = r8 instanceof defpackage.ol5
            r2 = 0
            if (r1 != 0) goto Lc
            goto L72
        Lc:
            ol5 r8 = (defpackage.ol5) r8
            boolean r1 = r7.a
            boolean r3 = r8.a
            if (r1 == r3) goto L16
            goto L72
        L16:
            long r3 = r7.b
            long r5 = r8.b
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 == 0) goto L1f
            goto L72
        L1f:
            java.lang.String r1 = r7.c
            java.lang.String r3 = r8.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L2a
            goto L72
        L2a:
            java.lang.String r1 = r8.d
            java.lang.String r3 = r7.d
            if (r3 != 0) goto L36
            if (r1 != 0) goto L34
            r1 = r0
            goto L3d
        L34:
            r1 = r2
            goto L3d
        L36:
            if (r1 != 0) goto L39
            goto L34
        L39:
            boolean r1 = r3.equals(r1)
        L3d:
            if (r1 != 0) goto L40
            goto L72
        L40:
            java.lang.String r1 = r7.e
            java.lang.String r3 = r8.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L4b
            goto L72
        L4b:
            java.lang.String r1 = r7.f
            java.lang.String r3 = r8.f
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L56
            goto L72
        L56:
            int r1 = r7.g
            int r3 = r8.g
            if (r1 == r3) goto L5d
            goto L72
        L5d:
            java.lang.String r1 = r7.h
            java.lang.String r3 = r8.h
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L68
            goto L72
        L68:
            gen.model.SourceParameter r7 = r7.i
            gen.model.SourceParameter r8 = r8.i
            boolean r7 = r7.equals(r8)
            if (r7 != 0) goto L73
        L72:
            return r2
        L73:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ol5.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int i = this.a ? 1231 : 1237;
        long j = this.b;
        int iO = wgd.o(((i * 31) + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c);
        String str = this.d;
        return this.i.hashCode() + wgd.o((wgd.o(wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.e), 31, this.f) + this.g) * 31, 31, this.h);
    }

    public final String toString() {
        String str = this.d;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbE = km4.E("HighlightWasPiledOntoRollupNotificationDataItem(isUnread=", this.a, ", timestamp=", this.b);
        ka1.C(sbE, ", notificationId=", this.c, ", firstActorImageId=", strA);
        ka1.C(sbE, ", firstActorId=", this.e, ", firstActorName=", this.f);
        sbE.append(", rollupItemsCount=");
        sbE.append(this.g);
        sbE.append(", postTitle=");
        sbE.append(this.h);
        sbE.append(", sourceParameter=");
        sbE.append(this.i);
        sbE.append(")");
        return sbE.toString();
    }
}

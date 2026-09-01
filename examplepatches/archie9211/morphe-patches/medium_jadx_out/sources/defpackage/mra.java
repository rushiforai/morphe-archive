package defpackage;

import gen.model.SourceParameter;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mra implements xi8 {
    public final boolean a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final int h;
    public final int i;
    public final ArrayList j;
    public final SourceParameter k;

    public mra(boolean z, String str, String str2, String str3, String str4, String str5, String str6, int i, int i2, ArrayList arrayList, SourceParameter sourceParameter) {
        str.getClass();
        str4.getClass();
        this.a = z;
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = str4;
        this.f = str5;
        this.g = str6;
        this.h = i;
        this.i = i2;
        this.j = arrayList;
        this.k = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0038  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L5
            goto L89
        L5:
            boolean r1 = r5 instanceof defpackage.mra
            r2 = 0
            if (r1 != 0) goto Lc
            goto L88
        Lc:
            mra r5 = (defpackage.mra) r5
            boolean r1 = r4.a
            boolean r3 = r5.a
            if (r1 == r3) goto L16
            goto L88
        L16:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L22
            goto L88
        L22:
            java.lang.String r1 = r4.c
            java.lang.String r3 = r5.c
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L2e
            goto L88
        L2e:
            java.lang.String r1 = r5.d
            java.lang.String r3 = r4.d
            if (r3 != 0) goto L3a
            if (r1 != 0) goto L38
            r1 = r0
            goto L41
        L38:
            r1 = r2
            goto L41
        L3a:
            if (r1 != 0) goto L3d
            goto L38
        L3d:
            boolean r1 = r3.equals(r1)
        L41:
            if (r1 != 0) goto L44
            goto L88
        L44:
            java.lang.String r1 = r4.e
            java.lang.String r3 = r5.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L4f
            goto L88
        L4f:
            java.lang.String r1 = r4.f
            java.lang.String r3 = r5.f
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L5a
            goto L88
        L5a:
            java.lang.String r1 = r4.g
            java.lang.String r3 = r5.g
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L65
            goto L88
        L65:
            int r1 = r4.h
            int r3 = r5.h
            if (r1 == r3) goto L6c
            goto L88
        L6c:
            int r1 = r4.i
            int r3 = r5.i
            if (r1 == r3) goto L73
            goto L88
        L73:
            java.util.ArrayList r1 = r4.j
            java.util.ArrayList r3 = r5.j
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L7e
            goto L88
        L7e:
            gen.model.SourceParameter r4 = r4.k
            gen.model.SourceParameter r5 = r5.k
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L89
        L88:
            return r2
        L89:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mra.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o((this.a ? 1231 : 1237) * 31, 31, this.b), 31, this.c);
        String str = this.d;
        return this.k.hashCode() + b09.p(this.j, (((wgd.o(wgd.o(wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.e), 31, this.f), 31, this.g) + this.h) * 31) + this.i) * 31, 31);
    }

    public final String toString() {
        String str = this.d;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sb = new StringBuilder("QuoteRollupItemNotificationDataItem(isUnread=");
        sb.append(this.a);
        sb.append(", actorId=");
        sb.append(this.b);
        sb.append(", actorName=");
        ka1.C(sb, this.c, ", actorImageId=", strA, ", postId=");
        ka1.C(sb, this.e, ", postTitle=", this.f, ", paragraphText=");
        sb.append(this.g);
        sb.append(", quoteStartOffset=");
        sb.append(this.h);
        sb.append(", quoteEndOffset=");
        sb.append(this.i);
        sb.append(", markups=");
        sb.append(this.j);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.k, ")");
    }
}

package defpackage;

import gen.model.SourceParameter;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kra implements xi8 {
    public final boolean a;
    public final long b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final String h;
    public final int i;
    public final int j;
    public final ArrayList k;
    public final SourceParameter l;

    public kra(boolean z, long j, String str, String str2, String str3, String str4, String str5, String str6, int i, int i2, ArrayList arrayList, SourceParameter sourceParameter) {
        str.getClass();
        str4.getClass();
        this.a = z;
        this.b = j;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = str4;
        this.g = str5;
        this.h = str6;
        this.i = i;
        this.j = i2;
        this.k = arrayList;
        this.l = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0042  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r8) {
        /*
            r7 = this;
            r0 = 1
            if (r7 != r8) goto L5
            goto L93
        L5:
            boolean r1 = r8 instanceof defpackage.kra
            r2 = 0
            if (r1 != 0) goto Lc
            goto L92
        Lc:
            kra r8 = (defpackage.kra) r8
            boolean r1 = r7.a
            boolean r3 = r8.a
            if (r1 == r3) goto L16
            goto L92
        L16:
            long r3 = r7.b
            long r5 = r8.b
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 == 0) goto L20
            goto L92
        L20:
            java.lang.String r1 = r7.c
            java.lang.String r3 = r8.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L2c
            goto L92
        L2c:
            java.lang.String r1 = r7.d
            java.lang.String r3 = r8.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L38
            goto L92
        L38:
            java.lang.String r1 = r8.e
            java.lang.String r3 = r7.e
            if (r3 != 0) goto L44
            if (r1 != 0) goto L42
            r1 = r0
            goto L4b
        L42:
            r1 = r2
            goto L4b
        L44:
            if (r1 != 0) goto L47
            goto L42
        L47:
            boolean r1 = r3.equals(r1)
        L4b:
            if (r1 != 0) goto L4e
            goto L92
        L4e:
            java.lang.String r1 = r7.f
            java.lang.String r3 = r8.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L59
            goto L92
        L59:
            java.lang.String r1 = r7.g
            java.lang.String r3 = r8.g
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L64
            goto L92
        L64:
            java.lang.String r1 = r7.h
            java.lang.String r3 = r8.h
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L6f
            goto L92
        L6f:
            int r1 = r7.i
            int r3 = r8.i
            if (r1 == r3) goto L76
            goto L92
        L76:
            int r1 = r7.j
            int r3 = r8.j
            if (r1 == r3) goto L7d
            goto L92
        L7d:
            java.util.ArrayList r1 = r7.k
            java.util.ArrayList r3 = r8.k
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L88
            goto L92
        L88:
            gen.model.SourceParameter r7 = r7.l
            gen.model.SourceParameter r8 = r8.l
            boolean r7 = r7.equals(r8)
            if (r7 != 0) goto L93
        L92:
            return r2
        L93:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kra.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int i = this.a ? 1231 : 1237;
        long j = this.b;
        int iO = wgd.o(wgd.o(((i * 31) + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c), 31, this.d);
        String str = this.e;
        return this.l.hashCode() + b09.p(this.k, (((wgd.o(wgd.o(wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.f), 31, this.g), 31, this.h) + this.i) * 31) + this.j) * 31, 31);
    }

    public final String toString() {
        String str = this.e;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbE = km4.E("QuoteNotificationDataItem(isUnread=", this.a, ", timestamp=", this.b);
        ka1.C(sbE, ", actorId=", this.c, ", actorName=", this.d);
        ka1.C(sbE, ", actorImageId=", strA, ", postId=", this.f);
        ka1.C(sbE, ", postTitle=", this.g, ", paragraphText=", this.h);
        sbE.append(", quoteStartOffset=");
        sbE.append(this.i);
        sbE.append(", quoteEndOffset=");
        sbE.append(this.j);
        sbE.append(", markups=");
        sbE.append(this.k);
        sbE.append(", sourceParameter=");
        sbE.append(this.l);
        sbE.append(")");
        return sbE.toString();
    }
}

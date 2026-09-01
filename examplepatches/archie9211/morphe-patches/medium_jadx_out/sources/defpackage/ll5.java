package defpackage;

import gen.model.SourceParameter;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ll5 implements xi8 {
    public final boolean a;
    public final long b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final int h;
    public final int i;
    public final ArrayList j;
    public final SourceParameter k;

    public ll5(boolean z, long j, String str, String str2, String str3, String str4, String str5, int i, int i2, ArrayList arrayList, SourceParameter sourceParameter) {
        str.getClass();
        str4.getClass();
        this.a = z;
        this.b = j;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = str4;
        this.g = str5;
        this.h = i;
        this.i = i2;
        this.j = arrayList;
        this.k = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0041  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r8) {
        /*
            r7 = this;
            r0 = 1
            if (r7 != r8) goto L5
            goto L87
        L5:
            boolean r1 = r8 instanceof defpackage.ll5
            r2 = 0
            if (r1 != 0) goto Lc
            goto L86
        Lc:
            ll5 r8 = (defpackage.ll5) r8
            boolean r1 = r7.a
            boolean r3 = r8.a
            if (r1 == r3) goto L16
            goto L86
        L16:
            long r3 = r7.b
            long r5 = r8.b
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 == 0) goto L20
            goto L86
        L20:
            java.lang.String r1 = r7.c
            java.lang.String r3 = r8.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L2c
            goto L86
        L2c:
            java.lang.String r1 = r7.d
            java.lang.String r3 = r8.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L37
            goto L86
        L37:
            java.lang.String r1 = r8.e
            java.lang.String r3 = r7.e
            if (r3 != 0) goto L43
            if (r1 != 0) goto L41
            r1 = r0
            goto L4a
        L41:
            r1 = r2
            goto L4a
        L43:
            if (r1 != 0) goto L46
            goto L41
        L46:
            boolean r1 = r3.equals(r1)
        L4a:
            if (r1 != 0) goto L4d
            goto L86
        L4d:
            java.lang.String r1 = r7.f
            java.lang.String r3 = r8.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L58
            goto L86
        L58:
            java.lang.String r1 = r7.g
            java.lang.String r3 = r8.g
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L63
            goto L86
        L63:
            int r1 = r7.h
            int r3 = r8.h
            if (r1 == r3) goto L6a
            goto L86
        L6a:
            int r1 = r7.i
            int r3 = r8.i
            if (r1 == r3) goto L71
            goto L86
        L71:
            java.util.ArrayList r1 = r7.j
            java.util.ArrayList r3 = r8.j
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L7c
            goto L86
        L7c:
            gen.model.SourceParameter r7 = r7.k
            gen.model.SourceParameter r8 = r8.k
            boolean r7 = r7.equals(r8)
            if (r7 != 0) goto L87
        L86:
            return r2
        L87:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ll5.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int i = this.a ? 1231 : 1237;
        long j = this.b;
        int iO = wgd.o(wgd.o(((i * 31) + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c), 31, this.d);
        String str = this.e;
        return this.k.hashCode() + b09.p(this.j, (((wgd.o(wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.f), 31, this.g) + this.h) * 31) + this.i) * 31, 31);
    }

    public final String toString() {
        String str = this.e;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbE = km4.E("HighlightWasPiledOntoNotificationDataItem(isUnread=", this.a, ", timestamp=", this.b);
        ka1.C(sbE, ", actorId=", this.c, ", actorName=", this.d);
        ka1.C(sbE, ", actorImageId=", strA, ", postId=", this.f);
        sbE.append(", paragraphText=");
        sbE.append(this.g);
        sbE.append(", quoteStartOffset=");
        sbE.append(this.h);
        sbE.append(", quoteEndOffset=");
        sbE.append(this.i);
        sbE.append(", markups=");
        sbE.append(this.j);
        sbE.append(", sourceParameter=");
        sbE.append(this.k);
        sbE.append(")");
        return sbE.toString();
    }
}

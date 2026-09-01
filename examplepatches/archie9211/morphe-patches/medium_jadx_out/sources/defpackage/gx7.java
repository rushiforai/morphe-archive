package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gx7 implements xi8 {
    public final boolean a;
    public final long b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final SourceParameter h;

    public gx7(boolean z, long j, String str, String str2, String str3, String str4, String str5, SourceParameter sourceParameter) {
        str.getClass();
        str4.getClass();
        this.a = z;
        this.b = j;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = str4;
        this.g = str5;
        this.h = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x003e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r8) {
        /*
            r7 = this;
            r0 = 1
            if (r7 != r8) goto L5
            goto L6b
        L5:
            boolean r1 = r8 instanceof defpackage.gx7
            r2 = 0
            if (r1 != 0) goto Lc
            goto L6a
        Lc:
            gx7 r8 = (defpackage.gx7) r8
            boolean r1 = r7.a
            boolean r3 = r8.a
            if (r1 == r3) goto L15
            goto L6a
        L15:
            long r3 = r7.b
            long r5 = r8.b
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 == 0) goto L1e
            goto L6a
        L1e:
            java.lang.String r1 = r7.c
            java.lang.String r3 = r8.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L29
            goto L6a
        L29:
            java.lang.String r1 = r7.d
            java.lang.String r3 = r8.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L34
            goto L6a
        L34:
            java.lang.String r1 = r8.e
            java.lang.String r3 = r7.e
            if (r3 != 0) goto L40
            if (r1 != 0) goto L3e
            r1 = r0
            goto L47
        L3e:
            r1 = r2
            goto L47
        L40:
            if (r1 != 0) goto L43
            goto L3e
        L43:
            boolean r1 = r3.equals(r1)
        L47:
            if (r1 != 0) goto L4a
            goto L6a
        L4a:
            java.lang.String r1 = r7.f
            java.lang.String r3 = r8.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L55
            goto L6a
        L55:
            java.lang.String r1 = r7.g
            java.lang.String r3 = r8.g
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L60
            goto L6a
        L60:
            gen.model.SourceParameter r7 = r7.h
            gen.model.SourceParameter r8 = r8.h
            boolean r7 = r7.equals(r8)
            if (r7 != 0) goto L6b
        L6a:
            return r2
        L6b:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gx7.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int i = this.a ? 1231 : 1237;
        long j = this.b;
        int iO = wgd.o(wgd.o(((i * 31) + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c), 31, this.d);
        String str = this.e;
        return this.h.hashCode() + wgd.o(wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.f), 31, this.g);
    }

    public final String toString() {
        String str = this.e;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbE = km4.E("MentionInPostNotificationDataItem(isUnread=", this.a, ", timestamp=", this.b);
        ka1.C(sbE, ", actorId=", this.c, ", actorName=", this.d);
        ka1.C(sbE, ", actorImageId=", strA, ", postId=", this.f);
        sbE.append(", postTitle=");
        sbE.append(this.g);
        sbE.append(", sourceParameter=");
        sbE.append(this.h);
        sbE.append(")");
        return sbE.toString();
    }
}

package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ms1 implements xi8 {
    public final boolean a;
    public final long b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final String h;
    public final String i;
    public final String j;
    public final boolean k;
    public final SourceParameter l;

    public ms1(boolean z, long j, String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, boolean z2, SourceParameter sourceParameter) {
        b09.I(str, str3, str6);
        this.a = z;
        this.b = j;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = str4;
        this.g = str5;
        this.h = str6;
        this.i = str7;
        this.j = str8;
        this.k = z2;
        this.l = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0088  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r8) {
        /*
            r7 = this;
            r0 = 1
            if (r7 != r8) goto L5
            goto La4
        L5:
            boolean r1 = r8 instanceof defpackage.ms1
            r2 = 0
            if (r1 != 0) goto Lc
            goto La3
        Lc:
            ms1 r8 = (defpackage.ms1) r8
            boolean r1 = r7.a
            boolean r3 = r8.a
            if (r1 == r3) goto L16
            goto La3
        L16:
            long r3 = r7.b
            long r5 = r8.b
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 == 0) goto L20
            goto La3
        L20:
            java.lang.String r1 = r7.c
            java.lang.String r3 = r8.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L2c
            goto La3
        L2c:
            java.lang.String r1 = r7.d
            java.lang.String r3 = r8.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L38
            goto La3
        L38:
            java.lang.String r1 = r7.e
            java.lang.String r3 = r8.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L44
            goto La3
        L44:
            java.lang.String r1 = r7.f
            java.lang.String r3 = r8.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L50
            goto La3
        L50:
            java.lang.String r1 = r8.g
            java.lang.String r3 = r7.g
            if (r3 != 0) goto L5c
            if (r1 != 0) goto L5a
            r1 = r0
            goto L63
        L5a:
            r1 = r2
            goto L63
        L5c:
            if (r1 != 0) goto L5f
            goto L5a
        L5f:
            boolean r1 = r3.equals(r1)
        L63:
            if (r1 != 0) goto L66
            goto La3
        L66:
            java.lang.String r1 = r7.h
            java.lang.String r3 = r8.h
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L71
            goto La3
        L71:
            java.lang.String r1 = r7.i
            java.lang.String r3 = r8.i
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L7c
            goto La3
        L7c:
            java.lang.String r1 = r8.j
            java.lang.String r3 = r7.j
            if (r3 != 0) goto L88
            if (r1 != 0) goto L86
            r1 = r0
            goto L8f
        L86:
            r1 = r2
            goto L8f
        L88:
            if (r1 != 0) goto L8b
            goto L86
        L8b:
            boolean r1 = r3.equals(r1)
        L8f:
            if (r1 != 0) goto L92
            goto La3
        L92:
            boolean r1 = r7.k
            boolean r3 = r8.k
            if (r1 == r3) goto L99
            goto La3
        L99:
            gen.model.SourceParameter r7 = r7.l
            gen.model.SourceParameter r8 = r8.l
            boolean r7 = r7.equals(r8)
            if (r7 != 0) goto La4
        La3:
            return r2
        La4:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ms1.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int i = this.a ? 1231 : 1237;
        long j = this.b;
        int iO = wgd.o(wgd.o(wgd.o(((i * 31) + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c), 31, this.d), 31, this.e);
        String str = this.f;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.g;
        int iO2 = wgd.o((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.h);
        String str3 = this.i;
        int iHashCode2 = (iO2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.j;
        return this.l.hashCode() + ((((iHashCode2 + (str4 != null ? str4.hashCode() : 0)) * 31) + (this.k ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        String str = this.g;
        String strA = str == null ? "null" : ax5.a(str);
        String str2 = this.j;
        String strA2 = str2 != null ? ax5.a(str2) : "null";
        StringBuilder sbE = km4.E("CollectionPostPublishedNotificationDataItem(isUnread=", this.a, ", timestamp=", this.b);
        ka1.C(sbE, ", postId=", this.c, ", postTitle=", this.d);
        ka1.C(sbE, ", authorId=", this.e, ", authorName=", this.f);
        ka1.C(sbE, ", authorImageId=", strA, ", publicationId=", this.h);
        ka1.C(sbE, ", publicationName=", this.i, ", publicationImageId=", strA2);
        sbE.append(", isCurrentUserEditorOfPublication=");
        sbE.append(this.k);
        sbE.append(", sourceParameter=");
        sbE.append(this.l);
        sbE.append(")");
        return sbE.toString();
    }
}

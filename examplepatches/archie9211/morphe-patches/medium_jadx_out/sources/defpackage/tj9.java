package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tj9 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final sw5 f;

    public tj9(String str, String str2, String str3, String str4, String str5, sw5 sw5Var) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = str5;
        this.f = sw5Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0016  */
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
            boolean r1 = r5 instanceof defpackage.tj9
            r2 = 0
            if (r1 != 0) goto La
            return r2
        La:
            tj9 r5 = (defpackage.tj9) r5
            java.lang.String r1 = r5.a
            java.lang.String r3 = r4.a
            if (r3 != 0) goto L18
            if (r1 != 0) goto L16
            r1 = r0
            goto L1f
        L16:
            r1 = r2
            goto L1f
        L18:
            if (r1 != 0) goto L1b
            goto L16
        L1b:
            boolean r1 = r3.equals(r1)
        L1f:
            if (r1 != 0) goto L22
            return r2
        L22:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L2d
            return r2
        L2d:
            java.lang.String r1 = r4.c
            java.lang.String r3 = r5.c
            boolean r1 = defpackage.g76.L(r1, r3)
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
            sw5 r4 = r4.f
            sw5 r5 = r5.f
            boolean r4 = defpackage.g76.L(r4, r5)
            if (r4 != 0) goto L59
            return r2
        L59:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tj9.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.d;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.e;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        sw5 sw5Var = this.f;
        return iHashCode5 + (sw5Var != null ? sw5Var.hashCode() : 0);
    }

    public final String toString() {
        String str = this.a;
        StringBuilder sbU = y30.u("PostPreviewData(authorImage=", str == null ? "null" : ax5.a(str), ", authorName=", this.b, ", publicationName=");
        ka1.C(sbU, this.c, ", postTitle=", this.d, ", postDescription=");
        sbU.append(this.e);
        sbU.append(", postPreviewImage=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}

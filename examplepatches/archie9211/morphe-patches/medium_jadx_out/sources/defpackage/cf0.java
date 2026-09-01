package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cf0 {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;

    public cf0(String str, String str2, String str3, boolean z) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x002c  */
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
            boolean r1 = r5 instanceof defpackage.cf0
            r2 = 0
            if (r1 != 0) goto La
            return r2
        La:
            cf0 r5 = (defpackage.cf0) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L17
            return r2
        L17:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L22
            return r2
        L22:
            java.lang.String r1 = r5.c
            java.lang.String r3 = r4.c
            if (r3 != 0) goto L2e
            if (r1 != 0) goto L2c
            r1 = r0
            goto L35
        L2c:
            r1 = r2
            goto L35
        L2e:
            if (r1 != 0) goto L31
            goto L2c
        L31:
            boolean r1 = r3.equals(r1)
        L35:
            if (r1 != 0) goto L38
            return r2
        L38:
            boolean r4 = r4.d
            boolean r5 = r5.d
            if (r4 == r5) goto L3f
            return r2
        L3f:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cf0.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        return ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("Collection(id=", this.a, ", name=", this.b, ", imageId=");
        sbU.append(strA);
        sbU.append(", sentAsNewsletter=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}

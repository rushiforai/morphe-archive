package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pq9 {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final String g;

    public /* synthetic */ pq9(String str, String str2, String str3, boolean z, int i) {
        this(str, str2, str3, z, true, (i & 32) != 0, null);
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
            boolean r1 = r5 instanceof defpackage.pq9
            r2 = 0
            if (r1 != 0) goto La
            return r2
        La:
            pq9 r5 = (defpackage.pq9) r5
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
            boolean r1 = r4.d
            boolean r3 = r5.d
            if (r1 == r3) goto L3f
            return r2
        L3f:
            boolean r1 = r4.e
            boolean r3 = r5.e
            if (r1 == r3) goto L46
            return r2
        L46:
            boolean r1 = r4.f
            boolean r3 = r5.f
            if (r1 == r3) goto L4d
            return r2
        L4d:
            java.lang.String r4 = r4.g
            java.lang.String r5 = r5.g
            boolean r4 = defpackage.g76.L(r4, r5)
            if (r4 != 0) goto L58
            return r2
        L58:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pq9.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.c;
        int iHashCode3 = (((((((iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31;
        String str4 = this.g;
        return iHashCode3 + (str4 != null ? str4.hashCode() : 0);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("Author(id=", this.a, ", name=", this.b, ", imageId=");
        ka1.D(sbU, strA, ", isBookAuthor=", this.d, ", showAuthor=");
        ho2.R(sbU, this.e, ", isSelectable=", this.f, ", newsletterId=");
        return ka1.v(sbU, this.g, ")");
    }

    public pq9(String str, String str2, String str3, boolean z, boolean z2, boolean z3, String str4) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = z2;
        this.f = z3;
        this.g = str4;
    }
}

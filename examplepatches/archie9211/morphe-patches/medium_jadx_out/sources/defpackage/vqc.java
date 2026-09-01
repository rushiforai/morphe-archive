package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vqc {
    public final String a;
    public final String b;
    public final String c;

    public vqc(String str, String str2, String str3) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
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
            goto L38
        L4:
            boolean r1 = r5 instanceof defpackage.vqc
            r2 = 0
            if (r1 != 0) goto La
            goto L37
        La:
            vqc r5 = (defpackage.vqc) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L17
            goto L37
        L17:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L22
            goto L37
        L22:
            java.lang.String r5 = r5.c
            java.lang.String r4 = r4.c
            if (r4 != 0) goto L2e
            if (r5 != 0) goto L2c
            r4 = r0
            goto L35
        L2c:
            r4 = r2
            goto L35
        L2e:
            if (r5 != 0) goto L31
            goto L2c
        L31:
            boolean r4 = r4.equals(r5)
        L35:
            if (r4 != 0) goto L38
        L37:
            return r2
        L38:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vqc.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        String str = this.c;
        return ka1.v(y30.u("AuthorInfo(authorId=", this.a, ", name=", this.b, ", imageId="), str == null ? "null" : ax5.a(str), ")");
    }
}

package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ixc {
    public final String a;
    public final String b;
    public final long c;
    public final String d;

    public ixc(long j, String str, String str2, String str3) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = j;
        this.d = str3;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0035  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r8) {
        /*
            r7 = this;
            r0 = 1
            if (r7 != r8) goto L4
            goto L41
        L4:
            boolean r1 = r8 instanceof defpackage.ixc
            r2 = 0
            if (r1 != 0) goto La
            goto L40
        La:
            ixc r8 = (defpackage.ixc) r8
            java.lang.String r1 = r7.a
            java.lang.String r3 = r8.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L17
            goto L40
        L17:
            java.lang.String r1 = r7.b
            java.lang.String r3 = r8.b
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L22
            goto L40
        L22:
            long r3 = r7.c
            long r5 = r8.c
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 == 0) goto L2b
            goto L40
        L2b:
            java.lang.String r8 = r8.d
            java.lang.String r7 = r7.d
            if (r7 != 0) goto L37
            if (r8 != 0) goto L35
            r7 = r0
            goto L3e
        L35:
            r7 = r2
            goto L3e
        L37:
            if (r8 != 0) goto L3a
            goto L35
        L3a:
            boolean r7 = r7.equals(r8)
        L3e:
            if (r7 != 0) goto L41
        L40:
            return r2
        L41:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ixc.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        long j = this.c;
        int i = (iO + ((int) (j ^ (j >>> 32)))) * 31;
        String str = this.d;
        return i + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        String str = this.d;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("Subscriber(id=", this.a, ", name=", this.b, ", subscribedAt=");
        sbU.append(this.c);
        sbU.append(", imageId=");
        sbU.append(strA);
        sbU.append(")");
        return sbU.toString();
    }
}

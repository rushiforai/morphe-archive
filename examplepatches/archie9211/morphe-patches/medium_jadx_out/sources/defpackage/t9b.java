package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class t9b {
    public final String a;
    public final String b;
    public final dr9 c;

    public t9b(String str, String str2, dr9 dr9Var) {
        this.a = str;
        this.b = str2;
        this.c = dr9Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0021  */
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
            boolean r1 = r5 instanceof defpackage.t9b
            r2 = 0
            if (r1 != 0) goto La
            goto L37
        La:
            t9b r5 = (defpackage.t9b) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L17
            goto L37
        L17:
            java.lang.String r1 = r5.b
            java.lang.String r3 = r4.b
            if (r3 != 0) goto L23
            if (r1 != 0) goto L21
            r1 = r0
            goto L2a
        L21:
            r1 = r2
            goto L2a
        L23:
            if (r1 != 0) goto L26
            goto L21
        L26:
            boolean r1 = r3.equals(r1)
        L2a:
            if (r1 != 0) goto L2d
            goto L37
        L2d:
            dr9 r4 = r4.c
            dr9 r5 = r5.c
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L38
        L37:
            return r2
        L38:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t9b.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.b;
        return this.c.hashCode() + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.b;
        StringBuilder sbU = y30.u("LoadedData(currentUserName=", this.a, ", currentUserImageId=", str == null ? "null" : ax5.a(str), ", postUiModel=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}

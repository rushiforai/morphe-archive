package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fc1 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final zw7 e;
    public final boolean f;
    public final bo4 g;

    public fc1(String str, String str2, String str3, String str4, zw7 zw7Var, boolean z, bo4 bo4Var) {
        str.getClass();
        zw7Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = zw7Var;
        this.f = z;
        this.g = bo4Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0037  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L4
            goto L5c
        L4:
            boolean r1 = r5 instanceof defpackage.fc1
            r2 = 0
            if (r1 != 0) goto La
            goto L5b
        La:
            fc1 r5 = (defpackage.fc1) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L17
            goto L5b
        L17:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L22
            goto L5b
        L22:
            java.lang.String r1 = r4.c
            java.lang.String r3 = r5.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L2d
            goto L5b
        L2d:
            java.lang.String r1 = r5.d
            java.lang.String r3 = r4.d
            if (r3 != 0) goto L39
            if (r1 != 0) goto L37
            r1 = r0
            goto L40
        L37:
            r1 = r2
            goto L40
        L39:
            if (r1 != 0) goto L3c
            goto L37
        L3c:
            boolean r1 = r3.equals(r1)
        L40:
            if (r1 != 0) goto L43
            goto L5b
        L43:
            zw7 r1 = r4.e
            zw7 r3 = r5.e
            if (r1 == r3) goto L4a
            goto L5b
        L4a:
            boolean r1 = r4.f
            boolean r3 = r5.f
            if (r1 == r3) goto L51
            goto L5b
        L51:
            bo4 r4 = r4.g
            bo4 r5 = r5.g
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L5c
        L5b:
            return r2
        L5c:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fc1.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.d;
        return this.g.hashCode() + ((((this.e.hashCode() + ((iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 31)) * 31) + (this.f ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        String str = this.d;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("Creator(id=", this.a, ", name=", this.b, ", bio=");
        ka1.C(sbU, this.c, ", imageId=", strA, ", membershipType=");
        sbU.append(this.e);
        sbU.append(", isCurrentUser=");
        sbU.append(this.f);
        sbU.append(", followSubscribeUiModelStream=");
        sbU.append(this.g);
        sbU.append(")");
        return sbU.toString();
    }
}

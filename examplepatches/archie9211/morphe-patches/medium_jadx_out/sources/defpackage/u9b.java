package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u9b implements x9b {
    public final String a;
    public final String b;
    public final dr9 c;
    public final uid d;
    public final boolean e;
    public final boolean f;
    public final int g;
    public final boolean h;

    public u9b(String str, String str2, dr9 dr9Var, uid uidVar, boolean z, boolean z2) {
        uidVar.getClass();
        this.a = str;
        this.b = str2;
        this.c = dr9Var;
        this.d = uidVar;
        this.e = z;
        this.f = z2;
        this.g = uidVar.a.b.length();
        this.h = !z;
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
            goto L51
        L4:
            boolean r1 = r5 instanceof defpackage.u9b
            r2 = 0
            if (r1 != 0) goto La
            goto L50
        La:
            u9b r5 = (defpackage.u9b) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L17
            goto L50
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
            goto L50
        L2d:
            dr9 r1 = r4.c
            dr9 r3 = r5.c
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L38
            goto L50
        L38:
            uid r1 = r4.d
            uid r3 = r5.d
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L43
            goto L50
        L43:
            boolean r1 = r4.e
            boolean r3 = r5.e
            if (r1 == r3) goto L4a
            goto L50
        L4a:
            boolean r4 = r4.f
            boolean r5 = r5.f
            if (r4 == r5) goto L51
        L50:
            return r2
        L51:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.u9b.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.b;
        return ((((this.d.hashCode() + ((this.c.hashCode() + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31)) * 31)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237);
    }

    public final String toString() {
        String str = this.b;
        StringBuilder sbU = y30.u("Content(currentUserName=", this.a, ", currentUserImageId=", str == null ? "null" : ax5.a(str), ", postUiModel=");
        sbU.append(this.c);
        sbU.append(", note=");
        sbU.append(this.d);
        sbU.append(", isReposting=");
        return b09.C(sbU, this.e, ", isEditMode=", this.f, ")");
    }
}

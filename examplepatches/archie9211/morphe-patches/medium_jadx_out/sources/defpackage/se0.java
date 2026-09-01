package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class se0 {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final Long e;
    public final Long f;
    public final String g;
    public final bo4 h;
    public final boolean i;

    public se0(String str, String str2, String str3, boolean z, Long l, Long l2, String str4, bo4 bo4Var, boolean z2) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = l;
        this.f = l2;
        this.g = str4;
        this.h = bo4Var;
        this.i = z2;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x002f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L5
            goto L75
        L5:
            boolean r1 = r5 instanceof defpackage.se0
            r2 = 0
            if (r1 != 0) goto Lc
            goto L74
        Lc:
            se0 r5 = (defpackage.se0) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L1a
            goto L74
        L1a:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L25
            goto L74
        L25:
            java.lang.String r1 = r5.c
            java.lang.String r3 = r4.c
            if (r3 != 0) goto L31
            if (r1 != 0) goto L2f
            r1 = r0
            goto L38
        L2f:
            r1 = r2
            goto L38
        L31:
            if (r1 != 0) goto L34
            goto L2f
        L34:
            boolean r1 = r3.equals(r1)
        L38:
            if (r1 != 0) goto L3b
            goto L74
        L3b:
            boolean r1 = r4.d
            boolean r3 = r5.d
            if (r1 == r3) goto L42
            goto L74
        L42:
            java.lang.Long r1 = r4.e
            java.lang.Long r3 = r5.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L4d
            goto L74
        L4d:
            java.lang.Long r1 = r4.f
            java.lang.Long r3 = r5.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L58
            goto L74
        L58:
            java.lang.String r1 = r4.g
            java.lang.String r3 = r5.g
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L63
            goto L74
        L63:
            bo4 r1 = r4.h
            bo4 r3 = r5.h
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L6e
            goto L74
        L6e:
            boolean r4 = r4.i
            boolean r5 = r5.i
            if (r4 == r5) goto L75
        L74:
            return r2
        L75:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.se0.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (((iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31) + (this.d ? 1231 : 1237)) * 31;
        Long l = this.e;
        int iHashCode4 = (iHashCode3 + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.f;
        int iHashCode5 = (iHashCode4 + (l2 == null ? 0 : l2.hashCode())) * 31;
        String str3 = this.g;
        return ka1.a(this.h, (iHashCode5 + (str3 != null ? str3.hashCode() : 0)) * 31, 31) + (this.i ? 1231 : 1237);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("Author(id=", this.a, ", name=", this.b, ", imageId=");
        ka1.D(sbU, strA, ", isBookAuthor=", this.d, ", numberOfFollowers=");
        sbU.append(this.e);
        sbU.append(", numberOfFollowing=");
        sbU.append(this.f);
        sbU.append(", bio=");
        sbU.append(this.g);
        sbU.append(", isFollowingAuthorStream=");
        sbU.append(this.h);
        sbU.append(", isCurrentUser=");
        return lv8.t(sbU, this.i, ")");
    }
}

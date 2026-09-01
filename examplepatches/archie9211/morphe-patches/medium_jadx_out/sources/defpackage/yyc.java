package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yyc implements ezc {
    public final String a;
    public final zw7 b;
    public final boolean c;
    public final boolean d;
    public final bzc e;

    public yyc(String str, zw7 zw7Var, boolean z, boolean z2, bzc bzcVar) {
        zw7Var.getClass();
        this.a = str;
        this.b = zw7Var;
        this.c = z;
        this.d = z2;
        this.e = bzcVar;
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
            goto L42
        L4:
            boolean r1 = r5 instanceof defpackage.yyc
            r2 = 0
            if (r1 != 0) goto La
            goto L41
        La:
            yyc r5 = (defpackage.yyc) r5
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
            goto L41
        L22:
            zw7 r1 = r4.b
            zw7 r3 = r5.b
            if (r1 == r3) goto L29
            goto L41
        L29:
            boolean r1 = r4.c
            boolean r3 = r5.c
            if (r1 == r3) goto L30
            goto L41
        L30:
            boolean r1 = r4.d
            boolean r3 = r5.d
            if (r1 == r3) goto L37
            goto L41
        L37:
            bzc r4 = r4.e
            bzc r5 = r5.e
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L42
        L41:
            return r2
        L42:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yyc.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        String str = this.a;
        return this.e.hashCode() + ((((((this.b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        String str = this.a;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sb = new StringBuilder("Content(currentUserImageId=");
        sb.append(strA);
        sb.append(", currentUserMembershipType=");
        sb.append(this.b);
        sb.append(", shouldShowFreeTrialCopy=");
        ho2.R(sb, this.c, ", isFromOnboarding=", this.d, ", ctaType=");
        sb.append(this.e);
        sb.append(")");
        return sb.toString();
    }
}

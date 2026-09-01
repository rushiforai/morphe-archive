package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qfb {
    public final String a;
    public final String b;
    public final String c;
    public final zw7 d;
    public final boolean e;
    public final boolean f;
    public final boolean g;
    public final ns0 h;
    public final List i;

    public qfb(String str, String str2, String str3, zw7 zw7Var, boolean z, boolean z2, boolean z3, ns0 ns0Var, List list) {
        str.getClass();
        str2.getClass();
        zw7Var.getClass();
        ns0Var.getClass();
        list.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = zw7Var;
        this.e = z;
        this.f = z2;
        this.g = z3;
        this.h = ns0Var;
        this.i = list;
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
            boolean r1 = r5 instanceof defpackage.qfb
            r2 = 0
            if (r1 != 0) goto La
            return r2
        La:
            qfb r5 = (defpackage.qfb) r5
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
            zw7 r1 = r4.d
            zw7 r3 = r5.d
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
            boolean r1 = r4.g
            boolean r3 = r5.g
            if (r1 == r3) goto L54
            return r2
        L54:
            ns0 r1 = r4.h
            ns0 r3 = r5.h
            if (r1 == r3) goto L5b
            return r2
        L5b:
            java.util.List r4 = r4.i
            java.util.List r5 = r5.i
            boolean r4 = defpackage.g76.L(r4, r5)
            if (r4 != 0) goto L66
            return r2
        L66:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qfb.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (((((this.d.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31;
        int i = this.g ? 1231 : 1237;
        return this.i.hashCode() + ((this.h.hashCode() + ((iHashCode + i) * 31)) * 31);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("Author(id=", this.a, ", name=", this.b, ", imageId=");
        sbU.append(strA);
        sbU.append(", membershipType=");
        sbU.append(this.d);
        sbU.append(", isContentAuthor=");
        ho2.R(sbU, this.e, ", isCurrentUser=", this.f, ", isVerifiedAuthor=");
        sbU.append(this.g);
        sbU.append(", blockState=");
        sbU.append(this.h);
        sbU.append(", pronouns=");
        return b09.B(sbU, this.i, ")");
    }
}

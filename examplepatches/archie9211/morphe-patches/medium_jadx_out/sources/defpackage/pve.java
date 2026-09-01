package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pve {
    public final String a;
    public final String b;
    public final zw7 c;
    public final List d;

    public pve(String str, String str2, zw7 zw7Var, List list) {
        str.getClass();
        list.getClass();
        this.a = str;
        this.b = str2;
        this.c = zw7Var;
        this.d = list;
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
            return r0
        L4:
            boolean r1 = r5 instanceof defpackage.pve
            r2 = 0
            if (r1 != 0) goto La
            return r2
        La:
            pve r5 = (defpackage.pve) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L17
            return r2
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
            return r2
        L2d:
            zw7 r1 = r4.c
            zw7 r3 = r5.c
            if (r1 == r3) goto L34
            return r2
        L34:
            java.util.List r4 = r4.d
            java.util.List r5 = r5.d
            boolean r4 = defpackage.g76.L(r4, r5)
            if (r4 != 0) goto L3f
            return r2
        L3f:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pve.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        zw7 zw7Var = this.c;
        return this.d.hashCode() + ((iHashCode2 + (zw7Var != null ? zw7Var.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.b;
        StringBuilder sbU = y30.u("CurrentUser(name=", this.a, ", imageId=", str == null ? "null" : ax5.a(str), ", membershipType=");
        sbU.append(this.c);
        sbU.append(", pronouns=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}

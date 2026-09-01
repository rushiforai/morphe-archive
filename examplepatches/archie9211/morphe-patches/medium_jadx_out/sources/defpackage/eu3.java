package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eu3 extends fu3 {
    public final uid a;
    public final uid b;
    public final String c;
    public final String d;
    public final boolean e;
    public final List f;
    public final String g;

    public eu3(uid uidVar, uid uidVar2, String str, String str2, boolean z, List list, String str3) {
        uidVar.getClass();
        uidVar2.getClass();
        str.getClass();
        list.getClass();
        str3.getClass();
        this.a = uidVar;
        this.b = uidVar2;
        this.c = str;
        this.d = str2;
        this.e = z;
        this.f = list;
        this.g = str3;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0038  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L5
            goto L61
        L5:
            boolean r1 = r5 instanceof defpackage.eu3
            r2 = 0
            if (r1 != 0) goto Lb
            goto L60
        Lb:
            eu3 r5 = (defpackage.eu3) r5
            uid r1 = r4.a
            uid r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L18
            goto L60
        L18:
            uid r1 = r4.b
            uid r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L23
            goto L60
        L23:
            java.lang.String r1 = r4.c
            java.lang.String r3 = r5.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L2e
            goto L60
        L2e:
            java.lang.String r1 = r5.d
            java.lang.String r3 = r4.d
            if (r3 != 0) goto L3a
            if (r1 != 0) goto L38
            r1 = r0
            goto L41
        L38:
            r1 = r2
            goto L41
        L3a:
            if (r1 != 0) goto L3d
            goto L38
        L3d:
            boolean r1 = r3.equals(r1)
        L41:
            if (r1 != 0) goto L44
            goto L60
        L44:
            boolean r1 = r4.e
            boolean r3 = r5.e
            if (r1 == r3) goto L4b
            goto L60
        L4b:
            java.util.List r1 = r4.f
            java.util.List r3 = r5.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L56
            goto L60
        L56:
            java.lang.String r4 = r4.g
            java.lang.String r5 = r5.g
            boolean r4 = defpackage.g76.L(r4, r5)
            if (r4 != 0) goto L61
        L60:
            return r2
        L61:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.eu3.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c);
        String str = this.d;
        return this.g.hashCode() + wgd.p((((iO + (str == null ? 0 : str.hashCode())) * 31) + (this.e ? 1231 : 1237)) * 31, 31, this.f);
    }

    public final String toString() {
        String str = this.d;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sb = new StringBuilder("Profile(name=");
        sb.append(this.a);
        sb.append(", shortBio=");
        sb.append(this.b);
        sb.append(", about=");
        ka1.C(sb, this.c, ", imageId=", strA, ", saving=");
        sb.append(this.e);
        sb.append(", pronouns=");
        sb.append(this.f);
        sb.append(", source=");
        return ka1.v(sb, this.g, ")");
    }
}

package defpackage;

import gen.model.SourceParameter;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kmc {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final zw7 e;
    public final Long f;
    public final jmc g;
    public final String h;
    public final SourceParameter i;

    public kmc(String str, String str2, String str3, String str4, zw7 zw7Var, Long l, jmc jmcVar, String str5, SourceParameter sourceParameter) {
        str.getClass();
        zw7Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = zw7Var;
        this.f = l;
        this.g = jmcVar;
        this.h = str5;
        this.i = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x003a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L5
            goto L79
        L5:
            boolean r1 = r5 instanceof defpackage.kmc
            r2 = 0
            if (r1 != 0) goto Lc
            goto L78
        Lc:
            kmc r5 = (defpackage.kmc) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L1a
            goto L78
        L1a:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L25
            goto L78
        L25:
            java.lang.String r1 = r4.c
            java.lang.String r3 = r5.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L30
            goto L78
        L30:
            java.lang.String r1 = r5.d
            java.lang.String r3 = r4.d
            if (r3 != 0) goto L3c
            if (r1 != 0) goto L3a
            r1 = r0
            goto L43
        L3a:
            r1 = r2
            goto L43
        L3c:
            if (r1 != 0) goto L3f
            goto L3a
        L3f:
            boolean r1 = r3.equals(r1)
        L43:
            if (r1 != 0) goto L46
            goto L78
        L46:
            zw7 r1 = r4.e
            zw7 r3 = r5.e
            if (r1 == r3) goto L4d
            goto L78
        L4d:
            java.lang.Long r1 = r4.f
            java.lang.Long r3 = r5.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L58
            goto L78
        L58:
            jmc r1 = r4.g
            jmc r3 = r5.g
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L63
            goto L78
        L63:
            java.lang.String r1 = r4.h
            java.lang.String r3 = r5.h
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L6e
            goto L78
        L6e:
            gen.model.SourceParameter r4 = r4.i
            gen.model.SourceParameter r5 = r5.i
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L79
        L78:
            return r2
        L79:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kmc.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.d;
        int iHashCode2 = (this.e.hashCode() + ((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31;
        Long l = this.f;
        int iA = ka1.a(this.g.a, (iHashCode2 + (l == null ? 0 : l.hashCode())) * 31, 31);
        String str3 = this.h;
        return this.i.hashCode() + ((iA + (str3 != null ? str3.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.d;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("StaffItemUiModel(id=", this.a, ", name=", this.b, ", title=");
        ka1.C(sbU, this.c, ", imageId=", strA, ", membershipType=");
        sbU.append(this.e);
        sbU.append(", followerCount=");
        sbU.append(this.f);
        sbU.append(", itemAction=");
        sbU.append(this.g);
        sbU.append(", description=");
        sbU.append(this.h);
        sbU.append(eoLmc.JkAICQR);
        return y30.r(sbU, this.i, ")");
    }
}

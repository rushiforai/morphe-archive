package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ld0 implements od0 {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final String e;
    public final SusiDestination f;
    public final l3d g;
    public final SusiOperation h;
    public final String i;

    public ld0(String str, String str2, String str3, boolean z, String str4, SusiDestination susiDestination, l3d l3dVar, SusiOperation susiOperation, String str5) {
        str2.getClass();
        str3.getClass();
        l3dVar.getClass();
        susiOperation.getClass();
        str5.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = str4;
        this.f = susiDestination;
        this.g = l3dVar;
        this.h = susiOperation;
        this.i = str5;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L5
            goto L70
        L5:
            boolean r1 = r5 instanceof defpackage.ld0
            r2 = 0
            if (r1 != 0) goto Lc
            goto L6f
        Lc:
            ld0 r5 = (defpackage.ld0) r5
            java.lang.String r1 = r5.a
            java.lang.String r3 = r4.a
            if (r3 != 0) goto L1a
            if (r1 != 0) goto L18
            r1 = r0
            goto L21
        L18:
            r1 = r2
            goto L21
        L1a:
            if (r1 != 0) goto L1d
            goto L18
        L1d:
            boolean r1 = r3.equals(r1)
        L21:
            if (r1 != 0) goto L24
            goto L6f
        L24:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L2f
            goto L6f
        L2f:
            java.lang.String r1 = r4.c
            java.lang.String r3 = r5.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L3a
            goto L6f
        L3a:
            boolean r1 = r4.d
            boolean r3 = r5.d
            if (r1 == r3) goto L41
            goto L6f
        L41:
            java.lang.String r1 = r4.e
            java.lang.String r3 = r5.e
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L4c
            goto L6f
        L4c:
            com.medium.android.core.susi.SusiDestination r1 = r4.f
            com.medium.android.core.susi.SusiDestination r3 = r5.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L57
            goto L6f
        L57:
            l3d r1 = r4.g
            l3d r3 = r5.g
            if (r1 == r3) goto L5e
            goto L6f
        L5e:
            com.medium.android.core.susi.SusiOperation r1 = r4.h
            com.medium.android.core.susi.SusiOperation r3 = r5.h
            if (r1 == r3) goto L65
            goto L6f
        L65:
            java.lang.String r4 = r4.i
            java.lang.String r5 = r5.i
            boolean r4 = defpackage.g76.L(r4, r5)
            if (r4 != 0) goto L70
        L6f:
            return r2
        L70:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ld0.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        String str = this.a;
        int iO = wgd.o((wgd.o(wgd.o((str == null ? 0 : str.hashCode()) * 31, 31, this.b), 31, this.c) + (this.d ? 1231 : 1237)) * 31, 31, this.e);
        SusiDestination susiDestination = this.f;
        return this.i.hashCode() + ((this.h.hashCode() + ((this.g.hashCode() + ((iO + (susiDestination != null ? susiDestination.hashCode() : 0)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        String str = this.a;
        StringBuilder sbU = y30.u("AccountHint(imageId=", str == null ? "null" : ax5.a(str), ", name=", this.b, ", obfuscatedEmail=");
        ka1.D(sbU, this.c, ", rememberMe=", this.d, ", source=");
        sbU.append(this.e);
        sbU.append(", susiDestination=");
        sbU.append(this.f);
        sbU.append(", susiMethod=");
        sbU.append(this.g);
        sbU.append(", susiOperation=");
        sbU.append(this.h);
        sbU.append(", userId=");
        return ka1.v(sbU, this.i, ")");
    }
}

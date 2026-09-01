package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mdb implements xi8 {
    public final boolean a;
    public final long b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final String h;
    public final mx i;
    public final SourceParameter j;

    public mdb(boolean z, long j, String str, String str2, String str3, String str4, String str5, String str6, mx mxVar, SourceParameter sourceParameter) {
        b09.I(str, str4, str6);
        this.a = z;
        this.b = j;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = str4;
        this.g = str5;
        this.h = str6;
        this.i = mxVar;
        this.j = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0040  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r8) {
        /*
            r7 = this;
            r0 = 1
            if (r7 != r8) goto L5
            goto L83
        L5:
            boolean r1 = r8 instanceof defpackage.mdb
            r2 = 0
            if (r1 != 0) goto Lc
            goto L82
        Lc:
            mdb r8 = (defpackage.mdb) r8
            boolean r1 = r7.a
            boolean r3 = r8.a
            if (r1 == r3) goto L16
            goto L82
        L16:
            long r3 = r7.b
            long r5 = r8.b
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 == 0) goto L20
            goto L82
        L20:
            java.lang.String r1 = r7.c
            java.lang.String r3 = r8.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L2b
            goto L82
        L2b:
            java.lang.String r1 = r7.d
            java.lang.String r3 = r8.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L36
            goto L82
        L36:
            java.lang.String r1 = r8.e
            java.lang.String r3 = r7.e
            if (r3 != 0) goto L42
            if (r1 != 0) goto L40
            r1 = r0
            goto L49
        L40:
            r1 = r2
            goto L49
        L42:
            if (r1 != 0) goto L45
            goto L40
        L45:
            boolean r1 = r3.equals(r1)
        L49:
            if (r1 != 0) goto L4c
            goto L82
        L4c:
            java.lang.String r1 = r7.f
            java.lang.String r3 = r8.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L57
            goto L82
        L57:
            java.lang.String r1 = r7.g
            java.lang.String r3 = r8.g
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L62
            goto L82
        L62:
            java.lang.String r1 = r7.h
            java.lang.String r3 = r8.h
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L6d
            goto L82
        L6d:
            mx r1 = r7.i
            mx r3 = r8.i
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L78
            goto L82
        L78:
            gen.model.SourceParameter r7 = r7.j
            gen.model.SourceParameter r8 = r8.j
            boolean r7 = r7.equals(r8)
            if (r7 != 0) goto L83
        L82:
            return r2
        L83:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mdb.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int i = this.a ? 1231 : 1237;
        long j = this.b;
        int iO = wgd.o(wgd.o(((i * 31) + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c), 31, this.d);
        String str = this.e;
        int iO2 = wgd.o(wgd.o(wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.f), 31, this.g), 31, this.h);
        mx mxVar = this.i;
        return this.j.hashCode() + ((iO2 + (mxVar != null ? mxVar.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.e;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbE = km4.E("ResponseCreatedNotificationDataItem(isUnread=", this.a, ", timestamp=", this.b);
        ka1.C(sbE, ", actorId=", this.c, ", actorName=", this.d);
        ka1.C(sbE, ", actorImageId=", strA, ", postId=", this.f);
        ka1.C(sbE, ", postTitle=", this.g, ", responseId=", this.h);
        sbE.append(", responseContent=");
        sbE.append((Object) this.i);
        sbE.append(", sourceParameter=");
        sbE.append(this.j);
        sbE.append(")");
        return sbE.toString();
    }
}

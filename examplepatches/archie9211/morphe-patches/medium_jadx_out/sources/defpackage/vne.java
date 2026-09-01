package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vne implements xi8 {
    public final boolean a;
    public final long b;
    public final String c;
    public final String d;
    public final String e;
    public final SourceParameter f;

    public vne(boolean z, long j, String str, String str2, String str3, SourceParameter sourceParameter) {
        str.getClass();
        this.a = z;
        this.b = j;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x003c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r8) {
        /*
            r7 = this;
            r0 = 1
            if (r7 != r8) goto L4
            goto L53
        L4:
            boolean r1 = r8 instanceof defpackage.vne
            r2 = 0
            if (r1 != 0) goto La
            goto L52
        La:
            vne r8 = (defpackage.vne) r8
            boolean r1 = r7.a
            boolean r3 = r8.a
            if (r1 == r3) goto L13
            goto L52
        L13:
            long r3 = r7.b
            long r5 = r8.b
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 == 0) goto L1c
            goto L52
        L1c:
            java.lang.String r1 = r7.c
            java.lang.String r3 = r8.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L27
            goto L52
        L27:
            java.lang.String r1 = r7.d
            java.lang.String r3 = r8.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L32
            goto L52
        L32:
            java.lang.String r1 = r8.e
            java.lang.String r3 = r7.e
            if (r3 != 0) goto L3e
            if (r1 != 0) goto L3c
            r1 = r0
            goto L45
        L3c:
            r1 = r2
            goto L45
        L3e:
            if (r1 != 0) goto L41
            goto L3c
        L41:
            boolean r1 = r3.equals(r1)
        L45:
            if (r1 != 0) goto L48
            goto L52
        L48:
            gen.model.SourceParameter r7 = r7.f
            gen.model.SourceParameter r8 = r8.f
            boolean r7 = r7.equals(r8)
            if (r7 != 0) goto L53
        L52:
            return r2
        L53:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vne.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int i = this.a ? 1231 : 1237;
        long j = this.b;
        int iO = wgd.o(wgd.o(((i * 31) + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c), 31, this.d);
        String str = this.e;
        return this.f.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        String str = this.e;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbE = km4.E("UsersEmailSubscribedNotificationDataItem(isUnread=", this.a, ", timestamp=", this.b);
        ka1.C(sbE, ", actorId=", this.c, ", actorName=", this.d);
        sbE.append(", actorImageId=");
        sbE.append(strA);
        sbE.append(", sourceParameter=");
        sbE.append(this.f);
        sbE.append(")");
        return sbE.toString();
    }
}

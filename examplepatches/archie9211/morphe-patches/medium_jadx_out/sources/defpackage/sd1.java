package defpackage;

import com.medium.android.core.models.CatalogName;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sd1 implements xi8 {
    public final boolean a;
    public final long b;
    public final int c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final CatalogName h;
    public final SourceParameter i;

    public sd1(int i, long j, CatalogName catalogName, SourceParameter sourceParameter, String str, String str2, String str3, String str4, boolean z) {
        str.getClass();
        str4.getClass();
        catalogName.getClass();
        this.a = z;
        this.b = j;
        this.c = i;
        this.d = str;
        this.e = str2;
        this.f = str3;
        this.g = str4;
        this.h = catalogName;
        this.i = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0046  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r8) {
        /*
            r7 = this;
            r0 = 1
            if (r7 != r8) goto L5
            goto L73
        L5:
            boolean r1 = r8 instanceof defpackage.sd1
            r2 = 0
            if (r1 != 0) goto Lc
            goto L72
        Lc:
            sd1 r8 = (defpackage.sd1) r8
            boolean r1 = r7.a
            boolean r3 = r8.a
            if (r1 == r3) goto L16
            goto L72
        L16:
            long r3 = r7.b
            long r5 = r8.b
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 == 0) goto L1f
            goto L72
        L1f:
            int r1 = r7.c
            int r3 = r8.c
            if (r1 == r3) goto L26
            goto L72
        L26:
            java.lang.String r1 = r7.d
            java.lang.String r3 = r8.d
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L31
            goto L72
        L31:
            java.lang.String r1 = r7.e
            java.lang.String r3 = r8.e
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L3c
            goto L72
        L3c:
            java.lang.String r1 = r8.f
            java.lang.String r3 = r7.f
            if (r3 != 0) goto L48
            if (r1 != 0) goto L46
            r1 = r0
            goto L4f
        L46:
            r1 = r2
            goto L4f
        L48:
            if (r1 != 0) goto L4b
            goto L46
        L4b:
            boolean r1 = r3.equals(r1)
        L4f:
            if (r1 != 0) goto L52
            goto L72
        L52:
            java.lang.String r1 = r7.g
            java.lang.String r3 = r8.g
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L5d
            goto L72
        L5d:
            com.medium.android.core.models.CatalogName r1 = r7.h
            com.medium.android.core.models.CatalogName r3 = r8.h
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L68
            goto L72
        L68:
            gen.model.SourceParameter r7 = r7.i
            gen.model.SourceParameter r8 = r8.i
            boolean r7 = r7.equals(r8)
            if (r7 != 0) goto L73
        L72:
            return r2
        L73:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sd1.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int i = this.a ? 1231 : 1237;
        long j = this.b;
        int iO = wgd.o(wgd.o(((((i * 31) + ((int) (j ^ (j >>> 32)))) * 31) + this.c) * 31, 31, this.d), 31, this.e);
        String str = this.f;
        return this.i.hashCode() + ((this.h.hashCode() + wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.g)) * 31);
    }

    public final String toString() {
        String str = this.f;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbE = km4.E("CatalogFollowedMilestoneNotificationDataItem(isUnread=", this.a, ", timestamp=", this.b);
        sbE.append(", milestoneArg=");
        sbE.append(this.c);
        sbE.append(", actorId=");
        sbE.append(this.d);
        ka1.C(sbE, ", actorName=", this.e, ", actorImageId=", strA);
        sbE.append(", catalogId=");
        sbE.append(this.g);
        sbE.append(", catalogName=");
        sbE.append(this.h);
        sbE.append(", sourceParameter=");
        sbE.append(this.i);
        sbE.append(")");
        return sbE.toString();
    }
}

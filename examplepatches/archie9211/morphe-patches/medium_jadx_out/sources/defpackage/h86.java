package defpackage;

import com.medium.android.core.models.CatalogName;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h86 implements xi8 {
    public final boolean a;
    public final long b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final CatalogName g;
    public final int h;
    public final SourceParameter i;

    public h86(int i, long j, CatalogName catalogName, SourceParameter sourceParameter, String str, String str2, String str3, String str4, boolean z) {
        str.getClass();
        str4.getClass();
        catalogName.getClass();
        this.a = z;
        this.b = j;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = str4;
        this.g = catalogName;
        this.h = i;
        this.i = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x003f  */
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
            boolean r1 = r8 instanceof defpackage.h86
            r2 = 0
            if (r1 != 0) goto Lc
            goto L72
        Lc:
            h86 r8 = (defpackage.h86) r8
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
            java.lang.String r1 = r7.c
            java.lang.String r3 = r8.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L2a
            goto L72
        L2a:
            java.lang.String r1 = r7.d
            java.lang.String r3 = r8.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L35
            goto L72
        L35:
            java.lang.String r1 = r8.e
            java.lang.String r3 = r7.e
            if (r3 != 0) goto L41
            if (r1 != 0) goto L3f
            r1 = r0
            goto L48
        L3f:
            r1 = r2
            goto L48
        L41:
            if (r1 != 0) goto L44
            goto L3f
        L44:
            boolean r1 = r3.equals(r1)
        L48:
            if (r1 != 0) goto L4b
            goto L72
        L4b:
            java.lang.String r1 = r7.f
            java.lang.String r3 = r8.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L56
            goto L72
        L56:
            com.medium.android.core.models.CatalogName r1 = r7.g
            com.medium.android.core.models.CatalogName r3 = r8.g
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L61
            goto L72
        L61:
            int r1 = r7.h
            int r3 = r8.h
            if (r1 == r3) goto L68
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h86.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int i = this.a ? 1231 : 1237;
        long j = this.b;
        int iO = wgd.o(wgd.o(((i * 31) + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c), 31, this.d);
        String str = this.e;
        return this.i.hashCode() + ((((this.g.hashCode() + wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.f)) * 31) + this.h) * 31);
    }

    public final String toString() {
        String str = this.e;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbE = km4.E("ItemAddedToFollowedCatalogRollupNotificationDataItem(isUnread=", this.a, ", timestamp=", this.b);
        ka1.C(sbE, ", actorId=", this.c, ", actorName=", this.d);
        ka1.C(sbE, ", actorImageId=", strA, ", catalogId=", this.f);
        sbE.append(", catalogName=");
        sbE.append(this.g);
        sbE.append(", addedItemsCount=");
        sbE.append(this.h);
        sbE.append(", sourceParameter=");
        sbE.append(this.i);
        sbE.append(")");
        return sbE.toString();
    }
}

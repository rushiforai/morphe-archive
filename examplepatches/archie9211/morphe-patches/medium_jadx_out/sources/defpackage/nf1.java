package defpackage;

import com.medium.android.core.models.CatalogName;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nf1 implements xi8 {
    public final boolean a;
    public final long b;
    public final int c;
    public final String d;
    public final CatalogName e;
    public final String f;
    public final String g;
    public final SourceParameter h;

    public nf1(boolean z, long j, int i, String str, CatalogName catalogName, String str2, String str3, SourceParameter sourceParameter) {
        str.getClass();
        catalogName.getClass();
        str2.getClass();
        this.a = z;
        this.b = j;
        this.c = i;
        this.d = str;
        this.e = catalogName;
        this.f = str2;
        this.g = str3;
        this.h = sourceParameter;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0050  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r8) {
        /*
            r7 = this;
            r0 = 1
            if (r7 != r8) goto L5
            goto L67
        L5:
            boolean r1 = r8 instanceof defpackage.nf1
            r2 = 0
            if (r1 != 0) goto Lc
            goto L66
        Lc:
            nf1 r8 = (defpackage.nf1) r8
            boolean r1 = r7.a
            boolean r3 = r8.a
            if (r1 == r3) goto L15
            goto L66
        L15:
            long r3 = r7.b
            long r5 = r8.b
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 == 0) goto L1e
            goto L66
        L1e:
            int r1 = r7.c
            int r3 = r8.c
            if (r1 == r3) goto L25
            goto L66
        L25:
            java.lang.String r1 = r7.d
            java.lang.String r3 = r8.d
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L30
            goto L66
        L30:
            com.medium.android.core.models.CatalogName r1 = r7.e
            com.medium.android.core.models.CatalogName r3 = r8.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L3b
            goto L66
        L3b:
            java.lang.String r1 = r7.f
            java.lang.String r3 = r8.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L46
            goto L66
        L46:
            java.lang.String r1 = r8.g
            java.lang.String r3 = r7.g
            if (r3 != 0) goto L52
            if (r1 != 0) goto L50
            r1 = r0
            goto L59
        L50:
            r1 = r2
            goto L59
        L52:
            if (r1 != 0) goto L55
            goto L50
        L55:
            boolean r1 = r3.equals(r1)
        L59:
            if (r1 != 0) goto L5c
            goto L66
        L5c:
            gen.model.SourceParameter r7 = r7.h
            gen.model.SourceParameter r8 = r8.h
            boolean r7 = r7.equals(r8)
            if (r7 != 0) goto L67
        L66:
            return r2
        L67:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nf1.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int i = this.a ? 1231 : 1237;
        long j = this.b;
        int iO = wgd.o((this.e.hashCode() + wgd.o(((((i * 31) + ((int) (j ^ (j >>> 32)))) * 31) + this.c) * 31, 31, this.d)) * 31, 31, this.f);
        String str = this.g;
        return this.h.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        String str = this.g;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbE = km4.E("CatalogRecommendedMilestoneNotificationDataItem(isUnread=", this.a, ", timestamp=", this.b);
        sbE.append(", milestoneArg=");
        sbE.append(this.c);
        sbE.append(", catalogId=");
        sbE.append(this.d);
        sbE.append(", catalogName=");
        sbE.append(this.e);
        sbE.append(", catalogCreatorId=");
        sbE.append(this.f);
        sbE.append(", catalogCreatorImageId=");
        sbE.append(strA);
        sbE.append(", sourceParameter=");
        sbE.append(this.h);
        sbE.append(")");
        return sbE.toString();
    }
}

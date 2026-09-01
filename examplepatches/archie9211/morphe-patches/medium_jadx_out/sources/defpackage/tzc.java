package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tzc implements c0d {
    public final String a;
    public final boolean b;
    public final az5 c;
    public final UpsellInfo d;
    public final ozc e;
    public final BillingPeriod f;
    public final nzc g;
    public final String h;
    public final String i;
    public final String j;

    public tzc(String str, boolean z, az5 az5Var, UpsellInfo upsellInfo, ozc ozcVar, BillingPeriod billingPeriod, nzc nzcVar, String str2, String str3, String str4) {
        az5Var.getClass();
        upsellInfo.getClass();
        this.a = str;
        this.b = z;
        this.c = az5Var;
        this.d = upsellInfo;
        this.e = ozcVar;
        this.f = billingPeriod;
        this.g = nzcVar;
        this.h = str2;
        this.i = str3;
        this.j = str4;
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
            goto L7f
        L5:
            boolean r1 = r5 instanceof defpackage.tzc
            r2 = 0
            if (r1 != 0) goto Lc
            goto L7e
        Lc:
            tzc r5 = (defpackage.tzc) r5
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
            goto L7e
        L24:
            boolean r1 = r4.b
            boolean r3 = r5.b
            if (r1 == r3) goto L2b
            goto L7e
        L2b:
            az5 r1 = r4.c
            az5 r3 = r5.c
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L36
            goto L7e
        L36:
            com.medium.android.core.membership.UpsellInfo r1 = r4.d
            com.medium.android.core.membership.UpsellInfo r3 = r5.d
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L41
            goto L7e
        L41:
            ozc r1 = r4.e
            ozc r3 = r5.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L4c
            goto L7e
        L4c:
            com.medium.android.core.models.BillingPeriod r1 = r4.f
            com.medium.android.core.models.BillingPeriod r3 = r5.f
            if (r1 == r3) goto L53
            goto L7e
        L53:
            nzc r1 = r4.g
            nzc r3 = r5.g
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L5e
            goto L7e
        L5e:
            java.lang.String r1 = r4.h
            java.lang.String r3 = r5.h
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L69
            goto L7e
        L69:
            java.lang.String r1 = r4.i
            java.lang.String r3 = r5.i
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L74
            goto L7e
        L74:
            java.lang.String r4 = r4.j
            java.lang.String r5 = r5.j
            boolean r4 = defpackage.g76.L(r4, r5)
            if (r4 != 0) goto L7f
        L7e:
            return r2
        L7f:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tzc.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (this.d.hashCode() + ka1.b(this.c, (((str == null ? 0 : str.hashCode()) * 31) + (this.b ? 1231 : 1237)) * 31, 31)) * 31;
        ozc ozcVar = this.e;
        int iHashCode2 = (this.g.hashCode() + ((this.f.hashCode() + ((iHashCode + (ozcVar == null ? 0 : ozcVar.hashCode())) * 31)) * 31)) * 31;
        String str2 = this.h;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.i;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.j;
        return iHashCode4 + (str4 != null ? str4.hashCode() : 0);
    }

    public final String toString() {
        String str = this.a;
        StringBuilder sbD = ev6.D("Main(currentUserImageId=", str == null ? "null" : ax5.a(str), ", trialEligible=", ", plans=", this.b);
        sbD.append(this.c);
        sbD.append(", upsellInfo=");
        sbD.append(this.d);
        sbD.append(", offer=");
        sbD.append(this.e);
        sbD.append(", activeBillingPeriod=");
        sbD.append(this.f);
        sbD.append(", legalDetails=");
        sbD.append(this.g);
        sbD.append(", currentProductId=");
        sbD.append(this.h);
        sbD.append(", currentPurchaseToken=");
        return km4.C(sbD, this.i, ", saveUpToPriceAYear=", this.j, ")");
    }
}

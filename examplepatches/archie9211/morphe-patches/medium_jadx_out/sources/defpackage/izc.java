package defpackage;

import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class izc implements nzc {
    public final BillingPeriod a;
    public final lzc b;
    public final lzc c;

    public izc(BillingPeriod billingPeriod, lzc lzcVar, lzc lzcVar2) {
        this.a = billingPeriod;
        this.b = lzcVar;
        this.c = lzcVar2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof izc)) {
            return false;
        }
        izc izcVar = (izc) obj;
        return this.a == izcVar.a && this.b.equals(izcVar.b) && g76.L(this.c, izcVar.c);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        lzc lzcVar = this.c;
        return iHashCode + (lzcVar == null ? 0 : lzcVar.hashCode());
    }

    public final String toString() {
        return "IntroductoryOffer(activeBillingPeriod=" + this.a + ", regular=" + this.b + ", premium=" + this.c + ")";
    }
}

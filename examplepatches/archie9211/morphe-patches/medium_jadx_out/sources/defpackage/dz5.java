package defpackage;

import java.util.Currency;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dz5 {
    public final String a;
    public final double b;
    public final Currency c;

    public dz5(String str, double d, Currency currency) {
        str.getClass();
        this.a = str;
        this.b = d;
        this.c = currency;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dz5)) {
            return false;
        }
        dz5 dz5Var = (dz5) obj;
        return g76.L(this.a, dz5Var.a) && Double.compare(this.b, dz5Var.b) == 0 && this.c.equals(dz5Var.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long jDoubleToLongBits = Double.doubleToLongBits(this.b);
        return this.c.hashCode() + ((iHashCode + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)))) * 31);
    }

    public final String toString() {
        return "InAppPurchase(eventName=" + this.a + ", amount=" + this.b + ", currency=" + this.c + ')';
    }
}

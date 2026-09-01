package defpackage;

import j$.util.Objects;
import java.math.BigInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dug extends dlg {
    public static final BigInteger e = BigInteger.valueOf(65537);
    public final int a;
    public final BigInteger b;
    public final d1g c;
    public final aug d;

    public dug(int i, BigInteger bigInteger, d1g d1gVar, aug augVar) {
        this.a = i;
        this.b = bigInteger;
        this.c = d1gVar;
        this.d = augVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof dug)) {
            return false;
        }
        dug dugVar = (dug) obj;
        return dugVar.a == this.a && Objects.equals(dugVar.b, this.b) && dugVar.c == this.c && dugVar.d == this.d;
    }

    public final int hashCode() {
        return Objects.hash(dug.class, Integer.valueOf(this.a), this.b, this.c, this.d);
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.c);
        String strValueOf2 = String.valueOf(this.d);
        String strValueOf3 = String.valueOf(this.b);
        int length = strValueOf.length();
        int length2 = strValueOf2.length();
        int length3 = strValueOf3.length();
        int i = this.a;
        StringBuilder sb = new StringBuilder(length + 47 + length2 + 18 + length3 + 6 + String.valueOf(i).length() + 13);
        ka1.C(sb, "RSA SSA PKCS1 Parameters (variant: ", strValueOf, ", hashType: ", strValueOf2);
        sb.append(", publicExponent: ");
        sb.append(strValueOf3);
        sb.append(", and ");
        sb.append(i);
        sb.append("-bit modulus)");
        return sb.toString();
    }
}

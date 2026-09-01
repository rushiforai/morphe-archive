package defpackage;

import j$.util.Objects;
import java.math.BigInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qug extends dlg {
    public static final BigInteger g = BigInteger.valueOf(65537);
    public final int a;
    public final BigInteger b;
    public final zwf c;
    public final oug d;
    public final oug e;
    public final int f;

    public qug(int i, BigInteger bigInteger, zwf zwfVar, oug ougVar, oug ougVar2, int i2) {
        this.a = i;
        this.b = bigInteger;
        this.c = zwfVar;
        this.d = ougVar;
        this.e = ougVar2;
        this.f = i2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof qug)) {
            return false;
        }
        qug qugVar = (qug) obj;
        return qugVar.a == this.a && Objects.equals(qugVar.b, this.b) && qugVar.c == this.c && qugVar.d == this.d && qugVar.e == this.e && qugVar.f == this.f;
    }

    public final int hashCode() {
        return Objects.hash(qug.class, Integer.valueOf(this.a), this.b, this.c, this.d, this.e, Integer.valueOf(this.f));
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.c);
        String strValueOf2 = String.valueOf(this.d);
        String strValueOf3 = String.valueOf(this.e);
        String strValueOf4 = String.valueOf(this.b);
        int length = strValueOf.length();
        int length2 = strValueOf2.length();
        int length3 = strValueOf3.length();
        int i = this.f;
        int length4 = String.valueOf(i).length();
        int length5 = strValueOf4.length();
        int i2 = this.a;
        StringBuilder sb = new StringBuilder(length + 55 + length2 + 17 + length3 + 19 + length4 + 18 + length5 + 6 + String.valueOf(i2).length() + 13);
        ka1.C(sb, "RSA SSA PSS Parameters (variant: ", strValueOf, ", signature hashType: ", strValueOf2);
        sb.append(", mgf1 hashType: ");
        sb.append(strValueOf3);
        sb.append(", saltLengthBytes: ");
        sb.append(i);
        sb.append(", publicExponent: ");
        sb.append(strValueOf4);
        sb.append(", and ");
        sb.append(i2);
        sb.append("-bit modulus)");
        return sb.toString();
    }
}

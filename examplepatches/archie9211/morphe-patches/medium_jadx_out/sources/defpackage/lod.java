package defpackage;

import com.medium.android.explore.ui.vAWg.OphtYB;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.util.concurrent.atomic.AtomicMarkableReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class lod {
    public Object a;
    public Object b;
    public Object c;
    public Object d = new zf3(this, false);
    public Object e = new zf3(this, true);
    public Object f = new ru(4);
    public Object g = new AtomicMarkableReference(null, false);

    public lod(String str, bh4 bh4Var, m50 m50Var) {
        this.c = str;
        this.a = new oz7(bh4Var);
        this.b = m50Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0159  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object a(java.lang.String r19, java.lang.String r20, gen.model.SourceParameter r21, java.lang.String r22, boolean r23, defpackage.p92 r24) {
        /*
            Method dump skipped, instruction units count: 360
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lod.a(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, boolean, p92):java.lang.Object");
    }

    public sug b() throws GeneralSecurityException {
        ujf ujfVar;
        ujf ujfVar2;
        tug tugVar = (tug) this.a;
        if (tugVar == null) {
            ygf.l("Cannot build without a RSA SSA PKCS1 public key");
            return null;
        }
        ujf ujfVar3 = (ujf) this.c;
        if (ujfVar3 == null || (ujfVar = (ujf) this.d) == null) {
            ygf.l("Cannot build without prime factors");
            return null;
        }
        ujf ujfVar4 = (ujf) this.b;
        if (ujfVar4 == null) {
            ygf.l("Cannot build without private exponent");
            return null;
        }
        ujf ujfVar5 = (ujf) this.e;
        if (ujfVar5 == null || (ujfVar2 = (ujf) this.f) == null) {
            ygf.l("Cannot build without prime exponents");
            return null;
        }
        ujf ujfVar6 = (ujf) this.g;
        if (ujfVar6 == null) {
            ygf.l("Cannot build without CRT coefficient");
            return null;
        }
        BigInteger bigInteger = tugVar.i.b;
        BigInteger bigInteger2 = tugVar.j;
        BigInteger bigInteger3 = (BigInteger) ujfVar3.b;
        BigInteger bigInteger4 = (BigInteger) ujfVar.b;
        BigInteger bigInteger5 = (BigInteger) ujfVar4.b;
        BigInteger bigInteger6 = (BigInteger) ujfVar5.b;
        BigInteger bigInteger7 = (BigInteger) ujfVar2.b;
        BigInteger bigInteger8 = (BigInteger) ujfVar6.b;
        if (!bigInteger3.isProbablePrime(10)) {
            ygf.l("p is not a prime");
            return null;
        }
        if (!bigInteger4.isProbablePrime(10)) {
            ygf.l("q is not a prime");
            return null;
        }
        if (!bigInteger3.multiply(bigInteger4).equals(bigInteger2)) {
            ygf.l("Prime p times prime q is not equal to the public key's modulus");
            return null;
        }
        BigInteger bigInteger9 = BigInteger.ONE;
        BigInteger bigIntegerSubtract = bigInteger3.subtract(bigInteger9);
        BigInteger bigIntegerSubtract2 = bigInteger4.subtract(bigInteger9);
        if (!bigInteger.multiply(bigInteger5).mod(bigIntegerSubtract.divide(bigIntegerSubtract.gcd(bigIntegerSubtract2)).multiply(bigIntegerSubtract2)).equals(bigInteger9)) {
            ygf.l("D is invalid.");
            return null;
        }
        if (!bigInteger.multiply(bigInteger6).mod(bigIntegerSubtract).equals(bigInteger9)) {
            ygf.l(OphtYB.cfwfeLP);
            return null;
        }
        if (!bigInteger.multiply(bigInteger7).mod(bigIntegerSubtract2).equals(bigInteger9)) {
            ygf.l("dQ is invalid.");
            return null;
        }
        if (bigInteger4.multiply(bigInteger8).mod(bigInteger3).equals(bigInteger9)) {
            return new sug((tug) this.a, (ujf) this.c, (ujf) this.d, (ujf) this.b, (ujf) this.e, (ujf) this.f, (ujf) this.g);
        }
        ygf.l("qInv is invalid.");
        return null;
    }
}

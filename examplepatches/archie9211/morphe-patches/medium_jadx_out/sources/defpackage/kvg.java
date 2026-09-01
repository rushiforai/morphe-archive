package defpackage;

import java.security.GeneralSecurityException;
import java.security.spec.ECPoint;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class kvg {
    public static final omg a;
    public static final kmg b;
    public static final skg c;
    public static final okg d;
    public static final skg e;
    public static final okg f;

    static {
        cmf cmfVarA = aog.a("type.googleapis.com/google.crypto.tink.EcdsaPrivateKey");
        cmf cmfVarA2 = aog.a("type.googleapis.com/google.crypto.tink.EcdsaPublicKey");
        a = new omg(prg.class);
        b = new kmg(cmfVarA);
        c = new skg(urg.class, z8g.b);
        d = new okg(cmfVarA2, d9g.b);
        e = new skg(srg.class, k9g.a);
        f = new okg(cmfVarA, n9g.a);
    }

    public static e1g a(d1g d1gVar) throws GeneralSecurityException {
        if (d1gVar == d1g.D) {
            return e1g.k;
        }
        if (d1gVar == d1g.E) {
            return e1g.n;
        }
        if (d1gVar == d1g.G) {
            return e1g.m;
        }
        if (d1gVar == d1g.F) {
            return e1g.l;
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(d1gVar.b));
    }

    public static d1g b(apg apgVar) throws GeneralSecurityException {
        int iOrdinal = apgVar.ordinal();
        if (iOrdinal == 2) {
            return d1g.B;
        }
        if (iOrdinal == 3) {
            return d1g.A;
        }
        if (iOrdinal == 4) {
            return d1g.C;
        }
        int iZza = apgVar.zza();
        throw new GeneralSecurityException(b09.A(new StringBuilder(String.valueOf(iZza).length() + 26), iZza, "Unable to parse HashType: "));
    }

    public static int d(grg grgVar) throws GeneralSecurityException {
        if (grgVar.equals(grg.c)) {
            return 33;
        }
        if (grgVar == grg.d) {
            return 49;
        }
        if (grgVar == grg.e) {
            return 67;
        }
        throw new GeneralSecurityException("Unable to serialize CurveType ".concat(grgVar.a));
    }

    public static nog e(urg urgVar) throws GeneralSecurityException {
        apg apgVar;
        int i;
        int iD = d(urgVar.i.b);
        ECPoint eCPoint = urgVar.j;
        log logVarA = nog.A();
        prg prgVar = urgVar.i;
        dog dogVarW = fog.w();
        d1g d1gVar = prgVar.c;
        if (d1gVar.equals(d1g.A)) {
            apgVar = apg.SHA256;
        } else if (d1gVar == d1g.B) {
            apgVar = apg.SHA384;
        } else {
            if (d1gVar != d1g.C) {
                throw new GeneralSecurityException("Unable to serialize HashType ".concat(d1gVar.b));
            }
            apgVar = apg.SHA512;
        }
        dogVarW.c();
        ((fog) dogVarW.b).y(apgVar);
        grg grgVar = prgVar.b;
        int i2 = 4;
        if (grgVar.equals(grg.c)) {
            i = 4;
        } else if (grgVar == grg.d) {
            i = 5;
        } else {
            if (grgVar != grg.e) {
                throw new GeneralSecurityException("Unable to serialize CurveType ".concat(grgVar.a));
            }
            i = 6;
        }
        dogVarW.c();
        ((fog) dogVarW.b).B(i);
        d2g d2gVar = prgVar.a;
        if (d2gVar.equals(d2g.f)) {
            i2 = 3;
        } else if (d2gVar != d2g.g) {
            throw new GeneralSecurityException("Unable to serialize SignatureEncoding ".concat(d2gVar.b));
        }
        dogVarW.c();
        ((fog) dogVarW.b).C(i2);
        fog fogVar = (fog) dogVarW.e();
        logVarA.c();
        ((nog) logVarA.b).D(fogVar);
        byte[] bArrQ = kk7.Q(eCPoint.getAffineX(), iD);
        omf omfVar = pmf.b;
        omf omfVarC = pmf.C(bArrQ, 0, bArrQ.length);
        logVarA.c();
        ((nog) logVarA.b).E(omfVarC);
        byte[] bArrQ2 = kk7.Q(eCPoint.getAffineY(), iD);
        omf omfVarC2 = pmf.C(bArrQ2, 0, bArrQ2.length);
        logVarA.c();
        ((nog) logVarA.b).F(omfVarC2);
        return (nog) logVarA.e();
    }

    public static grg f(int i) throws GeneralSecurityException {
        int i2 = i - 2;
        if (i2 == 2) {
            return grg.c;
        }
        if (i2 == 3) {
            return grg.d;
        }
        if (i2 == 4) {
            return grg.e;
        }
        if (i != 1) {
            throw new GeneralSecurityException(b09.A(new StringBuilder(String.valueOf(i2).length() + 35), i2, "Unable to parse EllipticCurveType: "));
        }
        tnf.a();
        throw null;
    }

    public static d2g g(int i) throws GeneralSecurityException {
        int i2 = i - 2;
        if (i2 == 1) {
            return d2g.f;
        }
        if (i2 == 2) {
            return d2g.g;
        }
        if (i != 1) {
            throw new GeneralSecurityException(b09.A(new StringBuilder(String.valueOf(i2).length() + 40), i2, "Unable to parse EcdsaSignatureEncoding: "));
        }
        tnf.a();
        throw null;
    }

    public static d1g c(e1g e1gVar) throws GeneralSecurityException {
        if (e1gVar == e1g.k) {
            return d1g.D;
        }
        if (e1gVar == e1g.n) {
            return d1g.E;
        }
        if (e1gVar == e1g.l) {
            return d1g.F;
        }
        if (e1gVar == e1g.m) {
            return d1g.G;
        }
        throw new GeneralSecurityException(gYpYQDQkhfs.aXlJMCUZUWRuhgu.concat(e1gVar.b));
    }
}

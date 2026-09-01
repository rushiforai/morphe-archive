package defpackage;

import j$.util.DesugarCollections;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class elf {
    public static final omg a;
    public static final kmg b;
    public static final skg c;
    public static final okg d;
    public static final skg e;
    public static final okg f;
    public static final pif g;

    static {
        cmf cmfVarA = aog.a("type.googleapis.com/google.crypto.tink.RsaSsaPkcs1PrivateKey");
        cmf cmfVarA2 = aog.a("type.googleapis.com/google.crypto.tink.RsaSsaPkcs1PublicKey");
        a = new omg(dug.class);
        b = new kmg(cmfVarA);
        c = new skg(iug.class, rbg.c);
        d = new okg(cmfVarA2, ubg.b);
        e = new skg(fug.class, z46.z);
        f = new okg(cmfVarA, cd7.m);
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        apg apgVar = apg.SHA256;
        aug augVar = aug.b;
        map.put(apgVar, augVar);
        map2.put(augVar, apgVar);
        apg apgVar2 = apg.SHA384;
        aug augVar2 = aug.c;
        map.put(apgVar2, augVar2);
        map2.put(augVar2, apgVar2);
        apg apgVar3 = apg.SHA512;
        aug augVar3 = aug.d;
        map.put(apgVar3, augVar3);
        map2.put(augVar3, apgVar3);
        g = new pif(DesugarCollections.unmodifiableMap(map), DesugarCollections.unmodifiableMap(map2));
    }

    public static e1g a(d1g d1gVar) throws GeneralSecurityException {
        if (d1gVar == d1g.K) {
            return e1g.m;
        }
        if (d1gVar == d1g.H) {
            return e1g.k;
        }
        if (d1gVar == d1g.I) {
            return e1g.n;
        }
        if (d1gVar == d1g.J) {
            return e1g.l;
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(d1gVar)));
    }

    public static d1g b(e1g e1gVar) throws GeneralSecurityException {
        if (e1gVar == e1g.m) {
            return d1g.K;
        }
        if (e1gVar == e1g.k) {
            return d1g.H;
        }
        if (e1gVar == e1g.n) {
            return d1g.I;
        }
        if (e1gVar == e1g.l) {
            return d1g.J;
        }
        throw new GeneralSecurityException("Unable to parse OutputPrefixType: ".concat(e1gVar.b));
    }

    public static sqg c(iug iugVar) {
        pqg pqgVarA = sqg.A();
        dug dugVar = iugVar.i;
        hqg hqgVarW = jqg.w();
        apg apgVar = (apg) g.e(dugVar.d);
        hqgVarW.c();
        ((jqg) hqgVarW.b).y(apgVar);
        jqg jqgVar = (jqg) hqgVarW.e();
        pqgVarA.c();
        ((sqg) pqgVarA.b).D(jqgVar);
        byte[] bArrN = kk7.N(iugVar.j);
        omf omfVar = pmf.b;
        omf omfVarC = pmf.C(bArrN, 0, bArrN.length);
        pqgVarA.c();
        ((sqg) pqgVarA.b).E(omfVarC);
        byte[] bArrN2 = kk7.N(iugVar.i.b);
        omf omfVarC2 = pmf.C(bArrN2, 0, bArrN2.length);
        pqgVarA.c();
        ((sqg) pqgVarA.b).F(omfVarC2);
        return (sqg) pqgVarA.e();
    }

    public static ujf d(pmf pmfVar) {
        return new ujf(7, new BigInteger(1, pmfVar.E()));
    }
}

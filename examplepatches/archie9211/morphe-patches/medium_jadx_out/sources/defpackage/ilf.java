package defpackage;

import j$.util.DesugarCollections;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ilf {
    public static final omg a;
    public static final kmg b;
    public static final skg c;
    public static final okg d;
    public static final skg e;
    public static final okg f;
    public static final pif g;

    static {
        cmf cmfVarA = aog.a("type.googleapis.com/google.crypto.tink.RsaSsaPssPrivateKey");
        cmf cmfVarA2 = aog.a("type.googleapis.com/google.crypto.tink.RsaSsaPssPublicKey");
        a = new omg(qug.class);
        b = new kmg(cmfVarA);
        c = new skg(tug.class, tz7.p);
        d = new okg(cmfVarA2, wz7.k);
        e = new skg(sug.class, u3b.p);
        f = new okg(cmfVarA, y3b.n);
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        apg apgVar = apg.SHA256;
        oug ougVar = oug.b;
        map.put(apgVar, ougVar);
        map2.put(ougVar, apgVar);
        apg apgVar2 = apg.SHA384;
        oug ougVar2 = oug.c;
        map.put(apgVar2, ougVar2);
        map2.put(ougVar2, apgVar2);
        apg apgVar3 = apg.SHA512;
        oug ougVar3 = oug.d;
        map.put(apgVar3, ougVar3);
        map2.put(ougVar3, apgVar3);
        g = new pif(DesugarCollections.unmodifiableMap(map), DesugarCollections.unmodifiableMap(map2));
    }

    public static e1g a(zwf zwfVar) throws GeneralSecurityException {
        if (zwfVar == zwf.s) {
            return e1g.m;
        }
        if (zwfVar == zwf.p) {
            return e1g.k;
        }
        if (zwfVar == zwf.q) {
            return e1g.n;
        }
        if (zwfVar == zwf.r) {
            return e1g.l;
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(zwfVar)));
    }

    public static zwf b(e1g e1gVar) throws GeneralSecurityException {
        if (e1gVar == e1g.m) {
            return zwf.s;
        }
        if (e1gVar == e1g.k) {
            return zwf.p;
        }
        if (e1gVar == e1g.n) {
            return zwf.q;
        }
        if (e1gVar == e1g.l) {
            return zwf.r;
        }
        throw new GeneralSecurityException("Unable to parse OutputPrefixType: ".concat(e1gVar.b));
    }

    public static crg c(tug tugVar) {
        arg argVarA = crg.A();
        qug qugVar = tugVar.i;
        uqg uqgVarY = vqg.y();
        oug ougVar = qugVar.d;
        pif pifVar = g;
        apg apgVar = (apg) pifVar.e(ougVar);
        uqgVarY.c();
        ((vqg) uqgVarY.b).A(apgVar);
        apg apgVar2 = (apg) pifVar.e(qugVar.e);
        uqgVarY.c();
        ((vqg) uqgVarY.b).B(apgVar2);
        int i = qugVar.f;
        uqgVarY.c();
        ((vqg) uqgVarY.b).C(i);
        vqg vqgVar = (vqg) uqgVarY.e();
        argVarA.c();
        ((crg) argVarA.b).E(vqgVar);
        byte[] bArrN = kk7.N(tugVar.j);
        omf omfVar = pmf.b;
        omf omfVarC = pmf.C(bArrN, 0, bArrN.length);
        argVarA.c();
        ((crg) argVarA.b).F(omfVarC);
        byte[] bArrN2 = kk7.N(tugVar.i.b);
        omf omfVarC2 = pmf.C(bArrN2, 0, bArrN2.length);
        argVarA.c();
        ((crg) argVarA.b).G(omfVarC2);
        argVarA.c();
        ((crg) argVarA.b).D(0);
        return (crg) argVarA.e();
    }

    public static ujf d(pmf pmfVar) {
        return new ujf(7, new BigInteger(1, pmfVar.E()));
    }
}

package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class pvg {
    public static final omg a;
    public static final kmg b;
    public static final skg c;
    public static final okg d;
    public static final skg e;
    public static final okg f;

    static {
        cmf cmfVarA = aog.a("type.googleapis.com/google.crypto.tink.Ed25519PrivateKey");
        cmf cmfVarA2 = aog.a("type.googleapis.com/google.crypto.tink.Ed25519PublicKey");
        a = new omg(esg.class);
        b = new kmg(cmfVarA);
        c = new skg(nsg.class, q9g.b);
        d = new okg(cmfVarA2, s9g.b);
        e = new skg(fsg.class, t9g.a);
        f = new okg(cmfVarA, pbg.b);
    }

    public static e1g a(b3g b3gVar) throws GeneralSecurityException {
        if (b3gVar == b3g.i) {
            return e1g.m;
        }
        if (b3gVar == b3g.f) {
            return e1g.k;
        }
        if (b3gVar == b3g.g) {
            return e1g.n;
        }
        if (b3gVar == b3g.h) {
            return e1g.l;
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(b3gVar.b));
    }

    public static b3g b(e1g e1gVar) throws GeneralSecurityException {
        if (e1gVar == e1g.m) {
            return b3g.i;
        }
        if (e1gVar == e1g.k) {
            return b3g.f;
        }
        if (e1gVar == e1g.n) {
            return b3g.g;
        }
        if (e1gVar == e1g.l) {
            return b3g.h;
        }
        throw new GeneralSecurityException("Unable to parse OutputPrefixType: ".concat(e1gVar.b));
    }

    public static wog c(nsg nsgVar) {
        vog vogVarY = wog.y();
        byte[] bArrB = nsgVar.j.b();
        omf omfVarC = pmf.C(bArrB, 0, bArrB.length);
        vogVarY.c();
        ((wog) vogVarY.b).B(omfVarC);
        return (wog) vogVarY.e();
    }
}

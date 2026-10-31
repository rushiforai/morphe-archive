package o40;

import com.google.crypto.tink.shaded.protobuf.InvalidProtocolBufferException;
import com.google.crypto.tink.shaded.protobuf.p;
import com.vungle.ads.internal.util.m;
import com.vungle.ads.internal.util.n;
import el.g;
import h6.c1;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.NoSuchProviderException;
import java.security.Provider;
import java.security.Signature;
import java.security.interfaces.ECPublicKey;
import java.security.interfaces.RSAPrivateCrtKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.ECPoint;
import java.security.spec.ECPublicKeySpec;
import java.security.spec.RSAPrivateCrtKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.util.Objects;
import kl.e0;
import kl.g0;
import kl.l0;
import kl.o;
import kl.p0;
import kl.q0;
import kl.w0;
import l1.a2;
import pl.b2;
import pl.d2;
import pl.e2;
import pl.f1;
import pl.f2;
import pl.g2;
import pl.h2;
import pl.i0;
import pl.i1;
import pl.i2;
import pl.j0;
import pl.j1;
import pl.k2;
import pl.m0;
import pl.n0;
import pl.r0;
import pl.s0;
import pl.t0;
import pl.v0;
import pl.x0;
import ql.a0;
import ql.b0;
import ql.c;
import ql.c0;
import ql.d0;
import ql.e;
import ql.h;
import ql.i;
import ql.k;
import ql.r;
import ql.s;
import ql.t;
import ql.u;
import ql.v;
import ql.w;
import rl.d;
import sl.f;
import sl.j;
import sl.l;
import sl.q;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements m, l0, cf.b, g0, e0, o, kl.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79523a;

    public /* synthetic */ b(int i5) {
        this.f79523a = i5;
    }

    @Override // com.vungle.ads.internal.util.m
    public ObjectInputStream a(InputStream inputStream) {
        return n.a(inputStream);
    }

    @Override // cf.b
    public boolean b(int i5, int i11, int i12, int i13, int i14) {
        if (i11 == 67 && i12 == 79 && i13 == 77 && (i14 == 77 || i5 == 2)) {
            return true;
        }
        if (i11 == 77 && i12 == 76 && i13 == 76) {
            return i14 == 84 || i5 == 2;
        }
        return false;
    }

    @Override // kl.e0
    public g c(q0 q0Var) throws GeneralSecurityException {
        switch (this.f79523a) {
            case 14:
                j1 j1Var = (j1) q0Var.f71630b;
                if (!j1Var.A().equals("type.googleapis.com/google.crypto.tink.EcdsaPrivateKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to EcdsaProtoSerialization.parseParameters: " + j1Var.A());
                }
                try {
                    j0 j0VarY = j0.y(j1Var.B(), p.a());
                    a2 a2VarB = c.b();
                    a2VarB.f73009c = rl.a.e(j0VarY.w().B());
                    a2VarB.f73007a = rl.a.g(j0VarY.w().A());
                    a2VarB.f73008b = rl.a.d(j0VarY.w().y());
                    a2VarB.f73010d = rl.a.h(j1Var.z());
                    return a2VarB.e();
                } catch (InvalidProtocolBufferException e3) {
                    throw new GeneralSecurityException("Parsing EcdsaParameters failed: ", e3);
                }
            case 20:
                j1 j1Var2 = (j1) q0Var.f71630b;
                if (!j1Var2.A().equals("type.googleapis.com/google.crypto.tink.Ed25519PrivateKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to Ed25519ProtoSerialization.parseParameters: " + j1Var2.A());
                }
                try {
                    if (r0.x(j1Var2.B(), p.a()).w() == 0) {
                        return new h((ql.g) d.f86063g.f(j1Var2.z()));
                    }
                    throw new GeneralSecurityException("Only version 0 keys are accepted");
                } catch (InvalidProtocolBufferException e11) {
                    throw new GeneralSecurityException("Parsing Ed25519Parameters failed: ", e11);
                }
            default:
                j1 j1Var3 = (j1) q0Var.f71630b;
                if (!j1Var3.A().equals("type.googleapis.com/google.crypto.tink.RsaSsaPkcs1PrivateKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to RsaSsaPkcs1ProtoSerialization.parseParameters: " + j1Var3.A());
                }
                try {
                    e2 e2VarC = e2.C(j1Var3.B(), p.a());
                    r rVarB = u.b();
                    rVarB.f84202c = (s) rl.h.f86081h.f(e2VarC.z().x());
                    rVarB.f84201b = kl.a.h(e2VarC.A().h());
                    rVarB.f84200a = Integer.valueOf(e2VarC.y());
                    rVarB.f84203d = (t) rl.h.f86080g.f(j1Var3.z());
                    return rVarB.a();
                } catch (InvalidProtocolBufferException e12) {
                    throw new GeneralSecurityException("Parsing RsaSsaPkcs1Parameters failed: ", e12);
                }
        }
    }

    @Override // kl.g0
    public q0 d(g gVar) {
        switch (this.f79523a) {
            case 13:
                c cVar = (c) gVar;
                i1 i1VarC = j1.C();
                i1VarC.g("type.googleapis.com/google.crypto.tink.EcdsaPrivateKey");
                i0 i0VarX = j0.x();
                pl.l0 l0VarB = rl.a.b(cVar);
                i0VarX.e();
                j0.v((j0) i0VarX.f34674b, l0VarB);
                i1VarC.h(((j0) i0VarX.a()).e());
                i1VarC.f(rl.a.f(cVar.f84131d));
                return q0.c((j1) i1VarC.a());
            case 19:
                i1 i1VarC2 = j1.C();
                i1VarC2.g("type.googleapis.com/google.crypto.tink.Ed25519PrivateKey");
                i1VarC2.h(r0.v().e());
                i1VarC2.f((b2) d.f86063g.j(((h) gVar).f84166a));
                return q0.c((j1) i1VarC2.a());
            default:
                u uVar = (u) gVar;
                i1 i1VarC3 = j1.C();
                i1VarC3.g("type.googleapis.com/google.crypto.tink.RsaSsaPkcs1PrivateKey");
                d2 d2VarB = e2.B();
                f2 f2VarY = g2.y();
                x0 x0Var = (x0) rl.h.f86081h.j(uVar.f84217d);
                f2VarY.e();
                g2.v((g2) f2VarY.f34674b, x0Var);
                g2 g2Var = (g2) f2VarY.a();
                d2VarB.e();
                e2.v((e2) d2VarB.f34674b, g2Var);
                int i5 = uVar.f84214a;
                d2VarB.e();
                e2.w((e2) d2VarB.f34674b, i5);
                com.google.crypto.tink.shaded.protobuf.g gVarB = rl.h.b(uVar.f84215b);
                d2VarB.e();
                e2.x((e2) d2VarB.f34674b, gVarB);
                i1VarC3.h(((e2) d2VarB.a()).e());
                i1VarC3.f((b2) rl.h.f86080g.j(uVar.f84216c));
                return q0.c((j1) i1VarC3.a());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0172  */
    @Override // kl.l0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object e(bh.g gVar) throws GeneralSecurityException {
        Provider providerN;
        int i5 = this.f79523a;
        ql.g gVar2 = ql.g.f84163d;
        b2 b2Var = b2.LEGACY;
        a0 a0Var = a0.f84107d;
        switch (i5) {
            case 1:
                ql.d dVar = (ql.d) gVar;
                Provider providerN2 = kl.a.n();
                l lVar = (l) rl.c.f86048i.j(dVar.f84139c.f84145c.f84130c);
                x7.l lVar2 = rl.c.f86049j;
                e eVar = dVar.f84139c;
                x7.l lVar3 = rl.c.f86050k;
                c cVar = eVar.f84145c;
                dVar.o0().b();
                if (cVar.f84131d.equals(ql.b.f84117j)) {
                    byte[] bArr = rl.b.f86042b;
                } else {
                    byte[] bArr2 = rl.b.f86041a;
                }
                rl.b bVar = new rl.b();
                if (!c1.c(2)) {
                    throw new GeneralSecurityException("Can not use ECDSA in FIPS-mode, as BoringCrypto is not available.");
                }
                sl.s.d(lVar);
                StringBuilder sb2 = new StringBuilder();
                sb2.append(lVar);
                sb2.append("withECDSA");
                return bVar;
            case 2:
                e eVar2 = (e) gVar;
                byte[] bArr3 = rl.c.f86046g;
                Provider providerN3 = kl.a.n();
                x7.l lVar4 = rl.c.f86050k;
                c cVar2 = eVar2.f84145c;
                return new rl.c((ECPublicKey) (providerN3 != null ? KeyFactory.getInstance("EC", providerN3) : (KeyFactory) j.f87513f.f87514a.a("EC")).generatePublic(new ECPublicKeySpec(eVar2.f84146d, sl.d.e((sl.g) lVar4.j(cVar2.f84129b)))), (l) rl.c.f86048i.j(cVar2.f84130c), (sl.h) rl.c.f86049j.j(cVar2.f84128a), eVar2.f84147e.b(), cVar2.f84131d.equals(ql.b.f84117j) ? rl.c.f86047h : rl.c.f86046g, providerN3);
            case 3:
                i iVar = (i) gVar;
                if (!c1.b(1)) {
                    throw new GeneralSecurityException("Can not use Ed25519 in FIPS-mode.");
                }
                try {
                    return rl.b.a(iVar);
                } catch (GeneralSecurityException unused) {
                    byte[] bArrB = ((tl.a) iVar.f84168d.f88562b).b();
                    iVar.o0().b();
                    iVar.f84167c.f84175c.f84166a.equals(gVar2);
                    f fVar = new f();
                    if (!c1.b(1)) {
                        throw new GeneralSecurityException("Can not use Ed25519 in FIPS-mode.");
                    }
                    if (bArrB.length != 32) {
                        throw new IllegalArgumentException("Given private key's length is not 32");
                    }
                    kl.a.q(kl.a.j(bArrB)).D();
                    return fVar;
                }
            case 4:
                k kVar = (k) gVar;
                if (!c1.b(1)) {
                    throw new GeneralSecurityException("Can not use Ed25519 in FIPS-mode.");
                }
                try {
                    return rl.e.b(kVar);
                } catch (GeneralSecurityException unused2) {
                    return new rl.f(kVar.f84176d.b(), kVar.f84177e.b(), kVar.f84175c.f84166a.equals(gVar2) ? new byte[]{0} : new byte[0]);
                }
            case 5:
                p0 p0Var = ((kl.s) gVar).f71634c;
                f1 f1Var = p0Var.f71623d;
                rl.f.b(p0Var);
                p0Var.f71624e.equals(b2Var);
                return new rl.b();
            case 6:
                p0 p0Var2 = ((kl.s) gVar).f71634c;
                f1 f1Var2 = p0Var2.f71623d;
                return new rl.f((el.i) kl.k.f71606d.a(el.i.class, p0Var2.f71620a).a(p0Var2.f71622c), rl.f.b(p0Var2), p0Var2.f71624e.equals(b2Var) ? new byte[]{0} : new byte[0]);
            case 7:
                v vVar = (v) gVar;
                int i11 = w0.f71650a;
                if (Objects.equals(System.getProperty("java.vendor"), "The Android Project")) {
                    providerN = (!Objects.equals(System.getProperty("java.vendor"), "The Android Project") ? null : kl.a.i()).intValue() > 21 ? kl.a.n() : null;
                }
                Provider provider = providerN;
                KeyFactory keyFactory = provider != null ? KeyFactory.getInstance("RSA", provider) : (KeyFactory) j.f87513f.f87514a.a("RSA");
                w wVar = vVar.f84218c;
                BigInteger bigInteger = wVar.f84226d;
                u uVar = wVar.f84225c;
                rl.i iVar2 = new rl.i((RSAPrivateCrtKey) keyFactory.generatePrivate(new RSAPrivateCrtKeySpec(bigInteger, uVar.f84215b, (BigInteger) vVar.f84219d.f88562b, (BigInteger) vVar.f84220e.f88562b, (BigInteger) vVar.f84221f.f88562b, (BigInteger) vVar.f84222g.f88562b, (BigInteger) vVar.f84223h.f88562b, (BigInteger) vVar.f84224i.f88562b)), uVar.f84217d, vVar.o0().b(), uVar.f84216c.equals(t.f84210d) ? rl.i.f86083h : rl.i.f86082g, provider != null ? rl.j.b(wVar, provider) : sl.o.b(wVar), provider);
                String str = iVar2.f86086b;
                Provider provider2 = iVar2.f86090f;
                Signature signature = provider2 != null ? Signature.getInstance(str, provider2) : (Signature) j.f87511d.f87514a.a(str);
                signature.initSign(iVar2.f86085a);
                byte[] bArr4 = rl.i.f86084i;
                signature.update(bArr4);
                byte[] bArr5 = iVar2.f86088d;
                if (bArr5.length > 0) {
                    signature.update(bArr5);
                }
                byte[] bArrSign = signature.sign();
                byte[] bArr6 = iVar2.f86087c;
                if (bArr6.length > 0) {
                    bArrSign = sl.d.a(bArr6, bArrSign);
                }
                try {
                    iVar2.f86089e.a(bArrSign, bArr4);
                    return iVar2;
                } catch (GeneralSecurityException e3) {
                    throw new IllegalStateException("RSA signature computation error", e3);
                }
            case 8:
                return sl.o.b((w) gVar);
            case 9:
                c0 c0Var = (c0) gVar;
                try {
                    return rl.b.b(c0Var);
                } catch (NoSuchProviderException unused3) {
                    KeyFactory keyFactory2 = (KeyFactory) j.f87513f.f87514a.a("RSA");
                    d0 d0Var = c0Var.f84132c;
                    d0 d0Var2 = c0Var.f84132c;
                    BigInteger bigInteger2 = d0Var.f84142d;
                    b0 b0Var = d0Var2.f84141c;
                    b0 b0Var2 = d0Var2.f84141c;
                    RSAPrivateCrtKey rSAPrivateCrtKey = (RSAPrivateCrtKey) keyFactory2.generatePrivate(new RSAPrivateCrtKeySpec(bigInteger2, b0Var.f84123b, (BigInteger) c0Var.f84133d.f88562b, (BigInteger) c0Var.f84134e.f88562b, (BigInteger) c0Var.f84135f.f88562b, (BigInteger) c0Var.f84136g.f88562b, (BigInteger) c0Var.f84137h.f88562b, (BigInteger) c0Var.f84138i.f88562b));
                    l lVar5 = (l) sl.r.f87536a.j(b0Var2.f84125d);
                    l lVar6 = (l) sl.r.f87536a.j(b0Var2.f84126e);
                    int i12 = b0Var2.f84127f;
                    c0Var.o0().b();
                    b0Var2.f84124c.equals(a0Var);
                    f fVar2 = new f();
                    if (jl.a.a()) {
                        throw new GeneralSecurityException("Can not use RSA PSS in FIPS-mode, as BoringCrypto module is not available.");
                    }
                    sl.s.d(lVar5);
                    if (!lVar5.equals(lVar6)) {
                        throw new GeneralSecurityException("sigHash and mgf1Hash must be the same");
                    }
                    sl.s.b(rSAPrivateCrtKey.getModulus().bitLength());
                    sl.s.c(rSAPrivateCrtKey.getPublicExponent());
                    return fVar2;
                }
            default:
                d0 d0Var3 = (d0) gVar;
                x7.l lVar7 = sl.r.f87536a;
                try {
                    return rl.l.b(d0Var3);
                } catch (NoSuchProviderException unused4) {
                    KeyFactory keyFactory3 = (KeyFactory) j.f87513f.f87514a.a("RSA");
                    BigInteger bigInteger3 = d0Var3.f84142d;
                    b0 b0Var3 = d0Var3.f84141c;
                    return new q((RSAPublicKey) keyFactory3.generatePublic(new RSAPublicKeySpec(bigInteger3, b0Var3.f84123b)), (l) lVar7.j(b0Var3.f84125d), (l) lVar7.j(b0Var3.f84126e), b0Var3.f84127f, d0Var3.f84143e.b(), b0Var3.f84124c.equals(a0Var) ? sl.r.f87538c : sl.r.f87537b);
                }
        }
    }

    @Override // kl.o
    public p0 f(bh.g gVar) throws GeneralSecurityException {
        switch (this.f79523a) {
            case 15:
                e eVar = (e) gVar;
                return p0.a("type.googleapis.com/google.crypto.tink.EcdsaPublicKey", rl.a.c(eVar).e(), f1.ASYMMETRIC_PUBLIC, rl.a.f(eVar.f84145c.f84131d), eVar.f84148f);
            case 17:
                ql.d dVar = (ql.d) gVar;
                int iA = rl.a.a(dVar.f84139c.f84145c.f84129b);
                m0 m0VarA = n0.A();
                e eVar2 = dVar.f84139c;
                pl.p0 p0VarC = rl.a.c(eVar2);
                m0VarA.e();
                n0.v((n0) m0VarA.f34674b, p0VarC);
                byte[] bArrX = kl.a.x(iA, (BigInteger) dVar.f84140d.f88562b);
                com.google.crypto.tink.shaded.protobuf.g gVarE = com.google.crypto.tink.shaded.protobuf.i.e(0, bArrX.length, bArrX);
                m0VarA.e();
                n0.w((n0) m0VarA.f34674b, gVarE);
                return p0.a("type.googleapis.com/google.crypto.tink.EcdsaPrivateKey", ((n0) m0VarA.a()).e(), f1.ASYMMETRIC_PRIVATE, rl.a.f(eVar2.f84145c.f84131d), dVar.W());
            case 21:
                k kVar = (k) gVar;
                return p0.a("type.googleapis.com/google.crypto.tink.Ed25519PublicKey", d.a(kVar).e(), f1.ASYMMETRIC_PUBLIC, (b2) d.f86063g.j(kVar.f84175c.f84166a), kVar.f84178f);
            case 23:
                i iVar = (i) gVar;
                s0 s0VarA = t0.A();
                v0 v0VarA = d.a(iVar.f84167c);
                s0VarA.e();
                t0.w((t0) s0VarA.f34674b, v0VarA);
                byte[] bArrB = ((tl.a) iVar.f84168d.f88562b).b();
                com.google.crypto.tink.shaded.protobuf.g gVarE2 = com.google.crypto.tink.shaded.protobuf.i.e(0, bArrB.length, bArrB);
                s0VarA.e();
                t0.v((t0) s0VarA.f34674b, gVarE2);
                return p0.a("type.googleapis.com/google.crypto.tink.Ed25519PrivateKey", ((t0) s0VarA.a()).e(), f1.ASYMMETRIC_PRIVATE, (b2) d.f86063g.j(iVar.f84167c.f84175c.f84166a), iVar.W());
            case 27:
                w wVar = (w) gVar;
                return p0.a("type.googleapis.com/google.crypto.tink.RsaSsaPkcs1PublicKey", rl.h.c(wVar).e(), f1.ASYMMETRIC_PUBLIC, (b2) rl.h.f86080g.j(wVar.f84225c.f84216c), wVar.f84228f);
            default:
                v vVar = (v) gVar;
                h2 h2VarL = i2.L();
                h2VarL.e();
                i2.v((i2) h2VarL.f34674b);
                k2 k2VarC = rl.h.c(vVar.f84218c);
                h2VarL.e();
                i2.A((i2) h2VarL.f34674b, k2VarC);
                com.google.crypto.tink.shaded.protobuf.g gVarB = rl.h.b((BigInteger) vVar.f84219d.f88562b);
                h2VarL.e();
                i2.B((i2) h2VarL.f34674b, gVarB);
                com.google.crypto.tink.shaded.protobuf.g gVarB2 = rl.h.b((BigInteger) vVar.f84220e.f88562b);
                h2VarL.e();
                i2.C((i2) h2VarL.f34674b, gVarB2);
                com.google.crypto.tink.shaded.protobuf.g gVarB3 = rl.h.b((BigInteger) vVar.f84221f.f88562b);
                h2VarL.e();
                i2.w((i2) h2VarL.f34674b, gVarB3);
                com.google.crypto.tink.shaded.protobuf.g gVarB4 = rl.h.b((BigInteger) vVar.f84222g.f88562b);
                h2VarL.e();
                i2.x((i2) h2VarL.f34674b, gVarB4);
                com.google.crypto.tink.shaded.protobuf.g gVarB5 = rl.h.b((BigInteger) vVar.f84223h.f88562b);
                h2VarL.e();
                i2.y((i2) h2VarL.f34674b, gVarB5);
                com.google.crypto.tink.shaded.protobuf.g gVarB6 = rl.h.b((BigInteger) vVar.f84224i.f88562b);
                h2VarL.e();
                i2.z((i2) h2VarL.f34674b, gVarB6);
                return p0.a("type.googleapis.com/google.crypto.tink.RsaSsaPkcs1PrivateKey", ((i2) h2VarL.a()).e(), f1.ASYMMETRIC_PRIVATE, (b2) rl.h.f86080g.j(vVar.f84218c.f84225c.f84216c), vVar.W());
        }
    }

    @Override // kl.m
    public bh.g h(kl.s0 s0Var) throws GeneralSecurityException {
        p0 p0Var = (p0) s0Var;
        switch (this.f79523a) {
            case 16:
                if (!p0Var.f71620a.equals("type.googleapis.com/google.crypto.tink.EcdsaPublicKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to EcdsaProtoSerialization.parsePublicKey: " + p0Var.f71620a);
                }
                try {
                    pl.p0 p0VarE = pl.p0.E(p0Var.f71622c, p.a());
                    if (p0VarE.A() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    a2 a2VarB = c.b();
                    a2VarB.f73009c = rl.a.e(p0VarE.z().B());
                    a2VarB.f73007a = rl.a.g(p0VarE.z().A());
                    a2VarB.f73008b = rl.a.d(p0VarE.z().y());
                    a2VarB.f73010d = rl.a.h(p0Var.f71624e);
                    c cVarE = a2VarB.e();
                    mh.c cVar = new mh.c(11, false);
                    cVar.f76324c = null;
                    cVar.f76325d = null;
                    cVar.f76323b = cVarE;
                    cVar.f76324c = new ECPoint(kl.a.h(p0VarE.B().h()), kl.a.h(p0VarE.C().h()));
                    cVar.f76325d = p0Var.f71625f;
                    return cVar.w();
                } catch (InvalidProtocolBufferException | IllegalArgumentException unused) {
                    throw new GeneralSecurityException("Parsing EcdsaPublicKey failed");
                }
            case 18:
                if (!p0Var.f71620a.equals("type.googleapis.com/google.crypto.tink.EcdsaPrivateKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to EcdsaProtoSerialization.parsePrivateKey: " + p0Var.f71620a);
                }
                try {
                    n0 n0VarB = n0.B(p0Var.f71622c, p.a());
                    if (n0VarB.z() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    pl.p0 p0VarY = n0VarB.y();
                    if (p0VarY.A() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    a2 a2VarB2 = c.b();
                    a2VarB2.f73009c = rl.a.e(p0VarY.z().B());
                    a2VarB2.f73007a = rl.a.g(p0VarY.z().A());
                    a2VarB2.f73008b = rl.a.d(p0VarY.z().y());
                    a2VarB2.f73010d = rl.a.h(p0Var.f71624e);
                    c cVarE2 = a2VarB2.e();
                    mh.c cVar2 = new mh.c(11, false);
                    cVar2.f76324c = null;
                    cVar2.f76325d = null;
                    cVar2.f76323b = cVarE2;
                    cVar2.f76324c = new ECPoint(kl.a.h(p0VarY.B().h()), kl.a.h(p0VarY.C().h()));
                    cVar2.f76325d = p0Var.f71625f;
                    e eVarW = cVar2.w();
                    nx.l lVar = new nx.l();
                    lVar.f78645b = null;
                    lVar.f78644a = eVarW;
                    lVar.f78645b = new t5.d0(kl.a.h(n0VarB.x().h()), 1);
                    return lVar.c();
                } catch (InvalidProtocolBufferException | IllegalArgumentException unused2) {
                    throw new GeneralSecurityException("Parsing EcdsaPrivateKey failed");
                }
            case 22:
                if (!p0Var.f71620a.equals("type.googleapis.com/google.crypto.tink.Ed25519PublicKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to Ed25519ProtoSerialization.parsePublicKey: " + p0Var.f71620a);
                }
                try {
                    v0 v0VarA = v0.A(p0Var.f71622c, p.a());
                    if (v0VarA.y() == 0) {
                        return k.p0((ql.g) d.f86063g.f(p0Var.f71624e), tl.a.a(v0VarA.x().h()), p0Var.f71625f);
                    }
                    throw new GeneralSecurityException("Only version 0 keys are accepted");
                } catch (InvalidProtocolBufferException unused3) {
                    throw new GeneralSecurityException("Parsing Ed25519PublicKey failed");
                }
            case 24:
                if (!p0Var.f71620a.equals("type.googleapis.com/google.crypto.tink.Ed25519PrivateKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to Ed25519ProtoSerialization.parsePrivateKey: " + p0Var.f71620a);
                }
                try {
                    t0 t0VarB = t0.B(p0Var.f71622c, p.a());
                    if (t0VarB.z() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    v0 v0VarY = t0VarB.y();
                    if (v0VarY.y() == 0) {
                        return i.q0(k.p0((ql.g) d.f86063g.f(p0Var.f71624e), tl.a.a(v0VarY.x().h()), p0Var.f71625f), new t5.d0(tl.a.a(t0VarB.x().h()), 2));
                    }
                    throw new GeneralSecurityException("Only version 0 keys are accepted");
                } catch (InvalidProtocolBufferException unused4) {
                    throw new GeneralSecurityException("Parsing Ed25519PrivateKey failed");
                }
            default:
                if (!p0Var.f71620a.equals("type.googleapis.com/google.crypto.tink.RsaSsaPkcs1PublicKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to RsaSsaPkcs1ProtoSerialization.parsePublicKey: " + p0Var.f71620a);
                }
                try {
                    k2 k2VarE = k2.E(p0Var.f71622c, p.a());
                    if (k2VarE.C() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    BigInteger bigIntegerH = kl.a.h(k2VarE.A().h());
                    int iBitLength = bigIntegerH.bitLength();
                    r rVarB = u.b();
                    rVarB.f84202c = (s) rl.h.f86081h.f(k2VarE.B().x());
                    rVarB.f84201b = kl.a.h(k2VarE.z().h());
                    rVarB.f84200a = Integer.valueOf(iBitLength);
                    rVarB.f84203d = (t) rl.h.f86080g.f(p0Var.f71624e);
                    u uVarA = rVarB.a();
                    mh.c cVar3 = new mh.c(12, false);
                    cVar3.f76323b = uVarA;
                    cVar3.f76324c = bigIntegerH;
                    cVar3.f76325d = p0Var.f71625f;
                    return cVar3.x();
                } catch (InvalidProtocolBufferException | IllegalArgumentException unused5) {
                    throw new GeneralSecurityException("Parsing RsaSsaPkcs1PublicKey failed");
                }
        }
    }
}

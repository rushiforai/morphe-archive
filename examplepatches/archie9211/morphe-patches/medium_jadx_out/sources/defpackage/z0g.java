package defpackage;

import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.interfaces.ECPrivateKey;
import java.security.interfaces.ECPublicKey;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.security.spec.EllipticCurve;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class z0g {
    public final /* synthetic */ int a;

    public /* synthetic */ z0g(int i) {
        this.a = i;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final gr7 a(bzf bzfVar, Integer num) throws GeneralSecurityException {
        ECParameterSpec eCParameterSpec;
        xug xugVar;
        byte[] bArr;
        qvg qvgVarA;
        ujf ujfVar;
        int i = 24;
        int i2 = 28;
        int i3 = 0;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        Object[] objArr4 = 0;
        switch (this.a) {
            case 0:
                f1g f1gVar = (f1g) bzfVar;
                int i4 = f1gVar.a;
                if (i4 != 16 && i4 != 32) {
                    ygf.l("AES key size must be 16 or 32 bytes");
                    return null;
                }
                o2b o2bVar = new o2b(i, (boolean) (objArr == true ? 1 : 0));
                o2bVar.c = null;
                o2bVar.d = null;
                o2bVar.b = f1gVar;
                o2bVar.e = num;
                o2bVar.c = ujf.n(i4);
                o2bVar.d = ujf.n(f1gVar.b);
                return o2bVar.N();
            case 1:
                p1g p1gVar = (p1g) bzfVar;
                int i5 = p1gVar.a;
                if (i5 == 24) {
                    ygf.l("192 bit AES EAX Parameters are not valid");
                    return null;
                }
                vwa vwaVar = new vwa(26, (boolean) (objArr2 == true ? 1 : 0));
                vwaVar.c = null;
                vwaVar.b = p1gVar;
                vwaVar.d = num;
                vwaVar.c = ujf.n(i5);
                return vwaVar.H();
            case 2:
                g2g g2gVar = (g2g) bzfVar;
                int i6 = g2gVar.a;
                if (i6 == 24) {
                    ygf.l("192 bit AES GCM Parameters are not valid");
                    return null;
                }
                vwa vwaVar2 = new vwa(27, (boolean) (objArr3 == true ? 1 : 0));
                vwaVar2.c = null;
                vwaVar2.b = g2gVar;
                vwaVar2.d = num;
                vwaVar2.c = ujf.n(i6);
                return vwaVar2.I();
            case 3:
                r2g r2gVar = (r2g) bzfVar;
                vwa vwaVar3 = new vwa(i2, (boolean) (objArr4 == true ? 1 : 0));
                vwaVar3.c = null;
                vwaVar3.b = r2gVar;
                vwaVar3.d = num;
                vwaVar3.c = ujf.n(r2gVar.a);
                return vwaVar3.J();
            case 4:
                return u2g.L(((c3g) bzfVar).a, ujf.n(32), num);
            case 5:
                return k3g.L((l3g) bzfVar, num);
            case 6:
                return z3g.L((x3g) bzfVar, num);
            case 7:
                return u4g.L((a5g) bzfVar, ujf.n(32), num);
            case 8:
                return g5g.L(((m5g) bzfVar).a, ujf.n(32), num);
            case 9:
                dbg dbgVar = (dbg) bzfVar;
                int i7 = dbgVar.a;
                if (i7 != 64) {
                    throw new InvalidAlgorithmParameterException(ev6.w("invalid key size: ", i7, ". Valid keys must have 64 bytes."));
                }
                tag tagVar = new tag();
                tagVar.b = null;
                tagVar.a = dbgVar;
                tagVar.c = num;
                tagVar.b = ujf.n(i7);
                return tagVar.b();
            case 10:
                jcg jcgVar = (jcg) bzfVar;
                fcg fcgVar = jcgVar.a;
                if (fcgVar == fcg.b) {
                    eCParameterSpec = nfg.a;
                } else if (fcgVar == fcg.c) {
                    eCParameterSpec = nfg.b;
                } else {
                    if (fcgVar != fcg.d) {
                        throw new GeneralSecurityException("Unsupported curve type: ".concat(String.valueOf(fcgVar)));
                    }
                    eCParameterSpec = nfg.c;
                }
                KeyPairGenerator keyPairGenerator = (KeyPairGenerator) cvg.e.a.a("EC");
                keyPairGenerator.initialize(eCParameterSpec);
                KeyPair keyPairGenerateKeyPair = keyPairGenerator.generateKeyPair();
                return lcg.M(ucg.L(jcgVar, ((ECPublicKey) keyPairGenerateKeyPair.getPublic()).getW(), num), new wjc(16, ((ECPrivateKey) keyPairGenerateKeyPair.getPrivate()).getS()));
            case 11:
                scg scgVar = (scg) bzfVar;
                rcg rcgVar = scgVar.a;
                if (rcgVar.equals(rcg.g)) {
                    byte[] bArrA = qig.a(32);
                    bArrA[0] = (byte) (bArrA[0] | 7);
                    byte b = (byte) (bArrA[31] & 63);
                    bArrA[31] = b;
                    bArrA[31] = (byte) (b | 128);
                    ujfVar = new ujf(i2, qvg.a(bArrA));
                    qvgVarA = qvg.a(no7.K(bArrA));
                } else {
                    rcg rcgVar2 = rcg.f;
                    rcg rcgVar3 = rcg.e;
                    rcg rcgVar4 = rcg.d;
                    if (rcgVar != rcgVar4 && rcgVar != rcgVar3 && rcgVar != rcgVar2) {
                        ygf.l("Unknown KEM ID");
                        return null;
                    }
                    byte[] bArr2 = weg.a;
                    if (rcgVar == rcgVar4) {
                        xugVar = xug.zza;
                    } else if (rcgVar == rcgVar3) {
                        xugVar = xug.zzb;
                    } else {
                        if (rcgVar != rcgVar2) {
                            ygf.l("Unrecognized NIST HPKE KEM identifier");
                            return null;
                        }
                        xugVar = xug.zzc;
                    }
                    ECParameterSpec eCParameterSpecX = en7.X(xugVar);
                    KeyPairGenerator keyPairGenerator2 = (KeyPairGenerator) cvg.e.a.a("EC");
                    keyPairGenerator2.initialize(eCParameterSpecX);
                    KeyPair keyPairGenerateKeyPair2 = keyPairGenerator2.generateKeyPair();
                    zug zugVar = zug.zza;
                    ECPoint w = ((ECPublicKey) keyPairGenerateKeyPair2.getPublic()).getW();
                    EllipticCurve curve = en7.X(xugVar).getCurve();
                    nfg.g(w, curve);
                    int iU = en7.U(curve);
                    int iOrdinal = zugVar.ordinal();
                    if (iOrdinal != 0) {
                        if (iOrdinal == 1) {
                            int i8 = iU + 1;
                            bArr = new byte[i8];
                            byte[] bArrJ = qq7.J(w.getAffineX());
                            System.arraycopy(bArrJ, 0, bArr, i8 - bArrJ.length, bArrJ.length);
                            bArr[0] = (byte) (w.getAffineY().testBit(0) ? 3 : 2);
                        } else {
                            if (iOrdinal != 2) {
                                throw new GeneralSecurityException("invalid format:".concat(String.valueOf(zugVar)));
                            }
                            int i9 = iU * 2;
                            bArr = new byte[i9];
                            byte[] bArrJ2 = qq7.J(w.getAffineX());
                            if (bArrJ2.length > iU) {
                                bArrJ2 = Arrays.copyOfRange(bArrJ2, bArrJ2.length - iU, bArrJ2.length);
                            }
                            byte[] bArrJ3 = qq7.J(w.getAffineY());
                            if (bArrJ3.length > iU) {
                                bArrJ3 = Arrays.copyOfRange(bArrJ3, bArrJ3.length - iU, bArrJ3.length);
                            }
                            System.arraycopy(bArrJ3, 0, bArr, i9 - bArrJ3.length, bArrJ3.length);
                            System.arraycopy(bArrJ2, 0, bArr, iU - bArrJ2.length, bArrJ2.length);
                        }
                    } else {
                        int i10 = (iU * 2) + 1;
                        bArr = new byte[i10];
                        byte[] bArrJ4 = qq7.J(w.getAffineX());
                        byte[] bArrJ5 = qq7.J(w.getAffineY());
                        System.arraycopy(bArrJ5, 0, bArr, i10 - bArrJ5.length, bArrJ5.length);
                        System.arraycopy(bArrJ4, 0, bArr, (iU + 1) - bArrJ4.length, bArrJ4.length);
                        bArr[0] = 4;
                    }
                    qvg qvgVarA2 = qvg.a(bArr);
                    ujf ujfVar2 = new ujf(i2, qvg.a(qq7.K(((ECPrivateKey) keyPairGenerateKeyPair2.getPrivate()).getS(), weg.a(rcgVar))));
                    qvgVarA = qvgVarA2;
                    ujfVar = ujfVar2;
                }
                return xcg.L(jdg.L(scgVar, qvgVarA, num), ujfVar);
            case 12:
                isg isgVar = (isg) ((qgg) bzfVar).a.c;
                ufg ufgVar = ufg.d;
                bgg bggVarD = ufgVar.d(isgVar.B());
                if (!((Boolean) ufgVar.b.get(isgVar.B())).booleanValue()) {
                    ygf.l("Creating new keys is not allowed.");
                    return null;
                }
                hsf hsfVarA = isgVar.A();
                bggVarD.getClass();
                hsg hsgVarT = isg.t();
                hsgVarT.g(bggVarD.a);
                hsgVarT.h(hsfVarA);
                hsgVarT.e(ntg.RAW);
                isg isgVar2 = (isg) hsgVarT.b();
                lig ligVar = new lig(isgVar2, i3, ejg.a(isgVar2.B()));
                fhg fhgVar = fhg.b;
                nig nigVar = (nig) fhgVar.c(zgg.b.b(fhgVar.b(ligVar), null));
                asg asgVarT = csg.t();
                String str = (String) nigVar.a;
                asgVarT.c();
                csg.u((csg) asgVarT.b, str);
                hsf hsfVar = (hsf) nigVar.c;
                asgVarT.c();
                csg.v((csg) asgVarT.b, hsfVar);
                zrg zrgVar = (zrg) nigVar.d;
                asgVarT.c();
                ((csg) asgVarT.b).zzg = zrgVar.zza();
                csg csgVar = (csg) asgVarT.b();
                return new lgg(nig.I(csgVar.A(), csgVar.z(), csgVar.x(), isgVar.z(), num));
            case 13:
                gjg gjgVar = (gjg) bzfVar;
                int i11 = gjgVar.a;
                if (i11 != 32) {
                    ygf.l("AesCmacKey size wrong, must be 32 bytes");
                    return null;
                }
                tag tagVar2 = new tag();
                tagVar2.b = null;
                tagVar2.c = null;
                tagVar2.a = gjgVar;
                tagVar2.b = ujf.n(i11);
                tagVar2.c = num;
                return tagVar2.c();
            default:
                ujg ujgVar = (ujg) bzfVar;
                tag tagVar3 = new tag();
                tagVar3.b = null;
                tagVar3.c = null;
                tagVar3.a = ujgVar;
                tagVar3.b = ujf.n(ujgVar.a);
                tagVar3.c = num;
                return tagVar3.e();
        }
    }
}

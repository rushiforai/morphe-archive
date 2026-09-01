package defpackage;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.android.recaptcha.internal.zzaek;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.interfaces.ECPrivateKey;
import java.security.interfaces.ECPublicKey;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.security.spec.ECPrivateKeySpec;
import java.security.spec.ECPublicKeySpec;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class n9g implements yfg, twf, vfg, qkg {
    public static final /* synthetic */ n9g a = new n9g();

    @Override // defpackage.qkg
    public ur7 j(ing ingVar) throws GeneralSecurityException {
        omg omgVar = kvg.a;
        String str = (String) ingVar.a;
        if (!str.equals("type.googleapis.com/google.crypto.tink.EcdsaPrivateKey")) {
            ay0.e("Wrong type URL in call to EcdsaProtoSerialization.parsePrivateKey: ".concat(String.valueOf(str)));
            return null;
        }
        try {
            pmf pmfVar = (pmf) ingVar.c;
            anf anfVar = anf.a;
            int i = gmf.a;
            jog jogVarY = jog.y(pmfVar, anf.a);
            if (jogVarY.v() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            nog nogVarW = jogVarY.w();
            if (nogVarW.v() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            rjg rjgVar = new rjg();
            rjgVar.c = kvg.b(nogVarW.w().v());
            rjgVar.a = kvg.g(nogVarW.w().A());
            rjgVar.b = kvg.f(nogVarW.w().z());
            rjgVar.d = kvg.c((e1g) ingVar.e);
            prg prgVarB = rjgVar.b();
            tag tagVar = new tag();
            tagVar.b = null;
            tagVar.c = null;
            tagVar.a = prgVarB;
            tagVar.b = new ECPoint(new BigInteger(1, nogVarW.x().E()), new BigInteger(1, nogVarW.y().E()));
            tagVar.c = (Integer) ingVar.f;
            urg urgVarJ = tagVar.j();
            d2f d2fVar = new d2f(27);
            d2fVar.c = null;
            d2fVar.b = urgVarJ;
            d2fVar.c = new ujf(7, new BigInteger(1, jogVarY.x().E()));
            return d2fVar.I0();
        } catch (zzaek | IllegalArgumentException unused) {
            ygf.l("Parsing EcdsaPrivateKey failed");
            return null;
        }
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) {
        g5g g5gVar = (g5g) gr7Var;
        cug cugVarW = eug.w();
        byte[] bArrB = ((qvg) g5gVar.i.b).b();
        rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
        cugVarW.c();
        eug.v((eug) cugVarW.b, rsfVarP);
        return nig.I("type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key", ((eug) cugVarW.b()).b(), zrg.SYMMETRIC, l9g.b(g5gVar.h.a), g5gVar.k);
    }

    @Override // defpackage.twf
    public Object p(bxf bxfVar, Class cls) throws GeneralSecurityException {
        Object obj;
        String str;
        int i;
        xwf qegVar;
        qvg qvgVarK;
        List list;
        bxf bxfVar2 = bxfVar;
        String str2 = "EC";
        if (cls.equals(vwf.class)) {
            bxfVar2.h();
            gr7 gr7Var = bxfVar2.n().a;
            if (gr7Var instanceof ucg) {
                ucg ucgVar = (ucg) gr7Var;
                jcg jcgVar = ucgVar.h;
                xug xugVar = (xug) uug.a.c(jcgVar.a);
                ECPoint eCPoint = ucgVar.i;
                byte[] byteArray = eCPoint.getAffineX().toByteArray();
                byte[] byteArray2 = eCPoint.getAffineY().toByteArray();
                ECParameterSpec eCParameterSpecX = en7.X(xugVar);
                ECPoint eCPoint2 = new ECPoint(new BigInteger(1, byteArray), new BigInteger(1, byteArray2));
                nfg.g(eCPoint2, eCParameterSpecX.getCurve());
                ECPublicKey eCPublicKey = (ECPublicKey) ((KeyFactory) cvg.f.a.a("EC")).generatePublic(new ECPublicKeySpec(eCPoint2, eCParameterSpecX));
                qvg qvgVar = jcgVar.f;
                if (qvgVar != null) {
                    qvgVar.b();
                }
                uug.a(jcgVar.b);
                vx0.n0(jcgVar);
                ucgVar.k.b();
                nfg.g(eCPublicKey.getW(), eCPublicKey.getParams().getCurve());
            } else {
                if (!(gr7Var instanceof jdg)) {
                    throw new GeneralSecurityException("Unknown key class: ".concat(String.valueOf(gr7Var.getClass())));
                }
                jdg jdgVar = (jdg) gr7Var;
                scg scgVar = jdgVar.h;
                qvg qvgVar2 = jdgVar.i;
                iq7.a0(scgVar.a);
                iq7.Y(scgVar.b);
                iq7.Z(scgVar.c);
                qvg qvgVar3 = jdgVar.j;
                qvgVar2.b();
                qvgVar3.b();
            }
            return cls.cast(new s7g());
        }
        if (!cls.equals(xwf.class)) {
            ygf.l("HybridConfigurationV1 can only create HybridEncrypt and HybridDecrypt primitives");
            return null;
        }
        HashMap map = new HashMap();
        int i2 = 0;
        int i3 = 0;
        while (i3 < bxfVar2.b.size()) {
            byf byfVarF = bxfVar2.f(i3);
            zwf zwfVar = byfVarF.c;
            gr7 gr7Var2 = byfVarF.a;
            if (zwfVar != zwf.c) {
                str = str2;
            } else {
                if (gr7Var2 instanceof lcg) {
                    lcg lcgVar = (lcg) gr7Var2;
                    jcg jcgVar2 = lcgVar.h.h;
                    xug xugVar2 = (xug) uug.a.c(jcgVar2.a);
                    ECPrivateKey eCPrivateKey = (ECPrivateKey) ((KeyFactory) cvg.f.a.a(str2)).generatePrivate(new ECPrivateKeySpec(qq7.I(qq7.J((BigInteger) lcgVar.i.b)), en7.X(xugVar2)));
                    byte[] bArrB = new byte[i2];
                    qvg qvgVar4 = jcgVar2.f;
                    if (qvgVar4 != null) {
                        bArrB = qvgVar4.b();
                    }
                    obj = null;
                    qegVar = new vug(eCPrivateKey, bArrB, uug.a(jcgVar2.b), (zug) uug.b.c(jcgVar2.c), vx0.n0(jcgVar2), ((beg) lcgVar.K()).K().b());
                    str = str2;
                } else {
                    obj = null;
                    if (!(gr7Var2 instanceof xcg)) {
                        throw new GeneralSecurityException("Unknown key class: ".concat(String.valueOf(gr7Var2.getClass())));
                    }
                    xcg xcgVar = (xcg) gr7Var2;
                    jdg jdgVar2 = xcgVar.h;
                    scg scgVar2 = jdgVar2.h;
                    rcg rcgVar = scgVar2.a;
                    reg regVarA0 = iq7.a0(rcgVar);
                    d1g d1gVarY = iq7.Y(scgVar2.b);
                    keg kegVarZ = iq7.Z(scgVar2.c);
                    rcg rcgVar2 = rcg.g;
                    boolean zEquals = rcgVar.equals(rcgVar2);
                    rcg rcgVar3 = rcg.f;
                    rcg rcgVar4 = rcg.e;
                    str = str2;
                    rcg rcgVar5 = rcg.d;
                    if (zEquals) {
                        i = 32;
                    } else if (rcgVar == rcgVar5) {
                        i = 65;
                    } else if (rcgVar == rcgVar4) {
                        i = 97;
                    } else {
                        if (rcgVar != rcgVar3) {
                            ygf.l("Unrecognized HPKE KEM identifier");
                            return null;
                        }
                        i = NikonType2MakernoteDirectory.TAG_MANUAL_FOCUS_DISTANCE;
                    }
                    int i4 = i;
                    if (!rcgVar.equals(rcgVar2) && rcgVar != rcgVar5 && rcgVar != rcgVar4 && rcgVar != rcgVar3) {
                        ygf.l("Unrecognized HPKE KEM identifier");
                        return null;
                    }
                    qegVar = new qeg(new zjf(qvg.a(((qvg) xcgVar.i.b).b()), 12, jdgVar2.i), regVarA0, d1gVarY, kegVarZ, i4, ((beg) xcgVar.K()).K());
                }
                if (gr7Var2 instanceof xdg) {
                    qvgVarK = ((beg) ((xdg) gr7Var2).K()).K();
                } else {
                    if (!(gr7Var2 instanceof lgg)) {
                        throw new GeneralSecurityException(lv8.r("Cannot get output prefix for key of class ", gr7Var2.getClass().getName(), " with parameters ", String.valueOf(gr7Var2.H())));
                    }
                    qvgVarK = ((lgg) gr7Var2).K();
                }
                afg afgVar = new afg(qegVar, byfVarF.d);
                byte[] bArr = qvgVarK.a;
                if (bArr.length != 0 && bArr.length != 5) {
                    ygf.l("PrefixMap only supports 0 and 5 byte prefixes");
                    return obj;
                }
                if (map.containsKey(qvgVarK)) {
                    list = (List) map.get(qvgVarK);
                } else {
                    ArrayList arrayList = new ArrayList();
                    map.put(qvgVarK, arrayList);
                    list = arrayList;
                }
                list.add(afgVar);
            }
            i3++;
            bxfVar2 = bxfVar;
            str2 = str;
            i2 = 0;
        }
        bxfVar.h();
        return cls.cast(new zeg(new vhg(map)));
    }

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        if (!((String) nigVar.a).equals("type.googleapis.com/google.crypto.tink.AesCmacKey")) {
            ay0.e(HrUBqHumRuLe.PQcJnFHggYrX);
            return null;
        }
        try {
            blg blgVarU = blg.u((hsf) nigVar.c, ptf.a);
            if (blgVarU.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            tag tagVarB = gjg.b();
            tagVarB.f(blgVarU.z().e());
            tagVarB.h(blgVarU.y().t());
            tagVarB.b = ckg.a((ntg) nigVar.e);
            gjg gjgVarD = tagVarB.d();
            tag tagVar = new tag();
            tagVar.b = null;
            tagVar.c = null;
            tagVar.a = gjgVarD;
            tagVar.b = new ujf(28, qvg.a(blgVarU.z().x()));
            tagVar.c = (Integer) nigVar.f;
            return tagVar.c();
        } catch (zzale | IllegalArgumentException unused) {
            ygf.l("Parsing AesCmacKey failed");
            return null;
        }
    }
}

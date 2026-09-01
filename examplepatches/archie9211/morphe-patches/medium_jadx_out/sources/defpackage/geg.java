package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.security.GeneralSecurityException;
import java.security.spec.ECPoint;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class geg {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;
    public static final zfg e;
    public static final wfg f;
    public static final pif g;
    public static final pif h;
    public static final pif i;
    public static final pif j;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.EciesAeadHkdfPrivateKey");
        qvg qvgVarC2 = ejg.c("type.googleapis.com/google.crypto.tink.EciesAeadHkdfPublicKey");
        int i2 = 1;
        a = new uhg(jcg.class, new s9g(i2));
        b = new shg(qvgVarC, new pbg(i2));
        c = new zfg(ucg.class, new t9g());
        d = new wfg(qvgVarC2, new ubg(i2));
        e = new zfg(lcg.class, new rbg(i2));
        f = new wfg(qvgVarC, new wbg());
        d2f d2fVarB = pif.b();
        d2fVarB.F0(ntg.RAW, gcg.d);
        d2fVarB.F0(ntg.TINK, gcg.b);
        ntg ntgVar = ntg.zzc;
        gcg gcgVar = gcg.c;
        d2fVarB.F0(ntgVar, gcgVar);
        d2fVarB.F0(ntg.CRUNCHY, gcgVar);
        g = d2fVarB.y0();
        d2f d2fVarB2 = pif.b();
        d2fVarB2.F0(iqg.SHA1, ecg.b);
        d2fVarB2.F0(iqg.SHA224, ecg.c);
        d2fVarB2.F0(iqg.SHA256, ecg.d);
        d2fVarB2.F0(iqg.SHA384, ecg.e);
        d2fVarB2.F0(iqg.SHA512, ecg.f);
        h = d2fVarB2.y0();
        d2f d2fVarB3 = pif.b();
        d2fVarB3.F0(ypg.NIST_P256, fcg.b);
        d2fVarB3.F0(ypg.NIST_P384, fcg.c);
        d2fVarB3.F0(ypg.NIST_P521, fcg.d);
        d2fVarB3.F0(ypg.CURVE25519, fcg.e);
        i = d2fVarB3.y0();
        d2f d2fVarB4 = pif.b();
        d2fVarB4.F0(pog.UNCOMPRESSED, hcg.c);
        d2fVarB4.F0(pog.COMPRESSED, hcg.b);
        d2fVarB4.F0(pog.DO_NOT_USE_CRUNCHY_UNCOMPRESSED, hcg.d);
        j = d2fVarB4.y0();
    }

    public static int a(fcg fcgVar) throws GeneralSecurityException {
        if (fcg.b == fcgVar) {
            return 33;
        }
        if (fcg.c == fcgVar) {
            return 49;
        }
        if (fcg.d == fcgVar) {
            return 67;
        }
        throw new GeneralSecurityException("Unable to serialize CurveType ".concat(String.valueOf(fcgVar)));
    }

    public static jcg b(ntg ntgVar, zog zogVar) {
        hsg hsgVarT = isg.t();
        hsgVarT.g(zogVar.x().w().B());
        hsgVarT.e(ntg.RAW);
        hsgVarT.h(zogVar.x().w().A());
        isg isgVar = (isg) hsgVarT.b();
        ing ingVarB = jcg.b();
        ingVarB.e = (gcg) g.d(ntgVar);
        ingVarB.a = (fcg) i.d(zogVar.A().y());
        ingVarB.b = (ecg) h.d(zogVar.A().z());
        ingVarB.m(kk7.M(isgVar.c()));
        qvg qvgVarA = qvg.a(zogVar.A().A().x());
        if (qvgVarA.a.length == 0) {
            ingVarB.f = null;
        } else {
            ingVarB.f = qvgVarA;
        }
        if (!zogVar.A().y().equals(ypg.CURVE25519)) {
            ingVarB.c = (hcg) j.d(zogVar.t());
        } else if (!zogVar.t().equals(pog.COMPRESSED)) {
            ygf.l("For CURVE25519 EcPointFormat must be compressed");
            return null;
        }
        return ingVarB.j();
    }

    public static jpg c(ucg ucgVar) throws GeneralSecurityException {
        jcg jcgVar = ucgVar.h;
        if (jcgVar.a.equals(fcg.e)) {
            hpg hpgVarA = jpg.A();
            hpgVarA.c();
            ((jpg) hpgVarA.b).zzf = 0;
            zog zogVarD = d(jcgVar);
            hpgVarA.c();
            jpg.x((jpg) hpgVarA.b, zogVarD);
            byte[] bArrB = ucgVar.j.b();
            rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
            hpgVarA.c();
            jpg.w((jpg) hpgVarA.b, rsfVarP);
            rsf rsfVar = hsf.b;
            hpgVarA.c();
            jpg.z((jpg) hpgVarA.b, rsfVar);
            return (jpg) hpgVarA.b();
        }
        int iA = a(jcgVar.a);
        ECPoint eCPoint = ucgVar.i;
        if (eCPoint == null) {
            ygf.l("NistCurvePoint was null for NIST curve");
            return null;
        }
        hpg hpgVarA2 = jpg.A();
        hpgVarA2.c();
        ((jpg) hpgVarA2.b).zzf = 0;
        zog zogVarD2 = d(jcgVar);
        hpgVarA2.c();
        jpg.x((jpg) hpgVarA2.b, zogVarD2);
        byte[] bArrK = qq7.K(eCPoint.getAffineX(), iA);
        rsf rsfVarP2 = hsf.p(bArrK, 0, bArrK.length);
        hpgVarA2.c();
        jpg.w((jpg) hpgVarA2.b, rsfVarP2);
        byte[] bArrK2 = qq7.K(eCPoint.getAffineY(), iA);
        rsf rsfVarP3 = hsf.p(bArrK2, 0, bArrK2.length);
        hpgVarA2.c();
        jpg.z((jpg) hpgVarA2.b, rsfVarP3);
        return (jpg) hpgVarA2.b();
    }

    public static zog d(jcg jcgVar) throws GeneralSecurityException {
        rpg rpgVarT = tpg.t();
        ypg ypgVar = (ypg) i.c(jcgVar.a);
        rpgVarT.c();
        ((tpg) rpgVarT.b).zze = ypgVar.zza();
        iqg iqgVar = (iqg) h.c(jcgVar.b);
        rpgVarT.c();
        ((tpg) rpgVarT.b).zzf = iqgVar.zza();
        qvg qvgVar = jcgVar.f;
        if (qvgVar != null && qvgVar.a.length > 0) {
            byte[] bArrB = qvgVar.b();
            rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
            rpgVarT.c();
            tpg.u((tpg) rpgVarT.b, rsfVarP);
        }
        tpg tpgVar = (tpg) rpgVarT.b();
        try {
            isg isgVarU = isg.u(kk7.O(jcgVar.e), ptf.a);
            mog mogVarT = oog.t();
            hsg hsgVarT = isg.t();
            hsgVarT.g(isgVarU.B());
            hsgVarT.e(ntg.TINK);
            hsgVarT.h(isgVarU.A());
            isg isgVar = (isg) hsgVarT.b();
            mogVarT.c();
            oog.u((oog) mogVarT.b, isgVar);
            oog oogVar = (oog) mogVarT.b();
            hcg hcgVar = jcgVar.c;
            if (hcgVar == null) {
                hcgVar = hcg.b;
            }
            yog yogVarY = zog.y();
            yogVarY.c();
            zog.w((zog) yogVarY.b, tpgVar);
            yogVarY.c();
            zog.u((zog) yogVarY.b, oogVar);
            pog pogVar = (pog) j.c(hcgVar);
            yogVarY.c();
            ((zog) yogVarY.b).zzh = pogVar.zza();
            return (zog) yogVarY.b();
        } catch (zzale e2) {
            throw new GeneralSecurityException("Parsing EciesParameters failed: ", e2);
        }
    }
}

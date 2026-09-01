package defpackage;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import java.math.BigInteger;
import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class cdg {
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
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.HpkePrivateKey");
        qvg qvgVarC2 = ejg.c("type.googleapis.com/google.crypto.tink.HpkePublicKey");
        a = new uhg(scg.class, new y8g());
        b = new shg(qvgVarC, new b9g());
        int i2 = 1;
        c = new zfg(jdg.class, new z8g(i2));
        d = new wfg(qvgVarC2, new e9g());
        e = new zfg(xcg.class, new d9g(i2));
        f = new wfg(qvgVarC, new k9g());
        d2f d2fVarB = pif.b();
        d2fVarB.F0(ntg.RAW, qcg.d);
        d2fVarB.F0(ntg.TINK, qcg.b);
        ntg ntgVar = ntg.zzc;
        qcg qcgVar = qcg.c;
        d2fVarB.F0(ntgVar, qcgVar);
        d2fVarB.F0(ntg.CRUNCHY, qcgVar);
        g = d2fVarB.y0();
        d2f d2fVarB2 = pif.b();
        d2fVarB2.F0(brg.DHKEM_P256_HKDF_SHA256, rcg.d);
        d2fVarB2.F0(brg.DHKEM_P384_HKDF_SHA384, rcg.e);
        d2fVarB2.F0(brg.DHKEM_P521_HKDF_SHA512, rcg.f);
        d2fVarB2.F0(brg.DHKEM_X25519_HKDF_SHA256, rcg.g);
        h = d2fVarB2.y0();
        d2f d2fVarB3 = pif.b();
        d2fVarB3.F0(drg.HKDF_SHA256, pcg.d);
        d2fVarB3.F0(drg.HKDF_SHA384, pcg.e);
        d2fVarB3.F0(drg.HKDF_SHA512, pcg.f);
        i = d2fVarB3.y0();
        d2f d2fVarB4 = pif.b();
        d2fVarB4.F0(yqg.AES_128_GCM, ocg.d);
        d2fVarB4.F0(yqg.AES_256_GCM, ocg.e);
        d2fVarB4.F0(yqg.CHACHA20_POLY1305, ocg.f);
        j = d2fVarB4.y0();
    }

    public static scg a(ntg ntgVar, org orgVar) {
        o2b o2bVarB = scg.b();
        o2bVarB.e = (qcg) g.d(ntgVar);
        o2bVarB.b = (rcg) h.d(orgVar.y());
        o2bVarB.c = (pcg) i.d(orgVar.x());
        o2bVarB.d = (ocg) j.d(orgVar.t());
        return o2bVarB.Q();
    }

    public static xrg b(jdg jdgVar) {
        wrg wrgVarZ = xrg.z();
        wrgVarZ.c();
        ((xrg) wrgVarZ.b).zzf = 0;
        org orgVarD = d(jdgVar.h);
        wrgVarZ.c();
        xrg.x((xrg) wrgVarZ.b, orgVarD);
        byte[] bArrB = jdgVar.i.b();
        rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
        wrgVarZ.c();
        xrg.w((xrg) wrgVarZ.b, rsfVarP);
        return (xrg) wrgVarZ.b();
    }

    public static qvg c(rcg rcgVar, byte[] bArr) throws GeneralSecurityException {
        int i2;
        BigInteger bigIntegerI = qq7.I(bArr);
        byte[] bArr2 = weg.a;
        if (rcgVar == rcg.g) {
            i2 = 32;
        } else if (rcgVar == rcg.d) {
            i2 = 65;
        } else if (rcgVar == rcg.e) {
            i2 = 97;
        } else {
            if (rcgVar != rcg.f) {
                ygf.l("Unrecognized HPKE KEM identifier");
                return null;
            }
            i2 = NikonType2MakernoteDirectory.TAG_MANUAL_FOCUS_DISTANCE;
        }
        return qvg.a(qq7.K(bigIntegerI, i2));
    }

    public static org d(scg scgVar) {
        nrg nrgVarZ = org.z();
        brg brgVar = (brg) h.c(scgVar.a);
        nrgVarZ.c();
        ((org) nrgVarZ.b).zze = brgVar.zza();
        drg drgVar = (drg) i.c(scgVar.b);
        nrgVarZ.c();
        ((org) nrgVarZ.b).zzf = drgVar.zza();
        yqg yqgVar = (yqg) j.c(scgVar.c);
        nrgVarZ.c();
        ((org) nrgVarZ.b).zzg = yqgVar.zza();
        return (org) nrgVarZ.b();
    }
}

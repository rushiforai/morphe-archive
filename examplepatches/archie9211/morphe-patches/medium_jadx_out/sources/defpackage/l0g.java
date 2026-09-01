package defpackage;

import j$.util.DesugarCollections;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class l0g {
    static {
        int i = mtg.a;
        try {
            a();
        } catch (GeneralSecurityException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void a() throws GeneralSecurityException {
        hhg hhgVar = hhg.b;
        hhgVar.a(q0g.b);
        hhgVar.b(q0g.c);
        wjg.a();
        mag magVar = y0g.e;
        if (!magVar.zza()) {
            ygf.l(AEVqIoD.MWOJhdhZr);
            return;
        }
        uhg uhgVar = n5g.a;
        fhg fhgVar = fhg.b;
        fhgVar.h(n5g.a);
        fhgVar.g(n5g.b);
        fhgVar.f(n5g.c);
        fhgVar.e(n5g.d);
        hhgVar.b(y0g.a);
        chg chgVar = chg.b;
        HashMap map = new HashMap();
        map.put("AES128_CTR_HMAC_SHA256", f4g.e);
        ing ingVarB = f1g.b();
        ingVarB.l(16);
        ingVarB.n(32);
        ingVarB.p(16);
        ingVarB.o(16);
        e1g e1gVar = e1g.e;
        ingVarB.d = e1gVar;
        d1g d1gVar = d1g.e;
        ingVarB.e = d1gVar;
        map.put("AES128_CTR_HMAC_SHA256_RAW", ingVarB.i());
        map.put("AES256_CTR_HMAC_SHA256", f4g.f);
        ing ingVarB2 = f1g.b();
        ingVarB2.l(32);
        ingVarB2.n(32);
        ingVarB2.p(32);
        ingVarB2.o(16);
        ingVarB2.d = e1gVar;
        ingVarB2.e = d1gVar;
        map.put("AES256_CTR_HMAC_SHA256_RAW", ingVarB2.i());
        chgVar.b(DesugarCollections.unmodifiableMap(map));
        bhg bhgVar = bhg.b;
        bhgVar.a(y0g.c, f1g.class);
        zgg zggVar = zgg.b;
        zggVar.a(y0g.d, f1g.class);
        ufg ufgVar = ufg.d;
        ufgVar.a(y0g.b, magVar, true);
        mag magVar2 = z1g.e;
        if (!magVar2.zza()) {
            ygf.l("Can not use AES-GCM in FIPS-mode, as BoringCrypto module is not available.");
            return;
        }
        fhgVar.h(f6g.a);
        fhgVar.g(f6g.b);
        fhgVar.f(f6g.c);
        fhgVar.e(f6g.d);
        hhgVar.b(z1g.a);
        HashMap map2 = new HashMap();
        map2.put("AES128_GCM", f4g.a);
        o2b o2bVarB = g2g.b();
        o2bVarB.R();
        o2bVarB.W(16);
        o2bVarB.Y();
        d2g d2gVar = d2g.e;
        o2bVarB.e = d2gVar;
        map2.put("AES128_GCM_RAW", o2bVarB.P());
        map2.put("AES256_GCM", f4g.b);
        o2b o2bVarB2 = g2g.b();
        o2bVarB2.R();
        o2bVarB2.W(32);
        o2bVarB2.Y();
        o2bVarB2.e = d2gVar;
        map2.put("AES256_GCM_RAW", o2bVarB2.P());
        chgVar.b(DesugarCollections.unmodifiableMap(map2));
        bhgVar.a(z1g.c, g2g.class);
        zggVar.a(z1g.d, g2g.class);
        ufgVar.a(z1g.b, magVar2, true);
        if (oag.a()) {
            return;
        }
        cig cigVar = n1g.a;
        mag magVar3 = mag.zza;
        if (!magVar3.zza()) {
            ygf.l("Registering AES EAX is not supported in FIPS mode");
            return;
        }
        fhgVar.h(v5g.a);
        fhgVar.g(v5g.b);
        fhgVar.f(v5g.c);
        fhgVar.e(v5g.d);
        hhgVar.b(n1g.a);
        HashMap map3 = new HashMap();
        map3.put("AES128_EAX", f4g.c);
        o2b o2bVarB3 = p1g.b();
        o2bVarB3.S(16);
        o2bVarB3.W(16);
        o2bVarB3.Y();
        d1g d1gVar2 = d1g.h;
        o2bVarB3.e = d1gVar2;
        map3.put("AES128_EAX_RAW", o2bVarB3.O());
        map3.put("AES256_EAX", f4g.d);
        o2b o2bVarB4 = p1g.b();
        o2bVarB4.S(16);
        o2bVarB4.W(32);
        o2bVarB4.Y();
        o2bVarB4.e = d1gVar2;
        map3.put("AES256_EAX_RAW", o2bVarB4.O());
        chgVar.b(DesugarCollections.unmodifiableMap(map3));
        zggVar.a(n1g.c, p1g.class);
        ufgVar.b(n1g.b, true);
        cig cigVar2 = k2g.a;
        if (!magVar3.zza()) {
            ygf.l("Registering AES GCM SIV is not supported in FIPS mode");
            return;
        }
        fhgVar.h(u6g.a);
        fhgVar.g(u6g.b);
        fhgVar.f(u6g.c);
        fhgVar.e(u6g.d);
        HashMap map4 = new HashMap();
        d2f d2fVarB = r2g.b();
        d2fVarB.E0(16);
        d1g d1gVar3 = d1g.i;
        d2fVarB.c = d1gVar3;
        map4.put("AES128_GCM_SIV", d2fVarB.A0());
        d2f d2fVarB2 = r2g.b();
        d2fVarB2.E0(16);
        d1g d1gVar4 = d1g.k;
        d2fVarB2.c = d1gVar4;
        map4.put("AES128_GCM_SIV_RAW", d2fVarB2.A0());
        d2f d2fVarB3 = r2g.b();
        d2fVarB3.E0(32);
        d2fVarB3.c = d1gVar3;
        map4.put("AES256_GCM_SIV", d2fVarB3.A0());
        d2f d2fVarB4 = r2g.b();
        d2fVarB4.E0(32);
        d2fVarB4.c = d1gVar4;
        map4.put("AES256_GCM_SIV_RAW", d2fVarB4.A0());
        chgVar.b(DesugarCollections.unmodifiableMap(map4));
        bhgVar.a(k2g.c, r2g.class);
        zggVar.a(k2g.b, r2g.class);
        hhgVar.b(k2g.a);
        ufgVar.b(k2g.d, true);
        cig cigVar3 = a3g.a;
        if (!magVar3.zza()) {
            ygf.l("Registering ChaCha20Poly1305 is not supported in FIPS mode");
            return;
        }
        fhgVar.h(m7g.a);
        fhgVar.g(m7g.b);
        fhgVar.f(m7g.c);
        fhgVar.e(m7g.d);
        hhgVar.b(a3g.a);
        zggVar.a(a3g.b, c3g.class);
        HashMap map5 = new HashMap();
        map5.put("CHACHA20_POLY1305", new c3g(b3g.c));
        map5.put("CHACHA20_POLY1305_RAW", new c3g(b3g.e));
        chgVar.b(DesugarCollections.unmodifiableMap(map5));
        ufgVar.b(a3g.c, true);
        cig cigVar4 = f3g.a;
        if (!magVar3.zza()) {
            ygf.l("Registering KMS AEAD is not supported in FIPS mode");
            return;
        }
        fhgVar.h(s3g.a);
        fhgVar.g(s3g.b);
        fhgVar.f(s3g.c);
        fhgVar.e(s3g.d);
        hhgVar.b(f3g.a);
        zggVar.a(f3g.c, l3g.class);
        ufgVar.b(f3g.b, true);
        bgg bggVar = j3g.a;
        if (!magVar3.zza()) {
            ygf.l("Registering KMS Envelope AEAD is not supported in FIPS mode");
            return;
        }
        fhgVar.h(b4g.a);
        fhgVar.g(b4g.b);
        fhgVar.f(b4g.c);
        fhgVar.e(b4g.d);
        zggVar.a(j3g.b, x3g.class);
        hhgVar.b(j3g.c);
        ufgVar.b(j3g.a, true);
        cig cigVar5 = d5g.a;
        if (!magVar3.zza()) {
            ygf.l("Registering XChaCha20Poly1305 is not supported in FIPS mode");
            return;
        }
        fhgVar.h(l9g.a);
        fhgVar.g(l9g.b);
        fhgVar.f(l9g.c);
        fhgVar.e(l9g.d);
        hhgVar.b(d5g.a);
        HashMap map6 = new HashMap();
        map6.put("XCHACHA20_POLY1305", new m5g(d1g.p));
        map6.put("XCHACHA20_POLY1305_RAW", new m5g(d1g.r));
        chgVar.b(DesugarCollections.unmodifiableMap(map6));
        zggVar.a(d5g.d, m5g.class);
        bhgVar.a(d5g.c, m5g.class);
        ufgVar.b(d5g.b, true);
        fhgVar.h(w8g.a);
        fhgVar.g(w8g.b);
        fhgVar.f(w8g.c);
        fhgVar.e(w8g.d);
        HashMap map7 = new HashMap();
        map7.put("XAES_256_GCM_192_BIT_NONCE", f4g.g);
        map7.put("XAES_256_GCM_192_BIT_NONCE_NO_PREFIX", f4g.h);
        map7.put("XAES_256_GCM_160_BIT_NONCE_NO_PREFIX", f4g.i);
        map7.put("X_AES_GCM_8_BYTE_SALT_NO_PREFIX", f4g.j);
        chgVar.b(DesugarCollections.unmodifiableMap(map7));
        hhgVar.b(t40.l);
        zggVar.a(t40.k, a5g.class);
    }
}

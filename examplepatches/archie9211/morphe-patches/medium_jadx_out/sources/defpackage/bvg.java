package defpackage;

import androidx.core.widget.nRCC.nGxjfIr;
import j$.util.DesugarCollections;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class bvg {
    static {
        int i = fqg.zza;
        try {
            a();
        } catch (GeneralSecurityException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void a() {
        ylg ylgVar = ylg.b;
        ylgVar.b(utg.b);
        ylgVar.a(utg.c);
        ylgVar.b(utg.d);
        ylgVar.a(utg.e);
        int i = bsg.f;
        if (!hk7.M(i)) {
            ygf.l("Can not use ECDSA in FIPS-mode, as BoringCrypto module is not available.");
            return;
        }
        omg omgVar = kvg.a;
        gmg gmgVar = gmg.b;
        gmgVar.c(kvg.a);
        gmgVar.d(kvg.b);
        gmgVar.a(kvg.c);
        gmgVar.b(kvg.d);
        gmgVar.a(kvg.e);
        gmgVar.b(kvg.f);
        wlg wlgVar = wlg.b;
        HashMap map = new HashMap();
        map.put("ECDSA_P256", rtg.a);
        map.put("ECDSA_P256_IEEE_P1363", rtg.d);
        rjg rjgVar = new rjg();
        rjgVar.c = d1g.A;
        rjgVar.b = grg.c;
        rjgVar.a = d2g.f;
        rjgVar.d = d1g.G;
        map.put("ECDSA_P256_RAW", rjgVar.b());
        map.put("ECDSA_P256_IEEE_P1363_WITHOUT_PREFIX", rtg.f);
        map.put("ECDSA_P384", rtg.b);
        map.put("ECDSA_P384_IEEE_P1363", rtg.e);
        rjg rjgVar2 = new rjg();
        rjgVar2.c = d1g.C;
        grg grgVar = grg.d;
        rjgVar2.b = grgVar;
        d2g d2gVar = d2g.g;
        rjgVar2.a = d2gVar;
        d1g d1gVar = d1g.D;
        rjgVar2.d = d1gVar;
        map.put(nGxjfIr.vaHhyOIsDnmwf, rjgVar2.b());
        rjg rjgVar3 = new rjg();
        rjgVar3.c = d1g.B;
        rjgVar3.b = grgVar;
        rjgVar3.a = d2gVar;
        rjgVar3.d = d1gVar;
        map.put("ECDSA_P384_SHA384", rjgVar3.b());
        map.put("ECDSA_P521", rtg.c);
        map.put("ECDSA_P521_IEEE_P1363", rtg.g);
        wlgVar.b(DesugarCollections.unmodifiableMap(map));
        ylgVar.a(bsg.a);
        ylgVar.a(bsg.b);
        plg plgVar = plg.b;
        plgVar.a(bsg.e, prg.class);
        ikg ikgVar = ikg.d;
        ikgVar.b(bsg.c, i, true);
        ikgVar.b(bsg.d, i, false);
        int i2 = lug.f;
        if (!hk7.M(i2)) {
            ygf.l("Can not use RSA SSA PKCS1 in FIPS-mode, as BoringCrypto module is not available.");
            return;
        }
        gmgVar.c(elf.a);
        gmgVar.d(elf.b);
        gmgVar.a(elf.c);
        gmgVar.b(elf.d);
        gmgVar.a(elf.e);
        gmgVar.b(elf.f);
        HashMap map2 = new HashMap();
        map2.put("RSA_SSA_PKCS1_3072_SHA256_F4", rtg.h);
        BigInteger bigInteger = dug.e;
        ytg ytgVar = new ytg();
        ytgVar.c = aug.b;
        ytgVar.a(3072);
        BigInteger bigInteger2 = dug.e;
        ytgVar.b = bigInteger2;
        d1g d1gVar2 = d1g.K;
        ytgVar.d = d1gVar2;
        map2.put("RSA_SSA_PKCS1_3072_SHA256_F4_RAW", ytgVar.b());
        map2.put("RSA_SSA_PKCS1_3072_SHA256_F4_WITHOUT_PREFIX", rtg.i);
        map2.put("RSA_SSA_PKCS1_4096_SHA512_F4", rtg.j);
        ytg ytgVar2 = new ytg();
        ytgVar2.c = aug.d;
        ytgVar2.a(4096);
        ytgVar2.b = bigInteger2;
        ytgVar2.d = d1gVar2;
        map2.put("RSA_SSA_PKCS1_4096_SHA512_F4_RAW", ytgVar2.b());
        wlgVar.b(map2);
        ylgVar.a(lug.a);
        ylgVar.a(lug.b);
        plgVar.a(lug.e, dug.class);
        ikgVar.b(lug.c, i2, true);
        ikgVar.b(lug.d, i2, false);
        int i3 = wug.f;
        if (!hk7.M(i3)) {
            ygf.l("Can not use RSA SSA PSS in FIPS-mode, as BoringCrypto module is not available.");
            return;
        }
        gmgVar.c(ilf.a);
        gmgVar.d(ilf.b);
        gmgVar.a(ilf.c);
        gmgVar.b(ilf.d);
        gmgVar.a(ilf.e);
        gmgVar.b(ilf.f);
        HashMap map3 = new HashMap();
        BigInteger bigInteger3 = qug.g;
        nug nugVar = new nug();
        oug ougVar = oug.b;
        nugVar.c = ougVar;
        nugVar.d = ougVar;
        nugVar.b(32);
        nugVar.a(3072);
        BigInteger bigInteger4 = qug.g;
        nugVar.b = bigInteger4;
        zwf zwfVar = zwf.p;
        nugVar.f = zwfVar;
        map3.put("RSA_SSA_PSS_3072_SHA256_F4", nugVar.c());
        nug nugVar2 = new nug();
        nugVar2.c = ougVar;
        nugVar2.d = ougVar;
        nugVar2.b(32);
        nugVar2.a(3072);
        nugVar2.b = bigInteger4;
        zwf zwfVar2 = zwf.s;
        nugVar2.f = zwfVar2;
        map3.put("RSA_SSA_PSS_3072_SHA256_F4_RAW", nugVar2.c());
        map3.put("RSA_SSA_PSS_3072_SHA256_SHA256_32_F4", rtg.k);
        nug nugVar3 = new nug();
        oug ougVar2 = oug.d;
        nugVar3.c = ougVar2;
        nugVar3.d = ougVar2;
        nugVar3.b(64);
        nugVar3.a(4096);
        nugVar3.b = bigInteger4;
        nugVar3.f = zwfVar;
        map3.put("RSA_SSA_PSS_4096_SHA512_F4", nugVar3.c());
        nug nugVar4 = new nug();
        nugVar4.c = ougVar2;
        nugVar4.d = ougVar2;
        nugVar4.b(64);
        nugVar4.a(4096);
        nugVar4.b = bigInteger4;
        nugVar4.f = zwfVar2;
        map3.put("RSA_SSA_PSS_4096_SHA512_F4_RAW", nugVar4.c());
        map3.put("RSA_SSA_PSS_4096_SHA512_SHA512_64_F4", rtg.l);
        wlgVar.b(DesugarCollections.unmodifiableMap(map3));
        ylgVar.a(wug.a);
        ylgVar.a(wug.b);
        plgVar.a(wug.e, qug.class);
        ikgVar.b(wug.c, i3, true);
        ikgVar.b(wug.d, i3, false);
        if (yjg.a()) {
            return;
        }
        xmg xmgVar = msg.a;
        if (!hk7.M(1)) {
            ygf.l("Registering AES GCM SIV is not supported in FIPS mode");
            return;
        }
        gmgVar.c(pvg.a);
        gmgVar.d(pvg.b);
        gmgVar.a(pvg.c);
        gmgVar.b(pvg.d);
        gmgVar.a(pvg.e);
        gmgVar.b(pvg.f);
        HashMap map4 = new HashMap();
        map4.put("ED25519", new esg(b3g.f));
        b3g b3gVar = b3g.i;
        map4.put("ED25519_RAW", new esg(b3gVar));
        map4.put("ED25519WithRawOutput", new esg(b3gVar));
        wlgVar.b(DesugarCollections.unmodifiableMap(map4));
        plgVar.a(msg.f, esg.class);
        slg slgVar = slg.b;
        jsg jsgVar = msg.e;
        jsg jsgVar2 = (jsg) slgVar.a.putIfAbsent(esg.class, jsgVar);
        if (jsgVar2 != null && jsgVar2 != jsgVar) {
            ygf.l("Different key creator for parameters class already inserted");
            return;
        }
        ylgVar.a(msg.a);
        ylgVar.a(msg.b);
        wkg wkgVar = msg.c;
        synchronized (ikgVar) {
            ikgVar.b(wkgVar, 1, true);
        }
        ikgVar.a(msg.d, false);
    }
}

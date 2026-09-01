package defpackage;

import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import j$.util.DesugarCollections;
import java.security.GeneralSecurityException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class wjg {
    static {
        int i = mtg.a;
        try {
            a();
        } catch (GeneralSecurityException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void a() {
        hhg hhgVar = hhg.b;
        hhgVar.a(q0g.k);
        hhgVar.b(q0g.l);
        hhgVar.a(q0g.j);
        mag magVar = ljg.f;
        if (!magVar.zza()) {
            ygf.l("Can not use HMAC in FIPS-mode, as BoringCrypto module is not available.");
            return;
        }
        pif pifVar = gkg.a;
        fhg fhgVar = fhg.b;
        fhgVar.h(gkg.c);
        fhgVar.g(gkg.d);
        fhgVar.f(gkg.e);
        fhgVar.e(gkg.f);
        hhgVar.b(ljg.a);
        hhgVar.b(ljg.b);
        chg chgVar = chg.b;
        HashMap map = new HashMap();
        map.put("HMAC_SHA256_128BITTAG", zjg.a);
        rjg rjgVarB = ujg.b();
        rjgVarB.a = 32;
        rjgVarB.b = 16;
        sjg sjgVar = sjg.e;
        rjgVarB.d = sjgVar;
        tjg tjgVar = tjg.d;
        rjgVarB.c = tjgVar;
        map.put("HMAC_SHA256_128BITTAG_RAW", rjgVarB.a());
        rjg rjgVarB2 = ujg.b();
        rjgVarB2.a = 32;
        rjgVarB2.b = 32;
        sjg sjgVar2 = sjg.b;
        rjgVarB2.d = sjgVar2;
        rjgVarB2.c = tjgVar;
        map.put("HMAC_SHA256_256BITTAG", rjgVarB2.a());
        rjg rjgVarB3 = ujg.b();
        rjgVarB3.a = 32;
        rjgVarB3.b = 32;
        rjgVarB3.d = sjgVar;
        rjgVarB3.c = tjgVar;
        map.put("HMAC_SHA256_256BITTAG_RAW", rjgVarB3.a());
        rjg rjgVarB4 = ujg.b();
        rjgVarB4.a = 64;
        rjgVarB4.b = 16;
        rjgVarB4.d = sjgVar2;
        tjg tjgVar2 = tjg.f;
        rjgVarB4.c = tjgVar2;
        map.put(AXoTRPEGKEve.HFiuz, rjgVarB4.a());
        rjg rjgVarB5 = ujg.b();
        rjgVarB5.a = 64;
        rjgVarB5.b = 16;
        rjgVarB5.d = sjgVar;
        rjgVarB5.c = tjgVar2;
        map.put("HMAC_SHA512_128BITTAG_RAW", rjgVarB5.a());
        rjg rjgVarB6 = ujg.b();
        rjgVarB6.a = 64;
        rjgVarB6.b = 32;
        rjgVarB6.d = sjgVar2;
        rjgVarB6.c = tjgVar2;
        map.put("HMAC_SHA512_256BITTAG", rjgVarB6.a());
        rjg rjgVarB7 = ujg.b();
        rjgVarB7.a = 64;
        rjgVarB7.b = 32;
        rjgVarB7.d = sjgVar;
        rjgVarB7.c = tjgVar2;
        map.put("HMAC_SHA512_256BITTAG_RAW", rjgVarB7.a());
        map.put("HMAC_SHA512_512BITTAG", zjg.b);
        rjg rjgVarB8 = ujg.b();
        rjgVarB8.a = 64;
        rjgVarB8.b = 64;
        rjgVarB8.d = sjgVar;
        rjgVarB8.c = tjgVar2;
        map.put("HMAC_SHA512_512BITTAG_RAW", rjgVarB8.a());
        chgVar.b(DesugarCollections.unmodifiableMap(map));
        zgg zggVar = zgg.b;
        zggVar.a(ljg.e, ujg.class);
        bhg.b.a(ljg.d, ujg.class);
        ufg ufgVar = ufg.d;
        ufgVar.a(ljg.c, magVar, true);
        if (oag.a()) {
            return;
        }
        z0g z0gVar = fjg.a;
        if (!mag.zza.zza()) {
            ygf.l("Registering AES CMAC is not supported in FIPS mode");
            return;
        }
        fhgVar.h(ckg.a);
        fhgVar.g(ckg.b);
        fhgVar.f(ckg.c);
        fhgVar.e(ckg.d);
        zggVar.a(fjg.a, gjg.class);
        hhgVar.b(fjg.b);
        hhgVar.b(fjg.c);
        HashMap map2 = new HashMap();
        gjg gjgVar = zjg.c;
        map2.put("AES_CMAC", gjgVar);
        map2.put("AES256_CMAC", gjgVar);
        tag tagVarB = gjg.b();
        tagVarB.f(32);
        tagVarB.h(16);
        tagVarB.b = zwf.o;
        map2.put("AES256_CMAC_RAW", tagVarB.d());
        chgVar.b(DesugarCollections.unmodifiableMap(map2));
        ufgVar.b(fjg.d, true);
    }
}

package defpackage;

import j$.util.DesugarCollections;
import java.security.GeneralSecurityException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class gbg {
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
        hhgVar.a(q0g.d);
        hhgVar.b(q0g.e);
        if (oag.a()) {
            return;
        }
        cig cigVar = yag.a;
        if (!mag.zza.zza()) {
            ygf.l("Registering AES SIV is not supported in FIPS mode");
            return;
        }
        uhg uhgVar = nbg.a;
        fhg fhgVar = fhg.b;
        fhgVar.h(nbg.a);
        fhgVar.g(nbg.b);
        fhgVar.f(nbg.c);
        fhgVar.e(nbg.d);
        hhgVar.b(yag.a);
        chg chgVar = chg.b;
        HashMap map = new HashMap();
        map.put("AES256_SIV", jbg.a);
        d2f d2fVarB = dbg.b();
        d2fVarB.E0(64);
        d2fVarB.c = bbg.d;
        map.put("AES256_SIV_RAW", d2fVarB.B0());
        chgVar.b(DesugarCollections.unmodifiableMap(map));
        bhg.b.a(yag.c, dbg.class);
        zgg.b.a(yag.d, dbg.class);
        ufg.d.b(yag.b, true);
    }
}

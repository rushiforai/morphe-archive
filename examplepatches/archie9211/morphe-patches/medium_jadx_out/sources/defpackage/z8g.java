package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class z8g implements thg, yfg, ukg {
    public static final /* synthetic */ z8g b = new z8g(3);
    public final /* synthetic */ int a;

    public /* synthetic */ z8g(int i) {
        this.a = i;
    }

    @Override // defpackage.ukg
    public ing d(ur7 ur7Var) {
        urg urgVar = (urg) ur7Var;
        return ing.k("type.googleapis.com/google.crypto.tink.EcdsaPublicKey", kvg.e(urgVar).c(), d1g.y, kvg.a(urgVar.i.d), urgVar.l);
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) throws GeneralSecurityException {
        ntg ntgVar;
        a5g a5gVar = (a5g) bzfVar;
        hsg hsgVarT = isg.t();
        hsgVarT.g("type.googleapis.com/google.crypto.tink.XAesGcmKey");
        ttg ttgVarW = vtg.w();
        xtg xtgVarV = ztg.v();
        int i = a5gVar.b;
        xtgVarV.c();
        ((ztg) xtgVarV.b).zze = i;
        ztg ztgVar = (ztg) xtgVarV.b();
        ttgVarW.c();
        vtg.v((vtg) ttgVarW.b, ztgVar);
        hsgVarT.h(((vtg) ttgVarW.b()).b());
        e1g e1gVar = a5gVar.a;
        if (e1gVar == e1g.h) {
            ntgVar = ntg.TINK;
        } else {
            if (e1gVar != e1g.i) {
                throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(e1gVar)));
            }
            ntgVar = ntg.RAW;
        }
        hsgVarT.e(ntgVar);
        return lig.p0((isg) hsgVarT.b());
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) {
        switch (this.a) {
            case 1:
                jdg jdgVar = (jdg) gr7Var;
                return nig.I("type.googleapis.com/google.crypto.tink.HpkePublicKey", cdg.b(jdgVar).b(), zrg.ASYMMETRIC_PUBLIC, (ntg) cdg.g.c(jdgVar.h.d), jdgVar.k);
            default:
                nig nigVar = ((lgg) gr7Var).h;
                int i = pgg.b[((zrg) nigVar.d).ordinal()];
                return nigVar;
        }
    }
}

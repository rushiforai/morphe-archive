package defpackage;

import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.util.Map;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class rbg implements thg, yfg, ukg {
    public static final /* synthetic */ rbg b = new rbg(2);
    public static final /* synthetic */ rbg c = new rbg(3);
    public final /* synthetic */ int a;

    public /* synthetic */ rbg(int i) {
        this.a = i;
    }

    @Override // defpackage.ukg
    public ing d(ur7 ur7Var) {
        switch (this.a) {
            case 2:
                return ((clg) ur7Var).i;
            default:
                iug iugVar = (iug) ur7Var;
                return ing.k("type.googleapis.com/google.crypto.tink.RsaSsaPkcs1PublicKey", elf.c(iugVar).c(), d1g.y, elf.a(iugVar.i.c), iugVar.l);
        }
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) throws GeneralSecurityException {
        lcg lcgVar = (lcg) gr7Var;
        dpg dpgVarY = fpg.y();
        dpgVarY.c();
        ((fpg) dpgVarY.b).zzf = 0;
        jpg jpgVarC = geg.c(lcgVar.h);
        dpgVarY.c();
        fpg.x((fpg) dpgVarY.b, jpgVarC);
        jcg jcgVar = lcgVar.h.h;
        if (jcgVar.a.equals(fcg.e)) {
            byte[] bArrB = ((qvg) lcgVar.j.b).b();
            rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
            dpgVarY.c();
            fpg.w((fpg) dpgVarY.b, rsfVarP);
        } else {
            byte[] bArrK = qq7.K((BigInteger) lcgVar.i.b, geg.a(jcgVar.a));
            rsf rsfVarP2 = hsf.p(bArrK, 0, bArrK.length);
            dpgVarY.c();
            fpg.w((fpg) dpgVarY.b, rsfVarP2);
        }
        return nig.I("type.googleapis.com/google.crypto.tink.EciesAeadHkdfPrivateKey", ((fpg) dpgVarY.b()).b(), zrg.ASYMMETRIC_PRIVATE, (ntg) geg.g.c(jcgVar.d), lcgVar.J());
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) throws GeneralSecurityException {
        dbg dbgVar = (dbg) bzfVar;
        hsg hsgVarT = isg.t();
        hsgVarT.g(fiHTiFJ.FxkXyMz);
        yng yngVarX = zng.x();
        int i = dbgVar.a;
        yngVarX.c();
        ((zng) yngVarX.b).zze = i;
        hsgVarT.h(((zng) yngVarX.b()).b());
        bbg bbgVar = dbgVar.b;
        Map map = nbg.e;
        if (!map.containsKey(bbgVar)) {
            throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(bbgVar)));
        }
        hsgVarT.e((ntg) map.get(bbgVar));
        return lig.p0((isg) hsgVarT.b());
    }
}

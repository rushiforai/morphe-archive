package defpackage;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import com.google.android.recaptcha.internal.zzaek;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.spec.ECPoint;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class d9g implements yfg, thg, qkg {
    public static final /* synthetic */ d9g b = new d9g(3);
    public final /* synthetic */ int a;

    public /* synthetic */ d9g(int i) {
        this.a = i;
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) {
        gjg gjgVar = (gjg) bzfVar;
        hsg hsgVarT = isg.t();
        hsgVarT.g("type.googleapis.com/google.crypto.tink.AesCmacKey");
        flg flgVarX = glg.x();
        jlg jlgVarV = klg.v();
        int i = gjgVar.b;
        jlgVarV.c();
        ((klg) jlgVarV.b).zze = i;
        klg klgVar = (klg) jlgVarV.b();
        flgVarX.c();
        glg.w((glg) flgVarX.b, klgVar);
        int i2 = gjgVar.a;
        flgVarX.c();
        ((glg) flgVarX.b).zzf = i2;
        hsgVarT.h(((glg) flgVarX.b()).b());
        hsgVarT.e(ckg.b(gjgVar.c));
        return lig.p0((isg) hsgVarT.b());
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) throws GeneralSecurityException {
        ntg ntgVar;
        switch (this.a) {
            case 0:
                u4g u4gVar = (u4g) gr7Var;
                ptg ptgVarX = qtg.x();
                byte[] bArrB = ((qvg) u4gVar.i.b).b();
                rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
                ptgVarX.c();
                qtg.v((qtg) ptgVarX.b, rsfVarP);
                xtg xtgVarV = ztg.v();
                a5g a5gVar = u4gVar.h;
                int i = a5gVar.b;
                xtgVarV.c();
                ((ztg) xtgVarV.b).zze = i;
                ztg ztgVar = (ztg) xtgVarV.b();
                ptgVarX.c();
                qtg.w((qtg) ptgVarX.b, ztgVar);
                rsf rsfVarB = ((qtg) ptgVarX.b()).b();
                zrg zrgVar = zrg.SYMMETRIC;
                e1g e1gVar = a5gVar.a;
                if (e1gVar == e1g.h) {
                    ntgVar = ntg.TINK;
                } else {
                    if (e1gVar != e1g.i) {
                        throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(e1gVar)));
                    }
                    ntgVar = ntg.RAW;
                }
                return nig.I("type.googleapis.com/google.crypto.tink.XAesGcmKey", rsfVarB, zrgVar, ntgVar, u4gVar.k);
            default:
                xcg xcgVar = (xcg) gr7Var;
                rrg rrgVarY = trg.y();
                rrgVarY.c();
                ((trg) rrgVarY.b).zzf = 0;
                xrg xrgVarB = cdg.b(xcgVar.h);
                rrgVarY.c();
                trg.x((trg) rrgVarY.b, xrgVarB);
                byte[] bArrB2 = ((qvg) xcgVar.i.b).b();
                rsf rsfVarP2 = hsf.p(bArrB2, 0, bArrB2.length);
                rrgVarY.c();
                trg.w((trg) rrgVarY.b, rsfVarP2);
                return nig.I("type.googleapis.com/google.crypto.tink.HpkePrivateKey", ((trg) rrgVarY.b()).b(), zrg.ASYMMETRIC_PRIVATE, (ntg) cdg.g.c(xcgVar.h.h.d), xcgVar.J());
        }
    }

    @Override // defpackage.qkg
    public ur7 j(ing ingVar) throws GeneralSecurityException {
        omg omgVar = kvg.a;
        String str = (String) ingVar.a;
        if (!str.equals(kSWQKWZ.OHqOptQYBMugpB)) {
            ay0.e("Wrong type URL in call to EcdsaProtoSerialization.parsePublicKey: ".concat(String.valueOf(str)));
            return null;
        }
        try {
            pmf pmfVar = (pmf) ingVar.c;
            anf anfVar = anf.a;
            int i = gmf.a;
            nog nogVarZ = nog.z(pmfVar, anf.a);
            if (nogVarZ.v() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            rjg rjgVar = new rjg();
            rjgVar.c = kvg.b(nogVarZ.w().v());
            rjgVar.a = kvg.g(nogVarZ.w().A());
            rjgVar.b = kvg.f(nogVarZ.w().z());
            rjgVar.d = kvg.c((e1g) ingVar.e);
            prg prgVarB = rjgVar.b();
            tag tagVar = new tag();
            tagVar.b = null;
            tagVar.c = null;
            tagVar.a = prgVarB;
            tagVar.b = new ECPoint(new BigInteger(1, nogVarZ.x().E()), new BigInteger(1, nogVarZ.y().E()));
            tagVar.c = (Integer) ingVar.f;
            return tagVar.j();
        } catch (zzaek | IllegalArgumentException unused) {
            ygf.l("Parsing EcdsaPublicKey failed");
            return null;
        }
    }
}

package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.math.BigInteger;
import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class k9g implements thg, vfg, rhg, ukg {
    public static final /* synthetic */ k9g a = new k9g();

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        String str = (String) nigVar.a;
        if (!str.equals("type.googleapis.com/google.crypto.tink.HpkePrivateKey")) {
            ay0.e(ka1.r("Wrong type URL in call to HpkeProtoSerialization.parsePrivateKey: ", str));
            return null;
        }
        try {
            trg trgVarU = trg.u((hsf) nigVar.c, ptf.a);
            if (trgVarU.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            xrg xrgVarZ = trgVarU.z();
            if (xrgVarZ.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            scg scgVarA = cdg.a((ntg) nigVar.e, xrgVarZ.y());
            rcg rcgVar = scgVarA.a;
            return xcg.L(jdg.L(scgVarA, cdg.c(rcgVar, xrgVarZ.B().x()), (Integer) nigVar.f), new ujf(28, qvg.a(qq7.K(qq7.I(trgVarU.A().x()), weg.a(rcgVar)))));
        } catch (zzale unused) {
            ygf.l("Parsing HpkePrivateKey failed");
            return null;
        }
    }

    @Override // defpackage.ukg
    public ing d(ur7 ur7Var) throws GeneralSecurityException {
        srg srgVar = (srg) ur7Var;
        omg omgVar = kvg.a;
        int iD = kvg.d(srgVar.i.i.b);
        gog gogVarZ = jog.z();
        urg urgVar = srgVar.i;
        nog nogVarE = kvg.e(urgVar);
        gogVarZ.c();
        ((jog) gogVarZ.b).B(nogVarE);
        byte[] bArrQ = kk7.Q((BigInteger) srgVar.j.b, iD);
        omf omfVar = pmf.b;
        omf omfVarC = pmf.C(bArrQ, 0, bArrQ.length);
        gogVarZ.c();
        ((jog) gogVarZ.b).C(omfVarC);
        return ing.k("type.googleapis.com/google.crypto.tink.EcdsaPrivateKey", ((jog) gogVarZ.e()).c(), d1g.x, kvg.a(urgVar.i.d), urgVar.l);
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) {
        hsg hsgVarT = isg.t();
        hsgVarT.g("type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key");
        hsgVarT.h(hug.v().b());
        hsgVarT.e(l9g.b(((m5g) bzfVar).a));
        return lig.p0((isg) hsgVarT.b());
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        isg isgVar = (isg) ligVar.c;
        if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.AesCmacKey")) {
            ay0.e(ka1.r("Wrong type URL in call to AesCmacProtoSerialization.parseParameters: ", isgVar.B()));
            return null;
        }
        try {
            glg glgVarU = glg.u(isgVar.A(), ptf.a);
            tag tagVarB = gjg.b();
            tagVarB.f(glgVarU.t());
            tagVarB.h(glgVarU.y().t());
            tagVarB.b = ckg.a(isgVar.z());
            return tagVarB.d();
        } catch (zzale e) {
            throw new GeneralSecurityException("Parsing AesCmacParameters failed: ", e);
        }
    }
}

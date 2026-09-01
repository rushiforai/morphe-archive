package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.android.recaptcha.internal.zzaek;
import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pbg implements rhg, yfg, qkg {
    public static final /* synthetic */ pbg b = new pbg(3);
    public final /* synthetic */ int a;

    public /* synthetic */ pbg(int i) {
        this.a = i;
    }

    @Override // defpackage.qkg
    public ur7 j(ing ingVar) throws GeneralSecurityException {
        omg omgVar = pvg.a;
        String str = (String) ingVar.a;
        if (!str.equals("type.googleapis.com/google.crypto.tink.Ed25519PrivateKey")) {
            ay0.e("Wrong type URL in call to Ed25519ProtoSerialization.parsePrivateKey: ".concat(String.valueOf(str)));
            return null;
        }
        try {
            pmf pmfVar = (pmf) ingVar.c;
            anf anfVar = anf.a;
            int i = gmf.a;
            tog togVarY = tog.y(pmfVar, anf.a);
            if (togVarY.v() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            wog wogVarX = togVarY.x();
            if (wogVarX.v() == 0) {
                return fsg.R(nsg.R(pvg.b((e1g) ingVar.e), cmf.a(wogVarX.w().E()), (Integer) ingVar.f), new wjc(9, cmf.a(togVarY.w().E())));
            }
            throw new GeneralSecurityException("Only version 0 keys are accepted");
        } catch (zzaek unused) {
            ygf.l("Parsing Ed25519PrivateKey failed");
            return null;
        }
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) {
        kjg kjgVar = (kjg) gr7Var;
        eqg eqgVarX = gqg.x();
        ujg ujgVar = kjgVar.h;
        rqg rqgVarX = tqg.x();
        int i = ujgVar.b;
        rqgVarX.c();
        ((tqg) rqgVarX.b).zzf = i;
        iqg iqgVar = (iqg) gkg.b.c(ujgVar.d);
        rqgVarX.c();
        ((tqg) rqgVarX.b).zze = iqgVar.zza();
        tqg tqgVar = (tqg) rqgVarX.b();
        eqgVarX.c();
        gqg.w((gqg) eqgVarX.b, tqgVar);
        byte[] bArrB = ((qvg) kjgVar.i.b).b();
        rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
        eqgVarX.c();
        gqg.v((gqg) eqgVarX.b, rsfVarP);
        return nig.I("type.googleapis.com/google.crypto.tink.HmacKey", ((gqg) eqgVarX.b()).b(), zrg.SYMMETRIC, (ntg) gkg.a.c(kjgVar.h.c), kjgVar.j);
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        switch (this.a) {
            case 0:
                isg isgVar = (isg) ligVar.c;
                if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.AesSivKey")) {
                    ay0.e(ka1.r("Wrong type URL in call to AesSivParameters.parseParameters: ", isgVar.B()));
                    return null;
                }
                try {
                    zng zngVarU = zng.u(isgVar.A(), ptf.a);
                    if (zngVarU.w() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    d2f d2fVarB = dbg.b();
                    d2fVarB.E0(zngVarU.t());
                    d2fVarB.c = nbg.a(isgVar.z());
                    return d2fVarB.B0();
                } catch (zzale e) {
                    throw new GeneralSecurityException("Parsing AesSivParameters failed: ", e);
                }
            default:
                isg isgVar2 = (isg) ligVar.c;
                if (!isgVar2.B().equals("type.googleapis.com/google.crypto.tink.EciesAeadHkdfPrivateKey")) {
                    ay0.e(ka1.r("Wrong type URL in call to EciesProtoSerialization.parseParameters: ", isgVar2.B()));
                    return null;
                }
                try {
                    return geg.b(isgVar2.z(), uog.u(isgVar2.A(), ptf.a).w());
                } catch (zzale e2) {
                    throw new GeneralSecurityException("Parsing EciesParameters failed: ", e2);
                }
        }
    }
}

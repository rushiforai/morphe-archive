package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.Provider;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e9g implements vfg, yfg, jvg {
    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        String str = (String) nigVar.a;
        if (!str.equals("type.googleapis.com/google.crypto.tink.HpkePublicKey")) {
            ay0.e(ka1.r("Wrong type URL in call to HpkeProtoSerialization.parsePublicKey: ", str));
            return null;
        }
        try {
            xrg xrgVarU = xrg.u((hsf) nigVar.c, ptf.a);
            if (xrgVarU.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            scg scgVarA = cdg.a((ntg) nigVar.e, xrgVarU.y());
            return jdg.L(scgVarA, cdg.c(scgVarA.a, xrgVarU.B().x()), (Integer) nigVar.f);
        } catch (zzale unused) {
            ygf.l("Parsing HpkePublicKey failed");
            return null;
        }
    }

    @Override // defpackage.jvg
    public /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? MessageDigest.getInstance(str) : MessageDigest.getInstance(str, provider);
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) {
        djg djgVar = (djg) gr7Var;
        zkg zkgVarX = blg.x();
        gjg gjgVar = djgVar.h;
        jlg jlgVarV = klg.v();
        int i = gjgVar.b;
        jlgVarV.c();
        ((klg) jlgVarV.b).zze = i;
        klg klgVar = (klg) jlgVarV.b();
        zkgVarX.c();
        blg.w((blg) zkgVarX.b, klgVar);
        byte[] bArrB = ((qvg) djgVar.i.b).b();
        rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
        zkgVarX.c();
        blg.v((blg) zkgVarX.b, rsfVarP);
        return nig.I("type.googleapis.com/google.crypto.tink.AesCmacKey", ((blg) zkgVarX.b()).b(), zrg.SYMMETRIC, ckg.b(djgVar.h.c), djgVar.j);
    }
}

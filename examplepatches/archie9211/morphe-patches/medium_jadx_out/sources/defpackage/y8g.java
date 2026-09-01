package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.security.GeneralSecurityException;
import java.security.KeyPairGenerator;
import java.security.Provider;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class y8g implements rhg, thg, cfg, jvg {
    @Override // defpackage.cfg
    public byte[] b(byte[] bArr, byte[] bArr2) {
        return no7.L(bArr, bArr2);
    }

    @Override // defpackage.jvg
    public /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? KeyPairGenerator.getInstance(str) : KeyPairGenerator.getInstance(str, provider);
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) {
        scg scgVar = (scg) bzfVar;
        hsg hsgVarT = isg.t();
        hsgVarT.g("type.googleapis.com/google.crypto.tink.HpkePrivateKey");
        frg frgVarV = hrg.v();
        org orgVarD = cdg.d(scgVar);
        frgVarV.c();
        hrg.u((hrg) frgVarV.b, orgVarD);
        hsgVarT.h(((hrg) frgVarV.b()).b());
        hsgVarT.e((ntg) cdg.g.c(scgVar.d));
        return lig.p0((isg) hsgVarT.b());
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        isg isgVar = (isg) ligVar.c;
        if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.XAesGcmKey")) {
            ay0.e(ka1.r("Wrong type URL in call to XAesGcmProtoSerialization.parseParameters: ", isgVar.B()));
            return null;
        }
        try {
            vtg vtgVarU = vtg.u(isgVar.A(), ptf.a);
            if (vtgVarU.t() == 0) {
                return a5g.b(w8g.a(isgVar.z()), vtgVarU.x().t());
            }
            ygf.l("Only version 0 parameters are accepted");
            return null;
        } catch (zzale e) {
            throw new GeneralSecurityException("Parsing XAesGcmParameters failed: ", e);
        }
    }
}

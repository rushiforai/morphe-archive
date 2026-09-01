package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.android.recaptcha.internal.zzaek;
import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class s9g implements vfg, thg, qkg {
    public static final /* synthetic */ s9g b = new s9g(3);
    public final /* synthetic */ int a;

    public /* synthetic */ s9g(int i) {
        this.a = i;
    }

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        if (!((String) nigVar.a).equals("type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key")) {
            ay0.e("Wrong type URL in call to XChaCha20Poly1305ProtoSerialization.parseKey");
            return null;
        }
        try {
            eug eugVarU = eug.u((hsf) nigVar.c, ptf.a);
            if (eugVarU.t() == 0) {
                return g5g.L(l9g.a((ntg) nigVar.e), new ujf(28, qvg.a(eugVarU.x().x())), (Integer) nigVar.f);
            }
            throw new GeneralSecurityException("Only version 0 keys are accepted");
        } catch (zzale unused) {
            ygf.l("Parsing XChaCha20Poly1305Key failed");
            return null;
        }
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) throws GeneralSecurityException {
        switch (this.a) {
            case 1:
                jcg jcgVar = (jcg) bzfVar;
                hsg hsgVarT = isg.t();
                hsgVarT.g("type.googleapis.com/google.crypto.tink.EciesAeadHkdfPrivateKey");
                sog sogVarT = uog.t();
                zog zogVarD = geg.d(jcgVar);
                sogVarT.c();
                uog.v((uog) sogVarT.b, zogVarD);
                hsgVarT.h(((uog) sogVarT.b()).b());
                hsgVarT.e((ntg) geg.g.c(jcgVar.d));
                return lig.p0((isg) hsgVarT.b());
            default:
                ujg ujgVar = (ujg) bzfVar;
                hsg hsgVarT2 = isg.t();
                hsgVarT2.g("type.googleapis.com/google.crypto.tink.HmacKey");
                lqg lqgVarY = nqg.y();
                rqg rqgVarX = tqg.x();
                int i = ujgVar.b;
                rqgVarX.c();
                ((tqg) rqgVarX.b).zzf = i;
                iqg iqgVar = (iqg) gkg.b.c(ujgVar.d);
                rqgVarX.c();
                ((tqg) rqgVarX.b).zze = iqgVar.zza();
                tqg tqgVar = (tqg) rqgVarX.b();
                lqgVarY.c();
                nqg.w((nqg) lqgVarY.b, tqgVar);
                int i2 = ujgVar.a;
                lqgVarY.c();
                ((nqg) lqgVarY.b).zzg = i2;
                hsgVarT2.h(((nqg) lqgVarY.b()).b());
                hsgVarT2.e((ntg) gkg.a.c(ujgVar.c));
                return lig.p0((isg) hsgVarT2.b());
        }
    }

    @Override // defpackage.qkg
    public ur7 j(ing ingVar) throws GeneralSecurityException {
        omg omgVar = pvg.a;
        String str = (String) ingVar.a;
        if (!str.equals("type.googleapis.com/google.crypto.tink.Ed25519PublicKey")) {
            ay0.e("Wrong type URL in call to Ed25519ProtoSerialization.parsePublicKey: ".concat(String.valueOf(str)));
            return null;
        }
        try {
            pmf pmfVar = (pmf) ingVar.c;
            anf anfVar = anf.a;
            int i = gmf.a;
            wog wogVarX = wog.x(pmfVar, anf.a);
            if (wogVarX.v() == 0) {
                return nsg.R(pvg.b((e1g) ingVar.e), cmf.a(wogVarX.w().E()), (Integer) ingVar.f);
            }
            throw new GeneralSecurityException("Only version 0 keys are accepted");
        } catch (zzaek unused) {
            ygf.l("Parsing Ed25519PublicKey failed");
            return null;
        }
    }
}

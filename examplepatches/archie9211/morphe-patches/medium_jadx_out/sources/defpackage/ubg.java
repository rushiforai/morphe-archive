package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.android.recaptcha.internal.zzaek;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.security.spec.ECPoint;
import javax.crypto.Cipher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ubg implements vfg, jvg, qkg {
    public static final /* synthetic */ ubg b = new ubg(3);
    public final /* synthetic */ int a;

    public /* synthetic */ ubg(int i) {
        this.a = i;
    }

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        switch (this.a) {
            case 0:
                if (!((String) nigVar.a).equals("type.googleapis.com/google.crypto.tink.AesSivKey")) {
                    ay0.e("Wrong type URL in call to AesSivParameters.parseParameters");
                    return null;
                }
                try {
                    ung ungVarU = ung.u((hsf) nigVar.c, ptf.a);
                    if (ungVarU.t() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    d2f d2fVarB = dbg.b();
                    d2fVarB.E0(ungVarU.x().e());
                    d2fVarB.c = nbg.a((ntg) nigVar.e);
                    dbg dbgVarB0 = d2fVarB.B0();
                    tag tagVar = new tag();
                    tagVar.b = null;
                    tagVar.c = null;
                    tagVar.a = dbgVarB0;
                    tagVar.b = new ujf(28, qvg.a(ungVarU.x().x()));
                    tagVar.c = (Integer) nigVar.f;
                    return tagVar.b();
                } catch (zzale unused) {
                    ygf.l("Parsing AesSivKey failed");
                    return null;
                }
            default:
                String str = (String) nigVar.a;
                Integer num = (Integer) nigVar.f;
                if (!str.equals("type.googleapis.com/google.crypto.tink.EciesAeadHkdfPublicKey")) {
                    ay0.e(ka1.r("Wrong type URL in call to EciesProtoSerialization.parsePublicKey: ", str));
                    return null;
                }
                try {
                    jpg jpgVarU = jpg.u((hsf) nigVar.c, ptf.a);
                    if (jpgVarU.t() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    jcg jcgVarB = geg.b((ntg) nigVar.e, jpgVarU.y());
                    if (!jcgVarB.a.equals(fcg.e)) {
                        return ucg.L(jcgVarB, new ECPoint(qq7.I(jpgVarU.C().x()), qq7.I(jpgVarU.D().x())), num);
                    }
                    if (jpgVarU.D().e() == 0) {
                        return ucg.M(jcgVarB, qvg.a(jpgVarU.C().x()), num);
                    }
                    throw new GeneralSecurityException("Y must be empty for X25519 points");
                } catch (zzale | IllegalArgumentException unused2) {
                    ygf.l("Parsing EcdsaPublicKey failed");
                    return null;
                }
        }
    }

    @Override // defpackage.jvg
    public /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? Cipher.getInstance(str) : Cipher.getInstance(str, provider);
    }

    @Override // defpackage.qkg
    public ur7 j(ing ingVar) throws GeneralSecurityException {
        omg omgVar = elf.a;
        String str = (String) ingVar.a;
        if (!str.equals("type.googleapis.com/google.crypto.tink.RsaSsaPkcs1PublicKey")) {
            ay0.e("Wrong type URL in call to RsaSsaPkcs1ProtoSerialization.parsePublicKey: ".concat(String.valueOf(str)));
            return null;
        }
        try {
            pmf pmfVar = (pmf) ingVar.c;
            anf anfVar = anf.a;
            int i = gmf.a;
            sqg sqgVarZ = sqg.z(pmfVar, anf.a);
            if (sqgVarZ.v() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            BigInteger bigInteger = new BigInteger(1, sqgVarZ.x().E());
            int iBitLength = bigInteger.bitLength();
            BigInteger bigInteger2 = dug.e;
            ytg ytgVar = new ytg();
            ytgVar.c = (aug) elf.g.f(sqgVarZ.w().v());
            ytgVar.b = new BigInteger(1, sqgVarZ.y().E());
            ytgVar.a(iBitLength);
            ytgVar.d = elf.b((e1g) ingVar.e);
            dug dugVarB = ytgVar.b();
            tag tagVar = new tag();
            tagVar.a = dugVarB;
            tagVar.b = bigInteger;
            tagVar.c = (Integer) ingVar.f;
            return tagVar.k();
        } catch (zzaek | IllegalArgumentException unused) {
            ygf.l("Parsing RsaSsaPkcs1PublicKey failed");
            return null;
        }
    }
}

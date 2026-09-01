package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.security.GeneralSecurityException;
import javax.crypto.Cipher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class t9g implements yfg, vfg, ukg {
    public static final /* synthetic */ t9g a = new t9g();

    public static Cipher a() {
        try {
            Cipher cipher = (Cipher) v9g.a.get();
            if (cipher != null) {
                return cipher;
            }
            throw new GeneralSecurityException("AES GCM SIV cipher is invalid.");
        } catch (IllegalStateException e) {
            throw new GeneralSecurityException("AES GCM SIV cipher is not available or is invalid.", e);
        }
    }

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        if (!((String) nigVar.a).equals("type.googleapis.com/google.crypto.tink.HmacKey")) {
            ay0.e("Wrong type URL in call to HmacProtoSerialization.parseKey");
            return null;
        }
        try {
            gqg gqgVarU = gqg.u((hsf) nigVar.c, ptf.a);
            if (gqgVarU.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            rjg rjgVarB = ujg.b();
            rjgVarB.a = Integer.valueOf(gqgVarU.A().e());
            rjgVarB.b = Integer.valueOf(gqgVarU.z().t());
            rjgVarB.c = (tjg) gkg.b.d(gqgVarU.z().w());
            rjgVarB.d = (sjg) gkg.a.d((ntg) nigVar.e);
            ujg ujgVarA = rjgVarB.a();
            tag tagVar = new tag();
            tagVar.b = null;
            tagVar.c = null;
            tagVar.a = ujgVarA;
            tagVar.b = new ujf(28, qvg.a(gqgVarU.A().x()));
            tagVar.c = (Integer) nigVar.f;
            return tagVar.e();
        } catch (zzale | IllegalArgumentException unused) {
            ygf.l("Parsing HmacKey failed");
            return null;
        }
    }

    @Override // defpackage.ukg
    public ing d(ur7 ur7Var) {
        fsg fsgVar = (fsg) ur7Var;
        omg omgVar = pvg.a;
        qog qogVarZ = tog.z();
        wog wogVarC = pvg.c(fsgVar.i);
        qogVarZ.c();
        ((tog) qogVarZ.b).C(wogVarC);
        byte[] bArrB = ((cmf) fsgVar.j.b).b();
        omf omfVarC = pmf.C(bArrB, 0, bArrB.length);
        qogVarZ.c();
        ((tog) qogVarZ.b).B(omfVarC);
        omf omfVarC2 = ((tog) qogVarZ.e()).c();
        d1g d1gVar = d1g.x;
        nsg nsgVar = fsgVar.i;
        return ing.k("type.googleapis.com/google.crypto.tink.Ed25519PrivateKey", omfVarC2, d1gVar, pvg.a(nsgVar.i.a), nsgVar.l);
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) {
        ucg ucgVar = (ucg) gr7Var;
        return nig.I("type.googleapis.com/google.crypto.tink.EciesAeadHkdfPublicKey", geg.c(ucgVar).b(), zrg.ASYMMETRIC_PUBLIC, (ntg) geg.g.c(ucgVar.h.d), ucgVar.l);
    }
}

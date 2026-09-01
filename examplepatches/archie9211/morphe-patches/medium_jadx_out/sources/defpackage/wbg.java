package defpackage;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.Provider;
import java.security.spec.ECPoint;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class wbg implements bag, vfg, jvg {
    @Override // defpackage.bag
    public bag a() {
        return new wbg();
    }

    @Override // defpackage.bag
    public mpg b(mpg mpgVar, int i, int i2) {
        byte[] bArr;
        int length;
        byte[] bArr2;
        if (i < 0 || i > i2 || i2 > (length = (bArr = mpgVar.a).length) || i > i2 || i2 > length) {
            throw new IndexOutOfBoundsException();
        }
        int i3 = i2 - i;
        if (i3 == 0) {
            bArr2 = new byte[0];
        } else {
            byte[] bArr3 = new byte[i3];
            System.arraycopy(bArr, i, bArr3, 0, i3);
            bArr2 = bArr3;
        }
        return new mpg(bArr2);
    }

    @Override // defpackage.bag
    public byte c(mpg mpgVar, int i) {
        return mpgVar.b(i);
    }

    @Override // defpackage.jvg
    public /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? KeyFactory.getInstance(str) : KeyFactory.getInstance(str, provider);
    }

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        String str = (String) nigVar.a;
        Integer num = (Integer) nigVar.f;
        if (!str.equals("type.googleapis.com/google.crypto.tink.EciesAeadHkdfPrivateKey")) {
            ay0.e(ka1.r("Wrong type URL in call to EciesProtoSerialization.parsePrivateKey: ", str));
            return null;
        }
        try {
            fpg fpgVarU = fpg.u((hsf) nigVar.c, ptf.a);
            if (fpgVarU.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            jpg jpgVarZ = fpgVarU.z();
            if (jpgVarZ.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            jcg jcgVarB = geg.b((ntg) nigVar.e, jpgVarZ.y());
            if (jcgVarB.a.equals(fcg.e)) {
                return lcg.N(ucg.M(jcgVarB, qvg.a(jpgVarZ.C().x()), num), new ujf(28, qvg.a(fpgVarU.A().x())));
            }
            return lcg.M(ucg.L(jcgVarB, new ECPoint(qq7.I(jpgVarZ.C().x()), qq7.I(jpgVarZ.D().x())), num), new wjc(16, qq7.I(fpgVarU.A().x())));
        } catch (zzale | IllegalArgumentException unused) {
            ygf.l(ZVsviyDAr.mOJqH);
            return null;
        }
    }
}

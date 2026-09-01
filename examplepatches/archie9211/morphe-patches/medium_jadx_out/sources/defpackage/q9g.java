package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.nio.ByteBuffer;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class q9g implements rhg, keg, ukg {
    public static final /* synthetic */ q9g b = new q9g(3);
    public final /* synthetic */ int a;

    public /* synthetic */ q9g(int i) {
        this.a = i;
    }

    @Override // defpackage.keg
    public byte[] a() {
        return weg.k;
    }

    @Override // defpackage.keg
    public byte[] c(byte[] bArr, byte[] bArr2, byte[] bArr3, int i, byte[] bArr4) throws GeneralSecurityException {
        if (bArr.length != 32) {
            throw new InvalidAlgorithmParameterException("Unexpected key length: 32");
        }
        mag magVar = m8g.c;
        try {
            d7g.a();
            m8g m8gVar = new m8g(bArr, d7g.a().getProvider());
            if (bArr3 == null) {
                z72.c("ciphertext is null");
                return null;
            }
            if (bArr2.length != 12) {
                ygf.l("nonce length must be 12 bytes.");
                return null;
            }
            if (bArr3.length < i + 16) {
                ygf.l("ciphertext too short");
                return null;
            }
            IvParameterSpec ivParameterSpec = new IvParameterSpec(bArr2);
            Cipher cipher = Cipher.getInstance("ChaCha20-Poly1305", m8gVar.b);
            cipher.init(2, m8gVar.a, ivParameterSpec);
            if (bArr4.length != 0) {
                cipher.updateAAD(bArr4);
            }
            return cipher.doFinal(bArr3, i, bArr3.length - i);
        } catch (GeneralSecurityException unused) {
            return new i8g(bArr, 0).c(ByteBuffer.wrap(Arrays.copyOfRange(bArr3, i, bArr3.length)), bArr2, bArr4);
        }
    }

    @Override // defpackage.ukg
    public ing d(ur7 ur7Var) {
        nsg nsgVar = (nsg) ur7Var;
        return ing.k("type.googleapis.com/google.crypto.tink.Ed25519PublicKey", pvg.c(nsgVar).c(), d1g.y, pvg.a(nsgVar.i.a), nsgVar.l);
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        switch (this.a) {
            case 0:
                isg isgVar = (isg) ligVar.c;
                if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key")) {
                    ay0.e(ka1.r("Wrong type URL in call to XChaCha20Poly1305ProtoSerialization.parseParameters: ", isgVar.B()));
                    return null;
                }
                try {
                    if (hug.u(isgVar.A(), ptf.a).t() == 0) {
                        return new m5g(l9g.a(isgVar.z()));
                    }
                    ygf.l("Only version 0 parameters are accepted");
                    return null;
                } catch (zzale e) {
                    throw new GeneralSecurityException("Parsing XChaCha20Poly1305Parameters failed: ", e);
                }
            default:
                isg isgVar2 = (isg) ligVar.c;
                if (!isgVar2.B().equals("type.googleapis.com/google.crypto.tink.HmacKey")) {
                    ay0.e(ka1.r("Wrong type URL in call to HmacProtoSerialization.parseParameters: ", isgVar2.B()));
                    return null;
                }
                try {
                    nqg nqgVarU = nqg.u(isgVar2.A(), ptf.a);
                    if (nqgVarU.x() != 0) {
                        throw new GeneralSecurityException(b09.w(nqgVarU.x(), "Parsing HmacParameters failed: unknown Version "));
                    }
                    rjg rjgVarB = ujg.b();
                    rjgVarB.a = Integer.valueOf(nqgVarU.t());
                    rjgVarB.b = Integer.valueOf(nqgVarU.A().t());
                    rjgVarB.c = (tjg) gkg.b.d(nqgVarU.A().w());
                    rjgVarB.d = (sjg) gkg.a.d(isgVar2.z());
                    return rjgVarB.a();
                } catch (zzale e2) {
                    throw new GeneralSecurityException("Parsing HmacParameters failed: ", e2);
                }
        }
    }

    @Override // defpackage.keg, defpackage.eeg
    public int zza() {
        return 32;
    }
}

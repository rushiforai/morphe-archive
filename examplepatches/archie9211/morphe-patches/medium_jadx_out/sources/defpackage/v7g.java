package defpackage;

import java.security.GeneralSecurityException;
import java.security.spec.AlgorithmParameterSpec;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v7g {
    public static final mag b = mag.zzb;
    public final SecretKeySpec a;

    public v7g(byte[] bArr) throws GeneralSecurityException {
        if (!b.zza()) {
            ygf.l("Can not use AES-GCM in FIPS-mode, as BoringCrypto module is not available.");
            throw null;
        }
        bt btVar = b6g.a;
        mo7.W(bArr.length);
        this.a = new SecretKeySpec(bArr, "AES");
    }

    public final byte[] a(byte[] bArr, byte[] bArr2, int i, byte[] bArr3) throws GeneralSecurityException {
        if (bArr.length != 12) {
            ygf.l("iv is wrong size");
            return null;
        }
        if (bArr2.length < i + 16) {
            ygf.l("ciphertext too short");
            return null;
        }
        AlgorithmParameterSpec algorithmParameterSpecA = b6g.a(bArr, 0, bArr.length);
        Cipher cipher = (Cipher) b6g.a.get();
        cipher.init(2, this.a, algorithmParameterSpecA);
        if (bArr3 != null && bArr3.length != 0) {
            cipher.updateAAD(bArr3);
        }
        return cipher.doFinal(bArr2, i, bArr2.length - i);
    }
}

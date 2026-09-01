package defpackage;

import java.security.GeneralSecurityException;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pug implements lwf {
    public static final mag c = mag.zzb;
    public final SecretKeySpec a;
    public final byte[] b;

    public pug(byte[] bArr, qvg qvgVar) throws GeneralSecurityException {
        if (!c.zza()) {
            ygf.l("Can not use AES-GCM in FIPS-mode, as BoringCrypto module is not available.");
            throw null;
        }
        bt btVar = b6g.a;
        mo7.W(bArr.length);
        this.a = new SecretKeySpec(bArr, "AES");
        this.b = qvgVar.b();
    }

    @Override // defpackage.lwf
    public final byte[] b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (bArr == null) {
            z72.c("ciphertext is null");
            return null;
        }
        int length = bArr.length;
        byte[] bArr3 = this.b;
        if (length < bArr3.length + 28) {
            ygf.l("ciphertext too short");
            return null;
        }
        if (!ejg.b(bArr3, bArr)) {
            ygf.l("Decryption failed (OutputPrefix mismatch).");
            return null;
        }
        AlgorithmParameterSpec algorithmParameterSpecA = b6g.a(bArr, bArr3.length, 12);
        Cipher cipher = (Cipher) b6g.a.get();
        cipher.init(2, this.a, algorithmParameterSpecA);
        if (bArr2 != null && bArr2.length != 0) {
            cipher.updateAAD(bArr2);
        }
        return cipher.doFinal(bArr, bArr3.length + 12, (bArr.length - bArr3.length) - 12);
    }

    @Override // defpackage.lwf
    public final byte[] c(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (bArr == null) {
            z72.c("plaintext is null");
            return null;
        }
        byte[] bArrA = qig.a(12);
        AlgorithmParameterSpec algorithmParameterSpecA = b6g.a(bArrA, 0, bArrA.length);
        Cipher cipher = (Cipher) b6g.a.get();
        cipher.init(1, this.a, algorithmParameterSpecA);
        if (bArr2 != null && bArr2.length != 0) {
            cipher.updateAAD(bArr2);
        }
        int outputSize = cipher.getOutputSize(bArr.length);
        byte[] bArr3 = this.b;
        if (outputSize > 2147483635 - bArr3.length) {
            ygf.l("plaintext too long");
            return null;
        }
        byte[] bArrCopyOf = Arrays.copyOf(bArr3, bArr3.length + 12 + outputSize);
        System.arraycopy(bArrA, 0, bArrCopyOf, bArr3.length, 12);
        if (cipher.doFinal(bArr, 0, bArr.length, bArrCopyOf, bArr3.length + 12) == outputSize) {
            return bArrCopyOf;
        }
        ygf.l("not enough data written");
        return null;
    }
}

package defpackage;

import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import java.security.Provider;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d7g implements lwf {
    public static final mag d = mag.zza;
    public static final byte[] e = vn7.o0("808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9f");
    public static final byte[] f = vn7.o0("070000004041424344454647");
    public static final byte[] g = vn7.o0("a0784d7a4716f3feb4f64e7f4b39bf04");
    public final SecretKeySpec a;
    public final byte[] b;
    public final Provider c;

    public d7g(byte[] bArr, byte[] bArr2, Provider provider) throws GeneralSecurityException {
        if (!d.zza()) {
            ygf.l("Can not use ChaCha20Poly1305 in FIPS-mode.");
            throw null;
        }
        if (bArr.length != 32) {
            throw new InvalidKeyException("The key length in bytes must be 32.");
        }
        this.a = new SecretKeySpec(bArr, "ChaCha20");
        this.b = bArr2;
        this.c = provider;
    }

    public static Cipher a() throws GeneralSecurityException {
        Cipher cipher = (Cipher) cvg.b.a.a("ChaCha20-Poly1305");
        try {
            IvParameterSpec ivParameterSpec = new IvParameterSpec(f);
            byte[] bArr = e;
            cipher.init(2, new SecretKeySpec(bArr, "ChaCha20"), ivParameterSpec);
            byte[] bArr2 = g;
            if (cipher.doFinal(bArr2).length == 0) {
                cipher.init(2, new SecretKeySpec(bArr, "ChaCha20"), ivParameterSpec);
                if (cipher.doFinal(bArr2).length == 0) {
                    return cipher;
                }
            }
        } catch (GeneralSecurityException unused) {
        }
        ygf.l("JCE does not support algorithm: ChaCha20-Poly1305");
        return null;
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
        byte[] bArr4 = new byte[12];
        System.arraycopy(bArr, bArr3.length, bArr4, 0, 12);
        IvParameterSpec ivParameterSpec = new IvParameterSpec(bArr4);
        Cipher cipher = Cipher.getInstance("ChaCha20-Poly1305", this.c);
        cipher.init(2, this.a, ivParameterSpec);
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
        IvParameterSpec ivParameterSpec = new IvParameterSpec(bArrA);
        Cipher cipher = Cipher.getInstance("ChaCha20-Poly1305", this.c);
        cipher.init(1, this.a, ivParameterSpec);
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

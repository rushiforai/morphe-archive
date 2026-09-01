package defpackage;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.drew.imaging.eps.ld.PdtluglzAX;
import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import java.security.Provider;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class g9g implements lwf {
    public static final mag d = mag.zza;
    public final byte[] a;
    public final byte[] b;
    public final Provider c;

    public g9g(byte[] bArr, byte[] bArr2, Provider provider) throws GeneralSecurityException {
        if (!d.zza()) {
            ygf.l("Can not use ChaCha20Poly1305 in FIPS-mode.");
            throw null;
        }
        if (bArr.length != 32) {
            throw new InvalidKeyException("The key length in bytes must be 32.");
        }
        this.a = bArr;
        this.b = bArr2;
        this.c = provider;
    }

    @Override // defpackage.lwf
    public final byte[] b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (bArr == null) {
            z72.c(aJzfoQ.yMYnx);
            return null;
        }
        int length = bArr.length;
        byte[] bArr3 = this.b;
        if (length < bArr3.length + 40) {
            ygf.l("ciphertext too short");
            return null;
        }
        if (!ejg.b(bArr3, bArr)) {
            ygf.l("Decryption failed (OutputPrefix mismatch).");
            return null;
        }
        byte[] bArr4 = new byte[24];
        System.arraycopy(bArr, bArr3.length, bArr4, 0, 24);
        SecretKeySpec secretKeySpec = new SecretKeySpec(y7g.c(this.a, bArr4), "ChaCha20");
        byte[] bArr5 = new byte[12];
        System.arraycopy(bArr4, 16, bArr5, 4, 8);
        IvParameterSpec ivParameterSpec = new IvParameterSpec(bArr5);
        mag magVar = d7g.d;
        Cipher cipher = Cipher.getInstance("ChaCha20-Poly1305", this.c);
        cipher.init(2, secretKeySpec, ivParameterSpec);
        if (bArr2 != null && bArr2.length != 0) {
            cipher.updateAAD(bArr2);
        }
        return cipher.doFinal(bArr, bArr3.length + 24, (bArr.length - bArr3.length) - 24);
    }

    @Override // defpackage.lwf
    public final byte[] c(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (bArr == null) {
            z72.c("plaintext is null");
            return null;
        }
        byte[] bArrA = qig.a(24);
        SecretKeySpec secretKeySpec = new SecretKeySpec(y7g.c(this.a, bArrA), "ChaCha20");
        byte[] bArr3 = new byte[12];
        System.arraycopy(bArrA, 16, bArr3, 4, 8);
        IvParameterSpec ivParameterSpec = new IvParameterSpec(bArr3);
        mag magVar = d7g.d;
        Cipher cipher = Cipher.getInstance("ChaCha20-Poly1305", this.c);
        cipher.init(1, secretKeySpec, ivParameterSpec);
        if (bArr2 != null && bArr2.length != 0) {
            cipher.updateAAD(bArr2);
        }
        int outputSize = cipher.getOutputSize(bArr.length);
        byte[] bArr4 = this.b;
        if (outputSize > 2147483623 - bArr4.length) {
            ygf.l("plaintext too long");
            return null;
        }
        byte[] bArrCopyOf = Arrays.copyOf(bArr4, bArr4.length + 24 + outputSize);
        System.arraycopy(bArrA, 0, bArrCopyOf, bArr4.length, 24);
        if (cipher.doFinal(bArr, 0, bArr.length, bArrCopyOf, bArr4.length + 24) == outputSize) {
            return bArrCopyOf;
        }
        ygf.l(PdtluglzAX.jHGBxzZT);
        return null;
    }
}

package defpackage;

import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.MessageDigest;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p6g implements lwf {
    public static final byte[] c = vn7.o0("7a806c");
    public static final byte[] d = vn7.o0("46bb91c3c5");
    public static final byte[] e = vn7.o0("36864200e0eaf5284d884a0e77d31646");
    public static final byte[] f = vn7.o0("bae8e37fc83441b16034566b");
    public static final byte[] g = vn7.o0("af60eb711bd85bc1e4d3e0a462e074eea428a8");
    public final SecretKeySpec a;
    public final byte[] b;

    public p6g(byte[] bArr, byte[] bArr2, t9g t9gVar) throws InvalidAlgorithmParameterException {
        this.b = bArr2;
        mo7.W(bArr.length);
        this.a = new SecretKeySpec(bArr, "AES");
    }

    public static boolean a(Cipher cipher) {
        try {
            byte[] bArr = f;
            cipher.init(2, new SecretKeySpec(e, "AES"), new GCMParameterSpec(128, bArr, 0, bArr.length));
            cipher.updateAAD(d);
            byte[] bArr2 = g;
            return MessageDigest.isEqual(cipher.doFinal(bArr2, 0, bArr2.length), c);
        } catch (GeneralSecurityException unused) {
            return false;
        }
    }

    @Override // defpackage.lwf
    public final byte[] b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
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
        Cipher cipherA = t9g.a();
        cipherA.init(2, this.a, new GCMParameterSpec(128, bArr, bArr3.length, 12));
        if (bArr2 != null && bArr2.length != 0) {
            cipherA.updateAAD(bArr2);
        }
        return cipherA.doFinal(bArr, bArr3.length + 12, (bArr.length - bArr3.length) - 12);
    }

    @Override // defpackage.lwf
    public final byte[] c(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        Cipher cipherA = t9g.a();
        int length = bArr.length;
        byte[] bArr3 = this.b;
        if (length > 2147483619 - bArr3.length) {
            ygf.l("plaintext too long");
            return null;
        }
        byte[] bArrCopyOf = Arrays.copyOf(bArr3, bArr3.length + 12 + bArr.length + 16);
        byte[] bArrA = qig.a(12);
        System.arraycopy(bArrA, 0, bArrCopyOf, bArr3.length, 12);
        cipherA.init(1, this.a, new GCMParameterSpec(128, bArrA, 0, bArrA.length));
        if (bArr2 != null && bArr2.length != 0) {
            cipherA.updateAAD(bArr2);
        }
        int iDoFinal = cipherA.doFinal(bArr, 0, bArr.length, bArrCopyOf, bArr3.length + 12);
        if (iDoFinal == bArr.length + 16) {
            return bArrCopyOf;
        }
        throw new GeneralSecurityException(ev6.w("encryption failed; AES-GCM-SIV tag must be 16 bytes, but got only ", iDoFinal - bArr.length, " bytes"));
    }
}

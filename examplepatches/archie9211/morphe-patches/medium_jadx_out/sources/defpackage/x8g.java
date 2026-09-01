package defpackage;

import java.security.GeneralSecurityException;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Arrays;
import javax.crypto.Cipher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x8g implements lwf {
    public final byte[] a;
    public final int b;
    public final rkg c;

    public x8g(byte[] bArr, qvg qvgVar, int i) {
        this.c = fo7.Z(pkg.K(jkg.b(bArr.length), new ujf(28, qvg.a(bArr))));
        this.a = qvgVar.b();
        this.b = i;
    }

    public final byte[] a(byte[] bArr) throws GeneralSecurityException {
        byte[] bArr2 = {0, 1, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        byte[] bArr3 = {0, 2, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        if (bArr.length > 12 || bArr.length < 8) {
            ygf.l("invalid salt size");
            return null;
        }
        System.arraycopy(bArr, 0, bArr2, 4, bArr.length);
        System.arraycopy(bArr, 0, bArr3, 4, bArr.length);
        byte[] bArr4 = new byte[32];
        rkg rkgVar = this.c;
        System.arraycopy(rkgVar.O(16, bArr2), 0, bArr4, 0, 16);
        System.arraycopy(rkgVar.O(16, bArr3), 0, bArr4, 16, 16);
        return bArr4;
    }

    @Override // defpackage.lwf
    public final byte[] b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (bArr == null) {
            z72.c("ciphertext is null");
            return null;
        }
        int length = bArr.length;
        byte[] bArr3 = this.a;
        int length2 = bArr3.length;
        int i = this.b;
        if (length < length2 + i + 28) {
            ygf.l("ciphertext too short");
            return null;
        }
        if (!ejg.b(bArr3, bArr)) {
            ygf.l("Decryption failed (OutputPrefix mismatch).");
            return null;
        }
        int length3 = bArr3.length + i;
        v7g v7gVar = new v7g(a(Arrays.copyOfRange(bArr, bArr3.length, length3)));
        int i2 = length3 + 12;
        return v7gVar.a(Arrays.copyOfRange(bArr, length3, i2), bArr, i2, bArr2);
    }

    @Override // defpackage.lwf
    public final byte[] c(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (bArr == null) {
            z72.c("plaintext is null");
            return null;
        }
        int i = this.b;
        int i2 = i + 12;
        byte[] bArrA = qig.a(i2);
        byte[] bArrCopyOf = Arrays.copyOf(bArrA, i);
        byte[] bArrCopyOfRange = Arrays.copyOfRange(bArrA, i, i2);
        v7g v7gVar = new v7g(a(bArrCopyOf));
        byte[] bArr3 = this.a;
        int length = bArr3.length + i + bArrCopyOfRange.length;
        if (bArrCopyOfRange.length != 12) {
            ygf.l("iv is wrong size");
            return null;
        }
        AlgorithmParameterSpec algorithmParameterSpecA = b6g.a(bArrCopyOfRange, 0, bArrCopyOfRange.length);
        Cipher cipher = (Cipher) b6g.a.get();
        cipher.init(1, v7gVar.a, algorithmParameterSpecA);
        if (bArr2 != null && bArr2.length != 0) {
            cipher.updateAAD(bArr2);
        }
        int outputSize = cipher.getOutputSize(bArr.length);
        if (outputSize > Integer.MAX_VALUE - length) {
            ygf.l("plaintext too long");
            return null;
        }
        byte[] bArr4 = new byte[length + outputSize];
        if (cipher.doFinal(bArr, 0, bArr.length, bArr4, length) != outputSize) {
            ygf.l("not enough data written");
            return null;
        }
        System.arraycopy(bArr3, 0, bArr4, 0, bArr3.length);
        System.arraycopy(bArrA, 0, bArr4, bArr3.length, bArrA.length);
        return bArr4;
    }
}

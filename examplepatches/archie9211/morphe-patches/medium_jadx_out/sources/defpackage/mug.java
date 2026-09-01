package defpackage;

import java.security.GeneralSecurityException;
import java.util.Arrays;
import javax.crypto.AEADBadTagException;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mug implements lwf {
    public static final mag e = mag.zza;
    public static final bt f = new bt(17);
    public final byte[] a;
    public final rkg b;
    public final SecretKeySpec c;
    public final int d;

    public mug(int i, byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (!e.zza()) {
            ygf.l("Can not use AES-EAX in FIPS-mode.");
            throw null;
        }
        if (i != 12 && i != 16) {
            ay0.e("IV size should be either 12 or 16 bytes");
            throw null;
        }
        this.d = i;
        mo7.W(bArr.length);
        this.c = new SecretKeySpec(bArr, "AES");
        this.b = fo7.Z(pkg.K(jkg.b(bArr.length), new ujf(28, qvg.a(bArr))));
        this.a = bArr2;
    }

    public final byte[] a(int i, int i2, int i3, byte[] bArr) {
        byte[] bArr2 = new byte[i3 + 16];
        bArr2[15] = (byte) i;
        System.arraycopy(bArr, i2, bArr2, 16, i3);
        return this.b.O(16, bArr2);
    }

    @Override // defpackage.lwf
    public final byte[] b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        int length = bArr.length;
        byte[] bArr3 = this.a;
        int length2 = length - bArr3.length;
        int i = this.d;
        int i2 = (length2 - i) - 16;
        if (i2 < 0) {
            ygf.l("ciphertext too short");
            return null;
        }
        if (!ejg.b(bArr3, bArr)) {
            ygf.l("Decryption failed (OutputPrefix mismatch).");
            return null;
        }
        byte[] bArrA = a(0, bArr3.length, i, bArr);
        if (bArr2 == null) {
            bArr2 = new byte[0];
        }
        byte[] bArrA2 = a(1, 0, bArr2.length, bArr2);
        byte[] bArrA3 = a(2, bArr3.length + i, i2, bArr);
        int length3 = bArr.length - 16;
        byte b = 0;
        for (int i3 = 0; i3 < 16; i3++) {
            b = (byte) (b | (((bArr[length3 + i3] ^ bArrA2[i3]) ^ bArrA[i3]) ^ bArrA3[i3]));
        }
        if (b != 0) {
            throw new AEADBadTagException("tag mismatch");
        }
        Cipher cipher = (Cipher) f.get();
        cipher.init(1, this.c, new IvParameterSpec(bArrA));
        return cipher.doFinal(bArr, bArr3.length + i, i2);
    }

    @Override // defpackage.lwf
    public final byte[] c(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        int length = bArr.length;
        byte[] bArr3 = this.a;
        int length2 = Integer.MAX_VALUE - bArr3.length;
        int i = this.d;
        if (length > (length2 - i) - 16) {
            ygf.l("plaintext too long");
            return null;
        }
        byte[] bArrCopyOf = Arrays.copyOf(bArr3, bArr3.length + i + bArr.length + 16);
        byte[] bArrA = qig.a(i);
        System.arraycopy(bArrA, 0, bArrCopyOf, bArr3.length, i);
        byte[] bArrA2 = a(0, 0, bArrA.length, bArrA);
        if (bArr2 == null) {
            bArr2 = new byte[0];
        }
        byte[] bArrA3 = a(1, 0, bArr2.length, bArr2);
        Cipher cipher = (Cipher) f.get();
        cipher.init(1, this.c, new IvParameterSpec(bArrA2));
        cipher.doFinal(bArr, 0, bArr.length, bArrCopyOf, bArr3.length + i);
        byte[] bArrA4 = a(2, bArr3.length + i, bArr.length, bArrCopyOf);
        int length3 = bArr3.length + bArr.length + i;
        for (int i2 = 0; i2 < 16; i2++) {
            bArrCopyOf[length3 + i2] = (byte) ((bArrA3[i2] ^ bArrA2[i2]) ^ bArrA4[i2]);
        }
        return bArrCopyOf;
    }
}

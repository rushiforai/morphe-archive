package defpackage;

import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tkg implements rkg {
    public static final mag d = mag.zza;
    public static final bt e = new bt(14);
    public final SecretKeySpec a;
    public final byte[] b;
    public final byte[] c;

    public tkg(byte[] bArr) throws GeneralSecurityException {
        mo7.W(bArr.length);
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, "AES");
        this.a = secretKeySpec;
        if (!d.zza()) {
            ygf.l("Can not use AES-CMAC in FIPS-mode.");
            throw null;
        }
        Cipher cipher = (Cipher) e.get();
        cipher.init(1, secretKeySpec);
        byte[] bArrM = mk7.M(cipher.doFinal(new byte[16]));
        this.b = bArrM;
        this.c = mk7.M(bArrM);
    }

    @Override // defpackage.rkg
    public final byte[] O(int i, byte[] bArr) throws GeneralSecurityException {
        byte[] bArrG;
        if (i > 16) {
            throw new InvalidAlgorithmParameterException("outputLength too large, max is 16 bytes");
        }
        if (!d.zza()) {
            ygf.l("Can not use AES-CMAC in FIPS-mode.");
            return null;
        }
        Cipher cipher = (Cipher) e.get();
        cipher.init(1, this.a);
        int length = bArr.length;
        int i2 = length == 0 ? 1 : ((length - 1) / 16) + 1;
        if ((i2 << 4) == bArr.length) {
            bArrG = il7.F(bArr, (i2 - 1) << 4, this.b, 16);
        } else {
            byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr, (i2 - 1) << 4, bArr.length);
            if (bArrCopyOfRange.length >= 16) {
                ay0.e("x must be smaller than a block.");
                return null;
            }
            byte[] bArrCopyOf = Arrays.copyOf(bArrCopyOfRange, 16);
            bArrCopyOf[bArrCopyOfRange.length] = -128;
            bArrG = il7.G(bArrCopyOf, this.c);
        }
        byte[] bArr2 = new byte[16];
        byte[] bArr3 = new byte[16];
        for (int i3 = 0; i3 < i2 - 1; i3++) {
            int i4 = i3 << 4;
            for (int i5 = 0; i5 < 16; i5++) {
                bArr3[i5] = (byte) (bArr2[i5] ^ bArr[i5 + i4]);
            }
            if (cipher.doFinal(bArr3, 0, 16, bArr2) != 16) {
                ygf.f("Cipher didn't write full block");
                return null;
            }
        }
        for (int i6 = 0; i6 < 16; i6++) {
            bArr3[i6] = (byte) (bArr2[i6] ^ bArrG[i6]);
        }
        if (cipher.doFinal(bArr3, 0, 16, bArr2) == 16) {
            return 16 == i ? bArr2 : Arrays.copyOf(bArr2, i);
        }
        ygf.f("Cipher didn't write full block");
        return null;
    }
}

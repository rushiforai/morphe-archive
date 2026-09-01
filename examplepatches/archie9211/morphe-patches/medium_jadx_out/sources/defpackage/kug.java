package defpackage;

import java.security.GeneralSecurityException;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kug {
    public static final mag d = mag.zzb;
    public static final bt e = new bt(16);
    public final SecretKeySpec a;
    public final int b;
    public final int c;

    public kug(byte[] bArr, int i) throws GeneralSecurityException {
        if (!d.zza()) {
            ygf.l("Can not use AES-CTR in FIPS-mode, as BoringCrypto module is not available.");
            throw null;
        }
        mo7.W(bArr.length);
        this.a = new SecretKeySpec(bArr, "AES");
        int blockSize = ((Cipher) e.get()).getBlockSize();
        this.c = blockSize;
        if (i < 12 || i > blockSize) {
            ygf.l("invalid IV size");
            throw null;
        }
        this.b = i;
    }

    public final void a(byte[] bArr, int i, int i2, byte[] bArr2, int i3, byte[] bArr3, boolean z) {
        Cipher cipher = (Cipher) e.get();
        byte[] bArr4 = new byte[this.c];
        System.arraycopy(bArr3, 0, bArr4, 0, this.b);
        IvParameterSpec ivParameterSpec = new IvParameterSpec(bArr4);
        SecretKeySpec secretKeySpec = this.a;
        if (z) {
            cipher.init(1, secretKeySpec, ivParameterSpec);
        } else {
            cipher.init(2, secretKeySpec, ivParameterSpec);
        }
        if (cipher.doFinal(bArr, i, i2, bArr2, i3) == i2) {
            return;
        }
        ygf.l("stored output's length does not match input's length");
    }
}

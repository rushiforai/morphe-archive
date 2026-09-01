package defpackage;

import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rug {
    public static final mag d = mag.zza;
    public static final byte[] e = new byte[16];
    public static final byte[] f = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1};
    public static final bt g = new bt(18);
    public final rkg a;
    public final byte[] b;
    public final byte[] c;

    public rug(byte[] bArr, qvg qvgVar) throws GeneralSecurityException {
        if (!d.zza()) {
            ygf.l("Can not use AES-SIV in FIPS-mode.");
            throw null;
        }
        if (bArr.length != 32 && bArr.length != 64) {
            throw new InvalidKeyException(ev6.w("invalid key size: ", bArr.length, " bytes; key must have 32 or 64 bytes"));
        }
        byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr, 0, bArr.length / 2);
        this.b = Arrays.copyOfRange(bArr, bArr.length / 2, bArr.length);
        this.a = fo7.Z(pkg.K(jkg.b(bArrCopyOfRange.length), new ujf(28, qvg.a(bArrCopyOfRange))));
        this.c = qvgVar.b();
    }
}

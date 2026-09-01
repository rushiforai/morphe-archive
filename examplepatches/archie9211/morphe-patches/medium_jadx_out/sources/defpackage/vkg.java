package defpackage;

import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.util.Arrays;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vkg implements rkg {
    public static final mag c = mag.zza;
    public final SecretKeySpec a;
    public final Provider b;

    public vkg(byte[] bArr, Provider provider) throws GeneralSecurityException {
        if (!c.zza()) {
            ygf.l("Cannot use AES-CMAC in FIPS-mode, as BoringCrypto module is not available");
            throw null;
        }
        this.a = new SecretKeySpec(bArr, "AES");
        this.b = provider;
    }

    @Override // defpackage.rkg
    public final byte[] O(int i, byte[] bArr) throws NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        if (i > 16) {
            throw new InvalidAlgorithmParameterException("outputLength must not be larger than 16");
        }
        Mac mac = Mac.getInstance("AESCMAC", this.b);
        mac.init(this.a);
        byte[] bArrDoFinal = mac.doFinal(bArr);
        return i == bArrDoFinal.length ? bArrDoFinal : Arrays.copyOf(bArrDoFinal, i);
    }
}

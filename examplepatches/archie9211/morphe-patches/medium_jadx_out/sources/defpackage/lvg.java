package defpackage;

import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lvg implements rkg {
    public static final mag e = mag.zzb;
    public final ovg a;
    public final String b;
    public final SecretKeySpec c;
    public final int d;

    public lvg(String str, SecretKeySpec secretKeySpec) throws GeneralSecurityException {
        ovg ovgVar = new ovg(this);
        this.a = ovgVar;
        if (!e.zza()) {
            ygf.l("Can not use HMAC in FIPS-mode, as BoringCrypto module is not available.");
            throw null;
        }
        this.b = str;
        this.c = secretKeySpec;
        if (secretKeySpec.getEncoded().length < 16) {
            throw new InvalidAlgorithmParameterException("key size too small, need at least 16 bytes");
        }
        switch (str) {
            case "HMACSHA1":
                this.d = 20;
                break;
            case "HMACSHA224":
                this.d = 28;
                break;
            case "HMACSHA256":
                this.d = 32;
                break;
            case "HMACSHA384":
                this.d = 48;
                break;
            case "HMACSHA512":
                this.d = 64;
                break;
            default:
                throw new NoSuchAlgorithmException("unknown Hmac algorithm: ".concat(str));
        }
        ovgVar.get();
    }

    @Override // defpackage.rkg
    public final byte[] O(int i, byte[] bArr) throws InvalidAlgorithmParameterException {
        if (i > this.d) {
            throw new InvalidAlgorithmParameterException("tag size too big");
        }
        ovg ovgVar = this.a;
        ((Mac) ovgVar.get()).update(bArr);
        return Arrays.copyOf(((Mac) ovgVar.get()).doFinal(), i);
    }
}

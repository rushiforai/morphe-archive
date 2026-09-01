package defpackage;

import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import java.security.Provider;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m8g {
    public static final mag c = mag.zza;
    public final SecretKeySpec a;
    public final Provider b;

    public m8g(byte[] bArr, Provider provider) throws GeneralSecurityException {
        if (!c.zza()) {
            ygf.l("Can not use ChaCha20Poly1305 in FIPS-mode.");
            throw null;
        }
        if (bArr.length != 32) {
            throw new InvalidKeyException("The key length in bytes must be 32.");
        }
        this.a = new SecretKeySpec(bArr, "ChaCha20");
        this.b = provider;
    }
}

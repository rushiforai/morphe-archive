package ll;

import h6.c1;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes3.dex */
public final class f implements e {
    public f(int i5) throws GeneralSecurityException {
        switch (i5) {
            case 3:
                if (!c1.c(2)) {
                    throw new GeneralSecurityException("Can not use HMAC in FIPS-mode, as BoringCrypto module is not available.");
                }
                return;
            default:
                return;
        }
    }

    public static e a(a aVar) throws GeneralSecurityException {
        if (!c1.b(1)) {
            throw new GeneralSecurityException("Cannot use AES-CMAC in FIPS-mode.");
        }
        Provider providerN = kl.a.n();
        if (providerN != null) {
            try {
                return b(aVar, providerN);
            } catch (GeneralSecurityException unused) {
            }
        }
        return new f();
    }

    public static f b(a aVar, Provider provider) throws GeneralSecurityException {
        f fVar = new f();
        if (!c1.b(1)) {
            throw new GeneralSecurityException("Cannot use AES-CMAC in FIPS-mode.");
        }
        try {
            Mac.getInstance("AESCMAC", provider);
            aVar.f74987e.b();
            new SecretKeySpec(((tl.a) aVar.f74986d.f88562b).b(), "AES");
            return fVar;
        } catch (NoSuchAlgorithmException e3) {
            throw new GeneralSecurityException("AES-CMAC not available.", e3);
        }
    }
}

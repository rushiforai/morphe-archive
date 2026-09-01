package defpackage;

import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.Provider;
import java.security.Signature;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class glf implements njg {
    public static final byte[] f = new byte[0];
    public static final byte[] g = {0};
    public final RSAPublicKey a;
    public final String b;
    public final byte[] c;
    public final byte[] d;
    public final Provider e;

    public glf(RSAPublicKey rSAPublicKey, aug augVar, byte[] bArr, byte[] bArr2, Provider provider) throws GeneralSecurityException {
        String str = null;
        if (!hk7.M(2)) {
            ygf.l("Can not use RSA-PKCS1.5 in FIPS-mode, as BoringCrypto module is not available.");
            throw null;
        }
        ek7.R(rSAPublicKey.getModulus().bitLength());
        ek7.U(rSAPublicKey.getPublicExponent());
        this.a = rSAPublicKey;
        if (augVar == aug.b) {
            str = "SHA256withRSA";
        } else if (augVar == aug.c) {
            str = "SHA384withRSA";
        } else if (augVar == aug.d) {
            str = "SHA512withRSA";
        } else {
            ygf.l("unknown hash type");
        }
        this.b = str;
        this.c = bArr;
        this.d = bArr2;
        this.e = provider;
    }

    public static glf a(iug iugVar, Provider provider) {
        KeyFactory keyFactory = KeyFactory.getInstance("RSA", provider);
        BigInteger bigInteger = iugVar.j;
        dug dugVar = iugVar.i;
        return new glf((RSAPublicKey) keyFactory.generatePublic(new RSAPublicKeySpec(bigInteger, dugVar.b)), dugVar.d, iugVar.k.b(), dugVar.c != d1g.J ? f : g, provider);
    }

    @Override // defpackage.njg
    public final void b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArr3 = this.c;
        if (!aog.b(bArr3, bArr)) {
            ygf.l("Invalid signature (output prefix mismatch)");
            return;
        }
        Signature signature = Signature.getInstance(this.b, this.e);
        signature.initVerify(this.a);
        signature.update(bArr2);
        byte[] bArr4 = this.d;
        if (bArr4.length > 0) {
            signature.update(bArr4);
        }
        try {
            if (signature.verify(Arrays.copyOfRange(bArr, bArr3.length, bArr.length))) {
                return;
            }
        } catch (RuntimeException unused) {
        }
        ygf.l("Invalid signature");
    }
}

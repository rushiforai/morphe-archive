package rl;

import h6.c1;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.Signature;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.Arrays;
import kl.w0;
import ql.s;
import ql.t;
import ql.u;
import ql.w;

/* loaded from: classes3.dex */
public final class j implements el.i {

    /* renamed from: f, reason: collision with root package name */
    public static final byte[] f86091f = new byte[0];

    /* renamed from: g, reason: collision with root package name */
    public static final byte[] f86092g = {0};

    /* renamed from: a, reason: collision with root package name */
    public final RSAPublicKey f86093a;

    /* renamed from: b, reason: collision with root package name */
    public final String f86094b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f86095c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f86096d;

    /* renamed from: e, reason: collision with root package name */
    public final Provider f86097e;

    public j(RSAPublicKey rSAPublicKey, s sVar, byte[] bArr, byte[] bArr2, Provider provider) throws GeneralSecurityException {
        if (!c1.c(2)) {
            throw new GeneralSecurityException("Can not use RSA-PKCS1.5 in FIPS-mode, as BoringCrypto module is not available.");
        }
        sl.s.b(rSAPublicKey.getModulus().bitLength());
        sl.s.c(rSAPublicKey.getPublicExponent());
        this.f86093a = rSAPublicKey;
        this.f86094b = c(sVar);
        this.f86095c = bArr;
        this.f86096d = bArr2;
        this.f86097e = provider;
    }

    public static j b(w wVar, Provider provider) throws NoSuchAlgorithmException {
        KeyFactory keyFactory = KeyFactory.getInstance("RSA", provider);
        BigInteger bigInteger = wVar.f84226d;
        u uVar = wVar.f84225c;
        return new j((RSAPublicKey) keyFactory.generatePublic(new RSAPublicKeySpec(bigInteger, uVar.f84215b)), uVar.f84217d, wVar.f84227e.b(), uVar.f84216c.equals(t.f84210d) ? f86092g : f86091f, provider);
    }

    public static String c(s sVar) throws GeneralSecurityException {
        if (sVar == s.f84204b) {
            return "SHA256withRSA";
        }
        if (sVar == s.f84205c) {
            return "SHA384withRSA";
        }
        if (sVar == s.f84206d) {
            return "SHA512withRSA";
        }
        throw new GeneralSecurityException("unknown hash type");
    }

    @Override // el.i
    public final void a(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        boolean zVerify;
        byte[] bArr3 = this.f86095c;
        if (!w0.b(bArr3, bArr)) {
            throw new GeneralSecurityException("Invalid signature (output prefix mismatch)");
        }
        Signature signature = Signature.getInstance(this.f86094b, this.f86097e);
        signature.initVerify(this.f86093a);
        signature.update(bArr2);
        byte[] bArr4 = this.f86096d;
        if (bArr4.length > 0) {
            signature.update(bArr4);
        }
        try {
            zVerify = signature.verify(Arrays.copyOfRange(bArr, bArr3.length, bArr.length));
        } catch (RuntimeException unused) {
            zVerify = false;
        }
        if (!zVerify) {
            throw new GeneralSecurityException("Invalid signature");
        }
    }
}

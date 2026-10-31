package rl;

import h6.c1;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.Provider;
import java.security.Signature;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.MGF1ParameterSpec;
import java.security.spec.PSSParameterSpec;
import java.security.spec.RSAPublicKeySpec;
import java.util.Objects;
import kl.w0;
import ql.a0;
import ql.b0;
import ql.d0;
import ql.z;
import sl.s;

/* loaded from: classes3.dex */
public final class l implements el.i {

    /* renamed from: g, reason: collision with root package name */
    public static final byte[] f86106g = new byte[0];

    /* renamed from: h, reason: collision with root package name */
    public static final byte[] f86107h = {0};

    /* renamed from: a, reason: collision with root package name */
    public final RSAPublicKey f86108a;

    /* renamed from: b, reason: collision with root package name */
    public final String f86109b;

    /* renamed from: c, reason: collision with root package name */
    public final PSSParameterSpec f86110c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f86111d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f86112e;

    /* renamed from: f, reason: collision with root package name */
    public final Provider f86113f;

    public l(RSAPublicKey rSAPublicKey, z zVar, z zVar2, int i5, byte[] bArr, byte[] bArr2, Provider provider) throws GeneralSecurityException {
        if (!c1.c(2)) {
            throw new GeneralSecurityException("Cannot use RSA SSA PSS in FIPS-mode, as BoringCrypto module is not available.");
        }
        if (!zVar.equals(zVar2)) {
            throw new GeneralSecurityException("sigHash and mgf1Hash must be the same");
        }
        s.b(rSAPublicKey.getModulus().bitLength());
        s.c(rSAPublicKey.getPublicExponent());
        this.f86108a = rSAPublicKey;
        this.f86109b = c(zVar);
        this.f86110c = d(zVar, zVar2, i5);
        this.f86111d = bArr;
        this.f86112e = bArr2;
        this.f86113f = provider;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x002b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static l b(d0 d0Var) throws NoSuchAlgorithmException, NoSuchProviderException {
        Provider providerN;
        int i5 = w0.f71650a;
        if (Objects.equals(System.getProperty("java.vendor"), "The Android Project")) {
            providerN = (!Objects.equals(System.getProperty("java.vendor"), "The Android Project") ? null : kl.a.i()).intValue() > 23 ? kl.a.n() : null;
        }
        Provider provider = providerN;
        if (provider == null) {
            throw new NoSuchProviderException("RSA SSA PSS using Conscrypt is not supported.");
        }
        KeyFactory keyFactory = KeyFactory.getInstance("RSA", provider);
        BigInteger bigInteger = d0Var.f84142d;
        b0 b0Var = d0Var.f84141c;
        return new l((RSAPublicKey) keyFactory.generatePublic(new RSAPublicKeySpec(bigInteger, b0Var.f84123b)), b0Var.f84125d, b0Var.f84126e, b0Var.f84127f, d0Var.f84143e.b(), b0Var.f84124c.equals(a0.f84107d) ? f86107h : f86106g, provider);
    }

    public static String c(z zVar) {
        if (zVar == z.f84243b) {
            return "SHA256withRSA/PSS";
        }
        if (zVar == z.f84244c) {
            return "SHA384withRSA/PSS";
        }
        if (zVar == z.f84245d) {
            return "SHA512withRSA/PSS";
        }
        throw new IllegalArgumentException("Unsupported hash: " + zVar);
    }

    public static PSSParameterSpec d(z zVar, z zVar2, int i5) {
        String str;
        MGF1ParameterSpec mGF1ParameterSpec;
        z zVar3 = z.f84245d;
        z zVar4 = z.f84244c;
        z zVar5 = z.f84243b;
        if (zVar == zVar5) {
            str = "SHA-256";
        } else if (zVar == zVar4) {
            str = "SHA-384";
        } else {
            if (zVar != zVar3) {
                throw new IllegalArgumentException("Unsupported MD hash: " + zVar);
            }
            str = "SHA-512";
        }
        if (zVar2 == zVar5) {
            mGF1ParameterSpec = MGF1ParameterSpec.SHA256;
        } else if (zVar2 == zVar4) {
            mGF1ParameterSpec = MGF1ParameterSpec.SHA384;
        } else {
            if (zVar2 != zVar3) {
                throw new IllegalArgumentException("Unsupported MGF1 hash: " + zVar2);
            }
            mGF1ParameterSpec = MGF1ParameterSpec.SHA512;
        }
        return new PSSParameterSpec(str, "MGF1", mGF1ParameterSpec, i5, 1);
    }

    @Override // el.i
    public final void a(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArr3 = this.f86111d;
        if (!w0.b(bArr3, bArr)) {
            throw new GeneralSecurityException("Invalid signature (output prefix mismatch)");
        }
        Signature signature = Signature.getInstance(this.f86109b, this.f86113f);
        signature.initVerify(this.f86108a);
        signature.setParameter(this.f86110c);
        signature.update(bArr2);
        byte[] bArr4 = this.f86112e;
        if (bArr4.length > 0) {
            signature.update(bArr4);
        }
        if (!signature.verify(bArr, bArr3.length, bArr.length - bArr3.length)) {
            throw new GeneralSecurityException("signature verification failed");
        }
    }
}

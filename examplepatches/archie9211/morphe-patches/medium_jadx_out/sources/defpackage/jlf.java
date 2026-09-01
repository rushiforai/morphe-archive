package defpackage;

import android.os.Build;
import j$.util.Objects;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.NoSuchProviderException;
import java.security.Provider;
import java.security.Signature;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.MGF1ParameterSpec;
import java.security.spec.PSSParameterSpec;
import java.security.spec.RSAPublicKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jlf implements njg {
    public static final byte[] g = new byte[0];
    public static final byte[] h = {0};
    public final RSAPublicKey a;
    public final String b;
    public final PSSParameterSpec c;
    public final byte[] d;
    public final byte[] e;
    public final Provider f;

    public jlf(RSAPublicKey rSAPublicKey, oug ougVar, oug ougVar2, int i, byte[] bArr, byte[] bArr2, Provider provider) throws GeneralSecurityException {
        String str;
        String str2;
        MGF1ParameterSpec mGF1ParameterSpec;
        PSSParameterSpec pSSParameterSpec = null;
        if (!hk7.M(2)) {
            ygf.l("Cannot use RSA SSA PSS in FIPS-mode, as BoringCrypto module is not available.");
            throw null;
        }
        if (!ougVar.equals(ougVar2)) {
            ygf.l("sigHash and mgf1Hash must be the same");
            throw null;
        }
        ek7.R(rSAPublicKey.getModulus().bitLength());
        ek7.U(rSAPublicKey.getPublicExponent());
        this.a = rSAPublicKey;
        oug ougVar3 = oug.d;
        oug ougVar4 = oug.c;
        oug ougVar5 = oug.b;
        if (ougVar == ougVar5) {
            str = "SHA256withRSA/PSS";
        } else if (ougVar == ougVar4) {
            str = "SHA384withRSA/PSS";
        } else if (ougVar == ougVar3) {
            str = "SHA512withRSA/PSS";
        } else {
            ay0.e("Unsupported hash: ".concat(String.valueOf(ougVar)));
            str = null;
        }
        this.b = str;
        if (ougVar == ougVar5) {
            str2 = "SHA-256";
        } else if (ougVar == ougVar4) {
            str2 = "SHA-384";
        } else {
            if (ougVar != ougVar3) {
                ay0.e("Unsupported MD hash: ".concat(String.valueOf(ougVar)));
                this.c = pSSParameterSpec;
                this.d = bArr;
                this.e = bArr2;
                this.f = provider;
            }
            str2 = "SHA-512";
        }
        String str3 = str2;
        if (ougVar2 == ougVar5) {
            mGF1ParameterSpec = MGF1ParameterSpec.SHA256;
        } else if (ougVar2 == ougVar4) {
            mGF1ParameterSpec = MGF1ParameterSpec.SHA384;
        } else {
            if (ougVar2 != ougVar3) {
                ay0.e("Unsupported MGF1 hash: ".concat(String.valueOf(ougVar2)));
                this.c = pSSParameterSpec;
                this.d = bArr;
                this.e = bArr2;
                this.f = provider;
            }
            mGF1ParameterSpec = MGF1ParameterSpec.SHA512;
        }
        pSSParameterSpec = new PSSParameterSpec(str3, "MGF1", mGF1ParameterSpec, i, 1);
        this.c = pSSParameterSpec;
        this.d = bArr;
        this.e = bArr2;
        this.f = provider;
    }

    public static jlf a(tug tugVar) {
        int i = aog.a;
        if (Objects.equals(System.getProperty("java.vendor"), "The Android Project")) {
            (!Objects.equals(System.getProperty("java.vendor"), "The Android Project") ? null : Integer.valueOf(Build.VERSION.SDK_INT)).getClass();
        }
        Provider providerW = yi2.W();
        if (providerW == null) {
            throw new NoSuchProviderException("RSA SSA PSS using Conscrypt is not supported.");
        }
        KeyFactory keyFactory = KeyFactory.getInstance("RSA", providerW);
        BigInteger bigInteger = tugVar.j;
        qug qugVar = tugVar.i;
        return new jlf((RSAPublicKey) keyFactory.generatePublic(new RSAPublicKeySpec(bigInteger, qugVar.b)), qugVar.d, qugVar.e, qugVar.f, tugVar.k.b(), qugVar.c != zwf.r ? g : h, providerW);
    }

    @Override // defpackage.njg
    public final void b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArr3 = this.d;
        if (!aog.b(bArr3, bArr)) {
            ygf.l("Invalid signature (output prefix mismatch)");
            return;
        }
        Signature signature = Signature.getInstance(this.b, this.f);
        signature.initVerify(this.a);
        signature.setParameter(this.c);
        signature.update(bArr2);
        byte[] bArr4 = this.e;
        if (bArr4.length > 0) {
            signature.update(bArr4);
        }
        int length = bArr.length;
        int length2 = bArr3.length;
        if (signature.verify(bArr, length2, length - length2)) {
            return;
        }
        ygf.l("signature verification failed");
    }
}

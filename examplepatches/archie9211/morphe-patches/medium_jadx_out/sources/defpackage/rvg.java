package defpackage;

import java.io.Serializable;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.NoSuchProviderException;
import java.security.Provider;
import java.security.PublicKey;
import java.security.Signature;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rvg implements njg {
    public static final byte[] f = {48, 42, 48, 5, 6, 3, 43, 101, 112, 3, 33, 0};
    public final /* synthetic */ int a = 1;
    public final byte[] b;
    public final byte[] c;
    public final PublicKey d;
    public final Serializable e;

    public rvg(byte[] bArr, byte[] bArr2, byte[] bArr3, Provider provider) throws GeneralSecurityException {
        if (!hk7.M(1)) {
            ygf.l("Can not use Ed25519 in FIPS-mode.");
            throw null;
        }
        if (bArr.length != 32) {
            ay0.e("Given public key's length is not 32.");
            throw null;
        }
        this.d = KeyFactory.getInstance("Ed25519", provider).generatePublic(new X509EncodedKeySpec(pr7.s(f, bArr)));
        this.b = bArr2;
        this.c = bArr3;
        this.e = provider;
    }

    public static rvg a(nsg nsgVar) {
        Provider providerW = yi2.W();
        if (providerW == null) {
            throw new NoSuchProviderException("Ed25519VerifyJce requires the Conscrypt provider.");
        }
        if (hk7.M(1)) {
            return new rvg(nsgVar.j.b(), nsgVar.k.b(), nsgVar.i.a != b3g.h ? new byte[0] : new byte[]{0}, providerW);
        }
        ygf.l("Can not use Ed25519 in FIPS-mode.");
        return null;
    }

    @Override // defpackage.njg
    public final void b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        int i = this.a;
        byte[] bArr3 = this.b;
        switch (i) {
            case 0:
                int length = bArr3.length;
                if (bArr.length != length + 64) {
                    ygf.l("Invalid signature length: 64");
                } else if (!aog.b(bArr3, bArr)) {
                    ygf.l("Invalid signature (output prefix mismatch)");
                } else {
                    Signature signature = Signature.getInstance("Ed25519", (Provider) this.e);
                    signature.initVerify(this.d);
                    signature.update(bArr2);
                    signature.update(this.c);
                    try {
                        if (signature.verify(bArr, length, 64)) {
                        }
                    } catch (RuntimeException unused) {
                    }
                    ygf.l("Signature check failed.");
                }
                break;
            default:
                int length2 = bArr3.length;
                if (length2 == 0) {
                    c(bArr, bArr2);
                } else if (!aog.b(bArr3, bArr)) {
                    ygf.l("Invalid signature (output prefix mismatch)");
                } else {
                    c(Arrays.copyOfRange(bArr, length2, bArr.length), bArr2);
                }
                break;
        }
    }

    public void c(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArrC;
        int i;
        RSAPublicKey rSAPublicKey = (RSAPublicKey) this.d;
        BigInteger publicExponent = rSAPublicKey.getPublicExponent();
        BigInteger modulus = rSAPublicKey.getModulus();
        int iBitLength = (modulus.bitLength() + 7) / 8;
        if (iBitLength != bArr.length) {
            ygf.l("invalid signature's length");
            return;
        }
        BigInteger bigInteger = new BigInteger(1, bArr);
        if (bigInteger.compareTo(modulus) >= 0) {
            ygf.l("signature out of range");
            return;
        }
        byte[] bArrQ = kk7.Q(bigInteger.modPow(publicExponent, modulus), iBitLength);
        ylf ylfVar = (ylf) this.e;
        ek7.P(ylfVar);
        MessageDigest messageDigest = (MessageDigest) wlf.c.a.a(ur7.J(ylfVar));
        messageDigest.update(bArr2);
        byte[] bArr3 = this.c;
        if (bArr3.length != 0) {
            messageDigest.update(bArr3);
        }
        byte[] bArrDigest = messageDigest.digest();
        int iOrdinal = ylfVar.ordinal();
        int i2 = 2;
        if (iOrdinal == 2) {
            bArrC = tr7.C("3031300d060960864801650304020105000420");
        } else if (iOrdinal == 3) {
            bArrC = tr7.C("3041300d060960864801650304020205000430");
        } else {
            if (iOrdinal != 4) {
                throw new GeneralSecurityException("Unsupported hash ".concat(ylfVar.toString()));
            }
            bArrC = tr7.C("3051300d060960864801650304020305000440");
        }
        int length = bArrDigest.length;
        int i3 = length + 19;
        if (iBitLength < length + 30) {
            ygf.l("intended encoded message length too short");
            return;
        }
        byte[] bArr4 = new byte[iBitLength];
        bArr4[0] = 0;
        bArr4[1] = 1;
        int i4 = 0;
        while (true) {
            i = i2 + 1;
            if (i4 >= (iBitLength - i3) - 3) {
                break;
            }
            bArr4[i2] = -1;
            i4++;
            i2 = i;
        }
        bArr4[i2] = 0;
        System.arraycopy(bArrC, 0, bArr4, i, 19);
        System.arraycopy(bArrDigest, 0, bArr4, i2 + 20, bArrDigest.length);
        if (MessageDigest.isEqual(bArrQ, bArr4)) {
            return;
        }
        ygf.l("invalid signature");
    }

    public /* synthetic */ rvg(RSAPublicKey rSAPublicKey, ylf ylfVar, byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (!yjg.a()) {
            ek7.P(ylfVar);
            ek7.R(rSAPublicKey.getModulus().bitLength());
            ek7.U(rSAPublicKey.getPublicExponent());
            this.d = rSAPublicKey;
            this.e = ylfVar;
            this.b = bArr;
            this.c = bArr2;
            return;
        }
        ygf.l("Conscrypt is not available, and we cannot use Java Implementation of RSA-PKCS1.5 in FIPS-mode.");
        throw null;
    }
}

package sl;

import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.interfaces.RSAPublicKey;
import java.util.Arrays;
import kl.w0;

/* loaded from: classes3.dex */
public final class n implements el.i {

    /* renamed from: a, reason: collision with root package name */
    public final RSAPublicKey f87521a;

    /* renamed from: b, reason: collision with root package name */
    public final l f87522b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f87523c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f87524d;

    public n(RSAPublicKey rSAPublicKey, l lVar, byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (jl.a.a()) {
            throw new GeneralSecurityException("Conscrypt is not available, and we cannot use Java Implementation of RSA-PKCS1.5 in FIPS-mode.");
        }
        s.d(lVar);
        s.b(rSAPublicKey.getModulus().bitLength());
        s.c(rSAPublicKey.getPublicExponent());
        this.f87521a = rSAPublicKey;
        this.f87522b = lVar;
        this.f87523c = bArr;
        this.f87524d = bArr2;
    }

    @Override // el.i
    public final void a(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArr3 = this.f87523c;
        if (bArr3.length == 0) {
            b(bArr, bArr2);
        } else {
            if (!w0.b(bArr3, bArr)) {
                throw new GeneralSecurityException("Invalid signature (output prefix mismatch)");
            }
            b(Arrays.copyOfRange(bArr, bArr3.length, bArr.length), bArr2);
        }
    }

    public final void b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArrC;
        RSAPublicKey rSAPublicKey = this.f87521a;
        BigInteger publicExponent = rSAPublicKey.getPublicExponent();
        BigInteger modulus = rSAPublicKey.getModulus();
        int iBitLength = (modulus.bitLength() + 7) / 8;
        if (iBitLength != bArr.length) {
            throw new GeneralSecurityException("invalid signature's length");
        }
        BigInteger bigIntegerH = kl.a.h(bArr);
        if (bigIntegerH.compareTo(modulus) >= 0) {
            throw new GeneralSecurityException("signature out of range");
        }
        byte[] bArrX = kl.a.x(iBitLength, bigIntegerH.modPow(publicExponent, modulus));
        l lVar = this.f87522b;
        s.d(lVar);
        MessageDigest messageDigest = (MessageDigest) j.f87512e.f87514a.a(d.f(lVar));
        messageDigest.update(bArr2);
        byte[] bArr3 = this.f87524d;
        if (bArr3.length != 0) {
            messageDigest.update(bArr3);
        }
        byte[] bArrDigest = messageDigest.digest();
        int iOrdinal = lVar.ordinal();
        int i5 = 2;
        if (iOrdinal == 2) {
            bArrC = d.c("3031300d060960864801650304020105000420");
        } else if (iOrdinal == 3) {
            bArrC = d.c("3041300d060960864801650304020205000430");
        } else {
            if (iOrdinal != 4) {
                throw new GeneralSecurityException("Unsupported hash " + lVar);
            }
            bArrC = d.c("3051300d060960864801650304020305000440");
        }
        int length = bArrC.length + bArrDigest.length;
        if (iBitLength < length + 11) {
            throw new GeneralSecurityException("intended encoded message length too short");
        }
        byte[] bArr4 = new byte[iBitLength];
        bArr4[0] = 0;
        bArr4[1] = 1;
        int i11 = 0;
        while (i11 < (iBitLength - length) - 3) {
            bArr4[i5] = -1;
            i11++;
            i5++;
        }
        int i12 = i5 + 1;
        bArr4[i5] = 0;
        System.arraycopy(bArrC, 0, bArr4, i12, bArrC.length);
        System.arraycopy(bArrDigest, 0, bArr4, i12 + bArrC.length, bArrDigest.length);
        if (!MessageDigest.isEqual(bArrX, bArr4)) {
            throw new GeneralSecurityException("invalid signature");
        }
    }
}

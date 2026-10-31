package sl;

import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.interfaces.RSAPublicKey;
import java.util.Arrays;
import kl.w0;

/* loaded from: classes3.dex */
public final class q implements el.i {

    /* renamed from: a, reason: collision with root package name */
    public final RSAPublicKey f87530a;

    /* renamed from: b, reason: collision with root package name */
    public final l f87531b;

    /* renamed from: c, reason: collision with root package name */
    public final l f87532c;

    /* renamed from: d, reason: collision with root package name */
    public final int f87533d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f87534e;

    /* renamed from: f, reason: collision with root package name */
    public final byte[] f87535f;

    public q(RSAPublicKey rSAPublicKey, l lVar, l lVar2, int i5, byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (jl.a.a()) {
            throw new GeneralSecurityException("Can not use RSA PSS in FIPS-mode, as BoringCrypto module is not available.");
        }
        s.d(lVar);
        if (!lVar.equals(lVar2)) {
            throw new GeneralSecurityException("sigHash and mgf1Hash must be the same");
        }
        s.b(rSAPublicKey.getModulus().bitLength());
        s.c(rSAPublicKey.getPublicExponent());
        this.f87530a = rSAPublicKey;
        this.f87531b = lVar;
        this.f87532c = lVar2;
        this.f87533d = i5;
        this.f87534e = bArr;
        this.f87535f = bArr2;
    }

    @Override // el.i
    public final void a(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArr3 = this.f87534e;
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
        RSAPublicKey rSAPublicKey = this.f87530a;
        BigInteger publicExponent = rSAPublicKey.getPublicExponent();
        BigInteger modulus = rSAPublicKey.getModulus();
        int iBitLength = (modulus.bitLength() + 7) / 8;
        int iBitLength2 = (modulus.bitLength() + 6) / 8;
        if (iBitLength != bArr.length) {
            throw new GeneralSecurityException("invalid signature's length");
        }
        BigInteger bigIntegerH = kl.a.h(bArr);
        if (bigIntegerH.compareTo(modulus) >= 0) {
            throw new GeneralSecurityException("signature out of range");
        }
        byte[] bArrX = kl.a.x(iBitLength2, bigIntegerH.modPow(publicExponent, modulus));
        byte b11 = 1;
        int iBitLength3 = modulus.bitLength() - 1;
        l lVar = this.f87531b;
        s.d(lVar);
        MessageDigest messageDigest = (MessageDigest) j.f87512e.f87514a.a(d.f(lVar));
        messageDigest.update(bArr2);
        byte[] bArr3 = this.f87535f;
        if (bArr3.length != 0) {
            messageDigest.update(bArr3);
        }
        byte[] bArrDigest = messageDigest.digest();
        int digestLength = messageDigest.getDigestLength();
        int length = bArrX.length;
        int i5 = this.f87533d;
        if (length < digestLength + i5 + 2) {
            throw new GeneralSecurityException("inconsistent");
        }
        if (bArrX[bArrX.length - 1] != -68) {
            throw new GeneralSecurityException("inconsistent");
        }
        int i11 = length - digestLength;
        int i12 = i11 - 1;
        byte[] bArrCopyOf = Arrays.copyOf(bArrX, i12);
        byte[] bArrCopyOfRange = Arrays.copyOfRange(bArrX, bArrCopyOf.length, bArrCopyOf.length + digestLength);
        int i13 = 0;
        while (true) {
            int i14 = i13;
            byte b12 = b11;
            long j11 = (length * 8) - iBitLength3;
            if (i13 < j11) {
                if (((bArrCopyOf[i14 / 8] >> (7 - (i14 % 8))) & 1) != 0) {
                    throw new GeneralSecurityException("inconsistent");
                }
                i13 = i14 + 1;
                b11 = b12;
            } else {
                MessageDigest messageDigest2 = (MessageDigest) j.f87512e.f87514a.a(d.f(this.f87532c));
                int digestLength2 = messageDigest2.getDigestLength();
                byte[] bArr4 = new byte[i12];
                int length2 = 0;
                int i15 = 0;
                while (i15 <= (i12 - 1) / digestLength2) {
                    messageDigest2.reset();
                    messageDigest2.update(bArrCopyOfRange);
                    int i16 = i5;
                    messageDigest2.update(kl.a.x(4, BigInteger.valueOf(i15)));
                    byte[] bArrDigest2 = messageDigest2.digest();
                    System.arraycopy(bArrDigest2, 0, bArr4, length2, Math.min(bArrDigest2.length, i12 - length2));
                    length2 += bArrDigest2.length;
                    i15++;
                    i11 = i11;
                    i5 = i16;
                }
                int i17 = i5;
                int i18 = i11;
                int length3 = bArr4.length;
                byte[] bArr5 = new byte[length3];
                for (int i19 = 0; i19 < length3; i19++) {
                    bArr5[i19] = (byte) (bArr4[i19] ^ bArrCopyOf[i19]);
                }
                for (int i21 = 0; i21 <= j11; i21++) {
                    int i22 = i21 / 8;
                    bArr5[i22] = (byte) ((~(b12 << (7 - (i21 % 8)))) & bArr5[i22]);
                }
                int i23 = 0;
                while (true) {
                    int i24 = (i18 - i17) - 2;
                    if (i23 >= i24) {
                        if (bArr5[i24] != b12) {
                            throw new GeneralSecurityException("inconsistent");
                        }
                        byte[] bArrCopyOfRange2 = Arrays.copyOfRange(bArr5, length3 - i17, length3);
                        int i25 = digestLength + 8;
                        byte[] bArr6 = new byte[i25 + i17];
                        System.arraycopy(bArrDigest, 0, bArr6, 8, bArrDigest.length);
                        System.arraycopy(bArrCopyOfRange2, 0, bArr6, i25, bArrCopyOfRange2.length);
                        if (!MessageDigest.isEqual(messageDigest.digest(bArr6), bArrCopyOfRange)) {
                            throw new GeneralSecurityException("inconsistent");
                        }
                        return;
                    }
                    if (bArr5[i23] != 0) {
                        throw new GeneralSecurityException("inconsistent");
                    }
                    i23++;
                }
            }
        }
    }
}

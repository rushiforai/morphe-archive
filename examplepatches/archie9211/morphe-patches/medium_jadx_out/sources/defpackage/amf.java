package defpackage;

import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.interfaces.RSAPublicKey;
import java.util.Arrays;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class amf implements njg {
    public final RSAPublicKey a;
    public final ylf b;
    public final ylf c;
    public final int d;
    public final byte[] e;
    public final byte[] f;

    public /* synthetic */ amf(RSAPublicKey rSAPublicKey, ylf ylfVar, ylf ylfVar2, int i, byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (yjg.a()) {
            ygf.l("Can not use RSA PSS in FIPS-mode, as BoringCrypto module is not available.");
            throw null;
        }
        ek7.P(ylfVar);
        if (!ylfVar.equals(ylfVar2)) {
            ygf.l("sigHash and mgf1Hash must be the same");
            throw null;
        }
        ek7.R(rSAPublicKey.getModulus().bitLength());
        ek7.U(rSAPublicKey.getPublicExponent());
        this.a = rSAPublicKey;
        this.b = ylfVar;
        this.c = ylfVar2;
        this.d = i;
        this.e = bArr;
        this.f = bArr2;
    }

    @Override // defpackage.njg
    public final void b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArr3 = this.e;
        int length = bArr3.length;
        if (length == 0) {
            a(bArr, bArr2);
        } else if (aog.b(bArr3, bArr)) {
            a(Arrays.copyOfRange(bArr, length, bArr.length), bArr2);
        } else {
            ygf.l("Invalid signature (output prefix mismatch)");
        }
    }

    public final void a(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        RSAPublicKey rSAPublicKey = this.a;
        BigInteger publicExponent = rSAPublicKey.getPublicExponent();
        BigInteger modulus = rSAPublicKey.getModulus();
        int iBitLength = modulus.bitLength() + 7;
        int iBitLength2 = modulus.bitLength() + 6;
        if (iBitLength / 8 != bArr.length) {
            ygf.l("invalid signature's length");
            return;
        }
        BigInteger bigInteger = new BigInteger(1, bArr);
        if (bigInteger.compareTo(modulus) >= 0) {
            ygf.l(eoLmc.iWQODGDtCkJ);
            return;
        }
        byte[] bArrQ = kk7.Q(bigInteger.modPow(publicExponent, modulus), iBitLength2 / 8);
        int iBitLength3 = modulus.bitLength() - 1;
        ylf ylfVar = this.b;
        ek7.P(ylfVar);
        wlf wlfVar = wlf.c;
        MessageDigest messageDigest = (MessageDigest) wlfVar.a.a(ur7.J(ylfVar));
        messageDigest.update(bArr2);
        byte[] bArr3 = this.f;
        if (bArr3.length != 0) {
            messageDigest.update(bArr3);
        }
        byte[] bArrDigest = messageDigest.digest();
        int digestLength = messageDigest.getDigestLength();
        int length = bArrQ.length;
        int i = this.d;
        if (length < digestLength + i + 2) {
            ygf.l("inconsistent");
            return;
        }
        if (bArrQ[length - 1] != -68) {
            ygf.l("inconsistent");
            return;
        }
        int i2 = length - digestLength;
        int i3 = i2 - 1;
        byte[] bArrCopyOf = Arrays.copyOf(bArrQ, i3);
        int length2 = bArrCopyOf.length;
        byte[] bArrCopyOfRange = Arrays.copyOfRange(bArrQ, length2, length2 + digestLength);
        int i4 = 0;
        while (true) {
            long j = (((long) length) * 8) - ((long) iBitLength3);
            if (i4 < j) {
                if (((bArrCopyOf[i4 / 8] >> (7 - (i4 % 8))) & 1) != 0) {
                    ygf.l("inconsistent");
                    return;
                }
                i4++;
            } else {
                MessageDigest messageDigest2 = (MessageDigest) wlfVar.a.a(ur7.J(this.c));
                int digestLength2 = messageDigest2.getDigestLength();
                byte[] bArr4 = new byte[i3];
                int i5 = 0;
                int i6 = 0;
                while (i5 <= (i2 - 2) / digestLength2) {
                    messageDigest2.reset();
                    messageDigest2.update(bArrCopyOfRange);
                    messageDigest2.update(kk7.Q(BigInteger.valueOf(i5), 4));
                    byte[] bArrDigest2 = messageDigest2.digest();
                    int length3 = bArrDigest2.length;
                    System.arraycopy(bArrDigest2, 0, bArr4, i6, Math.min(length3, i3 - i6));
                    i6 += length3;
                    i5++;
                    messageDigest2 = messageDigest2;
                }
                byte[] bArr5 = new byte[i3];
                for (int i7 = 0; i7 < i3; i7++) {
                    bArr5[i7] = (byte) (bArr4[i7] ^ bArrCopyOf[i7]);
                }
                for (int i8 = 0; i8 <= j; i8++) {
                    int i9 = i8 / 8;
                    bArr5[i9] = (byte) ((~(1 << (7 - (i8 % 8)))) & bArr5[i9]);
                }
                int i10 = 0;
                while (true) {
                    int i11 = (i2 - i) - 2;
                    if (i10 >= i11) {
                        if (bArr5[i11] != 1) {
                            ygf.l("inconsistent");
                            return;
                        }
                        byte[] bArrCopyOfRange2 = Arrays.copyOfRange(bArr5, i3 - i, i3);
                        int i12 = digestLength + 8;
                        byte[] bArr6 = new byte[i + i12];
                        System.arraycopy(bArrDigest, 0, bArr6, 8, bArrDigest.length);
                        System.arraycopy(bArrCopyOfRange2, 0, bArr6, i12, bArrCopyOfRange2.length);
                        if (MessageDigest.isEqual(messageDigest.digest(bArr6), bArrCopyOfRange)) {
                            return;
                        }
                        ygf.l("inconsistent");
                        return;
                    }
                    if (bArr5[i10] != 0) {
                        ygf.l("inconsistent");
                        return;
                    }
                    i10++;
                }
            }
        }
    }
}

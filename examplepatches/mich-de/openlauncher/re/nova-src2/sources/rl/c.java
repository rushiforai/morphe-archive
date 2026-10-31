package rl;

import h6.c1;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.security.Signature;
import java.security.interfaces.ECPublicKey;
import java.util.Arrays;
import kl.w0;
import sl.s;

/* loaded from: classes3.dex */
public final class c implements el.i {

    /* renamed from: g, reason: collision with root package name */
    public static final byte[] f86046g = new byte[0];

    /* renamed from: h, reason: collision with root package name */
    public static final byte[] f86047h = {0};

    /* renamed from: i, reason: collision with root package name */
    public static final x7.l f86048i;

    /* renamed from: j, reason: collision with root package name */
    public static final x7.l f86049j;

    /* renamed from: k, reason: collision with root package name */
    public static final x7.l f86050k;

    /* renamed from: a, reason: collision with root package name */
    public final ECPublicKey f86051a;

    /* renamed from: b, reason: collision with root package name */
    public final String f86052b;

    /* renamed from: c, reason: collision with root package name */
    public final sl.h f86053c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f86054d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f86055e;

    /* renamed from: f, reason: collision with root package name */
    public final Provider f86056f;

    static {
        x7.e eVarD = x7.l.d();
        eVarD.a(sl.l.f87516a, ql.b.f84110c);
        eVarD.a(sl.l.f87517b, ql.b.f84111d);
        eVarD.a(sl.l.f87518c, ql.b.f84112e);
        f86048i = eVarD.b();
        x7.e eVarD2 = x7.l.d();
        eVarD2.a(sl.h.f87504a, ql.b.f84113f);
        eVarD2.a(sl.h.f87505b, ql.b.f84114g);
        f86049j = eVarD2.b();
        x7.e eVarD3 = x7.l.d();
        eVarD3.a(sl.g.f87500a, ql.a.f84100c);
        eVarD3.a(sl.g.f87501b, ql.a.f84101d);
        eVarD3.a(sl.g.f87502c, ql.a.f84102e);
        f86050k = eVarD3.b();
    }

    public c(ECPublicKey eCPublicKey, sl.l lVar, sl.h hVar, byte[] bArr, byte[] bArr2, Provider provider) throws GeneralSecurityException {
        if (!c1.c(2)) {
            throw new GeneralSecurityException("Can not use ECDSA in FIPS-mode, as BoringCrypto is not available.");
        }
        s.d(lVar);
        this.f86052b = lVar + "withECDSA";
        this.f86051a = eCPublicKey;
        this.f86053c = hVar;
        this.f86054d = bArr;
        this.f86055e = bArr2;
        this.f86056f = provider;
    }

    @Override // el.i
    public final void a(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArr3 = this.f86054d;
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
        int i5;
        int i11;
        int i12;
        int i13;
        byte b11;
        int i14;
        byte b12;
        byte[] bArr3;
        int i15;
        byte[] bArr4 = bArr;
        sl.h hVar = this.f86053c;
        sl.h hVar2 = sl.h.f87504a;
        boolean zVerify = false;
        ECPublicKey eCPublicKey = this.f86051a;
        if (hVar == hVar2) {
            if (bArr4.length != ((kl.f.d(eCPublicKey.getParams().getCurve()).subtract(BigInteger.ONE).bitLength() + 7) / 8) * 2) {
                throw new GeneralSecurityException("Invalid signature");
            }
            if (bArr4.length % 2 != 0 || bArr4.length == 0 || bArr4.length > 132) {
                throw new GeneralSecurityException("Invalid IEEE_P1363 encoding");
            }
            byte[] bArrG = sl.d.g(Arrays.copyOf(bArr4, bArr4.length / 2));
            byte[] bArrG2 = sl.d.g(Arrays.copyOfRange(bArr4, bArr4.length / 2, bArr4.length));
            int length = bArrG.length + 4 + bArrG2.length;
            if (length >= 128) {
                bArr3 = new byte[length + 3];
                bArr3[0] = 48;
                bArr3[1] = -127;
                bArr3[2] = (byte) length;
                i15 = 3;
            } else {
                bArr3 = new byte[length + 2];
                bArr3[0] = 48;
                bArr3[1] = (byte) length;
                i15 = 2;
            }
            int i16 = i15 + 1;
            bArr3[i15] = 2;
            int i17 = i15 + 2;
            bArr3[i16] = (byte) bArrG.length;
            System.arraycopy(bArrG, 0, bArr3, i17, bArrG.length);
            int length2 = i17 + bArrG.length;
            bArr3[length2] = 2;
            bArr3[length2 + 1] = (byte) bArrG2.length;
            System.arraycopy(bArrG2, 0, bArr3, length2 + 2, bArrG2.length);
            bArr4 = bArr3;
        }
        boolean z11 = false;
        if (bArr4.length >= 8 && bArr4[0] == 48) {
            int i18 = bArr4[1] & 255;
            if (i18 == 129) {
                i18 = bArr4[2] & 255;
                if (i18 >= 128) {
                    i5 = 2;
                    if (i18 == (bArr4.length - 1) - i5 && bArr4[i5 + 1] == 2 && (i13 = (i12 = i5 + 3 + (i11 = bArr4[i5 + 2] & 255)) + 1) < bArr4.length && i11 != 0) {
                        int i19 = i5 + 3;
                        b11 = bArr4[i19];
                        if ((b11 & 255) < 128 && ((i11 <= 1 || b11 != 0 || (bArr4[i5 + 4] & 255) >= 128) && bArr4[i19 + i11] == 2)) {
                            i14 = bArr4[i13] & 255;
                            if (i12 + 2 + i14 == bArr4.length && i14 != 0) {
                                b12 = bArr4[i5 + 5 + i11];
                                if ((b12 & 255) < 128 && (i14 <= 1 || b12 != 0 || (bArr4[i5 + 6 + i11] & 255) >= 128)) {
                                    z11 = true;
                                }
                            }
                        }
                    }
                }
            } else if (i18 != 128 && i18 <= 129) {
                i5 = 1;
                if (i18 == (bArr4.length - 1) - i5) {
                    int i192 = i5 + 3;
                    b11 = bArr4[i192];
                    if ((b11 & 255) < 128) {
                        i14 = bArr4[i13] & 255;
                        if (i12 + 2 + i14 == bArr4.length) {
                            b12 = bArr4[i5 + 5 + i11];
                            if ((b12 & 255) < 128) {
                                z11 = true;
                            }
                        }
                    }
                }
            }
        }
        if (!z11) {
            throw new GeneralSecurityException("Invalid signature");
        }
        String str = this.f86052b;
        Provider provider = this.f86056f;
        Signature signature = provider != null ? Signature.getInstance(str, provider) : (Signature) sl.j.f87511d.f87514a.a(str);
        signature.initVerify(eCPublicKey);
        signature.update(bArr2);
        byte[] bArr5 = this.f86055e;
        if (bArr5.length > 0) {
            signature.update(bArr5);
        }
        try {
            zVerify = signature.verify(bArr4);
        } catch (RuntimeException unused) {
        }
        if (!zVerify) {
            throw new GeneralSecurityException("Invalid signature");
        }
    }
}

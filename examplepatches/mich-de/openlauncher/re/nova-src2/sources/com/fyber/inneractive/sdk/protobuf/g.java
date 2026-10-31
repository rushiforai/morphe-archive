package com.fyber.inneractive.sdk.protobuf;

import com.vungle.ads.internal.protos.Sdk;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public abstract class g {
    public static int a(int i5, byte[] bArr, int i11, f fVar) {
        int i12 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i13 = i11 + 1;
        byte b11 = bArr[i11];
        if (b11 >= 0) {
            fVar.f30797a = i12 | (b11 << 7);
            return i13;
        }
        int i14 = i12 | ((b11 & AbstractJsonLexerKt.TC_INVALID) << 7);
        int i15 = i11 + 2;
        byte b12 = bArr[i13];
        if (b12 >= 0) {
            fVar.f30797a = i14 | (b12 << 14);
            return i15;
        }
        int i16 = i14 | ((b12 & AbstractJsonLexerKt.TC_INVALID) << 14);
        int i17 = i11 + 3;
        byte b13 = bArr[i15];
        if (b13 >= 0) {
            fVar.f30797a = i16 | (b13 << 21);
            return i17;
        }
        int i18 = i16 | ((b13 & AbstractJsonLexerKt.TC_INVALID) << 21);
        int i19 = i11 + 4;
        byte b14 = bArr[i17];
        if (b14 >= 0) {
            fVar.f30797a = i18 | (b14 << 28);
            return i19;
        }
        int i21 = i18 | ((b14 & AbstractJsonLexerKt.TC_INVALID) << 28);
        while (true) {
            int i22 = i19 + 1;
            if (bArr[i19] >= 0) {
                fVar.f30797a = i21;
                return i22;
            }
            i19 = i22;
        }
    }

    public static long b(int i5, byte[] bArr) {
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    public static int c(byte[] bArr, int i5, f fVar) {
        int iD = d(bArr, i5, fVar);
        int i11 = fVar.f30797a;
        if (i11 < 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (i11 == 0) {
            fVar.f30799c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            return iD;
        }
        fVar.f30799c = d4.f30786a.a(bArr, iD, i11);
        return iD + i11;
    }

    public static int d(byte[] bArr, int i5, f fVar) {
        int i11 = i5 + 1;
        byte b11 = bArr[i5];
        if (b11 < 0) {
            return a(b11, bArr, i11, fVar);
        }
        fVar.f30797a = b11;
        return i11;
    }

    public static int e(byte[] bArr, int i5, f fVar) {
        int i11 = i5 + 1;
        long j11 = bArr[i5];
        if (j11 >= 0) {
            fVar.f30798b = j11;
            return i11;
        }
        int i12 = i5 + 2;
        byte b11 = bArr[i11];
        long j12 = (j11 & 127) | ((b11 & AbstractJsonLexerKt.TC_INVALID) << 7);
        int i13 = 7;
        while (b11 < 0) {
            int i14 = i12 + 1;
            i13 += 7;
            j12 |= (r10 & AbstractJsonLexerKt.TC_INVALID) << i13;
            b11 = bArr[i12];
            i12 = i14;
        }
        fVar.f30798b = j12;
        return i12;
    }

    public static int b(byte[] bArr, int i5, f fVar) {
        int iD = d(bArr, i5, fVar);
        int i11 = fVar.f30797a;
        if (i11 < 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (i11 == 0) {
            fVar.f30799c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            return iD;
        }
        fVar.f30799c = new String(bArr, iD, i11, l1.f30847a);
        return iD + i11;
    }

    public static int b(int i5, byte[] bArr, int i11, int i12, k1 k1Var, f fVar) throws n1 {
        int iD = d(bArr, i11, fVar);
        int i13 = fVar.f30797a;
        if (i13 < 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (i13 == 0) {
            k1Var.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        } else {
            int i14 = iD + i13;
            if (d4.f30786a.b(bArr, iD, i14)) {
                k1Var.add(new String(bArr, iD, i13, l1.f30847a));
                iD = i14;
            } else {
                throw new n1("Protocol message had invalid UTF-8.");
            }
        }
        while (iD < i12) {
            int iA = iD + 1;
            byte b11 = bArr[iD];
            if (b11 >= 0) {
                fVar.f30797a = b11;
            } else {
                iA = a(b11, bArr, iA, fVar);
            }
            if (i5 != fVar.f30797a) {
                break;
            }
            iD = iA + 1;
            byte b12 = bArr[iA];
            if (b12 >= 0) {
                fVar.f30797a = b12;
            } else {
                iD = a(b12, bArr, iD, fVar);
            }
            int i15 = fVar.f30797a;
            if (i15 < 0) {
                throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            }
            if (i15 == 0) {
                k1Var.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            } else {
                int i16 = iD + i15;
                if (d4.f30786a.b(bArr, iD, i16)) {
                    k1Var.add(new String(bArr, iD, i15, l1.f30847a));
                    iD = i16;
                } else {
                    throw new n1("Protocol message had invalid UTF-8.");
                }
            }
        }
        return iD;
    }

    public static int c(int i5, byte[] bArr, int i11, int i12, k1 k1Var, f fVar) {
        a1 a1Var = (a1) k1Var;
        int iD = d(bArr, i11, fVar);
        a1Var.c(fVar.f30797a);
        while (iD < i12) {
            int iA = iD + 1;
            byte b11 = bArr[iD];
            if (b11 >= 0) {
                fVar.f30797a = b11;
            } else {
                iA = a(b11, bArr, iA, fVar);
            }
            if (i5 != fVar.f30797a) {
                break;
            }
            iD = iA + 1;
            byte b12 = bArr[iA];
            if (b12 >= 0) {
                fVar.f30797a = b12;
            } else {
                iD = a(b12, bArr, iD, fVar);
            }
            a1Var.c(fVar.f30797a);
        }
        return iD;
    }

    public static int a(int i5, byte[] bArr, int i11, int i12, n3 n3Var, f fVar) {
        if ((i5 >>> 3) == 0) {
            throw new n1("Protocol message contained an invalid tag (zero).");
        }
        int i13 = i5 & 7;
        if (i13 == 0) {
            int iE = e(bArr, i11, fVar);
            n3Var.a(i5, Long.valueOf(fVar.f30798b));
            return iE;
        }
        if (i13 == 1) {
            n3Var.a(i5, Long.valueOf(b(i11, bArr)));
            return i11 + 8;
        }
        if (i13 == 2) {
            int iD = d(bArr, i11, fVar);
            int i14 = fVar.f30797a;
            if (i14 >= 0) {
                if (i14 > bArr.length - iD) {
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (i14 == 0) {
                    n3Var.a(i5, s.f30889b);
                } else {
                    s.a(iD, iD + i14, bArr.length);
                    n3Var.a(i5, new q(s.f30890c.a(bArr, iD, i14)));
                }
                return iD + i14;
            }
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (i13 != 3) {
            if (i13 == 5) {
                n3Var.a(i5, Integer.valueOf(a(i11, bArr)));
                return i11 + 4;
            }
            throw new n1("Protocol message contained an invalid tag (zero).");
        }
        n3 n3Var2 = new n3();
        int i15 = (i5 & (-8)) | 4;
        int i16 = 0;
        while (true) {
            if (i11 >= i12) {
                break;
            }
            int iD2 = d(bArr, i11, fVar);
            int i17 = fVar.f30797a;
            if (i17 == i15) {
                i16 = i17;
                i11 = iD2;
                break;
            }
            i11 = a(i17, bArr, iD2, i12, n3Var2, fVar);
            i16 = i17;
        }
        if (i11 <= i12 && i16 == i15) {
            n3Var.a(i5, n3Var2);
            return i11;
        }
        throw new n1("Failed to parse the message.");
    }

    public static int a(int i5, byte[] bArr, int i11, int i12, f fVar) {
        if ((i5 >>> 3) == 0) {
            throw new n1("Protocol message contained an invalid tag (zero).");
        }
        int i13 = i5 & 7;
        if (i13 == 0) {
            return e(bArr, i11, fVar);
        }
        if (i13 == 1) {
            return i11 + 8;
        }
        if (i13 == 2) {
            return d(bArr, i11, fVar) + fVar.f30797a;
        }
        if (i13 != 3) {
            if (i13 == 5) {
                return i11 + 4;
            }
            throw new n1("Protocol message contained an invalid tag (zero).");
        }
        int i14 = (i5 & (-8)) | 4;
        int i15 = 0;
        while (i11 < i12) {
            i11 = d(bArr, i11, fVar);
            i15 = fVar.f30797a;
            if (i15 == i14) {
                break;
            }
            i11 = a(i15, bArr, i11, i12, fVar);
        }
        if (i11 > i12 || i15 != i14) {
            throw new n1("Failed to parse the message.");
        }
        return i11;
    }

    public static int a(int i5, byte[] bArr) {
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public static int a(byte[] bArr, int i5, f fVar) {
        int iD = d(bArr, i5, fVar);
        int i11 = fVar.f30797a;
        if (i11 >= 0) {
            if (i11 > bArr.length - iD) {
                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            if (i11 == 0) {
                fVar.f30799c = s.f30889b;
                return iD;
            }
            int i12 = iD + i11;
            s.a(iD, i12, bArr.length);
            fVar.f30799c = new q(s.f30890c.a(bArr, iD, i11));
            return i12;
        }
        throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
    }

    public static int a(t2 t2Var, byte[] bArr, int i5, int i11, f fVar) {
        int iA = i5 + 1;
        int i12 = bArr[i5];
        if (i12 < 0) {
            iA = a(i12, bArr, iA, fVar);
            i12 = fVar.f30797a;
        }
        int i13 = iA;
        if (i12 >= 0 && i12 <= i11 - i13) {
            Object objA = t2Var.a();
            int i14 = i13 + i12;
            t2Var.a(objA, bArr, i13, i14, fVar);
            t2Var.c(objA);
            fVar.f30799c = objA;
            return i14;
        }
        throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    public static int a(t2 t2Var, byte[] bArr, int i5, int i11, int i12, f fVar) {
        i2 i2Var = (i2) t2Var;
        Object objA = i2Var.a();
        int iA = i2Var.a(objA, bArr, i5, i11, i12, fVar);
        i2Var.c(objA);
        fVar.f30799c = objA;
        return iA;
    }

    public static int a(byte[] bArr, int i5, k1 k1Var, f fVar) {
        a1 a1Var = (a1) k1Var;
        int iD = d(bArr, i5, fVar);
        int i11 = fVar.f30797a + iD;
        while (iD < i11) {
            int i12 = iD + 1;
            byte b11 = bArr[iD];
            if (b11 >= 0) {
                fVar.f30797a = b11;
                iD = i12;
            } else {
                iD = a(b11, bArr, i12, fVar);
            }
            a1Var.c(fVar.f30797a);
        }
        if (iD == i11) {
            return iD;
        }
        throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    public static int a(int i5, byte[] bArr, int i11, int i12, k1 k1Var, f fVar) throws n1 {
        int iD = d(bArr, i11, fVar);
        int i13 = fVar.f30797a;
        if (i13 < 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (i13 == 0) {
            k1Var.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        } else {
            k1Var.add(new String(bArr, iD, i13, l1.f30847a));
            iD += i13;
        }
        while (iD < i12) {
            int iA = iD + 1;
            byte b11 = bArr[iD];
            if (b11 >= 0) {
                fVar.f30797a = b11;
            } else {
                iA = a(b11, bArr, iA, fVar);
            }
            if (i5 != fVar.f30797a) {
                break;
            }
            iD = iA + 1;
            byte b12 = bArr[iA];
            if (b12 >= 0) {
                fVar.f30797a = b12;
            } else {
                iD = a(b12, bArr, iD, fVar);
            }
            int i14 = fVar.f30797a;
            if (i14 < 0) {
                throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            }
            if (i14 == 0) {
                k1Var.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            } else {
                k1Var.add(new String(bArr, iD, i14, l1.f30847a));
                iD += i14;
            }
        }
        return iD;
    }
}

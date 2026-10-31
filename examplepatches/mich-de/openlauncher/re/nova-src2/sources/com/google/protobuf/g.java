package com.google.protobuf;

import com.vungle.ads.internal.protos.Sdk;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class g {
    public static int A(Object obj, b2 b2Var, byte[] bArr, int i5, int i11, f fVar) throws InvalidProtocolBufferException {
        int iT = i5 + 1;
        int i12 = bArr[i5];
        if (i12 < 0) {
            iT = t(i12, bArr, iT, fVar);
            i12 = fVar.f34852a;
        }
        int i13 = iT;
        if (i12 < 0 || i12 > i11 - i13) {
            throw InvalidProtocolBufferException.g();
        }
        int i14 = fVar.f34856e + 1;
        fVar.f34856e = i14;
        if (i14 >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int i15 = i13 + i12;
        b2Var.g(obj, bArr, i13, i15, fVar);
        fVar.f34856e--;
        fVar.f34854c = obj;
        return i15;
    }

    public static int B(int i5, byte[] bArr, int i11, int i12, f fVar) throws InvalidProtocolBufferException {
        if ((i5 >>> 3) == 0) {
            throw InvalidProtocolBufferException.a();
        }
        int i13 = i5 & 7;
        if (i13 == 0) {
            return w(bArr, i11, fVar);
        }
        if (i13 == 1) {
            return i11 + 8;
        }
        if (i13 == 2) {
            return u(bArr, i11, fVar) + fVar.f34852a;
        }
        if (i13 != 3) {
            if (i13 == 5) {
                return i11 + 4;
            }
            throw InvalidProtocolBufferException.a();
        }
        int i14 = (i5 & (-8)) | 4;
        int i15 = 0;
        while (i11 < i12) {
            i11 = u(bArr, i11, fVar);
            i15 = fVar.f34852a;
            if (i15 == i14) {
                break;
            }
            i11 = B(i15, bArr, i11, i12, fVar);
        }
        if (i11 > i12 || i15 != i14) {
            throw InvalidProtocolBufferException.f();
        }
        return i11;
    }

    public static void a(byte b11, byte b12, byte b13, byte b14, char[] cArr, int i5) throws InvalidProtocolBufferException {
        if (!y(b12)) {
            if ((((b12 + 112) + (b11 << 28)) >> 30) == 0 && !y(b13) && !y(b14)) {
                int i11 = ((b11 & 7) << 18) | ((b12 & 63) << 12) | ((b13 & 63) << 6) | (b14 & 63);
                cArr[i5] = (char) ((i11 >>> 10) + 55232);
                cArr[i5 + 1] = (char) ((i11 & 1023) + 56320);
                return;
            }
        }
        throw InvalidProtocolBufferException.b();
    }

    public static void b(byte b11, byte b12, char[] cArr, int i5) throws InvalidProtocolBufferException {
        if (b11 < -62 || y(b12)) {
            throw InvalidProtocolBufferException.b();
        }
        cArr[i5] = (char) (((b11 & 31) << 6) | (b12 & 63));
    }

    public static void c(byte b11, byte b12, byte b13, char[] cArr, int i5) throws InvalidProtocolBufferException {
        if (y(b12) || ((b11 == -32 && b12 < -96) || ((b11 == -19 && b12 >= -96) || y(b13)))) {
            throw InvalidProtocolBufferException.b();
        }
        cArr[i5] = (char) (((b11 & 15) << 12) | ((b12 & 63) << 6) | (b13 & 63));
    }

    public static int d(byte[] bArr, int i5, f fVar) throws InvalidProtocolBufferException {
        int iU = u(bArr, i5, fVar);
        int i11 = fVar.f34852a;
        if (i11 < 0) {
            throw InvalidProtocolBufferException.e();
        }
        if (i11 > bArr.length - iU) {
            throw InvalidProtocolBufferException.g();
        }
        if (i11 == 0) {
            fVar.f34854c = l.f34884b;
            return iU;
        }
        fVar.f34854c = l.e(iU, i11, bArr);
        return iU + i11;
    }

    public static int e(int i5, byte[] bArr) {
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public static long f(int i5, byte[] bArr) {
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    public static int g(b2 b2Var, byte[] bArr, int i5, int i11, int i12, f fVar) throws InvalidProtocolBufferException {
        Object objD = b2Var.d();
        int iZ = z(objD, b2Var, bArr, i5, i11, i12, fVar);
        b2Var.b(objD);
        fVar.f34854c = objD;
        return iZ;
    }

    public static int h(b2 b2Var, byte[] bArr, int i5, int i11, f fVar) throws InvalidProtocolBufferException {
        Object objD = b2Var.d();
        int iA = A(objD, b2Var, bArr, i5, i11, fVar);
        b2Var.b(objD);
        fVar.f34854c = objD;
        return iA;
    }

    public static int i(b2 b2Var, int i5, byte[] bArr, int i11, int i12, z0 z0Var, f fVar) throws InvalidProtocolBufferException {
        int iH = h(b2Var, bArr, i11, i12, fVar);
        z0Var.add(fVar.f34854c);
        while (iH < i12) {
            int iU = u(bArr, iH, fVar);
            if (i5 != fVar.f34852a) {
                break;
            }
            iH = h(b2Var, bArr, iU, i12, fVar);
            z0Var.add(fVar.f34854c);
        }
        return iH;
    }

    public static int j(byte[] bArr, int i5, z0 z0Var, f fVar) throws InvalidProtocolBufferException {
        h hVar = (h) z0Var;
        int iU = u(bArr, i5, fVar);
        int i11 = fVar.f34852a + iU;
        while (iU < i11) {
            iU = w(bArr, iU, fVar);
            hVar.d(fVar.f34853b != 0);
        }
        if (iU == i11) {
            return iU;
        }
        throw InvalidProtocolBufferException.g();
    }

    public static int k(byte[] bArr, int i5, z0 z0Var, f fVar) throws InvalidProtocolBufferException {
        u uVar = (u) z0Var;
        int iU = u(bArr, i5, fVar);
        int i11 = fVar.f34852a + iU;
        while (iU < i11) {
            uVar.d(Double.longBitsToDouble(f(iU, bArr)));
            iU += 8;
        }
        if (iU == i11) {
            return iU;
        }
        throw InvalidProtocolBufferException.g();
    }

    public static int l(byte[] bArr, int i5, z0 z0Var, f fVar) throws InvalidProtocolBufferException {
        o0 o0Var = (o0) z0Var;
        int iU = u(bArr, i5, fVar);
        int i11 = fVar.f34852a + iU;
        while (iU < i11) {
            o0Var.d(e(iU, bArr));
            iU += 4;
        }
        if (iU == i11) {
            return iU;
        }
        throw InvalidProtocolBufferException.g();
    }

    public static int m(byte[] bArr, int i5, z0 z0Var, f fVar) throws InvalidProtocolBufferException {
        f1 f1Var = (f1) z0Var;
        int iU = u(bArr, i5, fVar);
        int i11 = fVar.f34852a + iU;
        while (iU < i11) {
            f1Var.d(f(iU, bArr));
            iU += 8;
        }
        if (iU == i11) {
            return iU;
        }
        throw InvalidProtocolBufferException.g();
    }

    public static int n(byte[] bArr, int i5, z0 z0Var, f fVar) throws InvalidProtocolBufferException {
        d0 d0Var = (d0) z0Var;
        int iU = u(bArr, i5, fVar);
        int i11 = fVar.f34852a + iU;
        while (iU < i11) {
            d0Var.d(Float.intBitsToFloat(e(iU, bArr)));
            iU += 4;
        }
        if (iU == i11) {
            return iU;
        }
        throw InvalidProtocolBufferException.g();
    }

    public static int o(byte[] bArr, int i5, z0 z0Var, f fVar) throws InvalidProtocolBufferException {
        o0 o0Var = (o0) z0Var;
        int iU = u(bArr, i5, fVar);
        int i11 = fVar.f34852a + iU;
        while (iU < i11) {
            iU = u(bArr, iU, fVar);
            o0Var.d(p.c(fVar.f34852a));
        }
        if (iU == i11) {
            return iU;
        }
        throw InvalidProtocolBufferException.g();
    }

    public static int p(byte[] bArr, int i5, z0 z0Var, f fVar) throws InvalidProtocolBufferException {
        f1 f1Var = (f1) z0Var;
        int iU = u(bArr, i5, fVar);
        int i11 = fVar.f34852a + iU;
        while (iU < i11) {
            iU = w(bArr, iU, fVar);
            f1Var.d(p.d(fVar.f34853b));
        }
        if (iU == i11) {
            return iU;
        }
        throw InvalidProtocolBufferException.g();
    }

    public static int q(byte[] bArr, int i5, z0 z0Var, f fVar) throws InvalidProtocolBufferException {
        o0 o0Var = (o0) z0Var;
        int iU = u(bArr, i5, fVar);
        int i11 = fVar.f34852a + iU;
        while (iU < i11) {
            iU = u(bArr, iU, fVar);
            o0Var.d(fVar.f34852a);
        }
        if (iU == i11) {
            return iU;
        }
        throw InvalidProtocolBufferException.g();
    }

    public static int r(byte[] bArr, int i5, f fVar) throws InvalidProtocolBufferException {
        int iU = u(bArr, i5, fVar);
        int i11 = fVar.f34852a;
        if (i11 < 0) {
            throw InvalidProtocolBufferException.e();
        }
        if (i11 == 0) {
            fVar.f34854c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            return iU;
        }
        fVar.f34854c = new String(bArr, iU, i11, a1.f34808a);
        return iU + i11;
    }

    public static int s(int i5, byte[] bArr, int i11, int i12, g2 g2Var, f fVar) throws InvalidProtocolBufferException {
        if ((i5 >>> 3) == 0) {
            throw InvalidProtocolBufferException.a();
        }
        int i13 = i5 & 7;
        if (i13 == 0) {
            int iW = w(bArr, i11, fVar);
            g2Var.f(i5, Long.valueOf(fVar.f34853b));
            return iW;
        }
        if (i13 == 1) {
            g2Var.f(i5, Long.valueOf(f(i11, bArr)));
            return i11 + 8;
        }
        if (i13 == 2) {
            int iU = u(bArr, i11, fVar);
            int i14 = fVar.f34852a;
            if (i14 < 0) {
                throw InvalidProtocolBufferException.e();
            }
            if (i14 > bArr.length - iU) {
                throw InvalidProtocolBufferException.g();
            }
            if (i14 == 0) {
                g2Var.f(i5, l.f34884b);
            } else {
                g2Var.f(i5, l.e(iU, i14, bArr));
            }
            return iU + i14;
        }
        if (i13 != 3) {
            if (i13 != 5) {
                throw InvalidProtocolBufferException.a();
            }
            g2Var.f(i5, Integer.valueOf(e(i11, bArr)));
            return i11 + 4;
        }
        g2 g2Var2 = new g2();
        int i15 = (i5 & (-8)) | 4;
        int i16 = fVar.f34856e + 1;
        fVar.f34856e = i16;
        if (i16 >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int i17 = 0;
        while (true) {
            if (i11 >= i12) {
                break;
            }
            int iU2 = u(bArr, i11, fVar);
            i17 = fVar.f34852a;
            if (i17 == i15) {
                i11 = iU2;
                break;
            }
            i11 = s(i17, bArr, iU2, i12, g2Var2, fVar);
        }
        fVar.f34856e--;
        if (i11 > i12 || i17 != i15) {
            throw InvalidProtocolBufferException.f();
        }
        g2Var.f(i5, g2Var2);
        return i11;
    }

    public static int t(int i5, byte[] bArr, int i11, f fVar) {
        int i12 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i13 = i11 + 1;
        byte b11 = bArr[i11];
        if (b11 >= 0) {
            fVar.f34852a = i12 | (b11 << 7);
            return i13;
        }
        int i14 = i12 | ((b11 & AbstractJsonLexerKt.TC_INVALID) << 7);
        int i15 = i11 + 2;
        byte b12 = bArr[i13];
        if (b12 >= 0) {
            fVar.f34852a = i14 | (b12 << 14);
            return i15;
        }
        int i16 = i14 | ((b12 & AbstractJsonLexerKt.TC_INVALID) << 14);
        int i17 = i11 + 3;
        byte b13 = bArr[i15];
        if (b13 >= 0) {
            fVar.f34852a = i16 | (b13 << 21);
            return i17;
        }
        int i18 = i16 | ((b13 & AbstractJsonLexerKt.TC_INVALID) << 21);
        int i19 = i11 + 4;
        byte b14 = bArr[i17];
        if (b14 >= 0) {
            fVar.f34852a = i18 | (b14 << 28);
            return i19;
        }
        int i21 = i18 | ((b14 & AbstractJsonLexerKt.TC_INVALID) << 28);
        while (true) {
            int i22 = i19 + 1;
            if (bArr[i19] >= 0) {
                fVar.f34852a = i21;
                return i22;
            }
            i19 = i22;
        }
    }

    public static int u(byte[] bArr, int i5, f fVar) {
        int i11 = i5 + 1;
        byte b11 = bArr[i5];
        if (b11 < 0) {
            return t(b11, bArr, i11, fVar);
        }
        fVar.f34852a = b11;
        return i11;
    }

    public static int v(int i5, byte[] bArr, int i11, int i12, z0 z0Var, f fVar) {
        o0 o0Var = (o0) z0Var;
        int iU = u(bArr, i11, fVar);
        o0Var.d(fVar.f34852a);
        while (iU < i12) {
            int iU2 = u(bArr, iU, fVar);
            if (i5 != fVar.f34852a) {
                break;
            }
            iU = u(bArr, iU2, fVar);
            o0Var.d(fVar.f34852a);
        }
        return iU;
    }

    public static int w(byte[] bArr, int i5, f fVar) {
        int i11 = i5 + 1;
        long j11 = bArr[i5];
        if (j11 >= 0) {
            fVar.f34853b = j11;
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
        fVar.f34853b = j12;
        return i12;
    }

    public static String x(l lVar) {
        StringBuilder sb2 = new StringBuilder(lVar.size());
        for (int i5 = 0; i5 < lVar.size(); i5++) {
            byte bC = lVar.c(i5);
            if (bC == 34) {
                sb2.append("\\\"");
            } else if (bC == 39) {
                sb2.append("\\'");
            } else if (bC != 92) {
                switch (bC) {
                    case 7:
                        sb2.append("\\a");
                        break;
                    case 8:
                        sb2.append("\\b");
                        break;
                    case 9:
                        sb2.append("\\t");
                        break;
                    case 10:
                        sb2.append("\\n");
                        break;
                    case 11:
                        sb2.append("\\v");
                        break;
                    case 12:
                        sb2.append("\\f");
                        break;
                    case 13:
                        sb2.append("\\r");
                        break;
                    default:
                        if (bC < 32 || bC > 126) {
                            sb2.append(AbstractJsonLexerKt.STRING_ESC);
                            sb2.append((char) (((bC >>> 6) & 3) + 48));
                            sb2.append((char) (((bC >>> 3) & 7) + 48));
                            sb2.append((char) ((bC & 7) + 48));
                            break;
                        } else {
                            sb2.append((char) bC);
                            break;
                        }
                }
            } else {
                sb2.append("\\\\");
            }
        }
        return sb2.toString();
    }

    public static boolean y(byte b11) {
        return b11 > -65;
    }

    public static int z(Object obj, b2 b2Var, byte[] bArr, int i5, int i11, int i12, f fVar) throws InvalidProtocolBufferException {
        r1 r1Var = (r1) b2Var;
        int i13 = fVar.f34856e + 1;
        fVar.f34856e = i13;
        if (i13 >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int iG = r1Var.G(obj, bArr, i5, i11, i12, fVar);
        fVar.f34856e--;
        fVar.f34854c = obj;
        return iG;
    }

    public abstract void C(int i5, int i11, byte[] bArr);
}

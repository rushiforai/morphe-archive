package defpackage;

import android.view.View;
import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.adobe.internal.xmp.XMPException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.reader.R;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.text.BreakIterator;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class no7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static final /* synthetic */ int e = 0;

    public static final Object D(vob vobVar, String str) {
        vobVar.getClass();
        Object objA = vobVar.a(str);
        if (objA != null) {
            return objA;
        }
        ywb.g(ev6.x("Required ", str, " in SavedStateHandle is null"));
        return null;
    }

    public static final u50 E(m45 m45Var) {
        return new u50(12, new uk8(m45Var, null));
    }

    public static void G(String str) throws XMPException {
        int iIndexOf = str.indexOf(58);
        if (iIndexOf > 0) {
            String strSubstring = str.substring(0, iIndexOf);
            if (kpe.d(strSubstring)) {
                if (v9f.a.n(strSubstring) != null) {
                    return;
                }
                ywb.e(102, "Unknown namespace prefix for qualified name");
                return;
            }
        }
        ywb.e(102, "Ill-formed qualified name");
    }

    public static void H(String str) throws XMPException {
        boolean[] zArr = kpe.a;
        if (str.length() <= 0 || kpe.c(str.charAt(0))) {
            for (int i = 1; i < str.length(); i++) {
                if (kpe.b(str.charAt(i))) {
                }
            }
            return;
        }
        ywb.e(102, "Bad XML name");
    }

    public static String I(String str, String str2) throws XMPException {
        if (str == null || str.length() == 0) {
            ywb.e(101, "Schema namespace URI is required");
            return null;
        }
        if (str2.charAt(0) == '?' || str2.charAt(0) == '@') {
            ywb.e(102, "Top level name must not be a qualifier");
            return null;
        }
        if (str2.indexOf(47) >= 0 || str2.indexOf(91) >= 0) {
            ywb.e(102, "Top level name must be simple");
            return null;
        }
        o2b o2bVar = v9f.a;
        String strL = o2bVar.l(str);
        if (strL == null) {
            ywb.e(101, "Unregistered schema namespace URI");
            return null;
        }
        int iIndexOf = str2.indexOf(58);
        if (iIndexOf < 0) {
            H(str2);
            return strL.concat(str2);
        }
        H(str2.substring(0, iIndexOf));
        H(str2.substring(iIndexOf));
        String strSubstring = str2.substring(0, iIndexOf + 1);
        String strL2 = o2bVar.l(str);
        if (strL2 == null) {
            ywb.e(101, "Unknown schema namespace prefix");
            return null;
        }
        if (strSubstring.equals(strL2)) {
            return str2;
        }
        ywb.e(101, "Schema namespace URI and prefix mismatch");
        return null;
    }

    public static void J(int i, Object[] objArr) {
        for (int i2 = 0; i2 < i; i2++) {
            if (objArr[i2] == null) {
                z72.c(b09.A(new StringBuilder(String.valueOf(i2).length() + 9), i2, "at index "));
                return;
            }
        }
    }

    public static byte[] K(byte[] bArr) throws InvalidKeyException {
        if (bArr.length != 32) {
            throw new InvalidKeyException("Private key must have 32 bytes.");
        }
        byte[] bArr2 = new byte[32];
        bArr2[0] = 9;
        return L(bArr, bArr2);
    }

    public static byte[] L(byte[] bArr, byte[] bArr2) throws InvalidKeyException {
        int i = 32;
        if (bArr.length != 32) {
            throw new InvalidKeyException("Private key must have 32 bytes.");
        }
        long[] jArr = new long[11];
        byte[] bArrCopyOf = Arrays.copyOf(bArr, 32);
        int i2 = 0;
        bArrCopyOf[0] = (byte) (bArrCopyOf[0] & 248);
        byte b2 = (byte) (bArrCopyOf[31] & 127);
        bArrCopyOf[31] = b2;
        bArrCopyOf[31] = (byte) (b2 | 64);
        if (bArr2.length != 32) {
            throw new InvalidKeyException("Public key length is not 32-byte");
        }
        byte[] bArrCopyOf2 = Arrays.copyOf(bArr2, bArr2.length);
        bArrCopyOf2[31] = (byte) (bArrCopyOf2[31] & 127);
        int i3 = 0;
        while (true) {
            byte[][] bArr3 = s42.k;
            if (i3 >= 7) {
                int i4 = 10;
                long[] jArr2 = new long[10];
                for (int i5 = 0; i5 < 10; i5++) {
                    int i6 = vc2.B[i5];
                    jArr2[i5] = (((((long) (bArrCopyOf2[i6 + 3] & 255)) << 24) | ((((long) (bArrCopyOf2[i6] & 255)) | (((long) (bArrCopyOf2[i6 + 1] & 255)) << 8)) | (((long) (bArrCopyOf2[i6 + 2] & 255)) << 16))) >> vc2.C[i5]) & ((long) vc2.D[i5 & 1]);
                }
                long[] jArr3 = new long[19];
                long[] jArr4 = new long[19];
                jArr4[0] = 1;
                long[] jArr5 = new long[19];
                jArr5[0] = 1;
                long[] jArr6 = new long[19];
                long[] jArr7 = new long[19];
                long[] jArr8 = new long[19];
                jArr8[0] = 1;
                long[] jArr9 = new long[19];
                long[] jArr10 = new long[19];
                jArr10[0] = 1;
                System.arraycopy(jArr2, 0, jArr3, 0, 10);
                while (i2 < i) {
                    int i7 = bArrCopyOf[31 - i2] & 255;
                    int i8 = 0;
                    while (i8 < 8) {
                        int i9 = (i7 >> (7 - i8)) & 1;
                        s42.q0(jArr5, jArr3, i9);
                        s42.q0(jArr6, jArr4, i9);
                        byte[] bArr4 = bArrCopyOf;
                        long[] jArrCopyOf = Arrays.copyOf(jArr5, 10);
                        int i10 = i7;
                        long[] jArr11 = new long[19];
                        int i11 = i2;
                        long[] jArr12 = new long[19];
                        int i12 = i8;
                        long[] jArr13 = new long[19];
                        long[] jArr14 = jArr;
                        long[] jArr15 = new long[19];
                        long[] jArr16 = new long[19];
                        long[] jArr17 = jArr10;
                        long[] jArr18 = new long[19];
                        long[] jArr19 = new long[19];
                        vc2.X(jArr5, jArr5, jArr6);
                        vc2.V(jArr6, jArrCopyOf, jArr6);
                        long[] jArrCopyOf2 = Arrays.copyOf(jArr3, 10);
                        vc2.X(jArr3, jArr3, jArr4);
                        vc2.V(jArr4, jArrCopyOf2, jArr4);
                        vc2.U(jArr15, jArr3, jArr6);
                        vc2.U(jArr16, jArr5, jArr4);
                        vc2.S(jArr15);
                        vc2.Q(jArr15);
                        vc2.S(jArr16);
                        vc2.Q(jArr16);
                        long[] jArr20 = jArr3;
                        System.arraycopy(jArr15, 0, jArrCopyOf2, 0, 10);
                        vc2.X(jArr15, jArr15, jArr16);
                        vc2.V(jArr16, jArrCopyOf2, jArr16);
                        vc2.T(jArr19, jArr15);
                        vc2.T(jArr18, jArr16);
                        vc2.U(jArr16, jArr18, jArr2);
                        vc2.S(jArr16);
                        vc2.Q(jArr16);
                        System.arraycopy(jArr19, 0, jArr7, 0, 10);
                        System.arraycopy(jArr16, 0, jArr8, 0, 10);
                        vc2.T(jArr12, jArr5);
                        vc2.T(jArr13, jArr6);
                        vc2.U(jArr9, jArr12, jArr13);
                        vc2.S(jArr9);
                        vc2.Q(jArr9);
                        vc2.V(jArr13, jArr12, jArr13);
                        Arrays.fill(jArr11, 10, 18, 0L);
                        int i13 = 0;
                        for (int i14 = 10; i13 < i14; i14 = 10) {
                            jArr11[i13] = jArr13[i13] * 121665;
                            i13++;
                        }
                        vc2.Q(jArr11);
                        vc2.X(jArr11, jArr11, jArr12);
                        vc2.U(jArr17, jArr13, jArr11);
                        vc2.S(jArr17);
                        vc2.Q(jArr17);
                        s42.q0(jArr9, jArr7, i9);
                        s42.q0(jArr17, jArr8, i9);
                        i8 = i12 + 1;
                        long[] jArr21 = jArr5;
                        jArr5 = jArr9;
                        jArr9 = jArr21;
                        long[] jArr22 = jArr6;
                        jArr6 = jArr17;
                        jArr10 = jArr22;
                        long[] jArr23 = jArr8;
                        jArr8 = jArr4;
                        jArr4 = jArr23;
                        i7 = i10;
                        jArr3 = jArr7;
                        bArrCopyOf = bArr4;
                        i2 = i11;
                        jArr = jArr14;
                        jArr7 = jArr20;
                    }
                    i2++;
                    i = 32;
                    i4 = 10;
                }
                long[] jArr24 = jArr;
                int i15 = i4;
                long[] jArr25 = new long[i15];
                long[] jArr26 = new long[i15];
                long[] jArr27 = new long[i15];
                long[] jArr28 = new long[i15];
                long[] jArr29 = new long[i15];
                long[] jArr30 = new long[i15];
                long[] jArr31 = new long[i15];
                long[] jArr32 = new long[i15];
                long[] jArr33 = new long[i15];
                long[] jArr34 = new long[i15];
                long[] jArr35 = jArr3;
                long[] jArr36 = new long[i15];
                vc2.T(jArr26, jArr6);
                vc2.T(jArr36, jArr26);
                vc2.T(jArr34, jArr36);
                vc2.R(jArr27, jArr34, jArr6);
                vc2.R(jArr28, jArr27, jArr26);
                vc2.T(jArr34, jArr28);
                vc2.R(jArr29, jArr34, jArr27);
                vc2.T(jArr34, jArr29);
                vc2.T(jArr36, jArr34);
                vc2.T(jArr34, jArr36);
                vc2.T(jArr36, jArr34);
                vc2.T(jArr34, jArr36);
                vc2.R(jArr30, jArr34, jArr29);
                vc2.T(jArr34, jArr30);
                vc2.T(jArr36, jArr34);
                for (int i16 = 2; i16 < 10; i16 += 2) {
                    vc2.T(jArr34, jArr36);
                    vc2.T(jArr36, jArr34);
                }
                vc2.R(jArr31, jArr36, jArr30);
                vc2.T(jArr34, jArr31);
                vc2.T(jArr36, jArr34);
                for (int i17 = 2; i17 < 20; i17 += 2) {
                    vc2.T(jArr34, jArr36);
                    vc2.T(jArr36, jArr34);
                }
                vc2.R(jArr34, jArr36, jArr31);
                vc2.T(jArr36, jArr34);
                vc2.T(jArr34, jArr36);
                for (int i18 = 2; i18 < 10; i18 += 2) {
                    vc2.T(jArr36, jArr34);
                    vc2.T(jArr34, jArr36);
                }
                vc2.R(jArr32, jArr34, jArr30);
                vc2.T(jArr34, jArr32);
                vc2.T(jArr36, jArr34);
                for (int i19 = 2; i19 < 50; i19 += 2) {
                    vc2.T(jArr34, jArr36);
                    vc2.T(jArr36, jArr34);
                }
                vc2.R(jArr33, jArr36, jArr32);
                vc2.T(jArr36, jArr33);
                vc2.T(jArr34, jArr36);
                for (int i20 = 2; i20 < 100; i20 += 2) {
                    vc2.T(jArr36, jArr34);
                    vc2.T(jArr34, jArr36);
                }
                vc2.R(jArr36, jArr34, jArr33);
                vc2.T(jArr34, jArr36);
                vc2.T(jArr36, jArr34);
                for (int i21 = 2; i21 < 50; i21 += 2) {
                    vc2.T(jArr34, jArr36);
                    vc2.T(jArr36, jArr34);
                }
                vc2.R(jArr34, jArr36, jArr32);
                vc2.T(jArr36, jArr34);
                vc2.T(jArr34, jArr36);
                vc2.T(jArr36, jArr34);
                vc2.T(jArr34, jArr36);
                vc2.T(jArr36, jArr34);
                vc2.R(jArr25, jArr36, jArr28);
                vc2.R(jArr24, jArr5, jArr25);
                long[] jArr37 = new long[10];
                long[] jArr38 = new long[10];
                long[] jArr39 = new long[11];
                long[] jArr40 = new long[11];
                long[] jArr41 = new long[11];
                vc2.R(jArr37, jArr2, jArr24);
                vc2.X(jArr38, jArr2, jArr24);
                long[] jArr42 = new long[10];
                jArr42[0] = 486662;
                vc2.X(jArr40, jArr38, jArr42);
                vc2.R(jArr40, jArr40, jArr4);
                vc2.X(jArr40, jArr40, jArr35);
                vc2.R(jArr40, jArr40, jArr37);
                vc2.R(jArr40, jArr40, jArr35);
                for (int i22 = 0; i22 < 10; i22++) {
                    jArr39[i22] = jArr40[i22] * 4;
                }
                vc2.Q(jArr39);
                vc2.R(jArr40, jArr37, jArr4);
                vc2.V(jArr40, jArr40, jArr4);
                vc2.R(jArr41, jArr38, jArr35);
                vc2.X(jArr40, jArr40, jArr41);
                vc2.T(jArr40, jArr40);
                if (MessageDigest.isEqual(vc2.W(jArr39), vc2.W(jArr40))) {
                    return vc2.W(jArr24);
                }
                ygf.f("Arithmetic error in curve multiplication with the public key: ".concat(vn7.p0(bArr2)));
                return null;
            }
            if (MessageDigest.isEqual(bArr3[i3], bArrCopyOf2)) {
                throw new InvalidKeyException("Banned public key: ".concat(vn7.p0(bArr3[i3])));
            }
            i3++;
        }
    }

    public static final void a(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1944292161);
        if (p65Var.P(i & 1, i != 0)) {
            b(w2g.C(jfc.d(o28.b, 1.0f), 24.0f), 0L, null, null, false, t40.c, p65Var, 1572870, 62);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 2);
        }
    }

    public static final void b(r28 r28Var, long j, cu0 cu0Var, m45 m45Var, boolean z, mz1 mz1Var, x12 x12Var, int i, int i2) {
        int i3;
        m45 m45Var2;
        int i4;
        long j2;
        cu0 cu0Var2;
        boolean z2;
        m45 m45Var3;
        int i5;
        cu0 cu0Var3;
        long j3;
        boolean z3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1050563634);
        if ((i & 6) == 0) {
            i3 = i | (p65Var.f(r28Var) ? 4 : 2);
        } else {
            i3 = i;
        }
        int i6 = i3 | 3216;
        int i7 = i2 & 16;
        if (i7 != 0) {
            i4 = i3 | 27792;
            m45Var2 = m45Var;
        } else {
            m45Var2 = m45Var;
            i4 = i6 | (p65Var.h(m45Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        }
        int i8 = i4 | 196608;
        int i9 = 1;
        if (p65Var.P(i8 & 1, (599187 & i8) != 599186)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                sn3 sn3Var = kt7.b;
                long j4 = ((zo7) p65Var.j(sn3Var)).a;
                cu0 cu0VarB = k40.b(1.0f, ((zo7) p65Var.j(sn3Var)).z);
                int i10 = i8 & (-1009);
                if (i7 != 0) {
                    Object objM = p65Var.M();
                    if (objM == w12.a) {
                        objM = new ov6(29);
                        p65Var.j0(objM);
                    }
                    m45Var2 = (m45) objM;
                }
                m45Var3 = m45Var2;
                i5 = i10;
                cu0Var3 = cu0VarB;
                j3 = j4;
                z3 = true;
            } else {
                p65Var.S();
                cu0Var3 = cu0Var;
                z3 = z;
                m45Var3 = m45Var2;
                i5 = i8 & (-1009);
                j3 = j;
            }
            p65Var.q();
            long j5 = j3;
            cu0 cu0Var4 = cu0Var3;
            boolean z4 = z3;
            m45Var2 = m45Var3;
            dm2.b(m45Var2, r28Var, z4, null, gx1.A(j3, 0L, p65Var, 0, 14), gx1.B(62), cu0Var4, pxf.E(-1377277447, new un7(mz1Var, i9), p65Var), p65Var, ((i5 >> 12) & 14) | 100663296 | ((i5 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 384, 136);
            cu0Var2 = cu0Var4;
            j2 = j5;
            z2 = z4;
        } else {
            p65Var.S();
            j2 = j;
            cu0Var2 = cu0Var;
            z2 = z;
        }
        m45 m45Var4 = m45Var2;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new km1(r28Var, j2, cu0Var2, m45Var4, z2, mz1Var, i, i2);
        }
    }

    public static final void c(xn8 xn8Var, vn8 vn8Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        wn8 wn8Var;
        sn3 sn3Var;
        long j;
        xn8Var.getClass();
        vn8Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-183353881);
        if ((i & 6) == 0) {
            i2 = i | (p65Var.f(xn8Var) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(vn8Var) ? 32 : 16;
        }
        int i3 = i2 | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            aw7 aw7Var = xn8Var.d;
            if ((aw7Var == null ? -1 : un8.a[aw7Var.ordinal()]) == 1) {
                p65Var.Y(1912277619);
                long j2 = xo7.B;
                if (yi2.N(p65Var)) {
                    p65Var.Y(1091114609);
                    sn3Var = kt7.b;
                    j = ((zo7) p65Var.j(sn3Var)).p;
                    p65Var.p(false);
                } else {
                    p65Var.Y(1091176082);
                    sn3Var = kt7.b;
                    j = ((zo7) p65Var.j(sn3Var)).n;
                    p65Var.p(false);
                }
                wn8Var = new wn8(j2, j, ((zo7) p65Var.j(sn3Var)).a, ((zo7) p65Var.j(sn3Var)).n);
                p65Var.p(false);
            } else {
                p65Var.Y(1912288106);
                sn3 sn3Var2 = kt7.b;
                wn8 wn8Var2 = new wn8(((zo7) p65Var.j(sn3Var2)).d, ((zo7) p65Var.j(sn3Var2)).p, ((zo7) p65Var.j(sn3Var2)).b, ((zo7) p65Var.j(sn3Var2)).n);
                p65Var.p(false);
                wn8Var = wn8Var2;
            }
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i5 = i3 & 14;
            boolean z = (i5 == 4) | (i4 == 32);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new ps5(vn8Var, 20, xn8Var);
                p65Var.j0(objM);
            }
            m45 m45Var = (m45) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new hb8(11);
                p65Var.j0(objM2);
            }
            o28 o28Var = o28.b;
            d(xn8Var, wn8Var, m45Var, bgf.N(wxb.a(o28Var, false, (x45) objM2), "offer_banner"), p65Var, i5);
            boolean z2 = (i4 == 32) | (i5 == 4);
            Object objM3 = p65Var.M();
            if (z2 || objM3 == uobVar) {
                objM3 = new rc0(vn8Var, xn8Var, null, 28);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, xn8Var);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 7, xn8Var, vn8Var, r28Var2);
        }
    }

    public static final void d(xn8 xn8Var, wn8 wn8Var, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1882794119);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(xn8Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(wn8Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(m45Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            mkd mkdVar = ((bu7) p65Var.j(jt7.c)).m;
            r28 r28VarD = w2g.D(hlg.r(flb.a0(jfc.d(r28Var, 1.0f), wn8Var.a, rv8.r), false, null, null, m45Var, 15), 16.0f, 8.0f);
            boolean zF = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.f(mkdVar) | ((i2 & 14) == 4);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new ho5(xn8Var, mkdVar, wn8Var, 20);
                p65Var.j0(objM);
            }
            f76.u(r28VarD, (b55) objM, p65Var, 0, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 5, xn8Var, wn8Var, m45Var, r28Var);
        }
    }

    public static final void e(String str, long j, long j2, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1617841502);
        int i2 = i | (p65Var2.f(str) ? 4 : 2) | (p65Var2.e(j) ? 32 : 16) | (p65Var2.e(j2) ? 256 : 128) | 3072;
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            mkd mkdVarA = mkd.a(((bu7) p65Var2.j(jt7.c)).n, j2, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            jjd.b(str, w2g.D(flb.a0(bgf.N(o28Var, "pill"), j, bmb.a(8.0f)), 8.0f, 4.0f), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVarA, p65Var, i2 & 14, 24960, 110588);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qn8(str, j, j2, r28Var2, i);
        }
    }

    public static wq f(String str, mkd mkdVar, long j, m73 m73Var, yy4 yy4Var, int i, int i2) {
        ey3 ey3Var = ey3.a;
        return new wq(new ar(str, mkdVar, ey3Var, ey3Var, yy4Var, m73Var), i, 1, j);
    }

    public static final void g(ko9 ko9Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1636921894);
        int i2 = (p65Var.h(ko9Var) ? 4 : 2) | i | 48;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            l78 l78VarZ = guc.z(ko9Var.w, p65Var, 0);
            l78 l78VarZ2 = guc.z(ko9Var.v, p65Var, 0);
            lo9 lo9Var = new lo9(ko9Var);
            pkf pkfVar = new pkf(ko9Var);
            tve tveVar = (tve) l78VarZ.getValue();
            tb3 tb3Var = (tb3) l78VarZ2.getValue();
            uua uuaVar = ko9Var.t;
            o28 o28Var = o28.b;
            mo7.u(tveVar, tb3Var, uuaVar, lo9Var, pkfVar, o28Var, p65Var, 196608, 0);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(ko9Var, r28Var, i, 16);
        }
    }

    public static final void h(boolean z, b55 b55Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1818896922);
        int i2 = (p65Var.g(z) ? 4 : 2) | i | (p65Var.h(b55Var) ? 32 : 16);
        if ((i2 & 19) == 18 && p65Var.B()) {
            p65Var.S();
        } else {
            mq7.g(z, b55Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pv0(z, b55Var, i, 3);
        }
    }

    public static final void i(int i, int i2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(996873154);
        int i4 = i2 & 1;
        if (i4 != 0) {
            i3 = i | 6;
            r28Var2 = r28Var;
        } else if ((i & 6) == 0) {
            r28Var2 = r28Var;
            i3 = i | (p65Var.f(r28Var2) ? 4 : 2);
        } else {
            r28Var2 = r28Var;
            i3 = i;
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28Var3 = i4 != 0 ? o28Var : r28Var2;
            r28 r28Var4 = r28Var3;
            r28 r28VarN = bgf.N(w2g.G(r28Var3, 24.0f, 0.0f, 24.0f, 0.0f, 10), "unlisted_badge");
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            c09 c09VarJ = vn7.J(R.drawable.ic_unlisted_24, 0, p65Var);
            sn3 sn3Var = kt7.b;
            qv5.b(c09VarJ, null, jfc.l(o28Var, 24.0f), ((zo7) p65Var.j(sn3Var)).o, p65Var, 440, 0);
            jjd.b(vo7.R(p65Var, R.string.common_unlisted), w2g.G(o28Var, 2.0f, 0.0f, 0.0f, 0.0f, 14), ((zo7) p65Var.j(sn3Var)).o, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, dl7.m(((bu7) p65Var.j(jt7.c)).m), p65Var, 48, 0, 131064);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new voc(r28Var2, i, i2);
        }
    }

    public static final l78 l(n6c n6cVar, Object obj, x12 x12Var, int i, int i2) {
        p65 p65Var = (p65) x12Var;
        zx3 zx3Var = zx3.a;
        boolean zH = p65Var.h(zx3Var) | p65Var.h(n6cVar);
        Object objM = p65Var.M();
        n92 n92Var = null;
        uob uobVar = w12.a;
        if (zH || objM == uobVar) {
            objM = new mw9(zx3Var, n6cVar, n92Var, 28);
            p65Var.j0(objM);
        }
        b55 b55Var = (b55) objM;
        Object objM2 = p65Var.M();
        if (objM2 == uobVar) {
            objM2 = qo7.u(obj);
            p65Var.j0(objM2);
        }
        l78 l78Var = (l78) objM2;
        boolean zH2 = p65Var.h(b55Var);
        Object objM3 = p65Var.M();
        if (zH2 || objM3 == uobVar) {
            objM3 = new cjc(b55Var, l78Var, n92Var, 1);
            p65Var.j0(objM3);
        }
        kyd.l(n6cVar, zx3Var, (b55) objM3, p65Var);
        return l78Var;
    }

    public static final l78 m(vpc vpcVar, x12 x12Var) {
        return l(vpcVar, vpcVar.getValue(), x12Var, 0, 0);
    }

    public static rbb n(String str, fn7 fn7Var) {
        Charset charset = wk1.a;
        if (fn7Var != null) {
            Charset charsetA = fn7.a(fn7Var);
            if (charsetA == null) {
                try {
                    fn7Var = en7.x(fn7Var + "; charset=utf-8");
                } catch (IllegalArgumentException unused) {
                    fn7Var = null;
                }
            } else {
                charset = charsetA;
            }
        }
        byte[] bytes = str.getBytes(charset);
        bytes.getClass();
        int length = bytes.length;
        egf.a(bytes.length, 0L, length);
        return new rbb(fn7Var, length, bytes);
    }

    public static final long o() {
        return Thread.currentThread().getId();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0049  */
    /* JADX WARN: Type inference failed for: r12v0, types: [java.lang.Object, java.lang.String] */
    /* JADX WARN: Type inference failed for: r12v1, types: [java.text.BreakIterator] */
    /* JADX WARN: Type inference failed for: r4v3, types: [java.lang.Object, ku3] */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3 */
    /* JADX WARN: Type inference failed for: r5v4, types: [java.lang.CharSequence] */
    /* JADX WARN: Type inference failed for: r5v8 */
    /* JADX WARN: Type inference failed for: r5v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final int q(int r11, java.lang.String r12) {
        /*
            yw3 r0 = u()
            r1 = 0
            if (r0 == 0) goto L7c
            int r2 = r0.c()
            r3 = 0
            r4 = 1
            if (r2 != r4) goto L10
            goto L11
        L10:
            r4 = r3
        L11:
            if (r4 == 0) goto L76
            java.lang.String r2 = "charSequence cannot be null"
            defpackage.jq7.h(r2, r12)
            wj r0 = r0.e
            java.lang.Object r0 = r0.b
            r4 = r0
            ku3 r4 = (defpackage.ku3) r4
            r4.getClass()
            r0 = -1
            if (r11 < 0) goto L2b
            int r2 = r12.length()
            if (r11 < r2) goto L2d
        L2b:
            r5 = r12
            goto L6c
        L2d:
            boolean r2 = r12 instanceof android.text.Spanned
            if (r2 == 0) goto L49
            r2 = r12
            android.text.Spanned r2 = (android.text.Spanned) r2
            int r5 = r11 + 1
            java.lang.Class<cyd> r6 = defpackage.cyd.class
            java.lang.Object[] r5 = r2.getSpans(r11, r5, r6)
            cyd[] r5 = (defpackage.cyd[]) r5
            int r6 = r5.length
            if (r6 <= 0) goto L49
            r3 = r5[r3]
            int r2 = r2.getSpanEnd(r3)
            r5 = r12
            goto L6d
        L49:
            int r2 = r11 + (-16)
            int r6 = java.lang.Math.max(r3, r2)
            int r2 = r12.length()
            int r3 = r11 + 16
            int r7 = java.lang.Math.min(r2, r3)
            kx3 r10 = new kx3
            r10.<init>(r11)
            r8 = 2147483647(0x7fffffff, float:NaN)
            r9 = 1
            r5 = r12
            java.lang.Object r12 = r4.H(r5, r6, r7, r8, r9, r10)
            kx3 r12 = (defpackage.kx3) r12
            int r2 = r12.c
            goto L6d
        L6c:
            r2 = r0
        L6d:
            java.lang.Integer r12 = java.lang.Integer.valueOf(r2)
            if (r2 != r0) goto L74
            goto L7d
        L74:
            r1 = r12
            goto L7d
        L76:
            java.lang.String r11 = "Not initialized yet"
            defpackage.ygf.f(r11)
            return r3
        L7c:
            r5 = r12
        L7d:
            if (r1 == 0) goto L84
            int r11 = r1.intValue()
            return r11
        L84:
            java.text.BreakIterator r12 = java.text.BreakIterator.getCharacterInstance()
            r12.setText(r5)
            int r11 = r12.following(r11)
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.no7.q(int, java.lang.String):int");
    }

    public static final int r(int i, String str) {
        yw3 yw3VarU = u();
        Integer num = null;
        if (yw3VarU != null) {
            Integer numValueOf = Integer.valueOf(yw3VarU.b(str, Math.max(0, i - 1)));
            if (numValueOf.intValue() != -1) {
                num = numValueOf;
            }
        }
        if (num != null) {
            return num.intValue();
        }
        BreakIterator characterInstance = BreakIterator.getCharacterInstance();
        characterInstance.setText(str);
        return characterInstance.preceding(i);
    }

    public static final Object s(vob vobVar, String str, Object obj) {
        vobVar.getClass();
        Object objA = vobVar.a(str);
        return objA == null ? obj : objA;
    }

    public static final String t() {
        return String.format("m.%s", Arrays.copyOf(new Object[]{f94.s}, 1));
    }

    public static final yw3 u() {
        if (!yw3.d()) {
            return null;
        }
        yw3 yw3VarA = yw3.a();
        if (yw3VarA.c() == 1) {
            return yw3VarA;
        }
        return null;
    }

    public static final String v() {
        return String.format("m.%s", Arrays.copyOf(new Object[]{f94.r}, 1));
    }

    public static k1b y(f41 f41Var, m45 m45Var) {
        if (m45Var != null) {
            return new k1b(f41Var, m45Var);
        }
        ay0.e("Argument for @NotNull parameter 'initializer' of kotlin/reflect/jvm/internal/ReflectProperties.lazySoft must not be null");
        return null;
    }

    public abstract void A(int i);

    public abstract void B(View view, int i, int i2);

    public abstract void C(View view, float f, float f2);

    public abstract boolean F(View view, int i);

    public abstract int j(View view, int i);

    public abstract int k(View view, int i);

    public int w(View view) {
        return 0;
    }

    public int x() {
        return 0;
    }

    public void z(View view, int i) {
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v0 */
    /* JADX WARN: Type inference failed for: r2v1, types: [java.lang.String, ru] */
    /* JADX WARN: Type inference failed for: r2v12 */
    public static ru p(String str, String str2) throws XMPException {
        int i;
        int i2;
        aaf aafVar;
        int i3;
        int i4;
        int i5;
        char c2;
        ?? r2 = 0;
        int i6 = 4;
        if (str == null || str2 == null) {
            ywb.e(4, "Parameter must not be null");
            return null;
        }
        ru ruVar = new ru(6);
        int i7 = 0;
        while (i7 < str2.length() && "/[*".indexOf(str2.charAt(i7)) < 0) {
            i7++;
        }
        if (i7 == 0) {
            ywb.e(102, "Empty initial XMPPath step");
            return null;
        }
        String strI = I(str, str2.substring(0, i7));
        baf bafVarG = v9f.a.g(strI);
        int i8 = 3;
        int i9 = 1;
        if (bafVarG == null) {
            ruVar.b(new aaf(str, Integer.MIN_VALUE));
            ruVar.b(new aaf(strI, 1));
        } else {
            String str3 = bafVarG.a;
            td tdVar = bafVarG.d;
            ruVar.b(new aaf(str3, Integer.MIN_VALUE));
            aaf aafVar2 = new aaf(I(str3, bafVarG.c), 1);
            aafVar2.c = true;
            aafVar2.d = tdVar.a;
            ruVar.b(aafVar2);
            if (tdVar.c(4096)) {
                aaf aafVar3 = new aaf("[?xml:lang='x-default']", 5);
                aafVar3.c = true;
                aafVar3.d = tdVar.a;
                ruVar.b(aafVar3);
            } else if (tdVar.c(512)) {
                aaf aafVar4 = new aaf("[1]", 3);
                aafVar4.c = true;
                aafVar4.d = tdVar.a;
                ruVar.b(aafVar4);
            }
        }
        int i10 = 0;
        int i11 = 0;
        while (i7 < str2.length()) {
            if (str2.charAt(i7) == '/' && (i7 = i7 + 1) >= str2.length()) {
                ywb.e(102, "Empty XMPPath segment");
                return r2;
            }
            if (str2.charAt(i7) == '*' && ((i7 = i7 + 1) >= str2.length() || str2.charAt(i7) != '[')) {
                ywb.e(102, "Missing '[' after '*'");
                return r2;
            }
            if (str2.charAt(i7) == '[') {
                int i12 = i7 + 1;
                if ('0' <= str2.charAt(i12)) {
                    i = i9;
                    if (str2.charAt(i12) <= '9') {
                        while (i12 < str2.length() && '0' <= str2.charAt(i12) && str2.charAt(i12) <= '9') {
                            i12++;
                        }
                        i2 = i11;
                        aafVar = new aaf(r2, i8);
                    }
                    if (i12 < str2.length() || str2.charAt(i12) != ']') {
                        ru ruVar2 = r2;
                        ywb.e(102, "Missing ']' for array index");
                        return ruVar2;
                    }
                    int i13 = i12 + 1;
                    aafVar.a = str2.substring(i7, i13);
                    i7 = i13;
                    i3 = i10;
                    i4 = i2;
                } else {
                    i = i9;
                }
                i2 = i12;
                while (i2 < str2.length() && str2.charAt(i2) != ']' && str2.charAt(i2) != '=') {
                    i2++;
                }
                if (i2 >= str2.length()) {
                    ru ruVar3 = r2;
                    ywb.e(102, "Missing ']' or '=' for array index");
                    return ruVar3;
                }
                if (str2.charAt(i2) != ']') {
                    char cCharAt = str2.charAt(i2 + 1);
                    if (cCharAt != '\'' && cCharAt != '\"') {
                        ywb.e(102, "Invalid quote in array selector");
                        return r2;
                    }
                    int i14 = i2 + 2;
                    while (i14 < str2.length()) {
                        if (str2.charAt(i14) == cCharAt) {
                            int i15 = i14 + 1;
                            if (i15 >= str2.length() || str2.charAt(i15) != cCharAt) {
                                break;
                            }
                            i14 = i15;
                        }
                        i14++;
                    }
                    if (i14 >= str2.length()) {
                        ru ruVar4 = r2;
                        ywb.e(102, "No terminating quote for array selector");
                        return ruVar4;
                    }
                    int i16 = i14 + 1;
                    aafVar = new aaf(r2, 6);
                    i12 = i16;
                    i10 = i12;
                } else {
                    if (!"[last()".equals(str2.substring(i7, i2))) {
                        ywb.e(102, "Invalid non-numeric array index");
                        return r2;
                    }
                    int i17 = i2;
                    i2 = i11;
                    aafVar = new aaf(r2, i6);
                    i12 = i17;
                }
                if (i12 < str2.length()) {
                }
                ru ruVar22 = r2;
                ywb.e(102, "Missing ']' for array index");
                return ruVar22;
            }
            i4 = i7;
            while (i4 < str2.length() && "/[*".indexOf(str2.charAt(i4)) < 0) {
                i4++;
            }
            if (i4 == i7) {
                ywb.e(102, "Empty XMPPath segment");
                return r2;
            }
            aafVar = new aaf(str2.substring(i7, i4), i9);
            i3 = i7;
            i = i9;
            i7 = i4;
            int i18 = aafVar.b;
            ru ruVar5 = r2;
            int i19 = i;
            if (i18 == i19) {
                if (aafVar.a.charAt(0) == '@') {
                    String strConcat = "?".concat(aafVar.a.substring(i19));
                    aafVar.a = strConcat;
                    if (!ZVsviyDAr.Tdnpnpk.equals(strConcat)) {
                        ywb.e(102, "Only xml:lang allowed with '@'");
                        return ruVar5;
                    }
                }
                if (aafVar.a.charAt(0) == '?') {
                    i3++;
                    aafVar.b = 2;
                }
                G(str2.substring(i3, i4));
            } else {
                if (i18 == 6) {
                    if (aafVar.a.charAt(1) == '@') {
                        String strConcat2 = "[?".concat(aafVar.a.substring(2));
                        aafVar.a = strConcat2;
                        if (!strConcat2.startsWith("[?xml:lang=")) {
                            ywb.e(102, "Only xml:lang allowed with '@'");
                            return ruVar5;
                        }
                    }
                    i5 = 1;
                    if (aafVar.a.charAt(1) == '?') {
                        i3++;
                        c2 = 5;
                        aafVar.b = 5;
                        G(str2.substring(i3, i4));
                    } else {
                        c2 = 5;
                    }
                }
                ruVar.b(aafVar);
                i11 = i4;
                i10 = i3;
                i9 = i5;
                r2 = ruVar5;
                i6 = 4;
                i8 = 3;
            }
            c2 = 5;
            i5 = 1;
            ruVar.b(aafVar);
            i11 = i4;
            i10 = i3;
            i9 = i5;
            r2 = ruVar5;
            i6 = 4;
            i8 = 3;
        }
        return ruVar;
    }
}

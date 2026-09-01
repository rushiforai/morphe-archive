package defpackage;

import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.RectF;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.google.android.recaptcha.internal.zzaek;
import com.medium.reader.R;
import java.io.IOException;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class kk7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static final /* synthetic */ int e = 0;

    /* JADX WARN: Removed duplicated region for block: B:11:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final float A(defpackage.s99 r6, boolean r7, defpackage.lr5[] r8, float r9) {
        /*
            int r0 = r8.length
            r1 = 2143289344(0x7fc00000, float:NaN)
            r2 = 0
            r3 = r2
        L5:
            if (r3 >= r0) goto L20
            r4 = r8[r3]
            float r4 = r6.a(r4)
            boolean r5 = java.lang.Float.isNaN(r1)
            if (r5 != 0) goto L1c
            int r5 = (r4 > r1 ? 1 : (r4 == r1 ? 0 : -1))
            if (r5 <= 0) goto L19
            r5 = 1
            goto L1a
        L19:
            r5 = r2
        L1a:
            if (r7 != r5) goto L1d
        L1c:
            r1 = r4
        L1d:
            int r3 = r3 + 1
            goto L5
        L20:
            boolean r6 = java.lang.Float.isNaN(r1)
            if (r6 == 0) goto L27
            return r9
        L27:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kk7.A(s99, boolean, lr5[], float):float");
    }

    /* JADX WARN: Code restructure failed: missing block: B:82:0x0166, code lost:
    
        if (r3 == r9) goto L83;
     */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00bd A[Catch: all -> 0x0055, TryCatch #1 {all -> 0x0055, blocks: (B:21:0x0051, B:44:0x00b5, B:46:0x00bd, B:48:0x00c9, B:50:0x00d5, B:41:0x009b), top: B:99:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object B(defpackage.u4d r17, defpackage.o72 r18, defpackage.xp r19, defpackage.lb9 r20, defpackage.kn0 r21) {
        /*
            Method dump skipped, instruction units count: 414
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kk7.B(u4d, o72, xp, lb9, kn0):java.lang.Object");
    }

    public static final long C(String str, long j, long j2, long j3) {
        String property;
        int i = a7d.a;
        try {
            property = System.getProperty(str);
        } catch (SecurityException unused) {
            property = null;
        }
        if (property == null) {
            return j;
        }
        Long lP = tuc.P(property);
        if (lP == null) {
            throw new IllegalStateException(("System property '" + str + "' has unrecognized value '" + property + '\'').toString());
        }
        long jLongValue = lP.longValue();
        if (j2 <= jLongValue && jLongValue <= j3) {
            return jLongValue;
        }
        StringBuilder sbI = ho2.I(j2, "System property '", str, "' should be in range ");
        wgd.y(sbI, "..", j3, ", but is '");
        sbI.append(jLongValue);
        sbI.append('\'');
        throw new IllegalStateException(sbI.toString().toString());
    }

    public static int D(int i, int i2, String str) {
        return (int) C(str, i, 1L, (i2 & 8) != 0 ? Integer.MAX_VALUE : 2097150);
    }

    public static final Rect E(o46 o46Var) {
        return new Rect(o46Var.a, o46Var.b, o46Var.c, o46Var.d);
    }

    public static final RectF F(zwa zwaVar) {
        return new RectF(zwaVar.a, zwaVar.b, zwaVar.c, zwaVar.d);
    }

    public static final zwa G(RectF rectF) {
        return new zwa(rectF.left, rectF.top, rectF.right, rectF.bottom);
    }

    public static final Class H(yv2 yv2Var) {
        if (!(yv2Var instanceof y28) || !g26.b(yv2Var)) {
            return null;
        }
        y28 y28Var = (y28) yv2Var;
        Class clsJ = bpe.j(y28Var);
        if (clsJ != null) {
            return clsJ;
        }
        StringBuilder sb = new StringBuilder("Class object for the class ");
        sb.append(y28Var.getName());
        mn1 mn1VarF = f93.f((co1) yv2Var);
        sb.append(" cannot be found (classId=");
        sb.append(mn1VarF);
        sb.append(')');
        throw new zb2(sb.toString());
    }

    public static final Class I(mn6 mn6Var) {
        hec hecVarG;
        Class clsH = H(mn6Var.j0().a());
        if (clsH == null) {
            return null;
        }
        if (nxd.e(mn6Var) && ((hecVarG = g26.g(mn6Var)) == null || nxd.e(hecVarG) || vm6.F(hecVarG))) {
            return null;
        }
        return clsH;
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x009e, code lost:
    
        if (r15 == r1) goto L35;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object J(defpackage.u4d r12, defpackage.rhd r13, defpackage.lb9 r14, defpackage.kn0 r15) {
        /*
            Method dump skipped, instruction units count: 213
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kk7.J(u4d, rhd, lb9, kn0):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:47:0x00c1, code lost:
    
        if (r15 == r1) goto L48;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object K(defpackage.u4d r11, defpackage.rhd r12, defpackage.lb9 r13, int r14, defpackage.kn0 r15) {
        /*
            Method dump skipped, instruction units count: 247
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kk7.K(u4d, rhd, lb9, int, kn0):java.lang.Object");
    }

    public static int L(byte[] bArr, int i, hmf hmfVar) {
        int i2 = i + 1;
        byte b2 = bArr[i];
        if (b2 < 0) {
            return P(b2, bArr, i2, hmfVar);
        }
        hmfVar.a = b2;
        return i2;
    }

    public static bzf M(byte[] bArr) throws GeneralSecurityException {
        try {
            isg isgVarU = isg.u(bArr, ptf.a);
            fhg fhgVar = fhg.b;
            qvg qvgVarA = ejg.a(isgVarU.B());
            lig ligVar = new lig(isgVarU, 0, qvgVarA);
            wig wigVar = (wig) fhgVar.a.get();
            wigVar.getClass();
            return !wigVar.d.containsKey(new zig(lig.class, qvgVarA)) ? new qgg(ligVar) : fhgVar.b(ligVar);
        } catch (IOException e2) {
            throw new GeneralSecurityException("Failed to parse proto", e2);
        }
    }

    public static byte[] N(BigInteger bigInteger) {
        if (bigInteger.signum() != -1) {
            return bigInteger.toByteArray();
        }
        ay0.e("n must not be negative");
        return null;
    }

    public static byte[] O(bzf bzfVar) {
        return bzfVar instanceof qgg ? ((isg) ((qgg) bzfVar).a.c).c() : ((isg) ((lig) fhg.b.d(bzfVar)).c).c();
    }

    public static int P(int i, byte[] bArr, int i2, hmf hmfVar) {
        byte b2 = bArr[i2];
        int i3 = i2 + 1;
        int i4 = i & 127;
        if (b2 >= 0) {
            hmfVar.a = i4 | (b2 << 7);
            return i3;
        }
        int i5 = i4 | ((b2 & 127) << 7);
        int i6 = i2 + 2;
        byte b3 = bArr[i3];
        if (b3 >= 0) {
            hmfVar.a = i5 | (b3 << 14);
            return i6;
        }
        int i7 = i5 | ((b3 & 127) << 14);
        int i8 = i2 + 3;
        byte b4 = bArr[i6];
        if (b4 >= 0) {
            hmfVar.a = i7 | (b4 << 21);
            return i8;
        }
        int i9 = i7 | ((b4 & 127) << 21);
        int i10 = i2 + 4;
        byte b5 = bArr[i8];
        if (b5 >= 0) {
            hmfVar.a = i9 | (b5 << 28);
            return i10;
        }
        int i11 = i9 | ((b5 & 127) << 28);
        while (true) {
            int i12 = i10 + 1;
            if (bArr[i10] >= 0) {
                hmfVar.a = i11;
                return i12;
            }
            i10 = i12;
        }
    }

    public static byte[] Q(BigInteger bigInteger, int i) throws GeneralSecurityException {
        if (bigInteger.signum() == -1) {
            ay0.e("integer must be nonnegative");
            return null;
        }
        byte[] byteArray = bigInteger.toByteArray();
        int length = byteArray.length;
        if (length == i) {
            return byteArray;
        }
        int i2 = i + 1;
        if (length > i2) {
            ygf.l("integer too large");
            return null;
        }
        if (length != i2) {
            byte[] bArr = new byte[i];
            System.arraycopy(byteArray, 0, bArr, i - length, length);
            return bArr;
        }
        if (byteArray[0] == 0) {
            return Arrays.copyOfRange(byteArray, 1, length);
        }
        ygf.l("integer too large");
        return null;
    }

    public static int R(byte[] bArr, int i, hmf hmfVar) {
        long j = bArr[i];
        int i2 = i + 1;
        if (j >= 0) {
            hmfVar.b = j;
            return i2;
        }
        int i3 = i + 2;
        byte b2 = bArr[i2];
        long j2 = (j & 127) | (((long) (b2 & 127)) << 7);
        int i4 = 7;
        while (b2 < 0) {
            int i5 = i3 + 1;
            byte b3 = bArr[i3];
            i4 += 7;
            j2 |= ((long) (b3 & 127)) << i4;
            b2 = b3;
            i3 = i5;
        }
        hmfVar.b = j2;
        return i3;
    }

    public static int S(int i, byte[] bArr) {
        int i2 = bArr[i] & 255;
        int i3 = bArr[i + 1] & 255;
        int i4 = bArr[i + 2] & 255;
        return ((bArr[i + 3] & 255) << 24) | (i3 << 8) | i2 | (i4 << 16);
    }

    public static long T(int i, byte[] bArr) {
        return (((long) bArr[i]) & 255) | ((((long) bArr[i + 1]) & 255) << 8) | ((((long) bArr[i + 2]) & 255) << 16) | ((((long) bArr[i + 3]) & 255) << 24) | ((((long) bArr[i + 4]) & 255) << 32) | ((((long) bArr[i + 5]) & 255) << 40) | ((((long) bArr[i + 6]) & 255) << 48) | ((((long) bArr[i + 7]) & 255) << 56);
    }

    public static int U(byte[] bArr, int i, hmf hmfVar) throws zzaek {
        int iL = L(bArr, i, hmfVar);
        int i2 = hmfVar.a;
        if (i2 < 0) {
            ygf.j("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return 0;
        }
        if (i2 > bArr.length - iL) {
            ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return 0;
        }
        if (i2 == 0) {
            hmfVar.c = pmf.b;
            return iL;
        }
        hmfVar.c = pmf.C(bArr, iL, i2);
        return iL + i2;
    }

    public static int V(vof vofVar, byte[] bArr, int i, int i2, hmf hmfVar) throws zzaek {
        fnf fnfVarZza = vofVar.zza();
        int iW = W(fnfVarZza, vofVar, bArr, i, i2, hmfVar);
        vofVar.a(fnfVarZza);
        hmfVar.c = fnfVarZza;
        return iW;
    }

    public static int W(Object obj, vof vofVar, byte[] bArr, int i, int i2, hmf hmfVar) throws zzaek {
        int iP = i + 1;
        int i3 = bArr[i];
        if (i3 < 0) {
            iP = P(i3, bArr, iP, hmfVar);
            i3 = hmfVar.a;
        }
        int i4 = iP;
        if (i3 < 0 || i3 > i2 - i4) {
            ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return 0;
        }
        int i5 = hmfVar.d + 1;
        hmfVar.d = i5;
        if (i5 >= 100) {
            ygf.j("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
            return 0;
        }
        int i6 = i4 + i3;
        vofVar.e(obj, bArr, i4, i6, hmfVar);
        hmfVar.d--;
        hmfVar.c = obj;
        return i6;
    }

    public static int X(Object obj, vof vofVar, byte[] bArr, int i, int i2, int i3, hmf hmfVar) throws zzaek {
        jof jofVar = (jof) vofVar;
        int i4 = hmfVar.d + 1;
        hmfVar.d = i4;
        if (i4 >= 100) {
            ygf.j("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
            return 0;
        }
        int iW = jofVar.w(obj, bArr, i, i2, i3, hmfVar);
        hmfVar.d--;
        hmfVar.c = obj;
        return iW;
    }

    public static int Y(int i, byte[] bArr, int i2, int i3, snf snfVar, hmf hmfVar) {
        gnf gnfVar = (gnf) snfVar;
        int iL = L(bArr, i2, hmfVar);
        gnfVar.m(hmfVar.a);
        while (iL < i3) {
            int iL2 = L(bArr, iL, hmfVar);
            if (i != hmfVar.a) {
                break;
            }
            iL = L(bArr, iL2, hmfVar);
            gnfVar.m(hmfVar.a);
        }
        return iL;
    }

    public static int Z(byte[] bArr, int i, snf snfVar, hmf hmfVar) throws zzaek {
        gnf gnfVar = (gnf) snfVar;
        int iL = L(bArr, i, hmfVar);
        int i2 = hmfVar.a;
        if (i2 < 0) {
            ygf.j("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return 0;
        }
        if (i2 > bArr.length - iL) {
            ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return 0;
        }
        int i3 = i2 + iL;
        while (iL < i3) {
            iL = L(bArr, iL, hmfVar);
            gnfVar.m(hmfVar.a);
        }
        if (iL == i3) {
            return iL;
        }
        ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        return 0;
    }

    public static final void a(uu1 uu1Var, mz1 mz1Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-697402044);
        int i2 = (p65Var.f(uu1Var) ? 4 : 2) | i;
        int i3 = 1;
        int i4 = 0;
        if (!p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.S();
        } else if (uu1Var == null) {
            p65Var.Y(-188459605);
            sn3 sn3Var = kt7.b;
            mz1Var.k(new uu1(((zo7) p65Var.j(sn3Var)).c), new uu1(((zo7) p65Var.j(sn3Var)).n), p65Var, 384);
            p65Var.p(false);
        } else if (op8.f0(uu1Var.a) > 0.5f) {
            p65Var.Y(-188453709);
            jt7.a(false, pxf.E(1421933650, new c4a(mz1Var, uu1Var, i4), p65Var), p65Var, 54, 0);
            p65Var.p(false);
        } else {
            p65Var.Y(-188447533);
            jt7.a(true, pxf.E(-860051982, new c4a(mz1Var, uu1Var, i3), p65Var), p65Var, 54, 0);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new c4a(uu1Var, mz1Var, i);
        }
    }

    public static int a0(vof vofVar, int i, byte[] bArr, int i2, int i3, snf snfVar, hmf hmfVar) throws zzaek {
        int iV = V(vofVar, bArr, i2, i3, hmfVar);
        snfVar.add(hmfVar.c);
        while (iV < i3) {
            int iL = L(bArr, iV, hmfVar);
            if (i != hmfVar.a) {
                break;
            }
            iV = V(vofVar, bArr, iL, i3, hmfVar);
            snfVar.add(hmfVar.c);
        }
        return iV;
    }

    public static final void b(dr9 dr9Var, sh9 sh9Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1823730003);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(dr9Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(sh9Var) ? 32 : 16;
        }
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            l78 l78VarX = guc.x(dr9Var.t.d, Boolean.FALSE, p65Var, 48);
            String strW = dr9Var.c;
            if (strW == null) {
                strW = km4.w(p65Var, -257868037, R.string.common_untitled_story, p65Var, false);
            } else {
                p65Var.Y(-257868688);
                p65Var.p(false);
            }
            boolean zBooleanValue = ((Boolean) l78VarX.getValue()).booleanValue();
            long j = ((zo7) p65Var.j(kt7.b)).o;
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i2 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ng5(sh9Var, dr9Var, 3);
                p65Var.j0(objM);
            }
            kng.e(strW, zBooleanValue, null, j, (m45) objM, p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(dr9Var, sh9Var, i, 24);
        }
    }

    public static int b0(int i, byte[] bArr, int i2, int i3, epf epfVar, hmf hmfVar) throws zzaek {
        if ((i >>> 3) == 0) {
            ygf.j("Protocol message contained an invalid tag (zero).");
            return 0;
        }
        int i4 = i & 7;
        if (i4 == 0) {
            int iR = R(bArr, i2, hmfVar);
            epfVar.d(i, Long.valueOf(hmfVar.b));
            return iR;
        }
        if (i4 == 1) {
            epfVar.d(i, Long.valueOf(T(i2, bArr)));
            return i2 + 8;
        }
        if (i4 == 2) {
            int iL = L(bArr, i2, hmfVar);
            int i5 = hmfVar.a;
            if (i5 < 0) {
                ygf.j("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                return 0;
            }
            if (i5 > bArr.length - iL) {
                ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                return 0;
            }
            if (i5 == 0) {
                epfVar.d(i, pmf.b);
            } else {
                epfVar.d(i, pmf.C(bArr, iL, i5));
            }
            return iL + i5;
        }
        if (i4 != 3) {
            if (i4 == 5) {
                epfVar.d(i, Integer.valueOf(S(i2, bArr)));
                return i2 + 4;
            }
            ygf.j("Protocol message contained an invalid tag (zero).");
            return 0;
        }
        int i6 = (i & (-8)) | 4;
        epf epfVarA = epf.a();
        int i7 = hmfVar.d + 1;
        hmfVar.d = i7;
        if (i7 >= 100) {
            ygf.j("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
            return 0;
        }
        int i8 = 0;
        while (true) {
            if (i2 >= i3) {
                break;
            }
            int iL2 = L(bArr, i2, hmfVar);
            int i9 = hmfVar.a;
            if (i9 == i6) {
                i8 = i9;
                i2 = iL2;
                break;
            }
            i2 = b0(i9, bArr, iL2, i3, epfVarA, hmfVar);
            i8 = i9;
        }
        hmfVar.d--;
        if (i2 > i3 || i8 != i6) {
            ygf.j("Failed to parse the message.");
            return 0;
        }
        epfVar.d(i, epfVarA);
        return i2;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x019e  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01b8  */
    /* JADX WARN: Removed duplicated region for block: B:69:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void c(final defpackage.gz8 r17, defpackage.r28 r18, defpackage.hy8 r19, defpackage.z46 r20, defpackage.zq0 r21, defpackage.iic r22, boolean r23, defpackage.zc8 r24, defpackage.hpe r25, defpackage.fx8 r26, final defpackage.mz1 r27, defpackage.x12 r28, final int r29, final int r30) {
        /*
            Method dump skipped, instruction units count: 456
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kk7.c(gz8, r28, hy8, z46, zq0, iic, boolean, zc8, hpe, fx8, mz1, x12, int, int):void");
    }

    public static final void d(sv1 sv1Var, myd mydVar, x4c x4cVar, mz1 mz1Var, x12 x12Var, int i) {
        x4c x4cVar2;
        k49 k49Var;
        uob uobVar;
        char c2;
        k49 k49Var2;
        float f;
        long j;
        k49 k49Var3 = sv1Var.l;
        k49 k49Var4 = sv1Var.j;
        k49 k49Var5 = sv1Var.i;
        k49 k49Var6 = sv1Var.h;
        k49 k49Var7 = sv1Var.d;
        k49 k49Var8 = sv1Var.c;
        k49 k49Var9 = sv1Var.b;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(53836214);
        int i2 = i | (p65Var.f(sv1Var) ? 4 : 2) | (p65Var.h(mz1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            p65Var.U();
            if ((i & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (objM == uobVar2) {
                uobVar = uobVar2;
                c2 = 4;
                k49Var2 = k49Var3;
                k49Var = k49Var4;
                objM = new sv1(sv1Var.d(), ((uu1) k49Var9.getValue()).a, ((uu1) k49Var8.getValue()).a, ((uu1) k49Var7.getValue()).a, sv1Var.a(), sv1Var.e(), sv1Var.b(), ((uu1) k49Var6.getValue()).a, ((uu1) k49Var5.getValue()).a, ((uu1) k49Var.getValue()).a, sv1Var.c(), ((uu1) k49Var2.getValue()).a, sv1Var.f());
                p65Var.j0(objM);
            } else {
                k49Var = k49Var4;
                uobVar = uobVar2;
                c2 = 4;
                k49Var2 = k49Var3;
            }
            sv1 sv1Var2 = (sv1) objM;
            sn3 sn3Var = tv1.a;
            sv1Var2.a.setValue(new uu1(sv1Var.d()));
            uu1 uu1Var = (uu1) k49Var9.getValue();
            long j2 = uu1Var.a;
            sv1Var2.b.setValue(uu1Var);
            uu1 uu1Var2 = (uu1) k49Var8.getValue();
            long j3 = uu1Var2.a;
            sv1Var2.c.setValue(uu1Var2);
            uu1 uu1Var3 = (uu1) k49Var7.getValue();
            long j4 = uu1Var3.a;
            sv1Var2.d.setValue(uu1Var3);
            sv1Var2.e.setValue(new uu1(sv1Var.a()));
            sv1Var2.f.setValue(new uu1(sv1Var.e()));
            sv1Var2.g.setValue(new uu1(sv1Var.b()));
            uu1 uu1Var4 = (uu1) k49Var6.getValue();
            long j5 = uu1Var4.a;
            sv1Var2.h.setValue(uu1Var4);
            uu1 uu1Var5 = (uu1) k49Var5.getValue();
            long j6 = uu1Var5.a;
            sv1Var2.i.setValue(uu1Var5);
            uu1 uu1Var6 = (uu1) k49Var.getValue();
            long j7 = uu1Var6.a;
            sv1Var2.j.setValue(uu1Var6);
            sv1Var2.k.setValue(new uu1(sv1Var.c()));
            uu1 uu1Var7 = (uu1) k49Var2.getValue();
            long j8 = uu1Var7.a;
            sv1Var2.l.setValue(uu1Var7);
            sv1Var2.m.setValue(Boolean.valueOf(sv1Var.f()));
            tkb tkbVarA = rkb.a(7, 0L, false);
            long jD = sv1Var2.d();
            long jA = sv1Var2.a();
            p65Var.Y(-2060762245);
            long jA2 = tv1.a(sv1Var2, jA);
            long j9 = jA2 != 16 ? jA2 : ((uu1) p65Var.j(d82.a)).a;
            p65Var.p(false);
            long j10 = ((uu1) p65Var.j(d82.a)).a;
            long jB = uu1.b((!((sv1) p65Var.j(tv1.a)).f() ? ((double) op8.f0(j10)) < 0.5d : ((double) op8.f0(j10)) > 0.5d) ? 0.6f : 0.74f, j9);
            boolean zE = p65Var.e(jD) | p65Var.e(jA) | p65Var.e(jB);
            Object objM2 = p65Var.M();
            if (zE || objM2 == uobVar) {
                long j11 = jD;
                f = 1.0f;
                long jD2 = sv1Var2.d();
                float fP = hk7.p(0.4f, j11, jB, jA);
                float fP2 = hk7.p(0.2f, j11, jB, jA);
                float f2 = 4.5f;
                float f3 = 0.4f;
                if (fP >= 4.5f) {
                    j = j11;
                    objM2 = new ekd(jD2, uu1.b(f3, j));
                    p65Var.j0(objM2);
                } else {
                    float f4 = 0.2f;
                    if (fP2 < 4.5f) {
                        f3 = 0.2f;
                        j = j11;
                        objM2 = new ekd(jD2, uu1.b(f3, j));
                        p65Var.j0(objM2);
                    } else {
                        float f5 = 0.4f;
                        int i3 = 0;
                        while (true) {
                            if (i3 >= 7) {
                                j = j11;
                                break;
                            }
                            float f6 = f2;
                            j = j11;
                            float fP3 = (hk7.p(f5, j11, jB, jA) / f6) - 1.0f;
                            if (0.0f <= fP3 && fP3 <= 0.01f) {
                                break;
                            }
                            if (fP3 < 0.0f) {
                                f3 = f5;
                            } else {
                                f4 = f5;
                            }
                            f5 = (f3 + f4) / 2.0f;
                            i3++;
                            j11 = j;
                            f2 = f6;
                        }
                        f3 = f5;
                        objM2 = new ekd(jD2, uu1.b(f3, j));
                        p65Var.j0(objM2);
                    }
                }
            } else {
                f = 1.0f;
            }
            ekd ekdVar = (ekd) objM2;
            sn3 sn3Var2 = tv1.a;
            o10 o10VarA = sn3Var2.a(sv1Var2);
            sn3 sn3Var3 = w72.a;
            long j12 = ((uu1) p65Var.j(d82.a)).a;
            o10 o10VarA2 = sn3Var3.a(Float.valueOf((!((sv1) p65Var.j(sn3Var2)).f() ? ((double) op8.f0(j12)) < 0.5d : ((double) op8.f0(j12)) > 0.5d) ? 0.87f : f));
            o10 o10VarA3 = s06.a.a(tkbVarA);
            x4cVar2 = x4cVar;
            o10 o10VarA4 = a5c.a.a(x4cVar2);
            o10 o10VarA5 = fkd.a.a(ekdVar);
            o10 o10VarA6 = qyd.b.a(mydVar);
            o10[] o10VarArr = new o10[6];
            o10VarArr[0] = o10VarA;
            o10VarArr[1] = o10VarA2;
            o10VarArr[2] = o10VarA3;
            o10VarArr[3] = o10VarA4;
            o10VarArr[c2] = o10VarA5;
            o10VarArr[5] = o10VarA6;
            k40.d(o10VarArr, pxf.E(496803446, new hm4(mydVar, 23, mz1Var), p65Var), p65Var, 56);
        } else {
            x4cVar2 = x4cVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i, 14, sv1Var, mydVar, x4cVar2, mz1Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01fe  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x020c  */
    /* JADX WARN: Removed duplicated region for block: B:91:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(boolean r33, defpackage.x45 r34, defpackage.r28 r35, boolean r36, defpackage.m68 r37, defpackage.h23 r38, defpackage.x12 r39, int r40, int r41) {
        /*
            Method dump skipped, instruction units count: 541
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kk7.e(boolean, x45, r28, boolean, m68, h23, x12, int, int):void");
    }

    public static final void f(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(516882021);
        int i2 = 20;
        if (p65Var.P(i & 1, i != 0)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, o28.b);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new be7(18);
                p65Var.j0(objM);
            }
            e(true, (x45) objM, null, false, null, null, p65Var, 54, 60);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new be7(19);
                p65Var.j0(objM2);
            }
            e(false, (x45) objM2, null, false, null, null, p65Var, 54, 60);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new be7(i2);
                p65Var.j0(objM3);
            }
            e(false, (x45) objM3, null, false, null, null, p65Var, 3126, 52);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new be7(21);
                p65Var.j0(objM4);
            }
            e(true, (x45) objM4, null, false, null, null, p65Var, 3126, 52);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, i2);
        }
    }

    public static final void g(dr9 dr9Var, sh9 sh9Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        sh9 sh9Var2;
        p65 p65Var;
        r28 r28Var2;
        mwa mwaVarS;
        hm8 hm8Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(179652594);
        if ((i & 6) == 0) {
            i2 = i | (p65Var2.f(dr9Var) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            sh9Var2 = sh9Var;
            i2 |= p65Var2.f(sh9Var) ? 32 : 16;
        } else {
            sh9Var2 = sh9Var;
        }
        int i3 = i2 | 384;
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            boolean z = dr9Var.v;
            o28 o28Var = o28.b;
            if (!z) {
                mwaVarS = p65Var2.s();
                if (mwaVarS != null) {
                    hm8Var = new hm8(dr9Var, sh9Var2, o28Var, i, 5);
                    mwaVarS.d = hm8Var;
                }
                return;
            }
            r28 r28VarN = bgf.N(o28Var, "more_options");
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var2.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, zk7VarC);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = new dq7(l78Var, 13);
                p65Var2.j0(objM2);
            }
            f49.l((m45) objM2, null, false, null, null, pxf.E(1955400654, new vh9(dr9Var, i4), p65Var2), p65Var2, 1572870, 62);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar) {
                objM3 = new dq7(l78Var, 11);
                p65Var2.j0(objM3);
            }
            mk7.b(dr9Var, zBooleanValue, sh9Var, (m45) objM3, bgf.N(o28Var, "more_options_menu"), p65Var2, (i3 & 14) | 27648 | ((i3 << 3) & 896));
            p65Var = p65Var2;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            hm8Var = new hm8(dr9Var, sh9Var, r28Var2, i, 1);
            mwaVarS.d = hm8Var;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0043  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0045  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x019d  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x01a9  */
    /* JADX WARN: Removed duplicated region for block: B:59:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void h(defpackage.r28 r21, long r22, boolean r24, defpackage.x12 r25, int r26, int r27) {
        /*
            Method dump skipped, instruction units count: 440
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kk7.h(r28, long, boolean, x12, int, int):void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v11, types: [boolean] */
    /* JADX WARN: Type inference failed for: r0v24 */
    /* JADX WARN: Type inference failed for: r0v29 */
    /* JADX WARN: Type inference failed for: r0v43 */
    /* JADX WARN: Type inference failed for: r0v48 */
    /* JADX WARN: Type inference failed for: r0v49 */
    /* JADX WARN: Type inference failed for: r0v50 */
    /* JADX WARN: Type inference failed for: r0v8, types: [boolean] */
    /* JADX WARN: Type inference failed for: r0v9, types: [boolean] */
    /* JADX WARN: Type inference failed for: r12v12 */
    /* JADX WARN: Type inference failed for: r12v16, types: [p65] */
    /* JADX WARN: Type inference failed for: r12v2, types: [p65] */
    /* JADX WARN: Type inference failed for: r12v20, types: [p65] */
    /* JADX WARN: Type inference failed for: r12v22, types: [p65] */
    /* JADX WARN: Type inference failed for: r12v24, types: [p65] */
    /* JADX WARN: Type inference failed for: r12v26 */
    /* JADX WARN: Type inference failed for: r12v27 */
    /* JADX WARN: Type inference failed for: r12v28 */
    /* JADX WARN: Type inference failed for: r12v29 */
    /* JADX WARN: Type inference failed for: r12v3, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r12v30 */
    /* JADX WARN: Type inference failed for: r12v31 */
    /* JADX WARN: Type inference failed for: r12v32 */
    /* JADX WARN: Type inference failed for: r12v33 */
    /* JADX WARN: Type inference failed for: r12v34 */
    /* JADX WARN: Type inference failed for: r12v35 */
    /* JADX WARN: Type inference failed for: r12v36 */
    /* JADX WARN: Type inference failed for: r12v37 */
    /* JADX WARN: Type inference failed for: r12v38 */
    /* JADX WARN: Type inference failed for: r12v4, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r12v5, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r12v6, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r12v7, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r12v8, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r14v13 */
    /* JADX WARN: Type inference failed for: r14v14 */
    /* JADX WARN: Type inference failed for: r14v15 */
    /* JADX WARN: Type inference failed for: r14v16 */
    /* JADX WARN: Type inference failed for: r14v17 */
    /* JADX WARN: Type inference failed for: r14v30 */
    /* JADX WARN: Type inference failed for: r14v35 */
    /* JADX WARN: Type inference failed for: r14v43 */
    /* JADX WARN: Type inference failed for: r14v45 */
    /* JADX WARN: Type inference failed for: r14v69 */
    /* JADX WARN: Type inference failed for: r14v70 */
    /* JADX WARN: Type inference failed for: r14v71 */
    /* JADX WARN: Type inference failed for: r17v0, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r17v2, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r17v4, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r30v6, types: [x12] */
    /* JADX WARN: Type inference failed for: r30v7, types: [x12] */
    /* JADX WARN: Type inference failed for: r39v2, types: [boolean] */
    /* JADX WARN: Type inference failed for: r6v19 */
    /* JADX WARN: Type inference failed for: r6v3 */
    /* JADX WARN: Type inference failed for: r6v4, types: [boolean, int] */
    public static final void i(final dr9 dr9Var, final sh9 sh9Var, final boolean z, final boolean z2, final boolean z3, final boolean z4, final boolean z5, r28 r28Var, x12 x12Var, final int i, final int i2) {
        int i3;
        Integer num;
        int i4;
        final r28 r28Var2;
        ?? r12;
        r28 r28Var3;
        ?? r6;
        lj3 lj3Var;
        ?? r122;
        ?? r14;
        ?? r123;
        o28 o28Var;
        uob uobVar;
        ?? r142;
        ?? r124;
        uob uobVar2;
        o28 o28Var2;
        ?? r143;
        ?? r125;
        ?? r0;
        ?? r144;
        ?? r126;
        ?? r02;
        ?? r127;
        ?? r03;
        boolean z6;
        boolean z7;
        int i5;
        int i6;
        int i7;
        boolean z8;
        Object obj;
        dr9Var.getClass();
        Integer num2 = dr9Var.g;
        Integer num3 = dr9Var.m;
        Integer num4 = dr9Var.l;
        Long l = dr9Var.k;
        sh9Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1303844136);
        if ((i & 6) == 0) {
            i3 = (p65Var.f(dr9Var) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        if ((i & 48) == 0) {
            i3 |= p65Var.f(sh9Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i3 |= p65Var.g(z) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i3 |= p65Var.g(z2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i3 |= p65Var.g(z3) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i3 |= p65Var.g(z4) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i3 |= p65Var.g(z5) ? 1048576 : 524288;
        }
        int i8 = i2 & 128;
        if (i8 != 0) {
            num = num2;
            i4 = i3 | 12582912;
        } else {
            num = num2;
            if ((i & 12582912) == 0) {
                i3 |= p65Var.f(r28Var) ? 8388608 : 4194304;
            }
            i4 = i3;
        }
        if (p65Var.P(i4 & 1, (i4 & 4793491) != 4793490)) {
            o28 o28Var3 = o28.b;
            r28 r28Var4 = i8 != 0 ? o28Var3 : r28Var;
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i9 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var4);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i9));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            lj3 lj3Var2 = dr9Var.y;
            uob uobVar3 = w12.a;
            if (lj3Var2 != null) {
                p65Var.Y(2041088118);
                boolean z9 = ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 14) == 4);
                Object objM = p65Var.M();
                Object obj2 = objM;
                if (z9 || objM == uobVar3) {
                    ng5 ng5Var = new ng5(sh9Var, dr9Var, 2);
                    p65Var.j0(ng5Var);
                    obj2 = ng5Var;
                }
                r28Var3 = r28Var4;
                r6 = 0;
                flb.E(lj3Var2, (m45) obj2, null, 0.0f, p65Var, 0);
                lj3Var = lj3Var2;
                r122 = p65Var;
            } else {
                r28Var3 = r28Var4;
                r6 = 0;
                lj3Var = lj3Var2;
                p65Var.Y(2038942174);
                r122 = p65Var;
            }
            r122.p(r6);
            if (lj3Var != null) {
                r122.Y(2041475339);
                hp7.t(r122, jfc.p(o28Var3, 8.0f));
            } else {
                r122.Y(2038942174);
            }
            r122.p(r6);
            if (dr9Var.e) {
                r122.Y(2041630649);
                ?? r30 = r122;
                w2g.e(vn7.J(R.drawable.ic_member_16, r6, r122), vo7.R(r122, R.string.cd_member_only), jfc.l(o28Var3, 16.0f), null, null, 0.0f, null, r30, 392, 120);
                ?? r128 = r30;
                r128.p(r6);
                r14 = r6;
                r123 = r128;
            } else {
                r122.Y(2038942174);
                r122.p(r6);
                r14 = 1;
                r123 = r122;
            }
            if (num != null) {
                r123.Y(2041971773);
                Object[] objArr = new Object[1];
                objArr[r6] = num;
                o28Var = o28Var3;
                uobVar = uobVar3;
                ?? r302 = r123;
                jjd.b(vo7.Q(R.string.min_read, objArr, r123), w2g.G(o28Var3, r14 != 0 ? 0.0f : 12.0f, 0.0f, 0.0f, 0.0f, 14), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) r123.j(jt7.c)).n, ((zo7) r123.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), r302, 0, 0, 131068);
                ?? r129 = r302;
                r129.p(r6);
                r142 = r6;
                r124 = r129;
            } else {
                o28Var = o28Var3;
                uobVar = uobVar3;
                r123.Y(2038942174);
                r123.p(r6);
                r124 = r123;
                r142 = r14;
            }
            if (!z || l == null || l.longValue() <= 0) {
                uobVar2 = uobVar;
                ?? r04 = r6;
                o28Var2 = o28Var;
                r124.Y(2038942174);
                r124.p(r04);
                r0 = r04;
                r125 = r124;
                r143 = r142;
            } else {
                r124.Y(2042502555);
                c09 c09VarJ = vn7.J(R.drawable.ic_clap_filled_16, r6, r124);
                o28 o28Var4 = o28Var;
                r28 r28VarL = jfc.l(w2g.G(o28Var4, r142 != 0 ? 0.0f : 12.0f, 0.0f, 0.0f, 0.0f, 14), 16.0f);
                sn3 sn3Var = kt7.b;
                ?? r39 = r6;
                ?? r17 = r124;
                qv5.b(c09VarJ, null, r28VarL, ((zo7) r124.j(sn3Var)).o, r17, 56, 0);
                long jLongValue = l.longValue();
                if (jLongValue > 2147483647L) {
                    jLongValue = 2147483647L;
                }
                Object[] objArr2 = new Object[1];
                objArr2[r39 == true ? 1 : 0] = String.valueOf(l.longValue());
                String strD = vo7.D(R.plurals.n_claps, (int) jLongValue, objArr2, r17);
                String strG = dq1.g(l);
                r28 r28VarG = w2g.G(o28Var4, 4.0f, 0.0f, 0.0f, 0.0f, 14);
                o28Var2 = o28Var4;
                boolean zF = r17.f(strD);
                Object objM2 = r17.M();
                if (zF) {
                    uobVar2 = uobVar;
                } else {
                    uobVar2 = uobVar;
                    obj = objM2;
                    if (objM2 == uobVar2) {
                    }
                    jjd.b(strG, wxb.a(r28VarG, r39, (x45) obj), 0L, 0L, 0L, null, null, 0L, 0, false, 1, 0, null, mkd.a(((bu7) r17.j(jt7.c)).n, ((zo7) r17.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), r17, 0, 24576, 114684);
                    ?? r1210 = r17;
                    r0 = 0;
                    r1210.p(false);
                    r143 = 0;
                    r125 = r1210;
                }
                ov5 ov5Var = new ov5(strD, 15);
                r17.j0(ov5Var);
                obj = ov5Var;
                jjd.b(strG, wxb.a(r28VarG, r39, (x45) obj), 0L, 0L, 0L, null, null, 0L, 0, false, 1, 0, null, mkd.a(((bu7) r17.j(jt7.c)).n, ((zo7) r17.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), r17, 0, 24576, 114684);
                ?? r12102 = r17;
                r0 = 0;
                r12102.p(false);
                r143 = 0;
                r125 = r12102;
            }
            if (!z || num4 == null || num4.intValue() <= 0) {
                r125.Y(2038942174);
                r125.p(r0);
                r02 = r0;
                r126 = r125;
                r144 = r143;
            } else {
                r125.Y(2043710935);
                c09 c09VarJ2 = vn7.J(R.drawable.ic_respond_filled_16, r0 == true ? 1 : 0, r125);
                o28 o28Var5 = o28Var2;
                r28 r28VarL2 = jfc.l(w2g.G(o28Var5, r143 != 0 ? 0.0f : 12.0f, 0.0f, 0.0f, 0.0f, 14), 16.0f);
                sn3 sn3Var2 = kt7.b;
                ?? r172 = r125;
                qv5.b(c09VarJ2, null, r28VarL2, ((zo7) r125.j(sn3Var2)).o, r172, 56, 0);
                String strD2 = vo7.D(R.plurals.n_responses, num4.intValue(), new Object[]{String.valueOf(num4.intValue())}, r172);
                String strG2 = dq1.g(num4);
                r28 r28VarG2 = w2g.G(o28Var5, 4.0f, 0.0f, 0.0f, 0.0f, 14);
                boolean zF2 = r172.f(strD2);
                Object objM3 = r172.M();
                Object obj3 = objM3;
                if (zF2 || objM3 == uobVar2) {
                    ov5 ov5Var2 = new ov5(strD2, 16);
                    r172.j0(ov5Var2);
                    obj3 = ov5Var2;
                }
                jjd.b(strG2, wxb.a(r28VarG2, false, (x45) obj3), 0L, 0L, 0L, null, null, 0L, 0, false, 1, 0, null, mkd.a(((bu7) r172.j(jt7.c)).n, ((zo7) r172.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), r172, 0, 24576, 114684);
                ?? r1211 = r172;
                r02 = 0;
                r1211.p(false);
                r144 = 0;
                r126 = r1211;
            }
            if (!z || num3.intValue() <= 0) {
                r126.Y(2038942174);
                r03 = r02;
                r127 = r126;
            } else {
                r126.Y(2044886827);
                c09 c09VarJ3 = vn7.J(R.drawable.ic_repost_16, r02 == true ? 1 : 0, r126);
                o28 o28Var6 = o28Var2;
                r28 r28VarL3 = jfc.l(w2g.G(o28Var6, r144 != 0 ? 0.0f : 12.0f, 0.0f, 0.0f, 0.0f, 14), 16.0f);
                sn3 sn3Var3 = kt7.b;
                ?? r173 = r126;
                qv5.b(c09VarJ3, null, r28VarL3, ((zo7) r126.j(sn3Var3)).o, r173, 56, 0);
                int iIntValue = num3.intValue();
                if (iIntValue > Integer.MAX_VALUE) {
                    iIntValue = Integer.MAX_VALUE;
                }
                String strD3 = vo7.D(R.plurals.n_reposts, iIntValue, new Object[]{String.valueOf(num3.intValue())}, r173);
                String strG3 = dq1.g(Long.valueOf(num3.intValue()));
                r28 r28VarG3 = w2g.G(o28Var6, 4.0f, 0.0f, 0.0f, 0.0f, 14);
                o28Var2 = o28Var6;
                boolean zF3 = r173.f(strD3);
                Object objM4 = r173.M();
                Object obj4 = objM4;
                if (zF3 || objM4 == uobVar2) {
                    ov5 ov5Var3 = new ov5(strD3, 17);
                    r173.j0(ov5Var3);
                    obj4 = ov5Var3;
                }
                jjd.b(strG3, wxb.a(r28VarG3, false, (x45) obj4), 0L, 0L, 0L, null, null, 0L, 0, false, 1, 0, null, mkd.a(((bu7) r173.j(jt7.c)).n, ((zo7) r173.j(sn3Var3)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), r173, 0, 24576, 114684);
                r127 = r173;
                r03 = 0;
            }
            r127.p(r03);
            hp7.t(r127, new sq6(1.0f, true));
            if (z2) {
                r127.Y(2046107483);
                n(dr9Var, sh9Var, bgf.N(o28Var2, "show_less_like_this"), r127, (i4 & 14) | 384 | (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
                z6 = false;
            } else {
                z6 = false;
                r127.Y(2038942174);
            }
            r127.p(z6);
            if (z4) {
                r127.Y(2046348167);
                i7 = 32;
                i6 = 4;
                boolean z10 = ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 14) == 4);
                Object objM5 = r127.M();
                Object obj5 = objM5;
                if (z10 || objM5 == uobVar2) {
                    ng5 ng5Var2 = new ng5(sh9Var, dr9Var, i6);
                    r127.j0(ng5Var2);
                    obj5 = ng5Var2;
                }
                z7 = false;
                l(0, r127, (m45) obj5, null);
                r127.p(false);
                i5 = 2038942174;
            } else {
                z7 = false;
                i5 = 2038942174;
                i6 = 4;
                i7 = 32;
                r127.Y(2038942174);
                r127.p(false);
            }
            if (z3) {
                r127.Y(2046684455);
                b(dr9Var, sh9Var, r127, i4 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            } else {
                r127.Y(i5);
            }
            r127.p(z7);
            if (!z5 || dr9Var.z == null) {
                z8 = false;
                r127.Y(2038942174);
            } else {
                r127.Y(2046871509);
                boolean z11 = ((i4 & 14) == i6) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == i7);
                Object objM6 = r127.M();
                Object obj6 = objM6;
                if (z11 || objM6 == uobVar2) {
                    ng5 ng5Var3 = new ng5(sh9Var, dr9Var, 5);
                    r127.j0(ng5Var3);
                    obj6 = ng5Var3;
                }
                z8 = false;
                m(0, r127, (m45) obj6, null);
            }
            r127.p(z8);
            g(dr9Var, sh9Var, null, r127, i4 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            r127.p(true);
            r28Var2 = r28Var3;
            r12 = r127;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            r12 = p65Var;
        }
        mwa mwaVarS = r12.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: uh9
                @Override // defpackage.b55
                public final Object invoke(Object obj7, Object obj8) {
                    ((Integer) obj8).getClass();
                    kk7.i(dr9Var, sh9Var, z, z2, z3, z4, z5, r28Var2, (x12) obj7, tr7.y(i | 1), i2);
                    return c1e.a;
                }
            };
        }
    }

    public static final void j(tla tlaVar, v08 v08Var, r28 r28Var, x12 x12Var, int i) {
        String str = tlaVar.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-448464485);
        int i2 = (p65Var.f(tlaVar) ? 4 : 2) | i | (p65Var.h(v08Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            boolean zF = p65Var.f(str);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = null;
                if (str != null) {
                    try {
                        objM = new uu1(op8.j(Color.parseColor(str)));
                    } catch (IllegalArgumentException e2) {
                        wld.a.e(e2, lv8.r("Incorrect color ", str, " for section ", tlaVar.a), new Object[0]);
                    }
                }
                p65Var.j0(objM);
            }
            a((uu1) objM, pxf.E(773195722, new o37(tlaVar, v08Var, r28Var, 5), p65Var), p65Var, 48);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 8, tlaVar, v08Var, r28Var);
        }
    }

    public static final void k(tla tlaVar, long j, long j2, v08 v08Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        int i3;
        char c2;
        boolean z;
        String str;
        o28 o28Var;
        boolean z2;
        int i4;
        long j3;
        float f;
        String str2 = tlaVar.c;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-910048254);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(tlaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.e(j) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.e(j2) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.h(v08Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var2.P(i2 & 1, (i2 & 9363) != 9362)) {
            r28 r28VarD = jfc.d(jfc.r(flb.a0(r28Var, j, bmb.a(4.0f)), 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j4 = p65Var2.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            o28 o28Var2 = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 480.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            int i6 = i2;
            long j5 = p65Var2.T;
            int i7 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarG = w2g.G(jfc.d(o28Var2, 1.0f), 40.0f, 0.0f, 40.0f, 0.0f, 10);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var2, 48);
            long j6 = p65Var2.T;
            int i8 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, r28VarG);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i8, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            String str3 = tlaVar.e;
            String str4 = tlaVar.b;
            boolean z3 = str2 != null;
            boolean z4 = str4 != null;
            boolean z5 = (str3 == null || tlaVar.f == null) ? false : true;
            if (z3) {
                km4.F(40.0f, 1623030965, p65Var2, p65Var2, o28Var2);
                if (((Boolean) p65Var2.j(l36.a)).booleanValue()) {
                    p65Var2.Y(1623124275);
                    z = false;
                    dy0.a(flb.a0(jfc.m(o28Var2, 250.0f, 100.0f), ((zo7) p65Var2.j(kt7.b)).o, rv8.r), p65Var2, 0);
                    p65Var2.p(false);
                    p65Var = p65Var2;
                    i3 = 3;
                    c2 = 4;
                } else {
                    p65Var2.Y(1623395711);
                    ax5 ax5Var = str2 != null ? new ax5(str2) : null;
                    if (ax5Var == null) {
                        ay0.e("Required value was null.");
                        return;
                    }
                    i3 = 3;
                    c2 = 4;
                    ur7.a(ax5Var, null, jfc.o(o28Var2, 0.0f, 0.0f, 250.0f, 100.0f, 3), null, null, 0.0f, null, 0, p65Var2, 432, 2040);
                    p65Var = p65Var2;
                    z = false;
                    p65Var.p(false);
                }
            } else {
                p65Var = p65Var2;
                i3 = 3;
                c2 = 4;
                z = false;
                p65Var.Y(1618843485);
            }
            p65Var.p(z);
            if (z4) {
                p65Var.Y(1623760519);
                if (z3) {
                    km4.F(20.0f, 1623780142, p65Var, p65Var, o28Var2);
                    p65Var.p(z);
                } else {
                    km4.F(32.0f, 1623864462, p65Var, p65Var, o28Var2);
                    p65Var.p(z);
                }
                if (str4 == null) {
                    ay0.e("Required value was null.");
                    return;
                }
                p65 p65Var3 = p65Var;
                str = str3;
                i4 = i6;
                o28Var = o28Var2;
                z2 = z;
                j3 = j2;
                jjd.b(str4, null, 0L, 0L, 0L, null, new jgd(i3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).i, j2, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var3, 0, 0, 130046);
                p65Var = p65Var3;
            } else {
                str = str3;
                o28Var = o28Var2;
                z2 = z;
                i4 = i6;
                j3 = j2;
                p65Var.Y(1618843485);
            }
            p65Var.p(z2);
            if (z5) {
                p65Var.Y(1624273662);
                if (z3 || z4) {
                    km4.F(8.0f, 1624289999, p65Var, p65Var, o28Var);
                    p65Var.p(z2);
                } else {
                    km4.F(18.0f, 1624373358, p65Var, p65Var, o28Var);
                    p65Var.p(z2);
                }
                boolean z6 = ((i4 & 14) == 4 ? true : z2) | ((i4 & 7168) == 2048 ? true : z2);
                Object objM = p65Var.M();
                if (z6 || objM == w12.a) {
                    objM = new ui9(v08Var, 6, tlaVar);
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                if (str == null) {
                    ay0.e("Required value was null.");
                    return;
                }
                xn7 xn7Var = xn7.S;
                jy8 jy8Var = h11.a;
                long j7 = uu1.g;
                p65 p65Var4 = p65Var;
                f = 18.0f;
                fo7.j(m45Var, str, xn7Var, null, false, h11.a(j7, j3, j7, uu1.b(0.5f, j3), p65Var4, 0), p65Var4, 384, 24);
                p65Var = p65Var4;
            } else {
                f = 18.0f;
                p65Var.Y(1618843485);
            }
            p65Var.p(z2);
            if (z5) {
                km4.F(f, 1625318486, p65Var, p65Var, o28Var);
                p65Var.p(z2);
            } else {
                km4.F(32.0f, 1625394870, p65Var, p65Var, o28Var);
                p65Var.p(z2);
            }
            b09.H(p65Var, true, true, true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d4a(tlaVar, j, j2, v08Var, r28Var, i);
        }
    }

    public static final void l(int i, x12 x12Var, m45 m45Var, r28 r28Var) {
        m45 m45Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1995893677);
        int i2 = 4;
        int i3 = (p65Var.h(m45Var) ? 4 : 2) | i | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            o28 o28Var = o28.b;
            m45Var2 = m45Var;
            f49.l(m45Var2, o28Var, false, null, null, kyd.c, p65Var, (i3 & 14) | 1572912, 60);
            r28Var = o28Var;
        } else {
            m45Var2 = m45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new va(m45Var2, r28Var, i, i2);
        }
    }

    public static final void m(int i, x12 x12Var, m45 m45Var, r28 r28Var) {
        m45 m45Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(594265644);
        int i2 = (p65Var.h(m45Var) ? 4 : 2) | i | 48;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            o28 o28Var = o28.b;
            m45Var2 = m45Var;
            f49.l(m45Var2, bgf.N(o28Var, "share_button"), false, null, null, kyd.d, p65Var, (i2 & 14) | 1572864, 60);
            r28Var = o28Var;
        } else {
            m45Var2 = m45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new va(m45Var2, r28Var, i, 5);
        }
    }

    public static final void n(dr9 dr9Var, sh9 sh9Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        sh9 sh9Var2;
        r28 r28Var2;
        int i3;
        dr9 dr9Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-355724973);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(dr9Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(sh9Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(r28Var) ? 256 : 128;
        }
        int i4 = 0;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            l78 l78VarX = guc.x(dr9Var.s, null, p65Var, 48);
            if (((z54) l78VarX.getValue()) == z54.ERROR) {
                mwa mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    mwaVarS.d = new hm8(dr9Var, sh9Var, r28Var, i, 2);
                    return;
                }
                return;
            }
            boolean z = true;
            if (((z54) l78VarX.getValue()) == z54.CANT_SHOW_MORE_OR_LESS) {
                mwa mwaVarS2 = p65Var.s();
                if (mwaVarS2 != null) {
                    mwaVarS2.d = new hm8(dr9Var, sh9Var, r28Var, i, 3);
                    return;
                }
                return;
            }
            dr9Var2 = dr9Var;
            sh9Var2 = sh9Var;
            i3 = i;
            z54 z54Var = (z54) l78VarX.getValue();
            boolean zD = p65Var.d(z54Var == null ? -1 : z54Var.ordinal());
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zD || objM == uobVar) {
                objM = bjc.b(new dq7(l78VarX, 12));
                p65Var.j0(objM);
            }
            upc upcVar = (upc) objM;
            boolean z2 = ((z54) l78VarX.getValue()) != null;
            boolean zF = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.f(upcVar);
            if ((i2 & 14) != 4) {
                z = false;
            }
            boolean z3 = zF | z;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                objM2 = new i16(sh9Var2, dr9Var2, upcVar, 11);
                p65Var.j0(objM2);
            }
            f49.l((m45) objM2, r28Var, z2, null, null, pxf.E(1842232817, new th9(upcVar, i4), p65Var), p65Var, ((i2 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 1572864, 56);
            r28Var2 = r28Var;
        } else {
            sh9Var2 = sh9Var;
            r28Var2 = r28Var;
            i3 = i;
            dr9Var2 = dr9Var;
            p65Var.S();
        }
        mwa mwaVarS3 = p65Var.s();
        if (mwaVarS3 != null) {
            mwaVarS3.d = new hm8(dr9Var2, sh9Var2, r28Var2, i3, 4);
        }
    }

    public static final cfc o(int i, int i2) {
        ue3.a(i);
        ue3 ue3Var = new ue3(i);
        ue3.a(i2);
        return new cfc(ue3Var, new ue3(i2));
    }

    public static final void p(int i, long j, x12 x12Var, r28 r28Var, boolean z) {
        r28 r28Var2;
        r28 r28Var3;
        cu cuVar;
        fn fnVar;
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(32287752);
        int i2 = i | 6 | (p65Var.e(j) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            p65Var.U();
            int i3 = i & 1;
            o28 o28Var = o28.b;
            if (i3 == 0 || p65Var.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarD = w2g.D(jfc.d(r28Var3, 1.0f), 24.0f, 32.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar2 = q12.f;
            tp7.B(p65Var, cuVar2, wv1VarA);
            cu cuVar3 = q12.e;
            tp7.B(p65Var, cuVar3, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar4 = q12.g;
            tp7.B(p65Var, cuVar4, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var, fnVar2);
            cu cuVar5 = q12.d;
            tp7.B(p65Var, cuVar5, r28VarR);
            sn3 sn3Var = jt7.c;
            int i5 = ((i2 << 6) & 7168) | 48;
            ok7.r(74.0f, i5, 4, j, p65Var, null, ((bu7) p65Var.j(sn3Var)).n);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            zq0 zq0Var = z46.n;
            fa4 fa4Var = qb8.a;
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar2, ombVarA);
            tp7.B(p65Var, cuVar3, i89VarL2);
            ka1.z(i6, p65Var, cuVar4, p65Var, fnVar2);
            tp7.B(p65Var, cuVar5, r28VarR2);
            r28 r28Var4 = r28Var3;
            ok7.r(344.0f, i5, 4, j, p65Var, null, ((bu7) p65Var.j(sn3Var)).e);
            p65Var = p65Var;
            p65Var.p(true);
            if (z) {
                km4.F(16.0f, -1839681904, p65Var, p65Var, o28Var);
                omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var, 48);
                long j4 = p65Var.T;
                int i7 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, o28Var);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar2, ombVarA2);
                tp7.B(p65Var, cuVar3, i89VarL3);
                fnVar = fnVar2;
                ka1.z(i7, p65Var, cuVar4, p65Var, fnVar);
                tp7.B(p65Var, cuVar5, r28VarR3);
                cuVar = cuVar5;
                d46.d(hl0.XXXS, null, j, p65Var, ((i2 << 3) & 896) | 6, 2);
                ok7.r(100.0f, i5, 4, j, p65Var, null, ((bu7) lv8.n(o28Var, 8.0f, p65Var, sn3Var)).n);
                p65Var = p65Var;
                p65Var.p(true);
                z2 = false;
            } else {
                cuVar = cuVar5;
                fnVar = fnVar2;
                z2 = false;
                p65Var.Y(-1841087568);
            }
            p65Var.p(z2);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            omb ombVarA3 = nmb.a(new h70(32.0f, true, new z10(21)), zq0Var, p65Var, 54);
            long j5 = p65Var.T;
            int i8 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar2, ombVarA3);
            tp7.B(p65Var, cuVar3, i89VarL4);
            ka1.z(i8, p65Var, cuVar4, p65Var, fnVar);
            tp7.B(p65Var, cuVar, r28VarR4);
            int i9 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            h(null, j, true, p65Var, i9 | 384, 1);
            h(null, j, false, p65Var, i9, 5);
            h(null, j, false, p65Var, i9, 5);
            h(null, j, false, p65Var, i9, 5);
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new j38(r28Var2, j, z, i);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x003f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x003d -> B:18:0x0040). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object q(defpackage.u4d r7, defpackage.kn0 r8) {
        /*
            boolean r0 = r8 instanceof defpackage.axb
            if (r0 == 0) goto L13
            r0 = r8
            axb r0 = (defpackage.axb) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            axb r0 = new axb
            r0.<init>(r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            u4d r7 = r0.b
            defpackage.br7.v(r8)
            goto L40
        L29:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L30:
            defpackage.br7.v(r8)
        L33:
            mb9 r8 = defpackage.mb9.Main
            r0.b = r7
            r0.d = r3
            java.lang.Object r8 = r7.a(r8, r0)
            if (r8 != r1) goto L40
            return r1
        L40:
            lb9 r8 = (defpackage.lb9) r8
            java.util.List r2 = r8.a
            int r4 = r2.size()
            r5 = 0
        L49:
            if (r5 >= r4) goto L5b
            java.lang.Object r6 = r2.get(r5)
            rb9 r6 = (defpackage.rb9) r6
            boolean r6 = defpackage.mq7.u(r6)
            if (r6 != 0) goto L58
            goto L33
        L58:
            int r5 = r5 + 1
            goto L49
        L5b:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kk7.q(u4d, kn0):java.lang.Object");
    }

    public static final Object r(Object obj, boolean z) {
        pf6 pf6Var;
        obj.getClass();
        if (z) {
            obj = (mg6) obj;
            if ((obj instanceof lg6) && (pf6Var = ((lg6) obj).i) != null) {
                String strD = te6.b(pf6Var.getWrapperFqName()).d();
                strD.getClass();
                return new kg6(strD);
            }
        }
        return obj;
    }

    public static final Object s(Object obj, f41 f41Var) {
        mn6 mn6VarV;
        Class clsI;
        return (((f41Var instanceof q4a) && g26.d((nqe) f41Var)) || (mn6VarV = v(f41Var)) == null || (clsI = I(mn6VarV)) == null) ? obj : w(clsI, f41Var).invoke(obj, null);
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x00a6, code lost:
    
        if ((r0 != null ? defpackage.g26.e(r0) : false) == true) goto L44;
     */
    /* JADX WARN: Removed duplicated region for block: B:19:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0092  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.v41 t(defpackage.f41 r3, defpackage.v41 r4, boolean r5) {
        /*
            r3.getClass()
            boolean r0 = defpackage.g26.a(r3)
            if (r0 != 0) goto Laa
            java.util.List r0 = r3.U()
            r0.getClass()
            boolean r1 = r0.isEmpty()
            r2 = 0
            if (r1 == 0) goto L18
            goto L40
        L18:
            java.util.Iterator r0 = r0.iterator()
        L1c:
            boolean r1 = r0.hasNext()
            if (r1 == 0) goto L40
            java.lang.Object r1 = r0.next()
            yq6 r1 = (defpackage.yq6) r1
            mn6 r1 = r1.getType()
            zvd r1 = r1.j0()
            co1 r1 = r1.a()
            if (r1 == 0) goto L3b
            boolean r1 = defpackage.g26.e(r1)
            goto L3c
        L3b:
            r1 = r2
        L3c:
            if (r1 == 0) goto L1c
            goto Laa
        L40:
            java.util.List r0 = r3.I()
            r0.getClass()
            boolean r1 = r0.isEmpty()
            if (r1 == 0) goto L4e
            goto L78
        L4e:
            java.util.Iterator r0 = r0.iterator()
        L52:
            boolean r1 = r0.hasNext()
            if (r1 == 0) goto L78
            java.lang.Object r1 = r0.next()
            lqe r1 = (defpackage.lqe) r1
            mn6 r1 = r1.getType()
            r1.getClass()
            zvd r1 = r1.j0()
            co1 r1 = r1.a()
            if (r1 == 0) goto L74
            boolean r1 = defpackage.g26.e(r1)
            goto L75
        L74:
            r1 = r2
        L75:
            if (r1 == 0) goto L52
            goto Laa
        L78:
            mn6 r0 = r3.getReturnType()
            r1 = 1
            if (r0 == 0) goto L92
            zvd r0 = r0.j0()
            co1 r0 = r0.a()
            if (r0 == 0) goto L8e
            boolean r0 = defpackage.g26.b(r0)
            goto L8f
        L8e:
            r0 = r2
        L8f:
            if (r0 != r1) goto L92
            goto Laa
        L92:
            mn6 r0 = v(r3)
            if (r0 == 0) goto La9
            zvd r0 = r0.j0()
            co1 r0 = r0.a()
            if (r0 == 0) goto La6
            boolean r2 = defpackage.g26.e(r0)
        La6:
            if (r2 != r1) goto La9
            goto Laa
        La9:
            return r4
        Laa:
            bqe r0 = new bqe
            r0.<init>(r3, r4, r5)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kk7.t(f41, v41, boolean):v41");
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0078  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void u(defpackage.zl3 r15, defpackage.xjd r16, java.lang.String r17, long r18, defpackage.mkd r20, long r21, int r23) {
        /*
            Method dump skipped, instruction units count: 294
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kk7.u(zl3, xjd, java.lang.String, long, mkd, long, int):void");
    }

    public static final mn6 v(f41 f41Var) {
        yq6 yq6VarP = f41Var.P();
        yq6 yq6VarM = f41Var.M();
        if (yq6VarP != null) {
            return yq6VarP.getType();
        }
        if (yq6VarM != null) {
            if (f41Var instanceof p72) {
                return yq6VarM.getType();
            }
            yv2 yv2VarH = f41Var.h();
            y28 y28Var = yv2VarH instanceof y28 ? (y28) yv2VarH : null;
            if (y28Var != null) {
                return y28Var.T();
            }
        }
        return null;
    }

    public static final Method w(Class cls, f41 f41Var) {
        f41Var.getClass();
        try {
            Method declaredMethod = cls.getDeclaredMethod("unbox-impl", null);
            declaredMethod.getClass();
            return declaredMethod;
        } catch (NoSuchMethodException unused) {
            lg8.x("No unbox method found in inline class: ", cls, " (calling ", f41Var);
            return null;
        }
    }

    public static final ArrayList x(hec hecVar) {
        ArrayList arrayListY = y(lk7.r(hecVar));
        if (arrayListY == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(cu1.k0(arrayListY, 10));
        Iterator it2 = arrayListY.iterator();
        while (it2.hasNext()) {
            arrayList.add("unbox-impl-" + ((String) it2.next()));
        }
        co1 co1VarA = hecVar.j0().a();
        co1VarA.getClass();
        Class clsJ = bpe.j((y28) co1VarA);
        clsJ.getClass();
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            arrayList2.add(clsJ.getDeclaredMethod((String) it3.next(), null));
        }
        return arrayList2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v0, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r3v1, types: [java.lang.Iterable] */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.util.ArrayList] */
    public static final ArrayList y(hec hecVar) {
        ?? Q;
        if (!g26.f(hecVar)) {
            return null;
        }
        co1 co1VarA = hecVar.j0().a();
        co1VarA.getClass();
        int i = f93.a;
        cqe cqeVarP0 = ((y28) co1VarA).p0();
        z48 z48Var = cqeVarP0 instanceof z48 ? (z48) cqeVarP0 : null;
        z48Var.getClass();
        ArrayList<f09> arrayList = z48Var.a;
        ArrayList arrayList2 = new ArrayList();
        for (f09 f09Var : arrayList) {
            n98 n98Var = (n98) f09Var.a;
            ArrayList arrayListY = y((hec) f09Var.b);
            if (arrayListY != null) {
                Q = new ArrayList(cu1.k0(arrayListY, 10));
                Iterator it2 = arrayListY.iterator();
                while (it2.hasNext()) {
                    Q.add(n98Var.c() + '-' + ((String) it2.next()));
                }
            } else {
                Q = d46.Q(n98Var.c());
            }
            bu1.n0(Q, arrayList2);
        }
        return arrayList2;
    }

    public static final boolean z(float f) {
        return Float.isNaN(f) || Math.abs(f) < 0.5f;
    }
}

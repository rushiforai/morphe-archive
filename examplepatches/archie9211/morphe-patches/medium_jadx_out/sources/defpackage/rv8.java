package defpackage;

import android.content.Context;
import android.content.res.Resources;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.data.preferences.DarkMode;
import com.medium.reader.R;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class rv8 {
    public static final /* synthetic */ int A = 0;
    public static final /* synthetic */ int B = 0;
    public static final h90 a = new h90();
    public static final mz1 b = new mz1(new vcf(1), false, 362847086);
    public static final mz1 c = new mz1(new yz1(0), false, 567619557);
    public static final mz1 d = new mz1(new yz1(1), false, -1471843930);
    public static final mz1 e = new mz1(new yz1(2), false, -1318552807);
    public static final mz1 f = new mz1(new yz1(3), false, 1653235543);
    public static final mz1 g = new mz1(new p02(25), false, 1199979890);
    public static final mz1 h = new mz1(new p02(26), false, 538390417);
    public static final mz1 i = new mz1(new c02(17), false, -1172325471);
    public static final mz1 j = new mz1(new f02(14), false, -359313383);
    public static final mz1 k = new mz1(new f02(15), false, 2046575456);
    public static final mz1 l = new mz1(new c02(18), false, -193180133);
    public static final mz1 m = new mz1(new c02(19), false, 234331844);
    public static final mz1 n = new mz1(new m02(20), false, 827663674);
    public static final mz1 o = new mz1(new n02(19), false, -83087117);
    public static final mz1 p = new mz1(new n02(20), false, 1066087742);
    public static final mz1 q = new mz1(new n02(21), false, -1719205725);
    public static final nr5 r = new nr5(5);
    public static final StackTraceElement[] s = new StackTraceElement[0];
    public static final sqe t = new sqe(18);
    public static final sqe u = new sqe(19);
    public static final sqe v = new sqe(20);
    public static final sqe w = new sqe(21);
    public static final /* synthetic */ int x = 0;
    public static final /* synthetic */ int y = 0;
    public static final /* synthetic */ int z = 0;

    public static j3f A(b72 b72Var, int i2, ArrayList arrayList, j3f j3fVar) {
        int i3;
        int i4 = i2 == 0 ? b72Var.p0 : b72Var.q0;
        if (i4 != -1 && (j3fVar == null || i4 != j3fVar.b)) {
            int i5 = 0;
            while (true) {
                if (i5 >= arrayList.size()) {
                    break;
                }
                j3f j3fVar2 = (j3f) arrayList.get(i5);
                if (j3fVar2.b == i4) {
                    if (j3fVar != null) {
                        j3fVar.c(i2, j3fVar2);
                        arrayList.remove(j3fVar);
                    }
                    j3fVar = j3fVar2;
                } else {
                    i5++;
                }
            }
        } else if (i4 != -1) {
            return j3fVar;
        }
        if (j3fVar == null) {
            if (b72Var instanceof jj5) {
                jj5 jj5Var = (jj5) b72Var;
                int i6 = 0;
                while (true) {
                    if (i6 >= jj5Var.s0) {
                        i3 = -1;
                        break;
                    }
                    b72 b72Var2 = jj5Var.r0[i6];
                    if ((i2 == 0 && (i3 = b72Var2.p0) != -1) || (i2 == 1 && (i3 = b72Var2.q0) != -1)) {
                        break;
                    }
                    i6++;
                }
                if (i3 != -1) {
                    int i7 = 0;
                    while (true) {
                        if (i7 >= arrayList.size()) {
                            break;
                        }
                        j3f j3fVar3 = (j3f) arrayList.get(i7);
                        if (j3fVar3.b == i3) {
                            j3fVar = j3fVar3;
                            break;
                        }
                        i7++;
                    }
                }
            }
            if (j3fVar == null) {
                j3fVar = new j3f();
                j3fVar.a = new ArrayList();
                j3fVar.d = null;
                j3fVar.e = -1;
                int i8 = j3f.f;
                j3f.f = i8 + 1;
                j3fVar.b = i8;
                j3fVar.c = i2;
            }
            arrayList.add(j3fVar);
        }
        ArrayList arrayList2 = j3fVar.a;
        if (arrayList2.contains(b72Var)) {
            return j3fVar;
        }
        arrayList2.add(b72Var);
        if (b72Var instanceof sh5) {
            sh5 sh5Var = (sh5) b72Var;
            sh5Var.u0.c(sh5Var.v0 == 0 ? 1 : 0, j3fVar, arrayList);
        }
        int i9 = j3fVar.b;
        if (i2 == 0) {
            b72Var.p0 = i9;
            b72Var.J.c(i2, j3fVar, arrayList);
            b72Var.L.c(i2, j3fVar, arrayList);
        } else {
            b72Var.q0 = i9;
            b72Var.K.c(i2, j3fVar, arrayList);
            b72Var.N.c(i2, j3fVar, arrayList);
            b72Var.M.c(i2, j3fVar, arrayList);
        }
        b72Var.Q.c(i2, j3fVar, arrayList);
        return j3fVar;
    }

    public static final void B(dd7 dd7Var) {
        boolean z2;
        int i2;
        if (ec2.a.contains(rv8.class)) {
            return;
        }
        try {
            dd7Var.getClass();
            int[] iArr = dd7Var.a;
            int i3 = 1;
            if (1 >= iArr.length) {
                return;
            }
            int length = iArr.length;
            int i4 = 1;
            for (int i5 = 1; i5 < length; i5++) {
                i4 *= dd7Var.a[i5];
            }
            int i6 = dd7Var.a[0];
            int[] iArr2 = {i6, i4};
            dd7Var.a = iArr2;
            n46 n46Var = new n46(1, 1, 1);
            int i7 = n46Var.b;
            int i8 = n46Var.c;
            if (i8 > 0) {
                z2 = 1 <= i7;
            } else if (1 >= i7) {
            }
            if (!z2) {
                i3 = i7;
            }
            while (z2) {
                if (i3 != i7) {
                    i2 = i3 + i8;
                } else {
                    if (!z2) {
                        throw new NoSuchElementException();
                    }
                    i2 = i3;
                    z2 = false;
                }
                i6 *= iArr2[i3];
                i3 = i2;
            }
            float[] fArr = new float[i6];
            System.arraycopy(dd7Var.c, 0, fArr, 0, Math.min(dd7Var.b, i6));
            dd7Var.c = fArr;
            dd7Var.b = i6;
        } catch (Throwable th) {
            ec2.a(rv8.class, th);
        }
    }

    public static boolean D(ly lyVar, y05 y05Var) {
        y05Var.getClass();
        return lyVar.i(y05Var) != null;
    }

    public static r28 E(r28 r28Var, m68 m68Var) {
        return r28Var.b(new ur5(m68Var));
    }

    public static nv5 F(long j2, x12 x12Var) {
        nv5 nv5Var;
        long j3 = uu1.h;
        float f2 = br7.d;
        long jB = uu1.b(f2, j2);
        p65 p65Var = (p65) x12Var;
        fv1 fv1Var = (fv1) p65Var.j(iv1.a);
        long j4 = ((uu1) p65Var.j(c82.a)).a;
        nv5 nv5Var2 = fv1Var.e0;
        if (nv5Var2 == null) {
            long j5 = uu1.g;
            nv5 nv5Var3 = new nv5(j5, j4, j5, uu1.b(f2, j4));
            fv1Var.e0 = nv5Var3;
            nv5Var = nv5Var3;
        } else {
            nv5Var = nv5Var2;
        }
        return nv5Var.a(j3, j2, j3, jB);
    }

    public static String G(qt5 qt5Var) {
        qt5Var.getClass();
        h21 h21Var = h21.d;
        return dq1.o(qt5Var.i).d("MD5").f();
    }

    public static final dd7 H(dd7 dd7Var, int i2) {
        dd7 dd7Var2;
        dd7 dd7Var3 = null;
        if (ec2.a.contains(rv8.class)) {
            return null;
        }
        try {
            dd7Var.getClass();
            int[] iArr = dd7Var.a;
            int i3 = 0;
            int i4 = iArr[0];
            int i5 = iArr[1];
            int i6 = iArr[2];
            int i7 = (i5 - i2) + 1;
            dd7 dd7Var4 = new dd7(new int[]{i4, i7, i6});
            float[] fArr = dd7Var.c;
            float[] fArr2 = dd7Var4.c;
            int i8 = 0;
            while (i8 < i4) {
                int i9 = i3;
                while (i9 < i6) {
                    int i10 = i3;
                    while (i10 < i7) {
                        int i11 = i10 * i6;
                        int i12 = (i8 * i7 * i6) + i11 + i9;
                        int i13 = (i8 * i5 * i6) + i11 + i9;
                        fArr2[i12] = Float.MIN_VALUE;
                        int i14 = i3;
                        while (i14 < i2) {
                            dd7Var2 = dd7Var3;
                            try {
                                fArr2[i12] = Math.max(fArr2[i12], fArr[(i14 * i6) + i13]);
                                i14++;
                                dd7Var3 = dd7Var2;
                            } catch (Throwable th) {
                                th = th;
                                ec2.a(rv8.class, th);
                                return dd7Var2;
                            }
                        }
                        i10++;
                        i3 = 0;
                    }
                    i9++;
                    i3 = 0;
                }
                i8++;
                i3 = 0;
            }
            return dd7Var4;
        } catch (Throwable th2) {
            th = th2;
            dd7Var2 = dd7Var3;
        }
    }

    public static final dd7 I(dd7 dd7Var, dd7 dd7Var2) {
        if (ec2.a.contains(rv8.class)) {
            return null;
        }
        try {
            dd7Var.getClass();
            dd7Var2.getClass();
            int i2 = dd7Var.a[0];
            int[] iArr = dd7Var2.a;
            int i3 = iArr[0];
            int i4 = iArr[1];
            dd7 dd7Var3 = new dd7(new int[]{i2, i4});
            float[] fArr = dd7Var.c;
            float[] fArr2 = dd7Var2.c;
            float[] fArr3 = dd7Var3.c;
            for (int i5 = 0; i5 < i2; i5++) {
                for (int i6 = 0; i6 < i4; i6++) {
                    int i7 = (i5 * i4) + i6;
                    fArr3[i7] = 0.0f;
                    for (int i8 = 0; i8 < i3; i8++) {
                        fArr3[i7] = (fArr[(i5 * i3) + i8] * fArr2[(i8 * i4) + i6]) + fArr3[i7];
                    }
                }
            }
            return dd7Var3;
        } catch (Throwable th) {
            ec2.a(rv8.class, th);
            return null;
        }
    }

    public static final r28 J(r28 r28Var, zc8 zc8Var, cd8 cd8Var) {
        return r28Var.b(new dd8(zc8Var, cd8Var));
    }

    public static final void K(kx6 kx6Var, uid uidVar, yqa yqaVar) {
        oic oicVarA = vn7.A();
        x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
        oic oicVarG = vn7.G(oicVarA);
        try {
            rjd rjdVarD = kx6Var.d();
            if (rjdVarD == null) {
                return;
            }
            ejd ejdVar = kx6Var.e;
            if (ejdVar == null) {
                return;
            }
            hp6 hp6VarC = kx6Var.c();
            if (hp6VarC == null) {
                return;
            }
            qq7.u(uidVar, kx6Var.a, rjdVarD.a, hp6VarC, ejdVar, kx6Var.b(), yqaVar);
        } finally {
            vn7.T(oicVarA, oicVarG, x45VarE);
        }
    }

    public static int L(yua yuaVar) throws IOException {
        byte bL;
        try {
            kz0 kz0Var = yuaVar.b;
            yuaVar.x0(1L);
            long j2 = 0;
            while (true) {
                long j3 = j2 + 1;
                if (!yuaVar.request(j3)) {
                    break;
                }
                bL = kz0Var.L(j2);
                if ((bL < 48 || bL > 57) && (j2 != 0 || bL != 45)) {
                    break;
                }
                j2 = j3;
            }
            if (j2 == 0) {
                kyd.I(16);
                String string = Integer.toString(bL, 16);
                string.getClass();
                throw new NumberFormatException("Expected a digit or '-' but was 0x".concat(string));
            }
            long jG0 = kz0Var.g0();
            String strI = yuaVar.I(Long.MAX_VALUE);
            if (jG0 >= 0 && jG0 <= 2147483647L && strI.length() <= 0) {
                return (int) jG0;
            }
            throw new IOException("expected an int but was \"" + jG0 + strI + '\"');
        } catch (NumberFormatException e2) {
            ik4.g(e2.getMessage());
            return 0;
        }
    }

    public static final void M(dd7 dd7Var) {
        if (ec2.a.contains(rv8.class)) {
            return;
        }
        try {
            dd7Var.getClass();
            float[] fArr = dd7Var.c;
            int length = fArr.length;
            for (int i2 = 0; i2 < length; i2++) {
                if (fArr[i2] < 0.0f) {
                    fArr[i2] = 0.0f;
                }
            }
        } catch (Throwable th) {
            ec2.a(rv8.class, th);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:58:0x013f, code lost:
    
        r14 = defpackage.epe.N(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0149, code lost:
    
        if (defpackage.ec2.a.contains(r1) == false) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x014c, code lost:
    
        defpackage.f94.c().execute(new defpackage.eq1(r14, r4));
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0159, code lost:
    
        r14 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x015a, code lost:
    
        defpackage.ec2.a(r1, r14);
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:?, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:?, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:?, code lost:
    
        return;
     */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00e7 A[Catch: all -> 0x001c, TryCatch #1 {all -> 0x001c, blocks: (B:5:0x0010, B:7:0x0018, B:10:0x001f, B:11:0x0027, B:13:0x002e, B:18:0x004f, B:25:0x0064, B:28:0x006a, B:29:0x006d, B:31:0x0085, B:34:0x008f, B:36:0x00a3, B:41:0x00dd, B:44:0x00e9, B:47:0x0102, B:49:0x010a, B:56:0x0131, B:50:0x010e, B:52:0x0112, B:54:0x011e, B:55:0x0129, B:37:0x00ac, B:38:0x00b4, B:40:0x00cd, B:43:0x00e7, B:57:0x013a, B:58:0x013f, B:64:0x015a, B:61:0x014c), top: B:70:0x0010, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void N(java.util.HashMap r14) {
        /*
            Method dump skipped, instruction units count: 354
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rv8.N(java.util.HashMap):void");
    }

    public static final void O(dd7 dd7Var) {
        if (ec2.a.contains(rv8.class)) {
            return;
        }
        try {
            dd7Var.getClass();
            int[] iArr = dd7Var.a;
            int i2 = iArr[0];
            int i3 = iArr[1];
            float[] fArr = dd7Var.c;
            for (int i4 = 0; i4 < i2; i4++) {
                int i5 = i4 * i3;
                int i6 = i5 + i3;
                float f2 = Float.MIN_VALUE;
                for (int i7 = i5; i7 < i6; i7++) {
                    float f3 = fArr[i7];
                    if (f3 > f2) {
                        f2 = f3;
                    }
                }
                float f4 = 0.0f;
                for (int i8 = i5; i8 < i6; i8++) {
                    float fExp = (float) Math.exp(fArr[i8] - f2);
                    fArr[i8] = fExp;
                    f4 += fExp;
                }
                while (i5 < i6) {
                    fArr[i5] = fArr[i5] / f4;
                    i5++;
                }
            }
        } catch (Throwable th) {
            ec2.a(rv8.class, th);
        }
    }

    public static final void P(zid zidVar, kx6 kx6Var, uid uidVar, ry5 ry5Var, yqa yqaVar) {
        lig ligVar = kx6Var.d;
        qa2 qa2Var = kx6Var.v;
        qa2 qa2Var2 = kx6Var.w;
        rya ryaVar = new rya();
        pi9 pi9Var = new pi9(ligVar, qa2Var, ryaVar, 15);
        ab9 ab9Var = zidVar.a;
        ab9Var.b(uidVar, ry5Var, pi9Var, qa2Var2);
        ejd ejdVar = new ejd(zidVar, ab9Var);
        zidVar.b.set(ejdVar);
        ryaVar.a = ejdVar;
        kx6Var.e = ejdVar;
        K(kx6Var, uidVar, yqaVar);
    }

    public static final String Q(zy4 zy4Var, x12 x12Var) {
        p65 p65Var;
        int i2;
        int i3;
        int i4 = gh3.b[zy4Var.ordinal()];
        if (i4 == 1) {
            p65Var = (p65) x12Var;
            i2 = R.string.display_settings_font_family_default;
            i3 = -1428279271;
        } else {
            if (i4 != 2) {
                throw ho2.L((p65) x12Var, -1428280410, false);
            }
            p65Var = (p65) x12Var;
            i2 = R.string.display_settings_font_family_opendyslexic;
            i3 = -1428276258;
        }
        return km4.w(p65Var, i3, i2, p65Var, false);
    }

    public static final String R(DarkMode darkMode, x12 x12Var) {
        int i2 = gh3.c[darkMode.ordinal()];
        if (i2 == 1) {
            p65 p65Var = (p65) x12Var;
            return km4.w(p65Var, 1913583868, R.string.display_settings_appearance_light, p65Var, false);
        }
        if (i2 == 2) {
            p65 p65Var2 = (p65) x12Var;
            return km4.w(p65Var2, 1913586427, R.string.display_settings_appearance_dark, p65Var2, false);
        }
        if (i2 != 3) {
            if (i2 != 4) {
                throw ho2.L((p65) x12Var, 1913583490, false);
            }
            p65 p65Var3 = (p65) x12Var;
            return km4.w(p65Var3, 1913607203, R.string.display_settings_appearance_auto_battery, p65Var3, false);
        }
        p65 p65Var4 = (p65) x12Var;
        p65Var4.Y(-808260946);
        String strQ = vo7.Q(R.string.display_settings_appearance_system_default, new Object[]{(Resources.getSystem().getConfiguration().uiMode & 48) == 32 ? km4.w(p65Var4, -808016945, R.string.display_settings_appearance_dark, p65Var4, false) : km4.w(p65Var4, -807930610, R.string.display_settings_appearance_light, p65Var4, false)}, p65Var4);
        p65Var4.p(false);
        return strQ;
    }

    public static String S(long j2) {
        return y(j2, 12884901888L) ? "Rgb" : y(j2, 12884901889L) ? "Xyz" : y(j2, 12884901890L) ? "Lab" : y(j2, 17179869187L) ? "Cmyk" : "Unknown";
    }

    public static final dd7 T(dd7 dd7Var) {
        if (ec2.a.contains(rv8.class)) {
            return null;
        }
        try {
            int[] iArr = dd7Var.a;
            int i2 = iArr[0];
            int i3 = iArr[1];
            dd7 dd7Var2 = new dd7(new int[]{i3, i2});
            float[] fArr = dd7Var.c;
            float[] fArr2 = dd7Var2.c;
            for (int i4 = 0; i4 < i2; i4++) {
                for (int i5 = 0; i5 < i3; i5++) {
                    fArr2[(i5 * i2) + i4] = fArr[(i4 * i3) + i5];
                }
            }
            return dd7Var2;
        } catch (Throwable th) {
            ec2.a(rv8.class, th);
            return null;
        }
    }

    public static final dd7 U(dd7 dd7Var) {
        if (ec2.a.contains(rv8.class)) {
            return null;
        }
        try {
            int[] iArr = dd7Var.a;
            int i2 = iArr[0];
            int i3 = iArr[1];
            int i4 = iArr[2];
            dd7 dd7Var2 = new dd7(new int[]{i4, i3, i2});
            float[] fArr = dd7Var.c;
            float[] fArr2 = dd7Var2.c;
            for (int i5 = 0; i5 < i2; i5++) {
                for (int i6 = 0; i6 < i3; i6++) {
                    for (int i7 = 0; i7 < i4; i7++) {
                        fArr2[(i6 * i2) + (i7 * i2 * i3) + i5] = fArr[(i6 * i4) + (i5 * i3 * i4) + i7];
                    }
                }
            }
            return dd7Var2;
        } catch (Throwable th) {
            ec2.a(rv8.class, th);
            return null;
        }
    }

    public static boolean V(a72 a72Var, a72 a72Var2, a72 a72Var3, a72 a72Var4) {
        a72 a72Var5;
        a72 a72Var6;
        a72 a72Var7 = a72.FIXED;
        return (a72Var3 == a72Var7 || a72Var3 == (a72Var6 = a72.WRAP_CONTENT) || (a72Var3 == a72.MATCH_PARENT && a72Var != a72Var6)) || (a72Var4 == a72Var7 || a72Var4 == (a72Var5 = a72.WRAP_CONTENT) || (a72Var4 == a72.MATCH_PARENT && a72Var2 != a72Var5));
    }

    public static Set W(yi5 yi5Var) {
        int size = yi5Var.size();
        TreeSet treeSet = null;
        for (int i2 = 0; i2 < size; i2++) {
            if ("Vary".equalsIgnoreCase(iq7.D(yi5Var, i2))) {
                String strF = iq7.F(yi5Var, i2);
                if (treeSet == null) {
                    Comparator comparator = String.CASE_INSENSITIVE_ORDER;
                    comparator.getClass();
                    treeSet = new TreeSet(comparator);
                }
                Iterator it2 = muc.o0(strF, new char[]{','}).iterator();
                while (it2.hasNext()) {
                    treeSet.add(muc.y0((String) it2.next()).toString());
                }
            }
        }
        return treeSet == null ? ny3.a : treeSet;
    }

    public static final r28 X(r28 r28Var, x45 x45Var) {
        return r28Var.b(new v6d(x45Var));
    }

    public static final void a(String str, List list, iaa iaaVar, r28 r28Var, x12 x12Var, int i2) {
        str.getClass();
        list.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1363015830);
        int i3 = (p65Var.f(str) ? 4 : 2) | i2 | (p65Var.h(list) ? 32 : 16) | (p65Var.f(iaaVar) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            r28Var = o28.b;
            int i4 = 21;
            m40.p(w2g.F(r28Var, 24.0f, 24.0f, 24.0f, 8.0f), new h70(8.0f, true, new z10(i4)), new h70(8.0f, true, new z10(i4)), null, 0, 0, pxf.E(-1991620741, new t(list, iaaVar, str), p65Var), p65Var, 1573296, 56);
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 1, str, list, iaaVar, r28Var2);
        }
    }

    public static final void b(lh3 lh3Var, ah3 ah3Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(792883668);
        int i4 = i2 | (p65Var.f(lh3Var) ? 4 : 2) | (p65Var.f(ah3Var) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(jfc.f(jfc.d(o28Var, 1.0f), 56.0f, 0.0f, 2), "appearance_selector");
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            jjd.b(vo7.R(p65Var, R.string.display_settings_appearance), w2g.G(o28Var, 24.0f, 0.0f, 0.0f, 0.0f, 14), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 48, 0, 131068);
            hp7.t(p65Var, new sq6(1.0f, true));
            zk7 zk7VarC = dy0.c(z46.d, false);
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
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = d46.R(DarkMode.FOLLOW_SYSTEM, DarkMode.LIGHT, DarkMode.DARK);
                p65Var.j0(objM2);
            }
            List list = (List) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new vs(l78Var, 16);
                p65Var.j0(objM3);
            }
            fo7.k(3462, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var, (m45) objM3, xn7.M, bgf.N(w2g.G(o28Var, 0.0f, 0.0f, 8.0f, 0.0f, 11), "current_appearance"), R(lh3Var.e, p65Var), false, false);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new vs(l78Var, 17);
                p65Var.j0(objM4);
            }
            mz1 mz1VarE = pxf.E(497836025, new ov2(list, lh3Var, ah3Var, l78Var, 3), p65Var);
            i3 = 2;
            xp7.b(zBooleanValue, (m45) objM4, null, 0L, null, null, null, 0L, 0.0f, mz1VarE, p65Var, 48, 2044);
            p65Var = p65Var;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            i3 = 2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fh3(lh3Var, ah3Var, i2, i3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:204:0x03c3  */
    /* JADX WARN: Removed duplicated region for block: B:205:0x03c7  */
    /* JADX WARN: Removed duplicated region for block: B:208:0x03f1  */
    /* JADX WARN: Removed duplicated region for block: B:210:0x03fc  */
    /* JADX WARN: Removed duplicated region for block: B:216:0x0420  */
    /* JADX WARN: Removed duplicated region for block: B:218:0x042b  */
    /* JADX WARN: Removed duplicated region for block: B:223:0x0448 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:227:0x044f  */
    /* JADX WARN: Removed duplicated region for block: B:230:0x0466  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x0471  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x0484  */
    /* JADX WARN: Removed duplicated region for block: B:241:0x0494  */
    /* JADX WARN: Removed duplicated region for block: B:244:0x04a3  */
    /* JADX WARN: Removed duplicated region for block: B:247:0x04b2  */
    /* JADX WARN: Removed duplicated region for block: B:250:0x04c3  */
    /* JADX WARN: Removed duplicated region for block: B:253:0x0533  */
    /* JADX WARN: Removed duplicated region for block: B:254:0x053a  */
    /* JADX WARN: Removed duplicated region for block: B:261:0x058a  */
    /* JADX WARN: Removed duplicated region for block: B:262:0x058c  */
    /* JADX WARN: Removed duplicated region for block: B:265:0x0594  */
    /* JADX WARN: Removed duplicated region for block: B:266:0x0596  */
    /* JADX WARN: Removed duplicated region for block: B:269:0x05a6  */
    /* JADX WARN: Removed duplicated region for block: B:270:0x05a9  */
    /* JADX WARN: Removed duplicated region for block: B:281:0x05d1  */
    /* JADX WARN: Removed duplicated region for block: B:284:0x05f2 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:285:0x05f4  */
    /* JADX WARN: Removed duplicated region for block: B:294:0x067d  */
    /* JADX WARN: Removed duplicated region for block: B:297:0x0685  */
    /* JADX WARN: Removed duplicated region for block: B:300:0x068e A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:303:0x069d  */
    /* JADX WARN: Removed duplicated region for block: B:306:0x06e1  */
    /* JADX WARN: Removed duplicated region for block: B:309:0x0720  */
    /* JADX WARN: Removed duplicated region for block: B:310:0x0722  */
    /* JADX WARN: Removed duplicated region for block: B:313:0x0735  */
    /* JADX WARN: Removed duplicated region for block: B:314:0x0737  */
    /* JADX WARN: Removed duplicated region for block: B:320:0x074c  */
    /* JADX WARN: Removed duplicated region for block: B:331:0x07b7  */
    /* JADX WARN: Removed duplicated region for block: B:333:0x07ba  */
    /* JADX WARN: Removed duplicated region for block: B:334:0x07d2  */
    /* JADX WARN: Removed duplicated region for block: B:338:0x07e2  */
    /* JADX WARN: Removed duplicated region for block: B:341:0x07fc  */
    /* JADX WARN: Removed duplicated region for block: B:342:0x07fe  */
    /* JADX WARN: Removed duplicated region for block: B:353:0x0818 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:356:0x081d  */
    /* JADX WARN: Removed duplicated region for block: B:359:0x0839  */
    /* JADX WARN: Removed duplicated region for block: B:360:0x083b  */
    /* JADX WARN: Removed duplicated region for block: B:365:0x0861  */
    /* JADX WARN: Removed duplicated region for block: B:370:0x0882  */
    /* JADX WARN: Removed duplicated region for block: B:373:0x08b4  */
    /* JADX WARN: Removed duplicated region for block: B:377:0x08ca  */
    /* JADX WARN: Removed duplicated region for block: B:387:0x096f  */
    /* JADX WARN: Removed duplicated region for block: B:389:0x0972  */
    /* JADX WARN: Removed duplicated region for block: B:395:0x0988  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void c(final defpackage.uid r65, final defpackage.x45 r66, final defpackage.r28 r67, final defpackage.mkd r68, final defpackage.ywb r69, final defpackage.x45 r70, final defpackage.dkc r71, final boolean r72, final int r73, final int r74, final defpackage.ry5 r75, final defpackage.pk6 r76, final boolean r77, final defpackage.c55 r78, defpackage.x12 r79, final int r80, final int r81) {
        /*
            Method dump skipped, instruction units count: 2551
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rv8.c(uid, x45, r28, mkd, ywb, x45, dkc, boolean, int, int, ry5, pk6, boolean, c55, x12, int, int):void");
    }

    public static final void d(r28 r28Var, lid lidVar, mz1 mz1Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2036174316);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2 | (p65Var.h(lidVar) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            zk7 zk7VarC = dy0.c(z46.d, true);
            long j2 = p65Var.T;
            int i4 = (int) ((j2 >>> 32) ^ j2);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            d46.f(lidVar, mz1Var, p65Var, (i3 >> 3) & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(r28Var, lidVar, mz1Var, i2);
        }
    }

    public static final void e(boolean z2, long j2, mz1 mz1Var, mx mxVar, x12 x12Var, int i2) {
        int i3;
        cu cuVar;
        fn fnVar;
        cu cuVar2;
        ot2 ot2Var;
        cu cuVar3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1956451808);
        int i4 = i2 | (p65Var.g(z2) ? 4 : 2) | (p65Var.e(j2) ? 32 : 16) | (p65Var.f(mxVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            a76 a76Var = a76.Min;
            o28 o28Var = o28.b;
            r28 r28VarP = pwd.P(o28Var, a76Var);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarP);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            cu cuVar4 = q12.f;
            tp7.B(p65Var, cuVar4, ombVarA);
            cu cuVar5 = q12.e;
            tp7.B(p65Var, cuVar5, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar6 = q12.g;
            tp7.B(p65Var, cuVar6, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var, fnVar2);
            cu cuVar7 = q12.d;
            tp7.B(p65Var, cuVar7, r28VarR);
            if (z2) {
                p65Var.Y(-363733082);
                i3 = i4;
                cuVar2 = cuVar6;
                fnVar = fnVar2;
                cuVar = cuVar5;
                ot2Var = ot2Var2;
                cuVar3 = cuVar4;
                tp7.e(2.0f, 384, 1, ((zo7) p65Var.j(kt7.b)).A, p65Var, null);
                p65Var.p(false);
            } else {
                i3 = i4;
                cuVar = cuVar5;
                fnVar = fnVar2;
                cuVar2 = cuVar6;
                ot2Var = ot2Var2;
                cuVar3 = cuVar4;
                km4.F(2.0f, -363571448, p65Var, p65Var, o28Var);
                p65Var.p(false);
            }
            mz1Var.f(w2g.G(o28Var, 16.0f, 18.0f, 0.0f, 18.0f, 4), p65Var, 54);
            zi5 zi5Var = qb8.e;
            r28 r28VarF = w2g.F(o28Var, 18.0f, 18.0f, 18.0f, 18.0f);
            wv1 wv1VarA = uv1.a(zi5Var, z46.p, p65Var, 6);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar3, wv1VarA);
            tp7.B(p65Var, cuVar, i89VarL2);
            ka1.z(i6, p65Var, cuVar2, p65Var, fnVar);
            tp7.B(p65Var, cuVar7, r28VarR2);
            sn3 sn3Var = jt7.c;
            jjd.c(mxVar, null, 0L, 0L, 0L, null, 0L, 2, false, 5, 0, null, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, (i3 >> 9) & 14, 24960, 241662);
            jjd.b(vo7.T((Context) p65Var.j(eo.b), j2), null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).o, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 24960, 110590);
            p65Var = p65Var;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fs(z2, j2, mz1Var, mxVar, i2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:56:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(final boolean r16, final java.lang.String r17, java.lang.Integer r18, final defpackage.mx r19, final long r20, int r22, final defpackage.m45 r23, final defpackage.m45 r24, defpackage.x12 r25, final int r26, final int r27) {
        /*
            Method dump skipped, instruction units count: 246
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rv8.f(boolean, java.lang.String, java.lang.Integer, mx, long, int, m45, m45, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x028e  */
    /* JADX WARN: Removed duplicated region for block: B:104:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0281  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void g(final boolean r55, final java.lang.String r56, java.lang.Integer r57, final defpackage.mx r58, final defpackage.mz1 r59, int r60, final defpackage.m45 r61, final defpackage.m45 r62, defpackage.x12 r63, final int r64, final int r65) {
        /*
            Method dump skipped, instruction units count: 678
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rv8.g(boolean, java.lang.String, java.lang.Integer, mx, mz1, int, m45, m45, x12, int, int):void");
    }

    public static final void h(vpc vpcVar, bo4 bo4Var, ah3 ah3Var, x12 x12Var, int i2) {
        p65 p65Var;
        ah3 ah3Var2;
        uob uobVar;
        vpcVar.getClass();
        bo4Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1585459863);
        int i3 = i2 | (p65Var2.h(vpcVar) ? 4 : 2) | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.f(ah3Var) ? 256 : 128);
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            l78 l78VarZ = guc.z(vpcVar, p65Var2, i3 & 14);
            int i4 = i3 & 896;
            boolean z2 = i4 == 256;
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (z2 || objM == uobVar2) {
                uobVar = uobVar2;
                gu1 gu1Var = new gu1(0, ah3Var, ah3.class, "close", "close()V", 0, 16);
                ah3Var2 = ah3Var;
                p65Var2.j0(gu1Var);
                objM = gu1Var;
            } else {
                ah3Var2 = ah3Var;
                uobVar = uobVar2;
            }
            p65Var = p65Var2;
            ek7.f((m45) ((qh6) objM), null, pxf.E(-1965296495, new ec(ah3Var2, 27, l78VarZ), p65Var2), p65Var, 384, 2);
            boolean zH = p65Var.h(bo4Var) | (i4 == 256);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new r91(bo4Var, ah3Var2, null, 26);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var = p65Var2;
            ah3Var2 = ah3Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 24, vpcVar, bo4Var, ah3Var2);
        }
    }

    public static final void i(lh3 lh3Var, ah3 ah3Var, x12 x12Var, int i2) {
        ah3 ah3Var2;
        int i3;
        lh3 lh3Var2 = lh3Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1959655419);
        int i4 = i2 | (p65Var.f(lh3Var2) ? 4 : 2) | (p65Var.f(ah3Var) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(jfc.f(jfc.d(o28Var, 1.0f), 56.0f, 0.0f, 2), "font_family_selector");
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            i3 = 1;
            jjd.b(vo7.R(p65Var, R.string.display_settings_font_family), w2g.G(o28Var, 24.0f, 0.0f, 0.0f, 0.0f, 14), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 48, 0, 131068);
            p65Var = p65Var;
            hp7.t(p65Var, new sq6(1.0f, true));
            zk7 zk7VarC = dy0.c(z46.d, false);
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
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new vs(l78Var, 14);
                p65Var.j0(objM2);
            }
            fo7.k(3462, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var, (m45) objM2, xn7.M, bgf.N(w2g.G(o28Var, 0.0f, 0.0f, 8.0f, 0.0f, 11), "current_font_family"), Q(lh3Var.d, p65Var), false, false);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new vs(l78Var, 15);
                p65Var.j0(objM3);
            }
            mz1 mz1VarE = pxf.E(2040264234, new nh(lh3Var, ah3Var, l78Var, 20), p65Var);
            lh3Var2 = lh3Var;
            ah3Var2 = ah3Var;
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, mz1VarE, p65Var, 48, 2044);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            ah3Var2 = ah3Var;
            i3 = 1;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fh3(lh3Var2, ah3Var2, i2, i3);
        }
    }

    public static final void j(lh3 lh3Var, ah3 ah3Var, x12 x12Var, int i2) {
        p65 p65Var;
        int i3;
        int i4;
        qmb qmbVar;
        cu cuVar;
        boolean z2;
        o28 o28Var;
        vkb vkbVar;
        cu cuVar2;
        fn fnVar;
        cu cuVar3;
        ot2 ot2Var;
        uob uobVar;
        cu cuVar4;
        String strQ;
        char c2;
        boolean z3;
        vkb vkbVar2;
        p65 p65Var2;
        float f2;
        ar0 ar0Var;
        lh3 lh3Var2 = lh3Var;
        ah3 ah3Var2 = ah3Var;
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(-2136820408);
        int i5 = i2 | (p65Var3.f(lh3Var2) ? 4 : 2) | (p65Var3.f(ah3Var2) ? 32 : 16);
        if (p65Var3.P(i5 & 1, (i5 & 19) != 18)) {
            o28 o28Var2 = o28.b;
            r28 r28VarN = bgf.N(jfc.e(jfc.d(o28Var2, 1.0f), 56.0f), "font_size_selector");
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var3, 0);
            long j2 = p65Var3.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var3.l();
            r28 r28VarR = gx1.R(p65Var3, r28VarN);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var2);
            } else {
                p65Var3.m0();
            }
            cu cuVar5 = q12.f;
            tp7.B(p65Var3, cuVar5, ombVarA);
            cu cuVar6 = q12.e;
            tp7.B(p65Var3, cuVar6, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar7 = q12.g;
            tp7.B(p65Var3, cuVar7, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var3, fnVar2);
            cu cuVar8 = q12.d;
            tp7.B(p65Var3, cuVar8, r28VarR);
            qmb qmbVar2 = qmb.a;
            r28 r28VarA = qmbVar2.a(1.0f, o28Var2, true);
            rh4 rh4Var = jfc.c;
            r28 r28VarB = r28VarA.b(rh4Var);
            boolean z4 = lh3Var2.a;
            vkb vkbVar3 = new vkb(0);
            int i7 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z5 = i7 == 32;
            Object objM = p65Var3.M();
            uob uobVar2 = w12.a;
            if (z5 || objM == uobVar2) {
                i4 = i7;
                qmbVar = qmbVar2;
                cuVar = cuVar7;
                z2 = z4;
                o28Var = o28Var2;
                vkbVar = vkbVar3;
                cuVar2 = cuVar6;
                fnVar = fnVar2;
                cuVar3 = cuVar8;
                ot2Var = ot2Var2;
                uobVar = uobVar2;
                cuVar4 = cuVar5;
                objM = new gu1(0, ah3Var2, ah3.class, "decreaseFontSize", "decreaseFontSize()V", 0, 17);
                p65Var3.j0(objM);
            } else {
                ot2Var = ot2Var2;
                qmbVar = qmbVar2;
                cuVar = cuVar7;
                uobVar = uobVar2;
                o28Var = o28Var2;
                vkbVar = vkbVar3;
                i4 = i7;
                cuVar2 = cuVar6;
                cuVar3 = cuVar8;
                cuVar4 = cuVar5;
                z2 = z4;
                fnVar = fnVar2;
            }
            r28 r28VarN2 = bgf.N(hlg.r(r28VarB, z2, null, vkbVar, (m45) ((qh6) objM), 10), "decrease_font_size");
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j3 = p65Var3.T;
            int i8 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var3.l();
            r28 r28VarR2 = gx1.R(p65Var3, r28VarN2);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar4, zk7VarC);
            tp7.B(p65Var3, cuVar2, i89VarL2);
            ka1.z(i8, p65Var3, cuVar, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar3, r28VarR2);
            o28 o28Var3 = o28Var;
            r28 r28VarI = w2g.i(o28Var3, lh3Var2.a ? 1.0f : 0.3f);
            String strR = vo7.R(p65Var3, R.string.display_settings_font_size_button);
            sn3 sn3Var = jt7.c;
            cu cuVar9 = cuVar4;
            ot2 ot2Var3 = ot2Var;
            cu cuVar10 = cuVar3;
            cu cuVar11 = cuVar2;
            fn fnVar3 = fnVar;
            uob uobVar3 = uobVar;
            jjd.b(strR, r28VarI, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var3.j(sn3Var)).t, p65Var3, 0, 0, 131068);
            p65Var3.p(true);
            tp7.e(0.0f, 0, 7, 0L, p65Var3, null);
            qmb qmbVar3 = qmbVar;
            r28 r28VarN3 = bgf.N(qmbVar3.a(1.0f, o28Var3, true).b(rh4Var), "current_font_size");
            zk7 zk7VarC2 = dy0.c(ar0Var2, false);
            long j4 = p65Var3.T;
            int i9 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var3.l();
            r28 r28VarR3 = gx1.R(p65Var3, r28VarN3);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var3);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar9, zk7VarC2);
            tp7.B(p65Var3, cuVar11, i89VarL3);
            ka1.z(i9, p65Var3, cuVar, p65Var3, fnVar3);
            tp7.B(p65Var3, cuVar10, r28VarR3);
            lh3Var2 = lh3Var;
            switch (gh3.a[lh3Var2.c.ordinal()]) {
                case 1:
                    p65Var3.Y(1376708062);
                    strQ = vo7.Q(R.string.display_settings_current_font_size, new Object[]{"25"}, p65Var3);
                    p65Var3.p(false);
                    break;
                case 2:
                    p65Var3.Y(1376711390);
                    strQ = vo7.Q(R.string.display_settings_current_font_size, new Object[]{"50"}, p65Var3);
                    p65Var3.p(false);
                    break;
                case 3:
                    p65Var3.Y(1376714654);
                    strQ = vo7.Q(R.string.display_settings_current_font_size, new Object[]{"75"}, p65Var3);
                    p65Var3.p(false);
                    break;
                case 4:
                    p65Var3.Y(1376717951);
                    strQ = vo7.Q(R.string.display_settings_current_font_size, new Object[]{"100"}, p65Var3);
                    p65Var3.p(false);
                    break;
                case 5:
                    p65Var3.Y(1376721247);
                    strQ = vo7.Q(R.string.display_settings_current_font_size, new Object[]{"125"}, p65Var3);
                    p65Var3.p(false);
                    break;
                case 6:
                    p65Var3.Y(1376724575);
                    strQ = vo7.Q(R.string.display_settings_current_font_size, new Object[]{"150"}, p65Var3);
                    p65Var3.p(false);
                    break;
                case 7:
                    p65Var3.Y(1376727935);
                    strQ = vo7.Q(R.string.display_settings_current_font_size, new Object[]{"175"}, p65Var3);
                    p65Var3.p(false);
                    break;
                default:
                    throw ho2.L(p65Var3, 1376707043, false);
            }
            jjd.b(strQ, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var3.j(sn3Var)).m, ((zo7) p65Var3.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var3, 0, 0, 131070);
            p65Var3.p(true);
            cu cuVar12 = cuVar;
            tp7.e(0.0f, 0, 7, 0L, p65Var3, null);
            r28 r28VarB2 = qmbVar3.a(1.0f, o28Var3, true).b(rh4Var);
            boolean z6 = lh3Var2.b;
            vkb vkbVar4 = new vkb(0);
            boolean z7 = i4 == 32;
            Object objM2 = p65Var3.M();
            if (z7 || objM2 == uobVar3) {
                c2 = ' ';
                z3 = z6;
                vkbVar2 = vkbVar4;
                p65Var2 = p65Var3;
                f2 = 1.0f;
                ah3Var2 = ah3Var;
                ar0Var = ar0Var2;
                gu1 gu1Var = new gu1(0, ah3Var2, ah3.class, "increaseFontSize", "increaseFontSize()V", 0, 18);
                p65Var2.j0(gu1Var);
                objM2 = gu1Var;
            } else {
                f2 = 1.0f;
                c2 = ' ';
                z3 = z6;
                vkbVar2 = vkbVar4;
                p65Var2 = p65Var3;
                ah3Var2 = ah3Var;
                ar0Var = ar0Var2;
            }
            r28 r28VarN4 = bgf.N(hlg.r(r28VarB2, z3, null, vkbVar2, (m45) ((qh6) objM2), 10), "increase_font_size");
            i3 = 0;
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j5 = p65Var2.T;
            int i10 = (int) (j5 ^ (j5 >>> c2));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarN4);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var3);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar9, zk7VarC3);
            tp7.B(p65Var2, cuVar11, i89VarL4);
            ka1.z(i10, p65Var2, cuVar12, p65Var2, fnVar3);
            tp7.B(p65Var2, cuVar10, r28VarR4);
            p65 p65Var4 = p65Var2;
            jjd.b(vo7.R(p65Var2, R.string.display_settings_font_size_button), w2g.i(o28Var3, lh3Var2.b ? f2 : 0.3f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).s, p65Var4, 0, 0, 131068);
            p65Var = p65Var4;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var = p65Var3;
            i3 = 0;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fh3(lh3Var2, ah3Var2, i2, i3);
        }
    }

    public static final void k(boolean z2, ah3 ah3Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1411785465);
        int i3 = i2 | (p65Var.g(z2) ? 4 : 2) | (p65Var.f(ah3Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(jfc.f(jfc.d(o28Var, 1.0f), 56.0f, 0.0f, 2), "highlights_from_others_selector");
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            jjd.b(vo7.R(p65Var, R.string.display_settings_highlights_from_others), w2g.G(o28Var, 24.0f, 0.0f, 0.0f, 0.0f, 14), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 48, 0, 131068);
            p65Var = p65Var;
            hp7.t(p65Var, new sq6(1.0f, true));
            boolean z3 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                k0 k0Var = new k0(1, ah3Var, ah3.class, "onHighlightsFromOthersToggled", "onHighlightsFromOthersToggled(Z)V", 0, 13);
                p65Var.j0(k0Var);
                objM = k0Var;
            }
            hk7.b(z2, (x45) ((qh6) objM), w2g.G(o28Var, 0.0f, 0.0f, 20.0f, 0.0f, 11), false, null, null, p65Var, (i3 & 14) | 384, 56);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jc0(z2, ah3Var, r28Var2, i2, 2);
        }
    }

    public static final void l(float f2, int i2, long j2, x12 x12Var, r28 r28Var) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(75144485);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.c(f2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.e(j2) ? 256 : 128;
        }
        int i4 = 0;
        boolean z2 = true;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.U();
            if ((i2 & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            r28 r28VarE = jfc.e(jfc.d(r28Var, 1.0f), f2);
            boolean z3 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            if ((((i3 & 896) ^ 384) <= 256 || !p65Var.e(j2)) && (i3 & 384) != 256) {
                z2 = false;
            }
            boolean z4 = z3 | z2;
            Object objM = p65Var.M();
            if (z4 || objM == w12.a) {
                objM = new ki3(f2, i4, j2);
                p65Var.j0(objM);
            }
            pxf.a(r28VarE, (x45) objM, p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new li3(r28Var, f2, j2, i2, 1);
        }
    }

    public static final long m(int i2) {
        long j2 = ((long) i2) << 32;
        int i3 = fk6.O;
        return j2;
    }

    public static final void n(pw6 pw6Var, hw8 hw8Var, nw6 nw6Var, r28 r28Var, jy8 jy8Var, dn4 dn4Var, boolean z2, fx8 fx8Var, float f2, x45 x45Var, x12 x12Var, int i2, int i3) {
        int i4;
        int i5;
        pw6 pw6Var2;
        p65 p65Var;
        Object iw6Var;
        pw6 pw6Var3;
        hw8 hw8Var2;
        ti6 ti6Var;
        r28 r28VarY;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1904835166);
        if ((i2 & 6) == 0) {
            i4 = (p65Var2.f(pw6Var) ? 4 : 2) | i2;
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var2.d(hw8Var.ordinal()) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i4 |= (i2 & 512) == 0 ? p65Var2.f(nw6Var) : p65Var2.h(nw6Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i4 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i4 |= p65Var2.f(jy8Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((i2 & 196608) == 0) {
            i4 |= p65Var2.g(false) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((i2 & 1572864) == 0) {
            i4 |= p65Var2.f(dn4Var) ? 1048576 : 524288;
        }
        if ((i2 & 12582912) == 0) {
            i4 |= p65Var2.g(z2) ? 8388608 : 4194304;
        }
        if ((i2 & 100663296) == 0) {
            i4 |= p65Var2.f(fx8Var) ? 67108864 : 33554432;
        }
        if ((i2 & 805306368) == 0) {
            i4 |= p65Var2.c(0.0f) ? 536870912 : 268435456;
        }
        int i6 = i4;
        if ((i3 & 6) == 0) {
            i5 = i3 | (p65Var2.c(f2) ? 4 : 2);
        } else {
            i5 = i3;
        }
        if ((i3 & 48) == 0) {
            i5 |= p65Var2.h(x45Var) ? 32 : 16;
        }
        boolean z3 = true;
        if (p65Var2.P(i6 & 1, ((i6 & 306783379) == 306783378 && (i5 & 19) == 18) ? false : true)) {
            p65Var2.U();
            if ((i2 & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            int i7 = i6 & 14;
            int i8 = (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | i7;
            l78 l78VarY = qo7.y(x45Var, p65Var2);
            int i9 = i5;
            boolean z4 = (((i8 & 14) ^ 6) > 4 && p65Var2.f(pw6Var)) || (i8 & 6) == 4;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z4 || objM == uobVar) {
                uob uobVar2 = uob.g;
                ei4 ei4Var = new ei4(l78VarY, 11);
                vwa vwaVar = bjc.a;
                objM = new kv4(0, 8, upc.class, new j83(new ps5(new j83(ei4Var, uobVar2), 7, pw6Var), uobVar2), "value", "getValue()Ljava/lang/Object;");
                p65Var2.j0(objM);
            }
            ti6 ti6Var2 = (ti6) objM;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var2);
                p65Var2.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            lf5 lf5Var = (lf5) p65Var2.j(z22.g);
            int i10 = i6 >> 6;
            int i11 = i6 >> 12;
            int i12 = (i10 & 896) | i7 | (i10 & 7168) | ((i6 << 9) & 57344) | (i11 & 458752) | ((i9 << 18) & 3670016) | ((i6 << 18) & 234881024);
            boolean zF = ((((i12 & 234881024) ^ 100663296) > 67108864 && p65Var2.f(nw6Var)) || (i12 & 100663296) == 67108864) | ((((i12 & 896) ^ 384) > 256 && p65Var2.f(jy8Var)) || (i12 & 384) == 256) | ((((i12 & 14) ^ 6) > 4 && p65Var2.f(pw6Var)) || (i12 & 6) == 4) | p65Var2.f(ti6Var2) | ((((i12 & 7168) ^ 3072) > 2048 && p65Var2.g(false)) || (i12 & 3072) == 2048) | ((((i12 & 57344) ^ 24576) > 16384 && p65Var2.d(hw8Var.ordinal())) || (i12 & 24576) == 16384) | ((((i12 & 458752) ^ 196608) > 131072 && p65Var2.c(0.0f)) || (i12 & 196608) == 131072) | ((((i12 & 3670016) ^ 1572864) > 1048576 && p65Var2.c(f2)) || (i12 & 1572864) == 1048576) | p65Var2.f(lf5Var);
            Object objM3 = p65Var2.M();
            if (zF || objM3 == uobVar) {
                pw6Var3 = pw6Var;
                hw8Var2 = hw8Var;
                iw6Var = new iw6(pw6Var3, hw8Var2, nw6Var, ti6Var2, jy8Var, sb2Var, lf5Var);
                ti6Var = ti6Var2;
                p65Var2.j0(iw6Var);
            } else {
                hw8Var2 = hw8Var;
                iw6Var = objM3;
                ti6Var = ti6Var2;
                pw6Var3 = pw6Var;
            }
            xt6 xt6Var = (xt6) iw6Var;
            int i13 = (i11 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | i7;
            boolean z5 = ((((i13 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) > 32 && p65Var2.g(false)) || (i13 & 48) == 32) | ((((i13 & 14) ^ 6) > 4 && p65Var2.f(pw6Var3)) || (i13 & 6) == 4);
            Object objM4 = p65Var2.M();
            if (z5 || objM4 == uobVar) {
                objM4 = new mw6(pw6Var3);
                p65Var2.j0(objM4);
            }
            mw6 mw6Var = (mw6) objM4;
            if (z2) {
                p65Var2.Y(-1834596342);
                if (((i7 ^ 6) <= 4 || !p65Var2.f(pw6Var3)) && (i6 & 6) != 4) {
                    z3 = false;
                }
                Object objM5 = p65Var2.M();
                if (z3 || objM5 == uobVar) {
                    objM5 = new wv6(pw6Var3);
                    p65Var2.j0(objM5);
                }
                r28VarY = bo.Y((wv6) objM5, pw6Var3.k, hw8Var2);
                p65Var2.p(false);
            } else {
                p65Var2.Y(-1834291488);
                p65Var2.p(false);
                r28VarY = o28.b;
            }
            r28 r28VarG = pxf.G(r40.H(r28Var.b(pw6Var3.i).b(pw6Var3.j), ti6Var, mw6Var, hw8Var2, z2).b(r28VarY).b(pw6Var3.t.k), pw6Var3, hw8Var2, fx8Var, z2, dn4Var, pw6Var3.r, null);
            pw6Var2 = pw6Var3;
            p65Var = p65Var2;
            yi2.y(ti6Var, r28VarG, pw6Var2.m, xt6Var, p65Var, 0);
        } else {
            pw6Var2 = pw6Var;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cw6(pw6Var2, hw8Var, nw6Var, r28Var, jy8Var, dn4Var, z2, fx8Var, f2, x45Var, i2, i3);
        }
    }

    public static final void o(lid lidVar, boolean z2, x12 x12Var, int i2) {
        rjd rjdVarD;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(626339208);
        int i3 = (p65Var.h(lidVar) ? 4 : 2) | i2 | (p65Var.g(z2) ? 32 : 16);
        if (!p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.S();
        } else if (z2) {
            p65Var.Y(1530097388);
            kx6 kx6Var = lidVar.d;
            qjd qjdVar = null;
            if (kx6Var != null && (rjdVarD = kx6Var.d()) != null) {
                qjd qjdVar2 = rjdVarD.a;
                kx6 kx6Var2 = lidVar.d;
                if (!(kx6Var2 != null ? kx6Var2.p : true)) {
                    qjdVar = qjdVar2;
                }
            }
            if (qjdVar == null) {
                p65Var.Y(1530097387);
                p65Var.p(false);
            } else {
                p65Var.Y(1530097388);
                if (bkd.c(lidVar.l().b)) {
                    p65Var.Y(2110860558);
                    p65Var.p(false);
                } else {
                    p65Var.Y(2109807302);
                    yqa yqaVar = lidVar.b;
                    int i4 = (int) (lidVar.l().b >> 32);
                    yqaVar.a(i4);
                    yqa yqaVar2 = lidVar.b;
                    int i5 = (int) (lidVar.l().b & 4294967295L);
                    yqaVar2.a(i5);
                    mcb mcbVarA = qjdVar.a(i4);
                    mcb mcbVarA2 = qjdVar.a(Math.max(i5 - 1, 0));
                    kx6 kx6Var3 = lidVar.d;
                    if (kx6Var3 == null || !((Boolean) kx6Var3.m.getValue()).booleanValue()) {
                        p65Var.Y(2110490542);
                        p65Var.p(false);
                    } else {
                        p65Var.Y(2110225306);
                        gr7.a(true, mcbVarA, lidVar, p65Var, ((i3 << 6) & 896) | 6);
                        p65Var.p(false);
                    }
                    kx6 kx6Var4 = lidVar.d;
                    if (kx6Var4 == null || !((Boolean) kx6Var4.n.getValue()).booleanValue()) {
                        p65Var.Y(2110838734);
                        p65Var.p(false);
                    } else {
                        p65Var.Y(2110574459);
                        gr7.a(false, mcbVarA2, lidVar, p65Var, ((i3 << 6) & 896) | 6);
                        p65Var.p(false);
                    }
                    p65Var.p(false);
                }
                kx6 kx6Var5 = lidVar.d;
                if (kx6Var5 != null) {
                    k49 k49Var = kx6Var5.l;
                    if (!g76.L(lidVar.t.a.b, lidVar.l().a.b)) {
                        k49Var.setValue(Boolean.FALSE);
                    }
                    if (kx6Var5.b()) {
                        if (((Boolean) k49Var.getValue()).booleanValue()) {
                            lidVar.s();
                        } else {
                            lidVar.m();
                        }
                    }
                }
                p65Var.p(false);
            }
            p65Var.p(false);
        } else {
            p65Var.Y(1989076778);
            p65Var.p(false);
            lidVar.m();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pv0(lidVar, z2, i2);
        }
    }

    public static final void p(lid lidVar, x12 x12Var, int i2) {
        mx mxVarK;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1436003720);
        int i3 = 2;
        int i4 = (p65Var.h(lidVar) ? 4 : 2) | i2;
        int i5 = 0;
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            kx6 kx6Var = lidVar.d;
            if (kx6Var == null || !((Boolean) kx6Var.o.getValue()).booleanValue() || (mxVarK = lidVar.k()) == null || mxVarK.b.length() <= 0) {
                p65Var.Y(-2111042550);
                p65Var.p(false);
            } else {
                p65Var.Y(-2112351432);
                boolean zF = p65Var.f(lidVar);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (zF || objM == uobVar) {
                    objM = new hid(lidVar);
                    p65Var.j0(objM);
                }
                rhd rhdVar = (rhd) objM;
                m73 m73Var = (m73) p65Var.j(z22.h);
                yqa yqaVar = lidVar.b;
                long j2 = lidVar.l().b;
                int i6 = bkd.c;
                int i7 = (int) (j2 >> 32);
                yqaVar.a(i7);
                kx6 kx6Var2 = lidVar.d;
                rjd rjdVarD = kx6Var2 != null ? kx6Var2.d() : null;
                rjdVarD.getClass();
                qjd qjdVar = rjdVarD.a;
                zwa zwaVarC = qjdVar.c(iq7.v(i7, 0, qjdVar.a.a.b.length()));
                long jFloatToRawIntBits = (((long) Float.floatToRawIntBits((m73Var.Z(2.0f) / 2.0f) + zwaVarC.a)) << 32) | (((long) Float.floatToRawIntBits(zwaVarC.d)) & 4294967295L);
                boolean zE = p65Var.e(jFloatToRawIntBits);
                Object objM2 = p65Var.M();
                if (zE || objM2 == uobVar) {
                    objM2 = new wa2(jFloatToRawIntBits);
                    p65Var.j0(objM2);
                }
                lp8 lp8Var = (lp8) objM2;
                boolean zH = p65Var.h(rhdVar) | p65Var.h(lidVar);
                Object objM3 = p65Var.M();
                if (zH || objM3 == uobVar) {
                    objM3 = new za2(rhdVar, i5, lidVar);
                    p65Var.j0(objM3);
                }
                q4d q4dVar = new q4d(rhdVar, null, (PointerInputEventHandler) objM3, 6);
                boolean zE2 = p65Var.e(jFloatToRawIntBits);
                Object objM4 = p65Var.M();
                if (zE2 || objM4 == uobVar) {
                    objM4 = new ro(i3, jFloatToRawIntBits);
                    p65Var.j0(objM4);
                }
                to.a(lp8Var, wxb.a(q4dVar, false, (x45) objM4), 0L, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new k6c(lidVar, i2);
        }
    }

    public static final void q(float f2, int i2, long j2, x12 x12Var, r28 r28Var) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1534852205);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.c(f2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.e(j2) ? 256 : 128;
        }
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.U();
            if ((i2 & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            r28 r28VarP = jfc.p(jfc.c(r28Var, 1.0f), f2);
            boolean z2 = ((((i3 & 896) ^ 384) > 256 && p65Var.e(j2)) || (i3 & 384) == 256) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new ki3(f2, i4, j2);
                p65Var.j0(objM);
            }
            pxf.a(r28VarP, (x45) objM, p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new li3(r28Var, f2, j2, i2, 2);
        }
    }

    public static final void r(dd7 dd7Var, dd7 dd7Var2) {
        if (ec2.a.contains(rv8.class)) {
            return;
        }
        try {
            dd7Var.getClass();
            int[] iArr = dd7Var.a;
            int i2 = iArr[0];
            int i3 = iArr[1];
            int i4 = iArr[2];
            float[] fArr = dd7Var.c;
            float[] fArr2 = dd7Var2.c;
            for (int i5 = 0; i5 < i2; i5++) {
                for (int i6 = 0; i6 < i3; i6++) {
                    for (int i7 = 0; i7 < i4; i7++) {
                        int i8 = (i6 * i4) + (i5 * i3 * i4) + i7;
                        fArr[i8] = fArr[i8] + fArr2[i7];
                    }
                }
            }
        } catch (Throwable th) {
            ec2.a(rv8.class, th);
        }
    }

    public static final dd7 s(dd7[] dd7VarArr) {
        if (ec2.a.contains(rv8.class)) {
            return null;
        }
        try {
            int i2 = dd7VarArr[0].a[0];
            int i3 = 0;
            for (dd7 dd7Var : dd7VarArr) {
                i3 += dd7Var.a[1];
            }
            dd7 dd7Var2 = new dd7(new int[]{i2, i3});
            float[] fArr = dd7Var2.c;
            for (int i4 = 0; i4 < i2; i4++) {
                int i5 = i4 * i3;
                for (dd7 dd7Var3 : dd7VarArr) {
                    float[] fArr2 = dd7Var3.c;
                    int i6 = dd7Var3.a[1];
                    System.arraycopy(fArr2, i4 * i6, fArr, i5, i6);
                    i5 += i6;
                }
            }
            return dd7Var2;
        } catch (Throwable th) {
            ec2.a(rv8.class, th);
            return null;
        }
    }

    public static final dd7 t(dd7 dd7Var, dd7 dd7Var2) {
        dd7 dd7Var3;
        dd7 dd7Var4 = null;
        if (ec2.a.contains(rv8.class)) {
            return null;
        }
        try {
            dd7Var.getClass();
            dd7Var2.getClass();
            int[] iArr = dd7Var.a;
            int i2 = 0;
            int i3 = iArr[0];
            int i4 = iArr[1];
            int i5 = iArr[2];
            int[] iArr2 = dd7Var2.a;
            int i6 = iArr2[0];
            int i7 = (i4 - i6) + 1;
            int i8 = iArr2[2];
            dd7 dd7Var5 = new dd7(new int[]{i3, i7, i8});
            float[] fArr = dd7Var.c;
            float[] fArr2 = dd7Var5.c;
            float[] fArr3 = dd7Var2.c;
            int i9 = 0;
            while (i9 < i3) {
                int i10 = i2;
                while (i10 < i8) {
                    int i11 = i2;
                    while (i11 < i7) {
                        float f2 = 0.0f;
                        dd7Var3 = dd7Var4;
                        int i12 = i2;
                        while (i12 < i6) {
                            while (i2 < i5) {
                                try {
                                    f2 = (fArr[((i12 + i11) * i5) + (i4 * i5 * i9) + i2] * fArr3[(((i12 * i5) + i2) * i8) + i10]) + f2;
                                    i2++;
                                } catch (Throwable th) {
                                    th = th;
                                    ec2.a(rv8.class, th);
                                    return dd7Var3;
                                }
                            }
                            i12++;
                            i2 = 0;
                        }
                        fArr2[(i11 * i8) + (i7 * i8 * i9) + i10] = f2;
                        i11++;
                        dd7Var4 = dd7Var3;
                        i2 = 0;
                    }
                    i10++;
                    i2 = 0;
                }
                i9++;
                i2 = 0;
            }
            return dd7Var5;
        } catch (Throwable th2) {
            th = th2;
            dd7Var3 = null;
        }
    }

    public static final dd7 u(dd7 dd7Var, dd7 dd7Var2, dd7 dd7Var3) {
        if (ec2.a.contains(rv8.class)) {
            return null;
        }
        try {
            dd7Var.getClass();
            dd7Var2.getClass();
            int i2 = dd7Var.a[0];
            int i3 = dd7Var3.a[0];
            dd7 dd7VarI = I(dd7Var, dd7Var2);
            float[] fArr = dd7Var3.c;
            float[] fArr2 = dd7VarI.c;
            for (int i4 = 0; i4 < i2; i4++) {
                for (int i5 = 0; i5 < i3; i5++) {
                    int i6 = (i4 * i3) + i5;
                    fArr2[i6] = fArr2[i6] + fArr[i5];
                }
            }
            return dd7VarI;
        } catch (Throwable th) {
            ec2.a(rv8.class, th);
            return null;
        }
    }

    public static final dd7 v(String[] strArr, dd7 dd7Var) {
        if (ec2.a.contains(rv8.class)) {
            return null;
        }
        try {
            int length = strArr.length;
            int i2 = dd7Var.a[1];
            dd7 dd7Var2 = new dd7(new int[]{length, 128, i2});
            float[] fArr = dd7Var2.c;
            float[] fArr2 = dd7Var.c;
            for (int i3 = 0; i3 < length; i3++) {
                int[] iArrX = hpe.b.x(strArr[i3]);
                for (int i4 = 0; i4 < 128; i4++) {
                    System.arraycopy(fArr2, iArrX[i4] * i2, fArr, (i2 * i4) + (i2 * 128 * i3), i2);
                }
            }
            return dd7Var2;
        } catch (Throwable th) {
            ec2.a(rv8.class, th);
            return null;
        }
    }

    public static final void w(kx6 kx6Var) {
        ejd ejdVar = kx6Var.e;
        if (ejdVar != null) {
            kx6Var.v.invoke(uid.a((uid) kx6Var.d.b, null, 0L, 3));
            zid zidVar = ejdVar.a;
            AtomicReference atomicReference = zidVar.b;
            while (true) {
                if (atomicReference.compareAndSet(ejdVar, null)) {
                    zidVar.a.e();
                    break;
                } else if (atomicReference.get() != ejdVar) {
                    break;
                }
            }
        }
        kx6Var.e = null;
    }

    public static final i04 x(Enum[] enumArr) {
        enumArr.getClass();
        return new i04(enumArr);
    }

    public static final boolean y(long j2, long j3) {
        return j2 == j3;
    }

    public static yx z(ly lyVar, y05 y05Var) {
        Object next;
        y05Var.getClass();
        Iterator it2 = lyVar.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (g76.L(((yx) next).e(), y05Var)) {
                break;
            }
        }
        return (yx) next;
    }

    public abstract long C();
}

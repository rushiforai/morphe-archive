package defpackage;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.util.Patterns;
import android.util.TypedValue;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.models.HighlightType;
import com.medium.android.core.navigation.HighlightReference;
import com.medium.android.domain.post.models.Highlight;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class sgg {
    public static final d1g l;
    public static final d1g m;
    public static final d1g n;
    public static final d1g o;
    public static final d1g p;
    public static final mz1 a = new mz1(new a02(13), false, -427644878);
    public static final mz1 b = new mz1(new zz1(5), false, 91041723);
    public static final mz1 c = new mz1(new j02(8), false, -187784421);
    public static final mz1 d = new mz1(new j02(9), false, -1024579364);
    public static final mz1 e = new mz1(new j02(10), false, -1338237854);
    public static final mz1 f = new mz1(new u02(6), false, -1788479125);
    public static final mz1 g = new mz1(new u02(7), false, -1665197459);
    public static final mz1 h = new mz1(new m02(28), false, 456366450);
    public static final mz1 i = new mz1(new m02(29), false, -1629476365);
    public static final u44 j = new u44(0);
    public static final Object k = new Object();
    public static final dq1 q = new dq1(27);

    static {
        boolean z = false;
        int i2 = 16;
        l = new d1g(i2, "STATE_REG", z);
        m = new d1g(i2, "STATE_COMPLETED", z);
        n = new d1g(i2, "STATE_CANCELLED", z);
        o = new d1g(i2, "NO_RESULT", z);
        p = new d1g(i2, "PARAM_CLAUSE_0", z);
    }

    public static final zwa A(hp6 hp6Var) {
        hp6 hp6VarY = hp6Var.y();
        return hp6VarY != null ? hp6VarY.H(hp6Var, true) : new zwa(0.0f, 0.0f, (int) (hp6Var.j() >> 32), (int) (hp6Var.j() & 4294967295L));
    }

    public static final zwa B(hp6 hp6Var, boolean z) {
        hp6 hp6VarK = K(hp6Var);
        float fJ = (int) (hp6VarK.j() >> 32);
        float fJ2 = (int) (hp6VarK.j() & 4294967295L);
        zwa zwaVarH = hp6VarK.H(hp6Var, z);
        float f2 = zwaVarH.a;
        if (z) {
            if (f2 < 0.0f) {
                f2 = 0.0f;
            }
            if (f2 > fJ) {
                f2 = fJ;
            }
        }
        float f3 = zwaVarH.b;
        if (z) {
            if (f3 < 0.0f) {
                f3 = 0.0f;
            }
            if (f3 > fJ2) {
                f3 = fJ2;
            }
        }
        float f4 = zwaVarH.c;
        if (z) {
            if (f4 < 0.0f) {
                f4 = 0.0f;
            }
            if (f4 <= fJ) {
                fJ = f4;
            }
            f4 = fJ;
        }
        float f5 = zwaVarH.d;
        if (z) {
            float f6 = f5 >= 0.0f ? f5 : 0.0f;
            if (f6 <= fJ2) {
                fJ2 = f6;
            }
            f5 = fJ2;
        }
        if (f2 == f4 || f3 == f5) {
            return zwa.e;
        }
        long jD = hp6VarK.d((((long) Float.floatToRawIntBits(f2)) << 32) | (((long) Float.floatToRawIntBits(f3)) & 4294967295L));
        long jD2 = hp6VarK.d((((long) Float.floatToRawIntBits(f4)) << 32) | (((long) Float.floatToRawIntBits(f3)) & 4294967295L));
        long jD3 = hp6VarK.d((((long) Float.floatToRawIntBits(f4)) << 32) | (((long) Float.floatToRawIntBits(f5)) & 4294967295L));
        long jD4 = hp6VarK.d((((long) Float.floatToRawIntBits(f5)) & 4294967295L) | (((long) Float.floatToRawIntBits(f2)) << 32));
        float fIntBitsToFloat = Float.intBitsToFloat((int) (jD >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jD2 >> 32));
        float fIntBitsToFloat3 = Float.intBitsToFloat((int) (jD4 >> 32));
        float fIntBitsToFloat4 = Float.intBitsToFloat((int) (jD3 >> 32));
        float fMin = Math.min(fIntBitsToFloat, Math.min(fIntBitsToFloat2, Math.min(fIntBitsToFloat3, fIntBitsToFloat4)));
        float fMax = Math.max(fIntBitsToFloat, Math.max(fIntBitsToFloat2, Math.max(fIntBitsToFloat3, fIntBitsToFloat4)));
        float fIntBitsToFloat5 = Float.intBitsToFloat((int) (jD & 4294967295L));
        float fIntBitsToFloat6 = Float.intBitsToFloat((int) (jD2 & 4294967295L));
        float fIntBitsToFloat7 = Float.intBitsToFloat((int) (jD4 & 4294967295L));
        float fIntBitsToFloat8 = Float.intBitsToFloat((int) (jD3 & 4294967295L));
        return new zwa(fMin, Math.min(fIntBitsToFloat5, Math.min(fIntBitsToFloat6, Math.min(fIntBitsToFloat7, fIntBitsToFloat8))), fMax, Math.max(fIntBitsToFloat5, Math.max(fIntBitsToFloat6, Math.max(fIntBitsToFloat7, fIntBitsToFloat8))));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [jta, o12] */
    /* JADX WARN: Type inference failed for: r6v0, types: [java.lang.Integer] */
    /* JADX WARN: Type inference failed for: r6v1 */
    /* JADX WARN: Type inference failed for: r6v2, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r6v3, types: [k65] */
    /* JADX WARN: Type inference failed for: r6v7, types: [java.lang.Integer] */
    public static final List C(igc igcVar, Integer num, int i2, Integer num2) {
        int iD;
        int iR;
        x68 x68Var;
        if (igcVar.w || igcVar.o() == 0) {
            return ey3.a;
        }
        ?? jtaVar = new jta(igcVar);
        if (num2 != null) {
            iD = num2.intValue();
        } else {
            iD = igcVar.v;
            if (iD < 0) {
                iD = igcVar.D(i2, igcVar.b);
            }
        }
        if (num == 0) {
            int iM = igcVar.i - igcVar.M(igcVar.q(i2), igcVar.b);
            k68 k68Var = igcVar.s;
            num = Integer.valueOf(iM + ((k68Var == null || (x68Var = (x68) k68Var.b(i2)) == null) ? 0 : x68Var.b));
        }
        int iQ = igcVar.q(i2) * 5;
        int[] iArr = igcVar.b;
        if (iQ < iArr.length) {
            iR = igcVar.r(i2);
        } else {
            int iD2 = iD >= 0 ? igcVar.D(iD, iArr) : iD;
            iR = igcVar.r(iD);
            int i3 = iD;
            iD = iD2;
            i2 = i3;
        }
        while (i2 >= 0) {
            jtaVar.g(iR, (igcVar.b[(igcVar.q(i2) * 5) + 1] & 536870912) != 0 ? igcVar.s(i2) : w12.a, igcVar.N(i2), num);
            num = igcVar.b(i2);
            if (iD >= 0) {
                int iD3 = igcVar.D(iD, igcVar.b);
                iR = igcVar.r(iD);
                int i4 = iD;
                iD = iD3;
                i2 = i4;
            } else {
                i2 = iD;
            }
        }
        return jtaVar.a;
    }

    public static final String E(String str) {
        char cCharAt;
        str.getClass();
        if (str.length() == 0 || 'a' > (cCharAt = str.charAt(0)) || cCharAt >= '{') {
            return str;
        }
        StringBuilder sb = new StringBuilder(str.length());
        sb.append(Character.toUpperCase(cCharAt));
        sb.append((CharSequence) str, 1, str.length());
        return sb.toString();
    }

    public static final void F(int i2, int i3) {
        if (i2 < 0 || i2 >= i3) {
            z10.i(ev6.v("index: ", i2, i3, ", size: "));
        }
    }

    public static final void G(int i2, int i3) {
        if (i2 < 0 || i2 > i3) {
            z10.i(ev6.v("index: ", i2, i3, ", size: "));
        }
    }

    public static final void H(int i2, int i3, int i4) {
        if (i2 < 0 || i3 > i4) {
            ik4.e(i4, ev6.B(i2, i3, "fromIndex: ", ", toIndex: ", ", size: "));
        } else {
            if (i2 <= i3) {
                return;
            }
            ay0.e(ev6.v("fromIndex: ", i2, i3, " > toIndex: "));
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x004b, code lost:
    
        if (defpackage.nk7.l0(r0.getWidth(), r0.getHeight(), (int) (r4 >> 32), (int) (r4 & 4294967295L), r11) == 1.0d) goto L16;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static android.graphics.Bitmap I(android.graphics.drawable.Drawable r8, android.graphics.Bitmap.Config r9, defpackage.cfc r10, defpackage.dqb r11, boolean r12) {
        /*
            boolean r0 = r8 instanceof android.graphics.drawable.BitmapDrawable
            r1 = 4294967295(0xffffffff, double:2.1219957905E-314)
            r3 = 32
            if (r0 == 0) goto L4e
            r0 = r8
            android.graphics.drawable.BitmapDrawable r0 = (android.graphics.drawable.BitmapDrawable) r0
            android.graphics.Bitmap r0 = r0.getBitmap()
            android.graphics.Bitmap$Config r4 = r0.getConfig()
            if (r9 == 0) goto L21
            boolean r5 = defpackage.u36.n(r9)
            if (r5 == 0) goto L1f
            goto L21
        L1f:
            r5 = r9
            goto L23
        L21:
            android.graphics.Bitmap$Config r5 = android.graphics.Bitmap.Config.ARGB_8888
        L23:
            if (r4 != r5) goto L4e
            if (r12 == 0) goto L28
            goto L4d
        L28:
            int r12 = r0.getWidth()
            int r4 = r0.getHeight()
            cfc r5 = defpackage.cfc.c
            long r4 = defpackage.nk7.k0(r12, r4, r10, r11, r5)
            long r6 = r4 >> r3
            int r12 = (int) r6
            long r4 = r4 & r1
            int r4 = (int) r4
            int r5 = r0.getWidth()
            int r6 = r0.getHeight()
            double r4 = defpackage.nk7.l0(r5, r6, r12, r4, r11)
            r6 = 4607182418800017408(0x3ff0000000000000, double:1.0)
            int r12 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
            if (r12 != 0) goto L4e
        L4d:
            return r0
        L4e:
            android.graphics.drawable.Drawable r8 = r8.mutate()
            int r12 = defpackage.spe.b(r8)
            r0 = 512(0x200, float:7.17E-43)
            if (r12 <= 0) goto L5b
            goto L5c
        L5b:
            r12 = r0
        L5c:
            int r4 = defpackage.spe.a(r8)
            if (r4 <= 0) goto L63
            r0 = r4
        L63:
            cfc r4 = defpackage.cfc.c
            long r4 = defpackage.nk7.k0(r12, r0, r10, r11, r4)
            long r6 = r4 >> r3
            int r10 = (int) r6
            long r1 = r1 & r4
            int r1 = (int) r1
            double r10 = defpackage.nk7.l0(r12, r0, r10, r1, r11)
            double r1 = (double) r12
            double r1 = r1 * r10
            int r12 = defpackage.nk7.v0(r1)
            double r0 = (double) r0
            double r10 = r10 * r0
            int r10 = defpackage.nk7.v0(r10)
            if (r9 == 0) goto L86
            boolean r11 = defpackage.u36.n(r9)
            if (r11 == 0) goto L88
        L86:
            android.graphics.Bitmap$Config r9 = android.graphics.Bitmap.Config.ARGB_8888
        L88:
            android.graphics.Bitmap r9 = android.graphics.Bitmap.createBitmap(r12, r10, r9)
            android.graphics.Rect r11 = r8.getBounds()
            int r0 = r11.left
            int r1 = r11.top
            int r2 = r11.right
            int r11 = r11.bottom
            r3 = 0
            r8.setBounds(r3, r3, r12, r10)
            android.graphics.Canvas r10 = new android.graphics.Canvas
            r10.<init>(r9)
            r8.draw(r10)
            r8.setBounds(r0, r1, r2, r11)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sgg.I(android.graphics.drawable.Drawable, android.graphics.Bitmap$Config, cfc, dqb, boolean):android.graphics.Bitmap");
    }

    public static final bo4 J(bo4 bo4Var, long j2) {
        if (j2 < 0) {
            ay0.e("Debounce timeout should not be negative");
            return null;
        }
        if (j2 == 0) {
            return bo4Var;
        }
        return new u50(6, new oo4(new ro(3, j2), bo4Var, null));
    }

    public static final hp6 K(hp6 hp6Var) {
        hp6 hp6Var2;
        hp6 hp6VarY = hp6Var.y();
        while (true) {
            hp6 hp6Var3 = hp6VarY;
            hp6Var2 = hp6Var;
            hp6Var = hp6Var3;
            if (hp6Var == null) {
                break;
            }
            hp6VarY = hp6Var.y();
        }
        eh8 eh8Var = hp6Var2 instanceof eh8 ? (eh8) hp6Var2 : null;
        if (eh8Var == null) {
            return hp6Var2;
        }
        eh8 eh8Var2 = eh8Var.q;
        while (true) {
            eh8 eh8Var3 = eh8Var2;
            eh8 eh8Var4 = eh8Var;
            eh8Var = eh8Var3;
            if (eh8Var == null) {
                return eh8Var4;
            }
            eh8Var2 = eh8Var.q;
        }
    }

    public static final Integer L(egc egcVar, l22 l22Var, int i2, int i3) {
        Integer numL;
        int[] iArr = egcVar.b;
        while (true) {
            if (i2 >= i3) {
                return null;
            }
            int i4 = iArr[(i2 * 5) + 3] + i2;
            if (egcVar.j(i2) && egcVar.i(i2) == 206 && g76.L(egcVar.p(i2, iArr), b22.e)) {
                Object objH = egcVar.h(i2, 0);
                t65 t65Var = objH instanceof t65 ? (t65) objH : null;
                p3b p3bVar = t65Var != null ? t65Var.a : null;
                m65 m65Var = p3bVar instanceof m65 ? (m65) p3bVar : null;
                if (m65Var != null && m65Var.a == l22Var) {
                    return Integer.valueOf(i2);
                }
            }
            if (egcVar.d(i2) && (numL = L(egcVar, l22Var, i2 + 1, i4)) != null) {
                return Integer.valueOf(numL.intValue());
            }
            i2 = i4;
        }
    }

    public static void N(Context context) {
        context.getClass();
        if (ys0.a() != null) {
            ys0.a();
            return;
        }
        ys0 ys0Var = new ys0(context);
        Set set = ec2.a;
        if (!set.contains(ys0.class)) {
            try {
                if (!set.contains(ys0Var)) {
                    try {
                        iq1.C((Context) ys0Var.b).L(ys0Var, new IntentFilter("com.parse.bolts.measurement_event"));
                    } catch (Throwable th) {
                        ec2.a(ys0Var, th);
                    }
                }
            } catch (Throwable th2) {
                ec2.a(ys0.class, th2);
            }
        }
        if (!ec2.a.contains(ys0.class)) {
            try {
                ys0.c = ys0Var;
            } catch (Throwable th3) {
                ec2.a(ys0.class, th3);
            }
        }
        ys0.a();
    }

    public static final int O(d80 d80Var, Object obj, int i2) {
        int i3 = d80Var.c;
        if (i3 == 0) {
            return -1;
        }
        try {
            int iC = vc2.C(i3, i2, d80Var.a);
            if (iC < 0 || g76.L(obj, d80Var.b[iC])) {
                return iC;
            }
            int i4 = iC + 1;
            while (i4 < i3 && d80Var.a[i4] == i2) {
                if (g76.L(obj, d80Var.b[i4])) {
                    return i4;
                }
                i4++;
            }
            for (int i5 = iC - 1; i5 >= 0 && d80Var.a[i5] == i2; i5--) {
                if (g76.L(obj, d80Var.b[i5])) {
                    return i5;
                }
            }
            return ~i4;
        } catch (IndexOutOfBoundsException unused) {
            z10.g();
            return 0;
        }
    }

    public static final boolean P(q4a q4aVar) {
        q4aVar.getClass();
        return q4aVar.b() == null;
    }

    public static final boolean Q(int i2, String str) {
        char cCharAt = str.charAt(i2);
        return 'A' <= cCharAt && cCharAt < '[';
    }

    public static r28 R(r28 r28Var, c09 c09Var, xd xdVar, w82 w82Var, float f2, bs0 bs0Var, int i2) {
        if ((i2 & 4) != 0) {
            xdVar = z46.h;
        }
        xd xdVar2 = xdVar;
        if ((i2 & 16) != 0) {
            f2 = 1.0f;
        }
        return r28Var.b(new d09(c09Var, xdVar2, w82Var, f2, bs0Var));
    }

    public static final ug7 T(f7 f7Var, x45 x45Var, x12 x12Var, int i2) {
        f7 f7Var2;
        qo7.y(f7Var, x12Var);
        l78 l78VarY = qo7.y(x45Var, x12Var);
        Object[] objArr = new Object[0];
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = new n7(1);
            p65Var.j0(objM);
        }
        String str = (String) hp7.E(objArr, (m45) objM, p65Var, 48);
        v7 v7Var = (v7) p65Var.j(s57.a);
        if (v7Var == null) {
            p65Var.Y(1213380307);
            Object baseContext = (Context) p65Var.j(eo.b);
            while (true) {
                if (!(baseContext instanceof ContextWrapper)) {
                    baseContext = null;
                    break;
                }
                if (baseContext instanceof v7) {
                    break;
                }
                baseContext = ((ContextWrapper) baseContext).getBaseContext();
            }
            v7Var = (v7) baseContext;
        } else {
            p65Var.Y(1213379439);
        }
        p65Var.p(false);
        if (v7Var == null) {
            ygf.f("No ActivityResultRegistryOwner was provided via LocalActivityResultRegistryOwner");
            return null;
        }
        r7 activityResultRegistry = v7Var.getActivityResultRegistry();
        Object objM2 = p65Var.M();
        if (objM2 == uobVar) {
            objM2 = new l7();
            p65Var.j0(objM2);
        }
        l7 l7Var = (l7) objM2;
        Object objM3 = p65Var.M();
        if (objM3 == uobVar) {
            objM3 = new ug7(l7Var);
            p65Var.j0(objM3);
        }
        ug7 ug7Var = (ug7) objM3;
        boolean zH = p65Var.h(l7Var) | p65Var.h(activityResultRegistry) | p65Var.f(str) | p65Var.h(f7Var) | p65Var.f(l78VarY);
        Object objM4 = p65Var.M();
        if (zH || objM4 == uobVar) {
            f7Var2 = f7Var;
            objM4 = new s7(l7Var, activityResultRegistry, str, f7Var2, l78VarY, 0);
            p65Var.j0(objM4);
        } else {
            f7Var2 = f7Var;
        }
        x45 x45Var2 = (x45) objM4;
        boolean zF = p65Var.f(activityResultRegistry) | p65Var.f(str) | p65Var.f(f7Var2);
        Object objM5 = p65Var.M();
        if (zF || objM5 == uobVar) {
            objM5 = new uh3(x45Var2);
            p65Var.j0(objM5);
        }
        return ug7Var;
    }

    public static TypedValue U(Resources.Theme theme, int i2) {
        TypedValue typedValue = new TypedValue();
        if (theme.resolveAttribute(i2, typedValue, true)) {
            return typedValue;
        }
        return null;
    }

    public static boolean V(Resources.Theme theme, int i2, boolean z) {
        TypedValue typedValueU = U(theme, i2);
        return (typedValueU == null || typedValueU.type != 18) ? z : typedValueU.data != 0;
    }

    public static int W(Context context, int i2, int i3) {
        TypedValue typedValueU = U(context.getTheme(), i2);
        return (typedValueU == null || typedValueU.type != 16) ? i3 : typedValueU.data;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object X(defpackage.m45 r5, defpackage.b55 r6, defpackage.p92 r7) {
        /*
            boolean r0 = r7 instanceof defpackage.ok
            if (r0 == 0) goto L13
            r0 = r7
            ok r0 = (defpackage.ok) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            ok r0 = new ok
            r0.<init>(r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r7)     // Catch: androidx.compose.material.AnchoredDragFinishedSignal -> L40
            goto L40
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r7)
            wk r7 = new wk     // Catch: androidx.compose.material.AnchoredDragFinishedSignal -> L40
            r2 = 0
            r7.<init>(r5, r6, r3, r2)     // Catch: androidx.compose.material.AnchoredDragFinishedSignal -> L40
            r0.c = r4     // Catch: androidx.compose.material.AnchoredDragFinishedSignal -> L40
            java.lang.Object r5 = defpackage.o7f.s(r7, r0)     // Catch: androidx.compose.material.AnchoredDragFinishedSignal -> L40
            if (r5 != r1) goto L40
            return r1
        L40:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sgg.X(m45, b55, p92):java.lang.Object");
    }

    public static final r28 Z(r28 r28Var, mya myaVar, mt2 mt2Var, gid gidVar, ta2 ta2Var) {
        return r28Var.b(new mhd(myaVar, mt2Var, gidVar, ta2Var));
    }

    public static final void a(fj1 fj1Var, bo4 bo4Var, si1 si1Var, ye1 ye1Var, x12 x12Var, int i2) {
        p65 p65Var;
        int i3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-2048400403);
        int i4 = i2 | (p65Var2.f(fj1Var) ? 4 : 2) | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.f(si1Var) ? 256 : 128) | (p65Var2.f(ye1Var) ? 2048 : 1024);
        if (p65Var2.P(i4 & 1, (i4 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var2);
            h70 h70Var = new h70(24.0f, true, new z10(21));
            jy8 jy8VarG = w2g.g(1, 0.0f);
            boolean z = ((i4 & 14) == 4) | ((i4 & 7168) == 2048);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new i0(fj1Var, 22, ye1Var);
                p65Var2.j0(objM);
            }
            k40.t(null, kv6VarA, jy8VarG, h70Var, null, null, false, null, (x45) objM, p65Var2, 24960, 489);
            p65Var = p65Var2;
            int i5 = i4 & 896;
            boolean zF = p65Var.f(kv6VarA) | (i5 == 256);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (zF || objM2 == uobVar) {
                objM2 = new r91(kv6VarA, si1Var, n92Var, 2);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6VarA);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                i3 = 1;
                objM3 = bjc.b(new f91(kv6VarA, i3));
                p65Var.j0(objM3);
            } else {
                i3 = 1;
            }
            upc upcVar = (upc) objM3;
            Boolean bool = (Boolean) upcVar.getValue();
            bool.booleanValue();
            if (i5 != 256) {
                i3 = 0;
            }
            Object objM4 = p65Var.M();
            if (i3 != 0 || objM4 == uobVar) {
                objM4 = new rc0(si1Var, upcVar, n92Var, 3);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, bool);
            boolean zH = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar) {
                objM5 = new wi1(bo4Var, kv6VarA, n92Var, 0);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 19, fj1Var, bo4Var, si1Var, ye1Var);
        }
    }

    public static final String a0(String str) {
        str.getClass();
        StringBuilder sb = new StringBuilder(str.length());
        int length = str.length();
        for (int i2 = 0; i2 < length; i2++) {
            char cCharAt = str.charAt(i2);
            if ('A' <= cCharAt && cCharAt < '[') {
                cCharAt = Character.toLowerCase(cCharAt);
            }
            sb.append(cCharAt);
        }
        return sb.toString();
    }

    public static final void b(b24 b24Var, si1 si1Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1908584082);
        int i3 = i2 | (p65Var.f(b24Var) ? 4 : 2) | (p65Var.f(si1Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            rh4 rh4Var = jfc.c;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                sc0 sc0Var = new sc0(0, si1Var, si1.class, "onRefresh", "onRefresh()V", 0, 24);
                p65Var.j0(sc0Var);
                objM = sc0Var;
            }
            iq7.a(b24Var, rh4Var, null, null, null, null, (m45) ((qh6) objM), null, p65Var, (i3 & 14) | 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 13, b24Var, si1Var, r28Var);
        }
    }

    public static y05 b0(n98 n98Var) {
        n98Var.getClass();
        String strB = n98Var.b();
        strB.getClass();
        return new y05(new z05(strB, y05.c.a, n98Var));
    }

    public static final void c(r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(172142052);
        int i4 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        boolean z = false;
        int i5 = 10;
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            float f2 = 24.0f;
            r28 r28VarG = w2g.G(r28Var, 0.0f, 24.0f, 0.0f, 0.0f, 13);
            wv1 wv1VarA = uv1.a(new h70(24.0f, true, new z10(21)), z46.p, p65Var, 6);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-1058080502);
            int iR = 0;
            while (iR < i5) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, z);
                long j3 = p65Var.T;
                int i7 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var, cuVar, zk7VarC);
                cu cuVar2 = q12.e;
                tp7.B(p65Var, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i7);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                float f3 = f2;
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, z);
                long j4 = p65Var.T;
                int i8 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                f2 = f3;
                s42.e(oe1.S, w2g.G(o28Var, f3, 0.0f, f3, 0.0f, 10), 0L, p65Var, 54, 4);
                iR = wgd.r(p65Var, true, true, iR, 1);
                i5 = 10;
                z = false;
            }
            i3 = i5;
            p65Var.p(z);
            p65Var.p(true);
        } else {
            i3 = 10;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, i3);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [jta, o12] */
    /* JADX WARN: Type inference failed for: r9v0, types: [java.lang.Integer] */
    /* JADX WARN: Type inference failed for: r9v1, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r9v3 */
    /* JADX WARN: Type inference failed for: r9v4 */
    /* JADX WARN: Type inference failed for: r9v5 */
    public static final ArrayList c0(egc egcVar, int i2, Integer num) {
        ?? jtaVar = new jta(egcVar);
        int iQ = egcVar.q(i2);
        k65 k65VarA = egcVar.a(i2);
        while (i2 >= 0) {
            jtaVar.g(egcVar.i(i2), egcVar.k(i2) ? egcVar.p(i2, egcVar.b) : w12.a, egcVar.a.r(i2), num);
            if (iQ >= 0) {
                k65 k65Var = k65VarA;
                k65VarA = egcVar.a(iQ);
                i2 = iQ;
                iQ = egcVar.q(iQ);
                num = k65Var;
            } else {
                i2 = iQ;
                num = k65VarA;
            }
        }
        return jtaVar.a;
    }

    public static final void d(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1637076734);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            gq7.a(jfc.c, null, vo7.R(p65Var, R.string.search_catalogs_none_found), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 6, 0, 2042);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 11);
        }
    }

    public static final void e(fj1 fj1Var, bo4 bo4Var, si1 si1Var, ye1 ye1Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1268735462);
        int i3 = i2 | (p65Var.f(fj1Var) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(si1Var) ? 256 : 128) | (p65Var.f(ye1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            boolean z = fj1Var.b;
            boolean z2 = (i3 & 896) == 256;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                sc0 sc0Var = new sc0(0, si1Var, si1.class, "onRefresh", "onRefresh()V", 0, 25);
                p65Var.j0(sc0Var);
                objM = sc0Var;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(2090041384, new fd3(fj1Var, bo4Var, si1Var, ye1Var, 26), p65Var), p65Var, (i3 >> 6) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(fj1Var, bo4Var, si1Var, ye1Var, r28Var, i2, 11);
        }
    }

    public static final void g(bo4 bo4Var, String str, bo4 bo4Var2, fub fubVar, r28 r28Var, mj1 mj1Var, x12 x12Var, int i2) {
        r28 r28Var2;
        mj1 mj1Var2;
        mj1 mj1Var3;
        int i3;
        r28 r28Var3;
        mj1 mj1Var4;
        str.getClass();
        bo4Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1372226241);
        int i4 = i2 | (p65Var.h(bo4Var) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(bo4Var2) ? 256 : 128) | (p65Var.f(fubVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 90112;
        int i5 = 0;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean zH = p65Var.h(bo4Var) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (zH || objM == uobVar) {
                    objM = new ui1(bo4Var, str, i5);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    mj1Var3 = (mj1) to7.z(n1b.a.b(mj1.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-458753);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-458753);
                r28Var3 = r28Var;
                mj1Var3 = mj1Var;
            }
            p65Var.q();
            Context context = (Context) p65Var.j(eo.b);
            l78 l78VarZ = guc.z(mj1Var3.m, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            aj1 aj1Var = new aj1(mj1Var3, fubVar, context);
            m50 m50Var = new m50(mj1Var3, fubVar, context, 15);
            f((gj1) l78VarZ.getValue(), nhcVarF, bo4Var2, aj1Var, m50Var, r28Var3, p65Var, (i3 & 896) | 196608, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            boolean zH2 = p65Var.h(mj1Var3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(m50Var) | p65Var.f(aj1Var);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar) {
                mj1Var4 = mj1Var3;
                objM3 = new yu(mj1Var4, nhcVarF, sb2Var, resources, m50Var, aj1Var, null, 3);
                p65Var.j0(objM3);
            } else {
                mj1Var4 = mj1Var3;
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            r28Var2 = r28Var3;
            mj1Var2 = mj1Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            mj1Var2 = mj1Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 5, r28Var2, (que) mj1Var2, (Object) bo4Var, (Object) bo4Var2, (Object) fubVar, str);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:124:0x02cc  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x02d0  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x031d  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0321  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x0352  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0356  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x03e3  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x03e5  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x03f5  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x0418  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x041a  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x0423  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x0447  */
    /* JADX WARN: Removed duplicated region for block: B:156:0x0454  */
    /* JADX WARN: Removed duplicated region for block: B:158:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0101  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0119  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0130  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0142  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0166  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0179  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0193  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01a6  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x01f9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void h(defpackage.xm1 r31, final defpackage.rm1 r32, final defpackage.qm1 r33, final defpackage.r28 r34, long r35, boolean r37, defpackage.m3c r38, defpackage.x12 r39, final int r40, final int r41) {
        /*
            Method dump skipped, instruction units count: 1126
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sgg.h(xm1, rm1, qm1, r28, long, boolean, m3c, x12, int, int):void");
    }

    public static final void i(int i2, boolean z, r28 r28Var, x12 x12Var, int i3) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-86982485);
        int i4 = 4;
        int i5 = (p65Var.d(i2) ? 4 : 2) | i3 | (p65Var.g(z) ? 32 : 16) | 384;
        int i6 = 0;
        if (p65Var.P(i5 & 1, (i5 & 147) != 146)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = yi2.h(60.0f);
                p65Var.j0(objM);
            }
            ou ouVar = (ou) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = yi2.h(0.0f);
                p65Var.j0(objM2);
            }
            ou ouVar2 = (ou) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = yi2.h(1.0f);
                p65Var.j0(objM3);
            }
            ou ouVar3 = (ou) objM3;
            Boolean boolValueOf = Boolean.valueOf(z);
            boolean zH = p65Var.h(ouVar) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.h(ouVar2) | p65Var.c(60.0f);
            Object objM4 = p65Var.M();
            n92 n92Var = null;
            if (zH || objM4 == uobVar) {
                objM4 = new om1(z, ouVar, ouVar2, (n92) null);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, boolValueOf);
            Integer numValueOf = Integer.valueOf(i2);
            boolean zH2 = p65Var.h(ouVar2) | p65Var.h(ouVar3);
            Object objM5 = p65Var.M();
            if (zH2 || objM5 == uobVar) {
                objM5 = new pm1(ouVar2, ouVar3, n92Var, i6);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, numValueOf);
            if (((Number) ouVar2.d()).floatValue() > 0.0f || z) {
                p65Var.Y(-1428164951);
                tr.a(new pkf(ouVar), null, new hd9(25), pxf.E(2103009124, new s(ouVar2, ouVar3, i2, i4), p65Var), p65Var, 3456, 2);
            } else {
                p65Var.Y(-1439347209);
            }
            p65Var.p(false);
            r28Var = o28.b;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jm1(i2, z, r28Var, i3);
        }
    }

    public static final void j(int i2, rm1 rm1Var, long j2, xm1 xm1Var, m45 m45Var, r28 r28Var, boolean z, x12 x12Var, int i3) {
        int i4;
        r28 r28Var2;
        boolean z2;
        long jB;
        char c2;
        r28 r28VarR;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(152840445);
        if ((i3 & 6) == 0) {
            i4 = (p65Var.d(i2) ? 4 : 2) | i3;
        } else {
            i4 = i3;
        }
        if ((i3 & 48) == 0) {
            i4 |= p65Var.d(rm1Var.ordinal()) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i4 |= p65Var.e(j2) ? 256 : 128;
        }
        if ((i3 & 3072) == 0) {
            i4 |= p65Var.f(xm1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i3 & 24576) == 0) {
            i4 |= p65Var.h(m45Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        int i5 = i4 | 196608;
        if ((1572864 & i3) == 0) {
            i5 |= p65Var.g(z) ? 1048576 : 524288;
        }
        if (p65Var.P(i5 & 1, (599187 & i5) != 599186)) {
            boolean z3 = xm1Var instanceof sm1;
            if (z3 || (xm1Var instanceof tm1)) {
                z2 = true;
            } else {
                if (!(xm1Var instanceof um1) && !(xm1Var instanceof wm1) && !(xm1Var instanceof vm1)) {
                    ygf.a();
                    return;
                }
                z2 = false;
            }
            int i6 = R.drawable.ic_clap_filled_24;
            if (z2 && i2 <= 0) {
                i6 = R.drawable.ic_clap_24;
            }
            if (z2) {
                p65Var.Y(850803554);
                p65Var.p(false);
                jB = j2;
            } else {
                p65Var.Y(850802695);
                jB = uu1.b(0.4f, j2);
                p65Var.p(false);
            }
            r28Var2 = o28.b;
            if (z3 && z) {
                p65Var.Y(605465287);
                int i7 = 14;
                r28 r28VarD = er7.D(r40.y(r28Var2, bmb.a), m45Var, false, 14);
                vkb vkbVar = new vkb(0);
                c2 = ' ';
                Object objM = p65Var.M();
                if (objM == w12.a) {
                    objM = new n7(i7);
                    p65Var.j0(objM);
                }
                r28VarR = hlg.r(r28VarD, false, null, vkbVar, (m45) objM, 11);
                p65Var.p(false);
            } else {
                c2 = ' ';
                p65Var.Y(605611669);
                p65Var.p(false);
                r28VarR = r28Var2;
            }
            r28 r28VarN = bgf.N(jfc.f(r28VarR, 48.0f, 0.0f, 2), "clap_button");
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j3 = p65Var.T;
            int i8 = (int) (j3 ^ (j3 >>> c2));
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarN);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i8));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            qv5.b(vn7.J(i6, 0, p65Var), vo7.R(p65Var, R.string.common_clap), bgf.N(jfc.l(r28Var2, rm1Var.m146getSizeD9Ej5fM()), "clap_icon"), jB, p65Var, 8, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new km1(i2, rm1Var, j2, xm1Var, m45Var, r28Var2, z, i3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:82:0x0117  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0138  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x01f2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void k(final java.lang.String r31, final long r32, final boolean r34, final defpackage.qm1 r35, final defpackage.xm1 r36, final defpackage.r28 r37, defpackage.x12 r38, final int r39) {
        /*
            Method dump skipped, instruction units count: 527
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sgg.k(java.lang.String, long, boolean, qm1, xm1, r28, x12, int):void");
    }

    public static final void l(String str, m45 m45Var, b55 b55Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        r28 r28Var2;
        String string;
        m45Var.getClass();
        b55Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(973809180);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(str) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.h(m45Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.h(b55Var) ? 256 : 128;
        }
        int i5 = i3 | 3072;
        if (p65Var2.P(i5 & 1, (i5 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                if (str == null || (string = muc.y0(str).toString()) == null) {
                    string = "";
                }
                objM = qo7.u(new uid(string, 6, 0L));
                p65Var2.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = qo7.u(new uid("", 6, 0L));
                p65Var2.j0(objM2);
            }
            l78 l78Var2 = (l78) objM2;
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(gt7.DEFAULT);
                p65Var2.j0(objM3);
            }
            l78 l78Var3 = (l78) objM3;
            Object objM4 = p65Var2.M();
            if (objM4 == uobVar) {
                objM4 = ka1.g(p65Var2);
            }
            long j2 = ((zo7) p65Var2.j(kt7.b)).a;
            r28Var2 = o28.b;
            p65Var = p65Var2;
            hlg.a(m45Var, pxf.E(-1671332652, new swe(b55Var, l78Var, l78Var2, l78Var3), p65Var2), r28Var2, pxf.E(428405778, new c60(i4, m45Var), p65Var2), null, f76.c, pxf.E(-716953873, new e45(b55Var, (sr4) objM4, l78Var, l78Var2, l78Var3, 13), p65Var2), null, j2, 0L, 0L, 0L, null, p65Var, ((i5 >> 3) & 14) | 1772976, 0, 16016);
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 13, str, m45Var, b55Var, r28Var2);
        }
    }

    public static final void m(b55 b55Var, l78 l78Var, l78 l78Var2, l78 l78Var3) {
        Object string = muc.y0(((uid) l78Var.getValue()).a.b).toString();
        String str = ((uid) l78Var2.getValue()).a.b;
        Pattern pattern = Patterns.EMAIL_ADDRESS;
        if (pattern.matcher(str).matches()) {
            b55Var.invoke(string, "mailto:" + str);
        } else {
            if (tuc.N(str, "mailto:", false)) {
                if (pattern.matcher(tuc.L(str, "mailto:", "")).matches()) {
                    b55Var.invoke(string, str);
                    return;
                } else {
                    l78Var3.setValue(gt7.ERROR);
                    return;
                }
            }
            if (Patterns.WEB_URL.matcher(str).matches()) {
                b55Var.invoke(string, str);
            } else {
                l78Var3.setValue(gt7.ERROR);
            }
        }
    }

    public static p73 n() {
        return new p73(1.0f, 1.0f);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r11v4 */
    /* JADX WARN: Type inference failed for: r11v5, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r11v6 */
    public static final void o(vk5 vk5Var, dk5 dk5Var, r28 r28Var, x12 x12Var, int i2) {
        dk5 dk5Var2;
        Object obj;
        p65 p65Var;
        az5 az5Var;
        ?? r11;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1055111349);
        int i3 = (i2 & 6) == 0 ? i2 | (p65Var2.f(vk5Var) ? 4 : 2) : i2;
        if ((i2 & 48) == 0) {
            dk5Var2 = dk5Var;
            i3 |= p65Var2.f(dk5Var2) ? 32 : 16;
        } else {
            dk5Var2 = dk5Var;
        }
        int i4 = i3 | 384;
        if (p65Var2.P(i4 & 1, (i4 & 147) != 146)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j2 = p65Var2.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var2, o28Var);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(m45Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, wv1VarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            String str = vk5Var.d;
            List list = vk5Var.h;
            p65 p65Var3 = p65Var2;
            bo.p(str, vk5Var.a, vk5Var.b, vk5Var.f, w2g.D(o28Var, 24.0f, 16.0f), (Highlight) bu1.z0(list), false, 0, null, p65Var3, 14180352, 256);
            ArrayList arrayList = new ArrayList();
            for (Object obj2 : list) {
                if (((Highlight) obj2).getType() == HighlightType.RESPONSE) {
                    arrayList.add(obj2);
                }
            }
            az5 az5VarF0 = bo.f0(arrayList);
            if (az5VarF0.isEmpty()) {
                az5Var = az5VarF0;
                r11 = 0;
                p65Var3.Y(883215553);
            } else {
                p65Var3.Y(890459199);
                tp7.c(0.0f, 6, 6, 0L, p65Var3, w2g.E(o28Var, 24.0f, 0.0f, 2));
                r(az5VarF0, dk5Var2, vk5Var.i, null, p65Var3, i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                az5Var = az5VarF0;
                r11 = 0;
            }
            p65Var3.p(r11);
            ArrayList arrayList2 = new ArrayList();
            for (Object obj3 : list) {
                if (((Highlight) obj3).getUserId() != null) {
                    arrayList2.add(obj3);
                }
            }
            az5 az5VarF02 = bo.f0(arrayList2);
            if (az5VarF02.isEmpty()) {
                p65Var3.Y(883215553);
            } else {
                p65Var3.Y(890845893);
                tp7.c(0.0f, 6, 6, 0L, p65Var3, w2g.E(o28Var, 24.0f, 0.0f, 2));
                u(vk5Var.g, az5VarF02, null, p65Var3, r11);
            }
            p65Var3.p(r11);
            if (az5Var.isEmpty() && az5VarF02.isEmpty()) {
                km4.F(8.0f, 891136270, p65Var3, p65Var3, o28Var);
                p65Var3.p(r11);
            } else {
                km4.F(24.0f, 891078765, p65Var3, p65Var3, o28Var);
                p65Var3.p(r11);
            }
            p65Var3.p(true);
            obj = o28Var;
            p65Var = p65Var3;
        } else {
            p65 p65Var4 = p65Var2;
            p65Var4.S();
            obj = r28Var;
            p65Var = p65Var4;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 26, vk5Var, dk5Var, obj);
        }
    }

    public static final void p(wk5 wk5Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1375820599);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(wk5Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i4 = i3 | 48;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            b24 b24Var = wk5Var.a;
            int i5 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            o28 o28Var = o28.b;
            iq7.a(b24Var, o28Var, null, null, null, null, null, null, p65Var, i5, 252);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(wk5Var, r28Var, i2, 16);
        }
    }

    public static final void q(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1518985407);
        int i3 = i2 | 6;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(jfc.d(o28Var, 1.0f), "loading");
            zk7 zk7VarC = dy0.c(z46.d, false);
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            xz5.o(iy0.a.a(w2g.E(o28Var, 0.0f, 96.0f, 1), z46.h), ((Boolean) p65Var.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 0.0f, 0L, 0L, 0, p65Var, 0, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            p65Var.p(true);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i2, 4);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void r(az5 az5Var, dk5 dk5Var, String str, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(46909128);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(az5Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(dk5Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(str) ? 256 : 128;
        }
        int i4 = i3 | 3072;
        int i5 = 0;
        if (!p65Var2.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        } else {
            if (((t0) az5Var).isEmpty()) {
                mwa mwaVarS = p65Var2.s();
                if (mwaVarS != null) {
                    mwaVarS.d = new ac(i2, 25, az5Var, dk5Var, str);
                    return;
                }
                return;
            }
            Highlight highlight = (Highlight) bu1.x0(az5Var);
            o28 o28Var = o28.b;
            r28 r28VarR = jfc.r(jfc.d(o28Var, 1.0f), 3);
            boolean zF = ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var2.f(highlight) | ((i4 & 896) == 256);
            Object objM = p65Var2.M();
            if (zF || objM == w12.a) {
                objM = new le0(dk5Var, highlight, str, 29);
                p65Var2.j0(objM);
            }
            r28 r28VarD = w2g.D(hlg.r(r28VarR, false, null, null, (m45) objM, 15), 24.0f, 12.0f);
            omb ombVarA = nmb.a(new h70(16.0f, true, new f70(i5, z46.p)), z46.n, p65Var2, 54);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, ombVarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR2);
            c09 c09VarJ = vn7.J(R.drawable.ic_respond_24, 0, p65Var2);
            sn3 sn3Var = kt7.b;
            qv5.b(c09VarJ, null, null, ((zo7) p65Var2.j(sn3Var)).o, p65Var2, 56, 4);
            Integer responseCount = highlight.getResponseCount();
            if (responseCount == null) {
                ay0.e("Response count is required");
                return;
            }
            int iIntValue = responseCount.intValue();
            jjd.b(vo7.D(R.plurals.n_responses, iIntValue, new Object[]{String.valueOf(iIntValue)}, p65Var2), new sq6(1.0f, true), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).m, p65Var2, 0, 0, 131068);
            p65Var = p65Var2;
            qv5.b(vn7.J(R.drawable.ic_chevron_forward, 0, p65Var), null, null, ((zo7) p65Var.j(sn3Var)).n, p65Var, 56, 4);
            p65Var.p(true);
            r28Var2 = o28Var;
        }
        mwa mwaVarS2 = p65Var.s();
        if (mwaVarS2 != null) {
            mwaVarS2.d = new v8(i2, 23, az5Var, dk5Var, str, r28Var2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0173  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x017d  */
    /* JADX WARN: Removed duplicated region for block: B:73:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void s(defpackage.yk5 r19, defpackage.nhc r20, defpackage.dk5 r21, defpackage.r28 r22, defpackage.x12 r23, int r24, int r25) {
        /*
            Method dump skipped, instruction units count: 396
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sgg.s(yk5, nhc, dk5, r28, x12, int, int):void");
    }

    public static final void t(HighlightReference highlightReference, String str, SourceParameter sourceParameter, String str2, zj5 zj5Var, r28 r28Var, dl5 dl5Var, x12 x12Var, int i2) {
        int i3;
        String str3;
        String str4;
        r28 r28Var2;
        dl5 dl5Var2;
        r28 r28Var3;
        dl5 dl5Var3;
        int i4;
        highlightReference.getClass();
        str.getClass();
        sourceParameter.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1210272620);
        if ((i2 & 6) == 0) {
            i3 = ((i2 & 8) == 0 ? p65Var.f(highlightReference) : p65Var.h(highlightReference) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            str3 = str;
            i3 |= p65Var.f(str3) ? 32 : 16;
        } else {
            str3 = str;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(sourceParameter) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            str4 = str2;
            i3 |= p65Var.f(str4) ? 2048 : 1024;
        } else {
            str4 = str2;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(zj5Var) ? 16384 : 8192;
        }
        int i5 = 196608 | i3;
        if ((1572864 & i2) == 0) {
            i5 = 720896 | i3;
        }
        if (p65Var.P(i5 & 1, (599187 & i5) != 599186)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z = ((i5 & 14) == 4 || ((i5 & 8) != 0 && p65Var.h(highlightReference))) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i5 & 896) == 256) | ((i5 & 7168) == 2048);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    iu iuVar = new iu(highlightReference, str3, sourceParameter, str4, 9);
                    p65Var.j0(iuVar);
                    objM = iuVar;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                dl5 dl5Var4 = (dl5) to7.z(n1b.a.b(dl5.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                r28Var3 = o28.b;
                dl5Var3 = dl5Var4;
                i4 = i5 & (-3670017);
            } else {
                p65Var.S();
                i4 = i5 & (-3670017);
                r28Var3 = r28Var;
                dl5Var3 = dl5Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(dl5Var3.n, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            r28 r28Var4 = r28Var3;
            s((yk5) l78VarZ.getValue(), nhcVarF, new dk5(dl5Var3, zj5Var), r28Var4, p65Var, (i4 >> 6) & 7168, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(dl5Var3) | p65Var.f(nhcVarF) | p65Var.h(resources) | ((i4 & 57344) == 16384);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                fl2 fl2Var = new fl2(dl5Var3, nhcVarF, resources, zj5Var, null, 27);
                p65Var.j0(fl2Var);
                objM2 = fl2Var;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            dl5Var2 = dl5Var3;
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            dl5Var2 = dl5Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kz1(highlightReference, str, sourceParameter, str2, zj5Var, r28Var2, dl5Var2, i2, 2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x011e  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0144  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0199  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01d4  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01d9  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01f0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void u(java.lang.String r35, defpackage.az5 r36, defpackage.r28 r37, defpackage.x12 r38, int r39) {
        /*
            Method dump skipped, instruction units count: 953
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sgg.u(java.lang.String, az5, r28, x12, int):void");
    }

    public static final void v(yk5 yk5Var, dk5 dk5Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        Object ek5Var;
        dk5 dk5Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(75854597);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(yk5Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(dk5Var) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (!p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            p65Var.S();
            r28Var2 = r28Var;
        } else {
            if (!(yk5Var instanceof vk5)) {
                mwa mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    mwaVarS.d = new s(yk5Var, dk5Var, i2, 17);
                    return;
                }
                return;
            }
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            c09 c09VarJ = vn7.J(R.drawable.ic_close_24, 0, p65Var);
            String strR = vo7.R(p65Var, R.string.common_close);
            boolean z = (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                ek5Var = new ek5(0, dk5Var, dk5.class, "close", "close()V", 0, 0);
                dk5Var2 = dk5Var;
                p65Var.j0(ek5Var);
            } else {
                dk5Var2 = dk5Var;
                ek5Var = objM2;
            }
            o28 o28Var = o28.b;
            qk7.b(o28Var, null, (m45) ((qh6) ek5Var), pxf.E(-444082928, new ck5(yk5Var, dk5Var2, l78Var), p65Var), c09VarJ, strR, 0L, 0L, p65Var, ((i4 >> 6) & 14) | 35840, 194);
            r28Var2 = o28Var;
        }
        mwa mwaVarS2 = p65Var.s();
        if (mwaVarS2 != null) {
            mwaVarS2.d = new ac(i2, 27, yk5Var, dk5Var, r28Var2);
        }
    }

    public static r28 w(r28 r28Var, sl slVar, hw8 hw8Var, boolean z, boolean z2, int i2) {
        return pl3.a(r28Var, slVar.f, hw8Var, z, null, slVar.k.getValue() != null, new kk(slVar, null, 1), (i2 & 8) != 0 ? false : z2, 32);
    }

    public static final Object x(sl slVar, Object obj, float f2, p92 p92Var) {
        Object objB = slVar.b(obj, s78.Default, new mk(slVar, f2, null, 1), p92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }

    public static Object y(sl slVar, Object obj, p4d p4dVar) {
        return x(slVar, obj, slVar.j.g(), p4dVar);
    }

    public static final c09 z(ew5 ew5Var, Context context, int i2) {
        return ew5Var instanceof yr0 ? wgf.a(new wp(((yr0) ew5Var).a), i2) : ew5Var instanceof em3 ? new hm3(dm2.x(ew5Var, context.getResources()).mutate()) : new lx5(ew5Var);
    }

    public abstract void D();

    public abstract void M();

    public abstract void S(ByteBuffer byteBuffer);

    public abstract void Y();

    /* JADX WARN: Removed duplicated region for block: B:51:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:64:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(defpackage.gj1 r23, defpackage.nhc r24, defpackage.bo4 r25, defpackage.si1 r26, defpackage.ye1 r27, defpackage.r28 r28, defpackage.x12 r29, int r30, int r31) {
        /*
            Method dump skipped, instruction units count: 244
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sgg.f(gj1, nhc, bo4, si1, ye1, r28, x12, int, int):void");
    }
}

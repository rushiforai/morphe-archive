package defpackage;

import android.app.ActivityManager;
import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.os.Debug;
import android.util.Log;
import android.view.View;
import android.widget.EdgeEffect;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.reader.R;
import com.squareup.wire.sjIw.ezwlgQm;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.AbstractCollection;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.Scanner;
import java.util.concurrent.Executor;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class gx1 {
    public static final g l;
    public static final n2c q;
    public static final /* synthetic */ int t = 0;
    public static final /* synthetic */ int u = 0;
    public static final char[] a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    public static final char[] b = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    public static final mz1 c = new mz1(new a02(14), false, -86857604);
    public static final mz1 d = new mz1(new j02(17), false, 1575883304);
    public static final mz1 e = new mz1(new j02(18), false, -623248441);
    public static final mz1 f = new mz1(new j02(19), false, -580804931);
    public static final mz1 g = new mz1(new j02(20), false, -632825164);
    public static final mz1 h = new mz1(new j02(21), false, -54059019);
    public static final mz1 i = new mz1(new j02(22), false, 1790455498);
    public static final mz1 j = new mz1(new u02(12), false, -323005687);
    public static final mz1 k = new mz1(new u02(13), false, 730351154);
    public static final StackTraceElement[] m = new StackTraceElement[0];
    public static final fa4 n = new fa4(23);
    public static final d1g o = new d1g(16, "NO_THREAD_ELEMENTS", false);
    public static final n2c p = new n2c(9);
    public static final n2c r = new n2c(11);
    public static final wz7 s = new wz7(27);

    static {
        int i2 = 10;
        l = new g(i2);
        q = new n2c(i2);
    }

    public static r61 A(long j2, long j3, x12 x12Var, int i2, int i3) {
        long j4;
        long jB = (i3 & 2) != 0 ? iv1.b(j2, x12Var) : j3;
        long j5 = uu1.h;
        long jB2 = uu1.b(0.38f, jB);
        fv1 fv1Var = (fv1) ((p65) x12Var).j(iv1.a);
        r61 r61Var = fv1Var.Z;
        if (r61Var == null) {
            gv1 gv1Var = vh4.a;
            j4 = jB;
            r61 r61Var2 = new r61(iv1.c(fv1Var, gv1Var), iv1.a(fv1Var, iv1.c(fv1Var, gv1Var)), op8.M(uu1.b(vh4.d, iv1.c(fv1Var, vh4.c)), iv1.c(fv1Var, gv1Var)), uu1.b(0.38f, iv1.a(fv1Var, iv1.c(fv1Var, gv1Var))));
            fv1Var.Z = r61Var2;
            r61Var = r61Var2;
        } else {
            j4 = jB;
        }
        long j6 = j2 != 16 ? j2 : r61Var.a;
        long j7 = j4 != 16 ? j4 : r61Var.b;
        if (j5 == 16) {
            j5 = r61Var.c;
        }
        long j8 = j5;
        if (jB2 == 16) {
            jB2 = r61Var.d;
        }
        return new r61(j6, j7, j8, jB2);
    }

    public static t61 B(int i2) {
        if ((i2 & 1) != 0) {
            gv1 gv1Var = vh4.a;
        }
        if ((i2 & 2) != 0) {
            gv1 gv1Var2 = vh4.a;
        }
        if ((i2 & 4) != 0) {
            gv1 gv1Var3 = vh4.a;
        }
        float f2 = (i2 & 8) != 0 ? vh4.f : 0.0f;
        float f3 = (i2 & 16) != 0 ? vh4.e : 0.0f;
        if ((i2 & 32) != 0) {
            gv1 gv1Var4 = vh4.a;
        }
        return new t61(0.0f, 0.0f, 0.0f, f2, f3, 0.0f);
    }

    public static void D(Closeable closeable, String str) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e2) {
                Log.e("FirebaseCrashlytics", str, e2);
            }
        }
    }

    public static final r28 E(r28 r28Var, c55 c55Var) {
        return r28Var.b(new v12(c55Var));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.tb2 F(defpackage.do4 r4, java.lang.Object r5, java.lang.Object r6, defpackage.p92 r7) {
        /*
            boolean r0 = r7 instanceof defpackage.ap4
            if (r0 == 0) goto L13
            r0 = r7
            ap4 r0 = (defpackage.ap4) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ap4 r0 = new ap4
            r0.<init>(r7)
        L18:
            java.lang.Object r7 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 == r3) goto L2a
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2a:
            java.lang.Object r6 = r0.b
            defpackage.br7.v(r7)
            goto L3e
        L30:
            defpackage.br7.v(r7)
            r0.b = r6
            r0.d = r3
            java.lang.Object r4 = r4.a(r5, r0)
            if (r4 != r1) goto L3e
            return r1
        L3e:
            kotlinx.coroutines.flow.internal.AbortFlowException r4 = new kotlinx.coroutines.flow.internal.AbortFlowException
            r4.<init>(r6)
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gx1.F(do4, java.lang.Object, java.lang.Object, p92):tb2");
    }

    public static lqe G(n98 n98Var, y28 y28Var) {
        if (n98Var == null) {
            b(19);
            throw null;
        }
        if (y28Var == null) {
            b(20);
            throw null;
        }
        Collection collectionW = y28Var.w();
        if (collectionW.size() != 1) {
            return null;
        }
        for (lqe lqeVar : ((zm1) collectionW.iterator().next()).I()) {
            if (lqeVar.getName().equals(n98Var)) {
                return lqeVar;
            }
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [int] */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v6 */
    public static int H() {
        boolean zN = N();
        ?? r0 = zN;
        if (O()) {
            r0 = (zN ? 1 : 0) | 2;
        }
        return (Debug.isDebuggerConnected() || Debug.waitingForDebugger()) ? r0 | 4 : r0;
    }

    public static float I(EdgeEffect edgeEffect) {
        if (Build.VERSION.SDK_INT >= 31) {
            return bo3.b(edgeEffect);
        }
        return 0.0f;
    }

    public static boolean J() {
        try {
            if (mn.c1 == null) {
                mn.c1 = Class.forName("android.os.SystemProperties");
            }
            Method declaredMethod = mn.d1;
            if (declaredMethod == null) {
                Class cls = mn.c1;
                declaredMethod = cls != null ? cls.getDeclaredMethod("getBoolean", String.class, Boolean.TYPE) : null;
                mn.d1 = declaredMethod;
            }
            Object objInvoke = declaredMethod != null ? declaredMethod.invoke(null, "debug.layout", Boolean.FALSE) : null;
            return g76.L(objInvoke instanceof Boolean ? (Boolean) objInvoke : null, Boolean.TRUE);
        } catch (Exception unused) {
            return false;
        }
    }

    public static int K(Context context, String str, String str2) {
        String packageName;
        Resources resources = context.getResources();
        int i2 = context.getApplicationContext().getApplicationInfo().icon;
        if (i2 > 0) {
            try {
                packageName = context.getResources().getResourcePackageName(i2);
                if ("android".equals(packageName)) {
                    packageName = context.getPackageName();
                }
            } catch (Resources.NotFoundException unused) {
                packageName = context.getPackageName();
            }
        } else {
            packageName = context.getPackageName();
        }
        return resources.getIdentifier(str, str2, packageName);
    }

    public static String L(byte[] bArr) {
        char[] cArr = new char[bArr.length * 2];
        for (int i2 = 0; i2 < bArr.length; i2++) {
            byte b2 = bArr[i2];
            int i3 = i2 * 2;
            char[] cArr2 = a;
            cArr[i3] = cArr2[(b2 & 255) >>> 4];
            cArr[i3 + 1] = cArr2[b2 & 15];
        }
        return new String(cArr);
    }

    public static final void M(sp6 sp6Var) {
        flb.v0(sp6Var).E();
    }

    public static boolean N() {
        if (Build.PRODUCT.contains("sdk")) {
            return true;
        }
        String str = Build.HARDWARE;
        return str.contains("goldfish") || str.contains("ranchu");
    }

    public static t41 P(ib2 ib2Var, b55 b55Var) {
        wb2 wb2Var = wb2.DEFAULT;
        ib2Var.getClass();
        wb2Var.getClass();
        return o7f.v(new mt(ib2Var, wb2Var, b55Var, 7));
    }

    public static final r28 Q(x12 x12Var, r28 r28Var) {
        if (r28Var.k(fn.v)) {
            return r28Var;
        }
        p65 p65Var = (p65) x12Var;
        p65Var.Z(1219399079);
        r28 r28Var2 = (r28) r28Var.h(new w0(5, p65Var), o28.b);
        p65Var.p(false);
        return r28Var2;
    }

    public static final r28 R(x12 x12Var, r28 r28Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(439770924);
        r28 r28VarQ = Q(p65Var, r28Var);
        p65Var.p(false);
        return r28VarQ;
    }

    public static float V(EdgeEffect edgeEffect, float f2, float f3) {
        if (Build.VERSION.SDK_INT >= 31) {
            return bo3.c(edgeEffect, f2, f3);
        }
        edgeEffect.onPull(f2, f3);
        return f2;
    }

    public static LinkedHashSet W(n98 n98Var, Collection collection, Collection collection2, y28 y28Var, q14 q14Var, cx8 cx8Var, boolean z) {
        if (collection == null) {
            b(13);
            throw null;
        }
        if (y28Var == null) {
            b(15);
            throw null;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        cx8Var.h(n98Var, collection, collection2, y28Var, new b93(q14Var, linkedHashSet, z));
        return linkedHashSet;
    }

    public static LinkedHashSet X(n98 n98Var, AbstractCollection abstractCollection, Collection collection, y28 y28Var, q14 q14Var, cx8 cx8Var) {
        if (y28Var != null) {
            return W(n98Var, abstractCollection, collection, y28Var, q14Var, cx8Var, false);
        }
        b(3);
        throw null;
    }

    public static LinkedHashSet Y(n98 n98Var, Collection collection, AbstractCollection abstractCollection, y28 y28Var, cx8 cx8Var) {
        fa4 fa4Var = fa4.o;
        if (collection == null) {
            b(7);
            throw null;
        }
        if (y28Var != null) {
            return W(n98Var, collection, abstractCollection, y28Var, fa4Var, cx8Var, true);
        }
        b(9);
        throw null;
    }

    public static final void Z(ib2 ib2Var, Object obj) {
        if (obj == o) {
            return;
        }
        if (!(obj instanceof fld)) {
            Object objN = ib2Var.N(q, null);
            objN.getClass();
            ((zkd) objN).a(obj);
            return;
        }
        fld fldVar = (fld) obj;
        zkd[] zkdVarArr = fldVar.c;
        int length = zkdVarArr.length - 1;
        if (length < 0) {
            return;
        }
        while (true) {
            int i2 = length - 1;
            zkd zkdVar = zkdVarArr[length];
            zkdVar.getClass();
            zkdVar.a(fldVar.b[length]);
            if (i2 < 0) {
                return;
            } else {
                length = i2;
            }
        }
    }

    public static String a0(String str) {
        byte[] bytes = str.getBytes();
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
            messageDigest.update(bytes);
            return L(messageDigest.digest());
        } catch (NoSuchAlgorithmException e2) {
            Log.e("FirebaseCrashlytics", "Could not create hashing algorithm: SHA-1, returning empty string.", e2);
            return "";
        }
    }

    public static final void c(final n90 n90Var, final String str, r28 r28Var, final x45 x45Var, final x45 x45Var2, final xd xdVar, final w82 w82Var, final float f2, final bs0 bs0Var, final int i2, final boolean z, x12 x12Var, final int i3, final int i4) {
        int i5;
        String str2;
        x45 x45Var3;
        x45 x45Var4;
        xd xdVar2;
        int i6;
        boolean z2;
        int i7;
        final r28 r28Var2;
        rx5 rx5Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1236588022);
        if ((i3 & 6) == 0) {
            i5 = (p65Var.f(n90Var) ? 4 : 2) | i3;
        } else {
            i5 = i3;
        }
        if ((i3 & 48) == 0) {
            str2 = str;
            i5 |= p65Var.f(str2) ? 32 : 16;
        } else {
            str2 = str;
        }
        if ((i3 & 384) == 0) {
            i5 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if ((i3 & 3072) == 0) {
            x45Var3 = x45Var;
            i5 |= p65Var.h(x45Var3) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            x45Var3 = x45Var;
        }
        if ((i3 & 24576) == 0) {
            x45Var4 = x45Var2;
            i5 |= p65Var.h(x45Var4) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            x45Var4 = x45Var2;
        }
        if ((196608 & i3) == 0) {
            xdVar2 = xdVar;
            i5 |= p65Var.f(xdVar2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            xdVar2 = xdVar;
        }
        if ((1572864 & i3) == 0) {
            i5 |= p65Var.f(w82Var) ? 1048576 : 524288;
        }
        if ((12582912 & i3) == 0) {
            i5 |= p65Var.c(f2) ? 8388608 : 4194304;
        }
        if ((100663296 & i3) == 0) {
            i5 |= p65Var.f(bs0Var) ? 67108864 : 33554432;
        }
        if ((805306368 & i3) == 0) {
            i6 = i2;
            i5 |= p65Var.d(i6) ? 536870912 : 268435456;
        } else {
            i6 = i2;
        }
        if ((i4 & 6) == 0) {
            z2 = z;
            i7 = i4 | (p65Var.g(z2) ? 4 : 2);
        } else {
            z2 = z;
            i7 = i4;
        }
        if (p65Var.P(i5 & 1, ((i5 & 306783379) == 306783378 && (i7 & 3) == 2) ? false : true)) {
            Object obj = n90Var.a;
            int i8 = ppe.b;
            p65Var.Y(-329318062);
            boolean z3 = obj instanceof rx5;
            uob uobVar = w12.a;
            if (z3) {
                p65Var.Y(-1008895720);
                rx5Var = (rx5) obj;
                if (rx5Var.u.i != null) {
                    p65Var.Y(-1008855668);
                    p65Var.p(false);
                    p65Var.p(false);
                    p65Var.p(false);
                } else {
                    p65Var.Y(-1008807494);
                    lfc lfcVarB = ppe.b(w82Var, p65Var);
                    boolean zF = p65Var.f(rx5Var) | p65Var.f(lfcVarB);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        nx5 nx5VarA = rx5.a(rx5Var);
                        nx5VarA.q = lfcVarB;
                        objM = nx5VarA.a();
                        p65Var.j0(objM);
                    }
                    rx5Var = (rx5) objM;
                    b09.H(p65Var, false, false, false);
                }
            } else {
                p65Var.Y(-1008549326);
                Context context = (Context) p65Var.j(eo.b);
                lfc lfcVarB2 = ppe.b(w82Var, p65Var);
                boolean zF2 = p65Var.f(context) | p65Var.f(obj) | p65Var.f(lfcVarB2);
                Object objM2 = p65Var.M();
                if (zF2 || objM2 == uobVar) {
                    nx5 nx5Var = new nx5(context);
                    nx5Var.c = obj;
                    nx5Var.q = lfcVarB2;
                    objM2 = nx5Var.a();
                    p65Var.j0(objM2);
                }
                rx5Var = (rx5) objM2;
                p65Var.p(false);
                p65Var.p(false);
            }
            rx5 rx5Var2 = rx5Var;
            ppe.f(rx5Var2);
            r28Var2 = r28Var;
            r28 r28VarB = r28Var2.b(new t82(rx5Var2, n90Var.c, n90Var.b, x45Var3, x45Var4, i6, xdVar2, w82Var, f2, bs0Var, z2, ppe.a(p65Var), str2));
            id idVar = id.n;
            int iS = w2g.s(p65Var);
            r28 r28VarR = R(p65Var, r28VarB);
            i89 i89VarL = p65Var.l();
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, idVar);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.d, r28VarR);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            p65Var.p(true);
        } else {
            r28Var2 = r28Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: y80
                @Override // defpackage.b55
                public final Object invoke(Object obj2, Object obj3) {
                    ((Integer) obj3).getClass();
                    int iY = tr7.y(i3 | 1);
                    int iY2 = tr7.y(i4);
                    gx1.c(n90Var, str, r28Var2, x45Var, x45Var2, xdVar, w82Var, f2, bs0Var, i2, z, (x12) obj2, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    public static String c0(FileInputStream fileInputStream) {
        Scanner scannerUseDelimiter = new Scanner(fileInputStream).useDelimiter("\\A");
        try {
            String next = scannerUseDelimiter.hasNext() ? scannerUseDelimiter.next() : "";
            scannerUseDelimiter.close();
            return next;
        } catch (Throwable th) {
            if (scannerUseDelimiter != null) {
                try {
                    scannerUseDelimiter.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public static final void d(Object obj, String str, gx5 gx5Var, r28 r28Var, xd xdVar, w82 w82Var, float f2, bs0 bs0Var, int i2, x12 x12Var, int i3, int i4, int i5) {
        float f3 = (i5 & 256) != 0 ? 1.0f : f2;
        bs0 bs0Var2 = (i5 & 512) != 0 ? null : bs0Var;
        int i6 = (i5 & 1024) != 0 ? 1 : i2;
        int i7 = i3 >> 3;
        p65 p65Var = (p65) x12Var;
        c(new n90(obj, (z80) p65Var.j(t57.a), gx5Var), str, r28Var, g90.v, null, xdVar, w82Var, f3, bs0Var2, i6, true, p65Var, (i7 & 234881024) | (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i7 & 896) | (i7 & 7168) | (57344 & i7) | (458752 & i7) | (3670016 & i7) | (29360128 & i7) | ((i4 << 27) & 1879048192), (i4 >> 3) & 14);
    }

    public static final Object d0(ib2 ib2Var) {
        Object objN = ib2Var.N(p, 0);
        objN.getClass();
        return objN;
    }

    public static final void e(mu1 mu1Var, bo4 bo4Var, hu1 hu1Var, cs1 cs1Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(159807648);
        int i3 = i2 | (p65Var2.f(mu1Var) ? 4 : 2) | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.f(hu1Var) ? 256 : 128) | (p65Var2.f(cs1Var) ? 2048 : 1024);
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var2);
            boolean z = ((i3 & 7168) == 2048) | ((i3 & 14) == 4);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new i0(mu1Var, 25, cs1Var);
                p65Var2.j0(objM);
            }
            k40.t(null, kv6VarA, null, null, null, null, false, null, (x45) objM, p65Var2, 0, 509);
            p65Var = p65Var2;
            int i4 = i3 & 896;
            boolean zF = p65Var.f(kv6VarA) | (i4 == 256);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (zF || objM2 == uobVar) {
                objM2 = new r91(kv6VarA, hu1Var, n92Var, 8);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6VarA);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = bjc.b(new f91(kv6VarA, 2));
                p65Var.j0(objM3);
            }
            upc upcVar = (upc) objM3;
            Boolean bool = (Boolean) upcVar.getValue();
            bool.booleanValue();
            boolean z2 = i4 == 256;
            Object objM4 = p65Var.M();
            if (z2 || objM4 == uobVar) {
                objM4 = new rc0(hu1Var, upcVar, n92Var, 4);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, bool);
            boolean zH = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar) {
                objM5 = new wi1(bo4Var, kv6VarA, n92Var, 1);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 20, mu1Var, bo4Var, hu1Var, cs1Var);
        }
    }

    public static v96 e0(lxd lxdVar, boolean z, xs6 xs6Var, int i2) {
        boolean z2 = (i2 & 1) != 0 ? false : z;
        boolean z3 = (i2 & 2) == 0;
        if ((i2 & 4) != 0) {
            xs6Var = null;
        }
        lxdVar.getClass();
        return new v96(lxdVar, z3, z2, xs6Var != null ? qo7.B(xs6Var) : null, 34);
    }

    public static final void f(b24 b24Var, hu1 hu1Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(12144946);
        int i3 = i2 | (p65Var.f(b24Var) ? 4 : 2) | (p65Var.f(hu1Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = R(p65Var, r28VarX);
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
            r28 r28VarR2 = R(p65Var, r28VarD);
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
                sc0 sc0Var = new sc0(0, hu1Var, hu1.class, "onRefresh", "onRefresh()V", 0, 29);
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
            mwaVarS.d = new af0(i2, 14, b24Var, hu1Var, r28Var);
        }
    }

    public static final Object f0(ib2 ib2Var, Object obj) {
        if (obj == null) {
            obj = d0(ib2Var);
        }
        if (obj == 0) {
            return o;
        }
        if (!(obj instanceof Integer)) {
            return ((zkd) obj).b();
        }
        return ib2Var.N(r, new fld(((Number) obj).intValue(), ib2Var));
    }

    public static final void g(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1825316421);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        boolean z = true;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = R(p65Var, r28Var);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(1572639290);
            int iR = 0;
            while (iR < 10) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, false);
                long j3 = p65Var.T;
                int i5 = (int) (j3 ^ (j3 >>> c2));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = R(p65Var, r28VarJ);
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
                Integer numValueOf = Integer.valueOf(i5);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                char c3 = c2;
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, false);
                long j4 = p65Var.T;
                int i6 = (int) (j4 ^ (j4 >>> c3));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                yi2.p(0, 0L, p65Var, null);
                iR = wgd.r(p65Var, true, true, iR, 1);
                c2 = c3;
                z = true;
            }
            p65Var.p(false);
            p65Var.p(z);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 12);
        }
    }

    public static final void h(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1834444859);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = R(p65Var, r28VarX);
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
            r28 r28VarR2 = R(p65Var, r28VarD);
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
            gq7.a(jfc.c, null, vo7.R(p65Var, R.string.search_collections_none_found), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 6, 0, 2042);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 13);
        }
    }

    public static final void i(mu1 mu1Var, bo4 bo4Var, hu1 hu1Var, cs1 cs1Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-441630315);
        int i3 = i2 | (p65Var.f(mu1Var) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(hu1Var) ? 256 : 128) | (p65Var.f(cs1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            boolean z = mu1Var.b;
            boolean z2 = (i3 & 896) == 256;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                gu1 gu1Var = new gu1(0, hu1Var, hu1.class, "onRefresh", "onRefresh()V", 0, 0);
                p65Var.j0(gu1Var);
                objM = gu1Var;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(1201456583, new fd3(mu1Var, bo4Var, hu1Var, cs1Var, 28), p65Var), p65Var, (i3 >> 6) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(mu1Var, bo4Var, hu1Var, cs1Var, r28Var, i2, 12);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:64:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void j(defpackage.nu1 r23, defpackage.nhc r24, defpackage.bo4 r25, defpackage.hu1 r26, defpackage.cs1 r27, defpackage.r28 r28, defpackage.x12 r29, int r30, int r31) {
        /*
            Method dump skipped, instruction units count: 244
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gx1.j(nu1, nhc, bo4, hu1, cs1, r28, x12, int, int):void");
    }

    public static final void k(bo4 bo4Var, String str, bo4 bo4Var2, gub gubVar, r28 r28Var, ru1 ru1Var, x12 x12Var, int i2) {
        r28 r28Var2;
        ru1 ru1Var2;
        ru1 ru1Var3;
        int i3;
        r28 r28Var3;
        ru1 ru1Var4;
        str.getClass();
        bo4Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-587670602);
        int i4 = i2 | (p65Var.h(bo4Var) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(bo4Var2) ? 256 : 128) | (p65Var.f(gubVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 90112;
        int i5 = 1;
        boolean z = false;
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
                    ru1Var3 = (ru1) to7.z(n1b.a.b(ru1.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-458753);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-458753);
                r28Var3 = r28Var;
                ru1Var3 = ru1Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(ru1Var3.m, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            hu1 hu1Var = new hu1(ru1Var3, gubVar);
            lig ligVar = new lig(ru1Var3, gubVar, z, 12);
            j((nu1) l78VarZ.getValue(), nhcVarF, bo4Var2, hu1Var, ligVar, r28Var3, p65Var, (i3 & 896) | 196608, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            boolean zH2 = p65Var.h(ru1Var3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(ligVar);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar) {
                ru1Var4 = ru1Var3;
                objM3 = new b9((que) ru1Var4, nhcVarF, sb2Var, resources, (Object) ligVar, (n92) null, 12);
                p65Var.j0(objM3);
            } else {
                ru1Var4 = ru1Var3;
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            r28Var2 = r28Var3;
            ru1Var2 = ru1Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            ru1Var2 = ru1Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 6, r28Var2, (que) ru1Var2, (Object) bo4Var, (Object) bo4Var2, (Object) gubVar, str);
        }
    }

    public static final void l(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-411797793);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarN = bgf.N(w2g.C(r28Var, 24.0f), "empty");
            rh4 rh4Var = jfc.c;
            r28 r28VarB = r28VarN.b(rh4Var);
            sn3 sn3Var = kt7.b;
            r28 r28VarA0 = flb.a0(r28VarB, ((zo7) p65Var.j(sn3Var)).c, bmb.a(4.0f));
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = R(p65Var, r28VarA0);
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
            ((jp7) p65Var.j(kt7.a)).getClass();
            r28 r28VarD = jfc.d(jfc.r(rh4Var, 3), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.h, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = R(p65Var, r28VarD);
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
            o28 o28Var = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarD3 = jfc.d(w2g.G(r28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j5 = p65Var.T;
            int i7 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = R(p65Var, r28VarD3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            w2g.e(vn7.J(2131231239, 0, p65Var), null, null, null, null, 0.0f, new bs0(5, ((zo7) p65Var.j(sn3Var)).n), p65Var, 56, 60);
            String strR = vo7.R(p65Var, R.string.find_friends_empty_state_title);
            sn3 sn3Var2 = jt7.c;
            jjd.b(strR, w2g.G(o28Var, 0.0f, 16.0f, 0.0f, 0.0f, 13), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).j, p65Var, 48, 0, 130044);
            jjd.b(vo7.R(p65Var, R.string.find_friends_empty_state_description), jfc.q(w2g.G(o28Var, 0.0f, 16.0f, 0.0f, 0.0f, 13), 0.0f, 200.0f, 1), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).m, p65Var, 48, 0, 130044);
            p65Var = p65Var;
            ho2.N(p65Var, true, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 27);
        }
    }

    public static final void m(oi4 oi4Var, hi4 hi4Var, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object hq3Var;
        oi4 oi4Var2 = oi4Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-242851455);
        int i3 = i2 | (p65Var.f(oi4Var2) ? 4 : 2) | (p65Var.f(hi4Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "error").b(jfc.c), 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = R(p65Var, r28VarX);
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
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = R(p65Var, r28VarD);
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
            oi4Var2 = oi4Var;
            b24 b24Var = oi4Var2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                hq3Var = new hq3(0, hi4Var, hi4.class, "refresh", "refresh()V", 0, 28);
                p65Var.j0(hq3Var);
            } else {
                hq3Var = objM;
                ar0Var = ar0Var2;
            }
            iq7.a(b24Var, w2g.G(iy0.a.a(o28Var, ar0Var), 24.0f, 0.0f, 24.0f, 0.0f, 10), null, null, null, null, (m45) ((qh6) hq3Var), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 14, oi4Var2, hi4Var, r28Var);
        }
    }

    public static final void n(si4 si4Var, String str, hi4 hi4Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        String strQ;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-942113872);
        int i3 = i2 | (p65Var2.f(si4Var) ? 4 : 2) | (p65Var2.f(str) ? 32 : 16) | (p65Var2.f(hi4Var) ? 256 : 128) | 3072;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            o28 o28Var = o28.b;
            r28 r28VarF = w2g.F(jfc.d(o28Var, 1.0f), 24.0f, 24.0f, 24.0f, 24.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = R(p65Var2, r28VarF);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, wv1VarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            if (si4Var instanceof qi4) {
                p65Var2.Y(-1076416163);
                int i5 = ((qi4) si4Var).a;
                strQ = vo7.D(R.plurals.find_friends_contacts_found, i5, new Object[]{Integer.valueOf(i5)}, p65Var2);
                p65Var2.p(false);
            } else {
                if (!(si4Var instanceof ri4)) {
                    throw ho2.L(p65Var2, -1076420138, false);
                }
                p65Var2.Y(-1076409267);
                strQ = vo7.Q(R.string.find_friends_found_more_than_x_friends, new Object[]{100}, p65Var2);
                p65Var2.p(false);
            }
            sn3 sn3Var = jt7.c;
            r28Var2 = o28Var;
            jjd.b(strQ, bgf.N(o28Var, "find_friends_contact_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).j, p65Var2, 48, 0, 131068);
            kx kxVarW = ho2.w(p65Var2, -1076398748);
            kxVarW.d(vo7.R(p65Var2, R.string.find_friends_explanation));
            kxVarW.d(" ");
            p65Var2.Y(-1076394759);
            wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14);
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 896) == 256);
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new bf0(hi4Var, 5, str);
                p65Var2.j0(objM);
            }
            int iV = ho2.v("learn_more", wjdVar, (e07) objM, kxVarW);
            try {
                kxVarW.d(vo7.R(p65Var2, R.string.find_friends_learn_more));
                kxVarW.f(iV);
                p65Var2.p(false);
                mx mxVarI = kxVarW.i();
                p65Var2.p(false);
                jjd.c(mxVarI, bgf.N(w2g.G(r28Var2, 0.0f, 8.0f, 0.0f, 0.0f, 13), "find_friends_explanation"), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var2.j(sn3Var)).n, p65Var2, 48, 0, 262140);
                p65Var = p65Var2;
                p65Var.p(true);
            } catch (Throwable th) {
                kxVarW.f(iV);
                throw th;
            }
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(si4Var, str, hi4Var, r28Var2, i2);
        }
    }

    public static final void o(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1720301968);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), w2g.G(m40.V(bgf.N(r28Var, "loading"), p65Var, 0), 0.0f, 24.0f, 0.0f, 0.0f, 13), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = R(p65Var, r28VarX);
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
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = R(p65Var, r28VarD);
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
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarG = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            sn3 sn3Var = jt7.c;
            ok7.s(0.5f, 432, 8, 0L, p65Var, r28VarG, ((bu7) p65Var.j(sn3Var)).j);
            ok7.s(0.9f, 432, 8, 0L, p65Var, r28VarG, ((bu7) p65Var.j(sn3Var)).n);
            ok7.s(0.95f, 432, 8, 0L, p65Var, r28VarG, ((bu7) p65Var.j(sn3Var)).n);
            ok7.s(0.5f, 432, 8, 0L, p65Var, r28VarG, ((bu7) p65Var.j(sn3Var)).n);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            p65Var.Y(-363201136);
            for (int i7 = 0; i7 < 10; i7++) {
                tr7.g(0, 1, p65Var, null);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 26);
        }
    }

    public static final void p(ti4 ti4Var, hi4 hi4Var, obe obeVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        iy0 iy0Var;
        o28 o28Var;
        ar0 ar0Var;
        fn fnVar;
        cu cuVar;
        boolean z;
        cu cuVar2;
        cu cuVar3;
        ar0 ar0Var2;
        ot2 ot2Var;
        rh4 rh4Var;
        boolean z2;
        p65 p65Var2;
        cu cuVar4;
        boolean z3;
        o28 o28Var2;
        r28 r28VarD;
        Object hq3Var;
        ar0 ar0Var3 = z46.h;
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(1014789660);
        int i3 = i2 | (p65Var3.f(ti4Var) ? 4 : 2) | (p65Var3.f(hi4Var) ? 32 : 16) | (p65Var3.f(obeVar) ? 256 : 128) | (p65Var3.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var3.P(i3 & 1, (i3 & 1171) != 1170)) {
            rh4 rh4Var2 = jfc.c;
            r28 r28VarB = r28Var.b(rh4Var2);
            ar0 ar0Var4 = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var4, false);
            char c2 = ' ';
            long j2 = p65Var3.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var3.l();
            r28 r28VarR = R(p65Var3, r28VarB);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var2);
            } else {
                p65Var3.m0();
            }
            cu cuVar5 = q12.f;
            tp7.B(p65Var3, cuVar5, zk7VarC);
            cu cuVar6 = q12.e;
            tp7.B(p65Var3, cuVar6, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar7 = q12.g;
            tp7.B(p65Var3, cuVar7, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var3, fnVar2);
            cu cuVar8 = q12.d;
            tp7.B(p65Var3, cuVar8, r28VarR);
            int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            y(ti4Var, hi4Var, obeVar, null, p65Var3, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            boolean z4 = ti4Var.e;
            uob uobVar = w12.a;
            o28 o28Var3 = o28.b;
            iy0 iy0Var2 = iy0.a;
            if (z4) {
                p65Var3.Y(1422261650);
                ar0 ar0Var5 = z46.k;
                r28 r28VarX = ho2.x((jp7) p65Var3.j(kt7.a), iy0Var2.a(o28Var3, ar0Var5), 3, 1.0f);
                zk7 zk7VarC2 = dy0.c(ar0Var3, false);
                long j3 = p65Var3.T;
                int i6 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL2 = p65Var3.l();
                r28 r28VarR2 = R(p65Var3, r28VarX);
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(ot2Var2);
                } else {
                    p65Var3.m0();
                }
                tp7.B(p65Var3, cuVar5, zk7VarC2);
                tp7.B(p65Var3, cuVar6, i89VarL2);
                ka1.z(i6, p65Var3, cuVar7, p65Var3, fnVar2);
                tp7.B(p65Var3, cuVar8, r28VarR2);
                r28 r28VarD2 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC3 = dy0.c(ar0Var4, false);
                long j4 = p65Var3.T;
                int i7 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL3 = p65Var3.l();
                r28 r28VarR3 = R(p65Var3, r28VarD2);
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(ot2Var2);
                } else {
                    p65Var3.m0();
                }
                tp7.B(p65Var3, cuVar5, zk7VarC3);
                tp7.B(p65Var3, cuVar6, i89VarL3);
                ka1.z(i7, p65Var3, cuVar7, p65Var3, fnVar2);
                tp7.B(p65Var3, cuVar8, r28VarR3);
                Context context = (Context) p65Var3.j(eo.b);
                context.getClass();
                float f2 = r0.widthPixels / context.getResources().getDisplayMetrics().density;
                int i8 = ii4.a[(vj3.a(f2, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f2, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED).ordinal()];
                if (i8 == 1) {
                    z3 = true;
                    r28 r28VarG = w2g.G(o28Var3, 24.0f, 0.0f, 24.0f, 24.0f, 2);
                    o28Var2 = o28Var3;
                    r28VarD = jfc.d(r28VarG, 1.0f);
                } else if (i8 != 2 && i8 != 3) {
                    ygf.a();
                    return;
                } else {
                    z3 = true;
                    r28VarD = jfc.d(jfc.q(iy0Var2.a(w2g.G(o28Var3, 24.0f, 0.0f, 24.0f, 24.0f, 2), ar0Var5), 0.0f, as7.l, 1), 1.0f);
                    o28Var2 = o28Var3;
                }
                boolean z5 = i5 == 32 ? z3 : false;
                Object objM = p65Var3.M();
                if (z5 || objM == uobVar) {
                    ar0Var2 = ar0Var4;
                    ot2Var = ot2Var2;
                    hq3Var = new hq3(0, hi4Var, hi4.class, "followAllContacts", "followAllContacts()V", 0, 29);
                    p65Var3.j0(hq3Var);
                } else {
                    ar0Var2 = ar0Var4;
                    hq3Var = objM;
                    ot2Var = ot2Var2;
                }
                iy0Var = iy0Var2;
                cuVar3 = cuVar6;
                fnVar = fnVar2;
                cuVar2 = cuVar8;
                c2 = ' ';
                p65Var2 = p65Var3;
                o28Var = o28Var2;
                cuVar4 = cuVar5;
                cuVar = cuVar7;
                z = false;
                r28 r28Var2 = r28VarD;
                ar0Var = ar0Var3;
                z2 = z3;
                rh4Var = rh4Var2;
                fo7.i((m45) ((qh6) hq3Var), vo7.R(p65Var3, R.string.find_friends_cta_follow_all_contacts), xn7.M, r28Var2, false, p65Var2, 384, 16);
                b09.H(p65Var2, z2, z2, false);
            } else {
                iy0Var = iy0Var2;
                o28Var = o28Var3;
                ar0Var = ar0Var3;
                fnVar = fnVar2;
                cuVar = cuVar7;
                z = false;
                cuVar2 = cuVar8;
                cuVar3 = cuVar6;
                ar0Var2 = ar0Var4;
                ot2Var = ot2Var2;
                rh4Var = rh4Var2;
                z2 = true;
                p65Var2 = p65Var3;
                cuVar4 = cuVar5;
                p65Var2.Y(1408178412);
                p65Var2.p(false);
            }
            if (ti4Var.f) {
                p65Var2.Y(1423363142);
                r28 r28VarA0 = flb.a0(rh4Var, uu1.b(0.5f, ((zo7) p65Var2.j(kt7.b)).a), rv8.r);
                Object objM2 = p65Var2.M();
                if (objM2 == uobVar) {
                    objM2 = new e73(5);
                    p65Var2.j0(objM2);
                }
                r28 r28VarR4 = hlg.r(r28VarA0, false, null, null, (m45) objM2, 14);
                zk7 zk7VarC4 = dy0.c(ar0Var2, z);
                long j5 = p65Var2.T;
                int i9 = (int) (j5 ^ (j5 >>> c2));
                i89 i89VarL4 = p65Var2.l();
                r28 r28VarR5 = R(p65Var2, r28VarR4);
                p65Var2.c0();
                if (p65Var2.S) {
                    p65Var2.k(ot2Var);
                } else {
                    p65Var2.m0();
                }
                tp7.B(p65Var2, cuVar4, zk7VarC4);
                tp7.B(p65Var2, cuVar3, i89VarL4);
                ka1.z(i9, p65Var2, cuVar, p65Var2, fnVar);
                tp7.B(p65Var2, cuVar2, r28VarR5);
                p65Var = p65Var2;
                xz5.o(iy0Var.a(o28Var, ar0Var), ((Boolean) p65Var2.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 0.0f, 0L, 0L, 0, p65Var, 0, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                p65Var.p(z2);
            } else {
                p65Var = p65Var2;
                p65Var.Y(1408178412);
            }
            p65Var.p(z);
            p65Var.p(z2);
        } else {
            p65Var = p65Var3;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 4, r28Var, (Object) ti4Var, (Object) hi4Var, (Object) obeVar);
        }
    }

    public static final void q(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1832832027);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarB = bgf.N(r28Var, "matching_animation").b(jfc.c);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = R(p65Var, r28VarB);
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
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR2 = R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            nk7.A((bc7) gp7.s(new jc7(R.raw.matching), p65Var).getValue(), jfc.l(o28Var, 200.0f), p65Var, 1572912);
            jjd.b(vo7.R(p65Var, R.string.find_friends_syncing), w2g.G(o28Var, 0.0f, 16.0f, 0.0f, 0.0f, 13), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).j, p65Var, 48, 0, 131068);
            p65Var = p65Var;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 25);
        }
    }

    public static final void r(hi4 hi4Var, r28 r28Var, x12 x12Var, int i2) {
        hi4 hi4Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2019047183);
        int i3 = (p65Var.f(hi4Var) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16);
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            int i5 = i3 & 14;
            boolean z = i5 == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new fi4(hi4Var, null, i4);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
            r28 r28VarN = bgf.N(w2g.C(r28Var, 24.0f), "permission");
            rh4 rh4Var = jfc.c;
            r28 r28VarB = r28VarN.b(rh4Var);
            sn3 sn3Var = kt7.b;
            r28 r28VarA0 = flb.a0(r28VarB, ((zo7) p65Var.j(sn3Var)).c, bmb.a(4.0f));
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = R(p65Var, r28VarA0);
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
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            ((jp7) p65Var.j(kt7.a)).getClass();
            r28 r28VarD = jfc.d(jfc.r(rh4Var, 3), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.h, false);
            long j3 = p65Var.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            o28 o28Var = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j4 = p65Var.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarD3 = jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j5 = p65Var.T;
            int i9 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = R(p65Var, r28VarD3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            w2g.e(vn7.J(2131231259, 0, p65Var), null, null, null, null, 0.0f, new bs0(5, ((zo7) p65Var.j(sn3Var)).n), p65Var, 56, 60);
            jjd.b(vo7.R(p65Var, R.string.find_friends_request_permission_description), jfc.q(w2g.G(o28Var, 0.0f, 16.0f, 0.0f, 0.0f, 13), 0.0f, 200.0f, 1), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 48, 0, 130044);
            boolean z2 = i5 == 4;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new gi4(0, hi4Var, hi4.class, "openAppSettings", "openAppSettings()V", 0, 0);
                hi4Var2 = hi4Var;
                p65Var.j0(objM2);
            } else {
                hi4Var2 = hi4Var;
            }
            p65Var = p65Var;
            fo7.i((m45) ((qh6) objM2), vo7.R(p65Var, R.string.find_friends_request_permission_cta_open_settings), xn7.M, bgf.N(w2g.G(o28Var, 0.0f, 24.0f, 0.0f, 0.0f, 13), "primary_action"), false, p65Var, 3456, 16);
            ho2.N(p65Var, true, true, true, true);
        } else {
            hi4Var2 = hi4Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(hi4Var2, r28Var, i2, 28);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00f4  */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void s(defpackage.xi4 r22, defpackage.nhc r23, defpackage.hi4 r24, defpackage.obe r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 256
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gx1.s(xi4, nhc, hi4, obe, r28, x12, int, int):void");
    }

    public static final void t(String str, rz2 rz2Var, r28 r28Var, fj4 fj4Var, x12 x12Var, int i2) {
        fj4 fj4Var2;
        fj4 fj4Var3;
        int i3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1983627768);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(rz2Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        int i5 = 1;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new mb(str, 20);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    fj4Var3 = (fj4) to7.z(n1b.a.b(fj4.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-7169);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
                fj4Var3 = fj4Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(fj4Var3.v, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i7 = 3;
            g7 g7Var = new g7(i7);
            boolean zH = p65Var.h(fj4Var3);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new ff4(i7, fj4Var3);
                p65Var.j0(objM2);
            }
            ug7 ug7VarT = sgg.T(g7Var, (x45) objM2, p65Var, 0);
            hi4 hi4Var = new hi4(rz2Var, fj4Var3);
            s26 s26Var = new s26(rz2Var, 24, fj4Var3);
            int i8 = 6;
            s((xi4) l78VarZ.getValue(), nhcVarF, hi4Var, s26Var, r28Var, p65Var, (i3 << 6) & 57344, 0);
            boolean zF = p65Var.f(hi4Var);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new fi4(hi4Var, null, i5);
                p65Var.j0(objM3);
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM3, c1eVar);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = kyd.M(p65Var);
                p65Var.j0(objM4);
            }
            sb2 sb2Var = (sb2) objM4;
            boolean zH2 = p65Var.h(fj4Var3) | p65Var.f(nhcVarF) | p65Var.h(ug7VarT) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(s26Var);
            Object objM5 = p65Var.M();
            if (zH2 || objM5 == uobVar) {
                yu yuVar = new yu(fj4Var3, nhcVarF, ug7VarT, sb2Var, resources, s26Var, null, 8);
                p65Var.j0(yuVar);
                objM5 = yuVar;
            }
            kyd.k(p65Var, (b55) objM5, c1eVar);
            iy6 iy6Var = (iy6) p65Var.j(y57.a);
            boolean zH3 = p65Var.h(fj4Var3) | p65Var.h(iy6Var);
            Object objM6 = p65Var.M();
            if (zH3 || objM6 == uobVar) {
                objM6 = new si3(iy6Var, i8, fj4Var3);
                p65Var.j0(objM6);
            }
            kyd.h(iy6Var, (x45) objM6, p65Var);
            fj4Var2 = fj4Var3;
        } else {
            p65Var.S();
            fj4Var2 = fj4Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 3, str, rz2Var, r28Var, fj4Var2);
        }
    }

    public static final void u(xi4 xi4Var, hi4 hi4Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        Object gi4Var;
        hi4 hi4Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-955053062);
        int i3 = i2 | (p65Var.f(xi4Var) ? 4 : 2) | (p65Var.f(hi4Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = bjc.b(new nh2(28, xi4Var));
                p65Var.j0(objM);
            }
            upc upcVar = (upc) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM2);
            }
            l78 l78Var = (l78) objM2;
            String strR = vo7.R(p65Var, R.string.find_friends_title);
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM3 = p65Var.M();
            if (z2 || objM3 == uobVar) {
                gi4Var = new gi4(0, hi4Var, hi4.class, "onBackPressed", "onBackPressed()V", 0, 1);
                hi4Var2 = hi4Var;
                p65Var.j0(gi4Var);
            } else {
                gi4Var = objM3;
                hi4Var2 = hi4Var;
            }
            m45 m45Var = (m45) ((qh6) gi4Var);
            mz1 mz1VarE = pxf.E(254974643, new nh(upcVar, l78Var, hi4Var2, 26), p65Var);
            o28 o28Var = o28.b;
            qk7.g(o28Var, strR, m45Var, mz1VarE, null, null, 0L, 0L, null, p65Var, 3078, 496);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 13, xi4Var, hi4Var, r28Var2);
        }
    }

    public static final void v(il5 il5Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1260359844);
        int i3 = (p65Var.f(il5Var) ? 4 : 2) | i2 | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            mz1 mz1VarE = pxf.E(1628160940, new so1(17, il5Var), p65Var);
            o28 o28Var = o28.b;
            fp7.c(0, false, o28Var, mz1VarE, p65Var, 3510);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(il5Var, r28Var, i2, 10);
        }
    }

    public static og4 w(g59 g59Var, ch4 ch4Var, String str, fva fvaVar, int i2) {
        if ((i2 & 4) != 0) {
            str = null;
        }
        if ((i2 & 8) != 0) {
            fvaVar = null;
        }
        return new og4(g59Var, ch4Var, str, fvaVar);
    }

    public static lkc x(zz0 zz0Var, ch4 ch4Var) {
        return new lkc(zz0Var, ch4Var, null);
    }

    public static final void y(ti4 ti4Var, hi4 hi4Var, obe obeVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-620305445);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(ti4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(hi4Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(obeVar) ? 256 : 128;
        }
        int i4 = i3 | 3072;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var);
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(o28Var, "find_friends_list");
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 96.0f, 7);
            boolean z = (i4 & 14) == 4;
            int i5 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = ((i4 & 896) == 256) | z | (i5 == 32);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new o8(ti4Var, hi4Var, obeVar, 17);
                p65Var.j0(objM);
            }
            k40.t(r28VarN, kv6VarA, jy8VarH, null, null, null, false, null, (x45) objM, p65Var, 384, 504);
            boolean zF = p65Var.f(kv6VarA) | (i5 == 32);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new xs3(kv6VarA, hi4Var, null, 4);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6VarA);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 20, ti4Var, hi4Var, obeVar, r28Var2);
        }
    }

    public static synchronized long z(Context context) {
        ActivityManager.MemoryInfo memoryInfo;
        memoryInfo = new ActivityManager.MemoryInfo();
        ((ActivityManager) context.getSystemService("activity")).getMemoryInfo(memoryInfo);
        return memoryInfo.totalMem;
    }

    public abstract h7e S(String str, ceg cegVar, Executor executor);

    public abstract View T(int i2);

    public abstract boolean U();

    public static /* synthetic */ void b(int i2) {
        String str = i2 != 18 ? "Argument for @NotNull parameter '%s' of %s.%s must not be null" : "@NotNull method %s.%s must not return null";
        Object[] objArr = new Object[i2 != 18 ? 3 : 2];
        switch (i2) {
            case 1:
            case 7:
            case 13:
                objArr[0] = "membersFromSupertypes";
                break;
            case 2:
            case 8:
            case 14:
                objArr[0] = "membersFromCurrent";
                break;
            case 3:
            case 9:
            case 15:
                objArr[0] = ezwlgQm.PdMMokFAqlxzk;
                break;
            case 4:
            case 10:
            case 16:
                objArr[0] = "errorReporter";
                break;
            case 5:
            case 11:
            case 17:
                objArr[0] = "overridingUtil";
                break;
            case 6:
            case 12:
            case 19:
            default:
                objArr[0] = "name";
                break;
            case 18:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/load/java/components/DescriptorResolverUtils";
                break;
            case 20:
                objArr[0] = "annotationClass";
                break;
        }
        if (i2 != 18) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/load/java/components/DescriptorResolverUtils";
        } else {
            objArr[1] = "resolveOverrides";
        }
        switch (i2) {
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
                objArr[2] = "resolveOverridesForStaticMembers";
                break;
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
                objArr[2] = "resolveOverrides";
                break;
            case 18:
                break;
            case 19:
            case 20:
                objArr[2] = "getAnnotationParameterByName";
                break;
            default:
                objArr[2] = "resolveOverridesForNonStaticMembers";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i2 == 18) {
            throw new IllegalStateException(str2);
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static String C(String str) {
        int iHashCode = str.hashCode();
        switch (iHashCode) {
            case -2061550653:
                if (!str.equals("kotlin.jvm.internal.DoubleCompanionObject")) {
                    return null;
                }
                return "kotlin.Double.Companion";
            case -2056817302:
                if (str.equals("java.lang.Integer")) {
                    return "kotlin.Int";
                }
                return null;
            case -2034166429:
                if (str.equals("java.lang.Cloneable")) {
                    return "kotlin.Cloneable";
                }
                return null;
            case -1979556166:
                if (str.equals("java.lang.annotation.Annotation")) {
                    return "kotlin.Annotation";
                }
                return null;
            case -1571515090:
                if (str.equals("java.lang.Comparable")) {
                    return "kotlin.Comparable";
                }
                return null;
            case -1383349348:
                if (str.equals("java.util.Map")) {
                    return "kotlin.collections.Map";
                }
                return null;
            case -1383343454:
                if (str.equals("java.util.Set")) {
                    return "kotlin.collections.Set";
                }
                return null;
            case -1325958191:
                if (str.equals("double")) {
                    return "kotlin.Double";
                }
                return null;
            case -1182275604:
                if (str.equals("kotlin.jvm.internal.ByteCompanionObject")) {
                    return "kotlin.Byte.Companion";
                }
                return null;
            case -1062240117:
                if (str.equals("java.lang.CharSequence")) {
                    return "kotlin.CharSequence";
                }
                return null;
            case -688322466:
                if (str.equals("java.util.Collection")) {
                    return "kotlin.collections.Collection";
                }
                return null;
            case -527879800:
                if (str.equals("java.lang.Float")) {
                    return "kotlin.Float";
                }
                return null;
            case -515992664:
                if (str.equals("java.lang.Short")) {
                    return "kotlin.Short";
                }
                return null;
            case -246476834:
                if (str.equals("kotlin.jvm.internal.CharCompanionObject")) {
                    return "kotlin.Char.Companion";
                }
                return null;
            case -207262728:
                if (str.equals("kotlin.jvm.internal.LongCompanionObject")) {
                    return "kotlin.Long.Companion";
                }
                return null;
            case -165139126:
                if (str.equals("java.util.Map$Entry")) {
                    return "kotlin.collections.Map.Entry";
                }
                return null;
            case 104431:
                if (str.equals("int")) {
                    return "kotlin.Int";
                }
                return null;
            case 3039496:
                if (str.equals("byte")) {
                    return "kotlin.Byte";
                }
                return null;
            case 3052374:
                if (str.equals("char")) {
                    return "kotlin.Char";
                }
                return null;
            case 3327612:
                if (str.equals("long")) {
                    return "kotlin.Long";
                }
                return null;
            case 64711720:
                if (str.equals("boolean")) {
                    return "kotlin.Boolean";
                }
                return null;
            case 65821278:
                if (str.equals("java.util.List")) {
                    return "kotlin.collections.List";
                }
                return null;
            case 77230534:
                if (str.equals("kotlin.jvm.internal.ShortCompanionObject")) {
                    return "kotlin.Short.Companion";
                }
                return null;
            case 97526364:
                if (str.equals("float")) {
                    return "kotlin.Float";
                }
                return null;
            case 109413500:
                if (str.equals("short")) {
                    return "kotlin.Short";
                }
                return null;
            case 155276373:
                if (str.equals("java.lang.Character")) {
                    return "kotlin.Char";
                }
                return null;
            case 226173651:
                if (str.equals("kotlin.jvm.internal.EnumCompanionObject")) {
                    return "kotlin.Enum.Companion";
                }
                return null;
            case 344809556:
                if (str.equals("java.lang.Boolean")) {
                    return "kotlin.Boolean";
                }
                return null;
            case 398507100:
                if (str.equals("java.lang.Byte")) {
                    return "kotlin.Byte";
                }
                return null;
            case 398585941:
                if (str.equals("java.lang.Enum")) {
                    return "kotlin.Enum";
                }
                return null;
            case 398795216:
                if (str.equals("java.lang.Long")) {
                    return "kotlin.Long";
                }
                return null;
            case 482629606:
                if (str.equals("kotlin.jvm.internal.FloatCompanionObject")) {
                    return "kotlin.Float.Companion";
                }
                return null;
            case 499831342:
                if (str.equals("java.util.Iterator")) {
                    return "kotlin.collections.Iterator";
                }
                return null;
            case 577341676:
                if (str.equals("java.util.ListIterator")) {
                    return "kotlin.collections.ListIterator";
                }
                return null;
            case 599019395:
                if (str.equals("kotlin.jvm.internal.StringCompanionObject")) {
                    return AXoTRPEGKEve.QCLDbBuYHoAnVB;
                }
                return null;
            case 761287205:
                if (str.equals("java.lang.Double")) {
                    return "kotlin.Double";
                }
                return null;
            case 1052881309:
                if (str.equals("java.lang.Number")) {
                    return "kotlin.Number";
                }
                return null;
            case 1063877011:
                if (str.equals("java.lang.Object")) {
                    return "kotlin.Any";
                }
                return null;
            case 1195259493:
                if (str.equals("java.lang.String")) {
                    return "kotlin.String";
                }
                return null;
            case 1275614662:
                if (str.equals("java.lang.Iterable")) {
                    return "kotlin.collections.Iterable";
                }
                return null;
            case 1383693018:
                if (str.equals("kotlin.jvm.internal.BooleanCompanionObject")) {
                    return "kotlin.Boolean.Companion";
                }
                return null;
            case 1630335596:
                if (str.equals("java.lang.Throwable")) {
                    return "kotlin.Throwable";
                }
                return null;
            case 1877171123:
                if (str.equals("kotlin.jvm.internal.IntCompanionObject")) {
                    return "kotlin.Int.Companion";
                }
                return null;
            default:
                switch (iHashCode) {
                    case -1811142716:
                        if (str.equals("kotlin.jvm.functions.Function10")) {
                            return "kotlin.Function10";
                        }
                        return null;
                    case -1811142715:
                        if (str.equals("kotlin.jvm.functions.Function11")) {
                            return "kotlin.Function11";
                        }
                        return null;
                    case -1811142714:
                        if (str.equals("kotlin.jvm.functions.Function12")) {
                            return "kotlin.Function12";
                        }
                        return null;
                    case -1811142713:
                        if (str.equals("kotlin.jvm.functions.Function13")) {
                            return "kotlin.Function13";
                        }
                        return null;
                    case -1811142712:
                        if (str.equals("kotlin.jvm.functions.Function14")) {
                            return "kotlin.Function14";
                        }
                        return null;
                    case -1811142711:
                        if (str.equals("kotlin.jvm.functions.Function15")) {
                            return "kotlin.Function15";
                        }
                        return null;
                    case -1811142710:
                        if (str.equals("kotlin.jvm.functions.Function16")) {
                            return "kotlin.Function16";
                        }
                        return null;
                    case -1811142709:
                        if (str.equals("kotlin.jvm.functions.Function17")) {
                            return "kotlin.Function17";
                        }
                        return null;
                    case -1811142708:
                        if (str.equals("kotlin.jvm.functions.Function18")) {
                            return "kotlin.Function18";
                        }
                        return null;
                    case -1811142707:
                        if (str.equals("kotlin.jvm.functions.Function19")) {
                            return "kotlin.Function19";
                        }
                        return null;
                    default:
                        switch (iHashCode) {
                            case -1811142685:
                                if (str.equals("kotlin.jvm.functions.Function20")) {
                                    return "kotlin.Function20";
                                }
                                return null;
                            case -1811142684:
                                if (str.equals("kotlin.jvm.functions.Function21")) {
                                    return "kotlin.Function21";
                                }
                                return null;
                            case -1811142683:
                                if (str.equals("kotlin.jvm.functions.Function22")) {
                                    return "kotlin.Function22";
                                }
                                return null;
                            default:
                                switch (iHashCode) {
                                    case 80123371:
                                        if (str.equals("kotlin.jvm.functions.Function0")) {
                                            return "kotlin.Function0";
                                        }
                                        return null;
                                    case 80123372:
                                        if (str.equals("kotlin.jvm.functions.Function1")) {
                                            return "kotlin.Function1";
                                        }
                                        return null;
                                    case 80123373:
                                        if (str.equals("kotlin.jvm.functions.Function2")) {
                                            return "kotlin.Function2";
                                        }
                                        return null;
                                    case 80123374:
                                        if (str.equals("kotlin.jvm.functions.Function3")) {
                                            return "kotlin.Function3";
                                        }
                                        return null;
                                    case 80123375:
                                        if (str.equals("kotlin.jvm.functions.Function4")) {
                                            return "kotlin.Function4";
                                        }
                                        return null;
                                    case 80123376:
                                        if (str.equals("kotlin.jvm.functions.Function5")) {
                                            return "kotlin.Function5";
                                        }
                                        return null;
                                    case 80123377:
                                        if (str.equals("kotlin.jvm.functions.Function6")) {
                                            return "kotlin.Function6";
                                        }
                                        return null;
                                    case 80123378:
                                        if (str.equals("kotlin.jvm.functions.Function7")) {
                                            return "kotlin.Function7";
                                        }
                                        return null;
                                    case 80123379:
                                        if (str.equals("kotlin.jvm.functions.Function8")) {
                                            return "kotlin.Function8";
                                        }
                                        return null;
                                    case 80123380:
                                        if (str.equals("kotlin.jvm.functions.Function9")) {
                                            return "kotlin.Function9";
                                        }
                                        return null;
                                    default:
                                        return null;
                                }
                        }
                }
        }
    }

    public static boolean O() {
        boolean zN = N();
        String str = Build.TAGS;
        if ((!zN && str != null && str.contains("test-keys")) || new File("/system/app/Superuser.apk").exists()) {
            return true;
        }
        File file = new File(CspinKvYN.NHlGbFvAp);
        if (!zN && file.exists()) {
            return true;
        }
        return false;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static String b0(String str) {
        int iHashCode = str.hashCode();
        switch (iHashCode) {
            case -2061550653:
                if (!str.equals("kotlin.jvm.internal.DoubleCompanionObject")) {
                    return null;
                }
                return "Companion";
            case -2056817302:
                if (str.equals("java.lang.Integer")) {
                    return "Int";
                }
                return null;
            case -2034166429:
                if (str.equals("java.lang.Cloneable")) {
                    return "Cloneable";
                }
                return null;
            case -1979556166:
                if (str.equals("java.lang.annotation.Annotation")) {
                    return "Annotation";
                }
                return null;
            case -1571515090:
                if (str.equals("java.lang.Comparable")) {
                    return "Comparable";
                }
                return null;
            case -1383349348:
                if (str.equals("java.util.Map")) {
                    return "Map";
                }
                return null;
            case -1383343454:
                if (str.equals("java.util.Set")) {
                    return "Set";
                }
                return null;
            case -1325958191:
                if (str.equals("double")) {
                    return "Double";
                }
                return null;
            case -1182275604:
                if (!str.equals("kotlin.jvm.internal.ByteCompanionObject")) {
                    return null;
                }
                return "Companion";
            case -1062240117:
                if (str.equals("java.lang.CharSequence")) {
                    return "CharSequence";
                }
                return null;
            case -688322466:
                if (str.equals("java.util.Collection")) {
                    return "Collection";
                }
                return null;
            case -527879800:
                if (str.equals("java.lang.Float")) {
                    return "Float";
                }
                return null;
            case -515992664:
                if (str.equals("java.lang.Short")) {
                    return "Short";
                }
                return null;
            case -246476834:
                if (!str.equals("kotlin.jvm.internal.CharCompanionObject")) {
                    return null;
                }
                return "Companion";
            case -207262728:
                if (!str.equals("kotlin.jvm.internal.LongCompanionObject")) {
                    return null;
                }
                return "Companion";
            case -165139126:
                if (str.equals("java.util.Map$Entry")) {
                    return "Entry";
                }
                return null;
            case 104431:
                if (str.equals("int")) {
                    return "Int";
                }
                return null;
            case 3039496:
                if (str.equals("byte")) {
                    return "Byte";
                }
                return null;
            case 3052374:
                if (str.equals("char")) {
                    return "Char";
                }
                return null;
            case 3327612:
                if (str.equals("long")) {
                    return "Long";
                }
                return null;
            case 64711720:
                if (str.equals("boolean")) {
                    return "Boolean";
                }
                return null;
            case 65821278:
                if (str.equals("java.util.List")) {
                    return "List";
                }
                return null;
            case 77230534:
                if (!str.equals("kotlin.jvm.internal.ShortCompanionObject")) {
                    return null;
                }
                return "Companion";
            case 97526364:
                if (str.equals("float")) {
                    return "Float";
                }
                return null;
            case 109413500:
                if (str.equals("short")) {
                    return "Short";
                }
                return null;
            case 155276373:
                if (str.equals("java.lang.Character")) {
                    return "Char";
                }
                return null;
            case 226173651:
                if (!str.equals("kotlin.jvm.internal.EnumCompanionObject")) {
                    return null;
                }
                return "Companion";
            case 344809556:
                if (str.equals("java.lang.Boolean")) {
                    return "Boolean";
                }
                return null;
            case 398507100:
                if (str.equals("java.lang.Byte")) {
                    return "Byte";
                }
                return null;
            case 398585941:
                if (str.equals("java.lang.Enum")) {
                    return "Enum";
                }
                return null;
            case 398795216:
                if (str.equals("java.lang.Long")) {
                    return "Long";
                }
                return null;
            case 482629606:
                if (!str.equals("kotlin.jvm.internal.FloatCompanionObject")) {
                    return null;
                }
                return "Companion";
            case 499831342:
                if (str.equals("java.util.Iterator")) {
                    return "Iterator";
                }
                return null;
            case 577341676:
                if (str.equals("java.util.ListIterator")) {
                    return "ListIterator";
                }
                return null;
            case 599019395:
                if (!str.equals("kotlin.jvm.internal.StringCompanionObject")) {
                    return null;
                }
                return "Companion";
            case 761287205:
                if (str.equals("java.lang.Double")) {
                    return "Double";
                }
                return null;
            case 1052881309:
                if (str.equals(fiHTiFJ.dTwPmZcT)) {
                    return "Number";
                }
                return null;
            case 1063877011:
                if (str.equals("java.lang.Object")) {
                    return "Any";
                }
                return null;
            case 1195259493:
                if (str.equals("java.lang.String")) {
                    return "String";
                }
                return null;
            case 1275614662:
                if (str.equals("java.lang.Iterable")) {
                    return "Iterable";
                }
                return null;
            case 1383693018:
                if (!str.equals("kotlin.jvm.internal.BooleanCompanionObject")) {
                    return null;
                }
                return "Companion";
            case 1630335596:
                if (str.equals("java.lang.Throwable")) {
                    return "Throwable";
                }
                return null;
            case 1877171123:
                if (!str.equals("kotlin.jvm.internal.IntCompanionObject")) {
                    return null;
                }
                return "Companion";
            default:
                switch (iHashCode) {
                    case -1811142716:
                        if (str.equals("kotlin.jvm.functions.Function10")) {
                            return "Function10";
                        }
                        return null;
                    case -1811142715:
                        if (str.equals("kotlin.jvm.functions.Function11")) {
                            return "Function11";
                        }
                        return null;
                    case -1811142714:
                        if (str.equals("kotlin.jvm.functions.Function12")) {
                            return "Function12";
                        }
                        return null;
                    case -1811142713:
                        if (str.equals("kotlin.jvm.functions.Function13")) {
                            return "Function13";
                        }
                        return null;
                    case -1811142712:
                        if (str.equals("kotlin.jvm.functions.Function14")) {
                            return "Function14";
                        }
                        return null;
                    case -1811142711:
                        if (str.equals("kotlin.jvm.functions.Function15")) {
                            return "Function15";
                        }
                        return null;
                    case -1811142710:
                        if (str.equals("kotlin.jvm.functions.Function16")) {
                            return "Function16";
                        }
                        return null;
                    case -1811142709:
                        if (str.equals("kotlin.jvm.functions.Function17")) {
                            return "Function17";
                        }
                        return null;
                    case -1811142708:
                        if (str.equals("kotlin.jvm.functions.Function18")) {
                            return "Function18";
                        }
                        return null;
                    case -1811142707:
                        if (str.equals("kotlin.jvm.functions.Function19")) {
                            return "Function19";
                        }
                        return null;
                    default:
                        switch (iHashCode) {
                            case -1811142685:
                                if (str.equals("kotlin.jvm.functions.Function20")) {
                                    return "Function20";
                                }
                                return null;
                            case -1811142684:
                                if (str.equals("kotlin.jvm.functions.Function21")) {
                                    return "Function21";
                                }
                                return null;
                            case -1811142683:
                                if (str.equals("kotlin.jvm.functions.Function22")) {
                                    return "Function22";
                                }
                                return null;
                            default:
                                switch (iHashCode) {
                                    case 80123371:
                                        if (str.equals("kotlin.jvm.functions.Function0")) {
                                            return "Function0";
                                        }
                                        return null;
                                    case 80123372:
                                        if (str.equals("kotlin.jvm.functions.Function1")) {
                                            return "Function1";
                                        }
                                        return null;
                                    case 80123373:
                                        if (str.equals("kotlin.jvm.functions.Function2")) {
                                            return "Function2";
                                        }
                                        return null;
                                    case 80123374:
                                        if (str.equals("kotlin.jvm.functions.Function3")) {
                                            return "Function3";
                                        }
                                        return null;
                                    case 80123375:
                                        if (str.equals("kotlin.jvm.functions.Function4")) {
                                            return "Function4";
                                        }
                                        return null;
                                    case 80123376:
                                        if (str.equals("kotlin.jvm.functions.Function5")) {
                                            return "Function5";
                                        }
                                        return null;
                                    case 80123377:
                                        if (str.equals("kotlin.jvm.functions.Function6")) {
                                            return "Function6";
                                        }
                                        return null;
                                    case 80123378:
                                        if (str.equals("kotlin.jvm.functions.Function7")) {
                                            return "Function7";
                                        }
                                        return null;
                                    case 80123379:
                                        if (str.equals("kotlin.jvm.functions.Function8")) {
                                            return "Function8";
                                        }
                                        return null;
                                    case 80123380:
                                        if (str.equals("kotlin.jvm.functions.Function9")) {
                                            return "Function9";
                                        }
                                        return null;
                                    default:
                                        return null;
                                }
                        }
                }
        }
    }
}

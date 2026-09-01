package defpackage;

import android.animation.TimeInterpolator;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Path;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import android.util.TypedValue;
import android.view.animation.AnimationUtils;
import android.view.animation.PathInterpolator;
import android.view.inputmethod.ExtractedText;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.facebook.FacebookSdkNotInitializedException;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class hk7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;

    public static boolean A(Context context) {
        if (Build.VERSION.SDK_INT >= 24) {
            return o6.o(context);
        }
        return true;
    }

    public static final al7 B(lmb lmbVar, int i, int i2, int i3, int i4, int i5, bl7 bl7Var, List list, t99[] t99VarArr, int i6, int i7, int[] iArr, int i8) {
        int i9;
        float f;
        long j;
        int i10;
        int i11;
        int i12;
        List list2 = list;
        long j2 = i5;
        int i13 = i7 - i6;
        int[] iArr2 = new int[i13];
        int i14 = i6;
        int iMax = 0;
        int i15 = 0;
        int i16 = 0;
        int iMin = 0;
        float f2 = 0.0f;
        while (i14 < i7) {
            tk7 tk7Var = (tk7) list2.get(i14);
            float F = ek7.F(ek7.D(tk7Var));
            if (F > 0.0f) {
                f2 += F;
                i15++;
                j = j2;
                i10 = i14;
            } else {
                int i17 = i3 - i16;
                t99 t99VarS = t99VarArr[i14];
                j = j2;
                if (t99VarS == null) {
                    if (i3 == Integer.MAX_VALUE) {
                        i10 = i14;
                        i11 = i15;
                        i12 = Integer.MAX_VALUE;
                    } else {
                        i10 = i14;
                        i11 = i15;
                        i12 = i17 < 0 ? 0 : i17;
                    }
                    t99VarS = tk7Var.s(lmbVar.g(0, i12, i4, false));
                } else {
                    i10 = i14;
                    i11 = i15;
                }
                t99 t99Var = t99VarS;
                int iJ = lmbVar.j(t99Var);
                int i18 = lmbVar.i(t99Var);
                iArr2[i10 - i6] = iJ;
                int i19 = i17 - iJ;
                if (i19 < 0) {
                    i19 = 0;
                }
                iMin = Math.min(i5, i19);
                i16 += iJ + iMin;
                iMax = Math.max(iMax, i18);
                t99VarArr[i10] = t99Var;
                i15 = i11;
            }
            i14 = i10 + 1;
            j2 = j;
        }
        long j3 = j2;
        int i20 = i15;
        if (i20 == 0) {
            i16 -= iMin;
            i9 = 0;
        } else {
            long j4 = ((long) (i20 - 1)) * j3;
            long jRound = ((long) ((i3 != Integer.MAX_VALUE ? i3 : i) - i16)) - j4;
            if (jRound < 0) {
                jRound = 0;
            }
            float f3 = jRound / f2;
            for (int i21 = i6; i21 < i7; i21++) {
                jRound -= (long) Math.round(ek7.F(ek7.D((tk7) list2.get(i21))) * f3);
            }
            int i22 = i6;
            int i23 = iMax;
            int i24 = 0;
            while (i22 < i7) {
                if (t99VarArr[i22] == null) {
                    tk7 tk7Var2 = (tk7) list2.get(i22);
                    f = f3;
                    mmb mmbVarD = ek7.D(tk7Var2);
                    float F2 = ek7.F(mmbVarD);
                    if (F2 <= 0.0f) {
                        z16.b("All weights <= 0 should have placeables");
                    }
                    int iSignum = Long.signum(jRound);
                    long j5 = jRound - ((long) iSignum);
                    int iMax2 = Math.max(0, Math.round(F2 * f) + iSignum);
                    t99 t99VarS2 = tk7Var2.s(lmbVar.g((!(mmbVarD != null ? mmbVarD.b : true) || iMax2 == Integer.MAX_VALUE) ? 0 : iMax2, iMax2, i4, true));
                    int iJ2 = lmbVar.j(t99VarS2);
                    int i25 = lmbVar.i(t99VarS2);
                    iArr2[i22 - i6] = iJ2;
                    i24 += iJ2;
                    int iMax3 = Math.max(i23, i25);
                    t99VarArr[i22] = t99VarS2;
                    i23 = iMax3;
                    jRound = j5;
                } else {
                    f = f3;
                }
                i22++;
                list2 = list;
                f3 = f;
            }
            i9 = (int) (((long) i24) + j4);
            int i26 = i3 - i16;
            if (i9 < 0) {
                i9 = 0;
            }
            if (i9 > i26) {
                i9 = i26;
            }
            iMax = i23;
        }
        int i27 = i9 + i16;
        if (i27 < 0) {
            i27 = 0;
        }
        int iMax4 = Math.max(i27, i);
        int iMax5 = Math.max(iMax, Math.max(i2, 0));
        int[] iArr3 = new int[i13];
        lmbVar.f(iMax4, iArr2, iArr3, bl7Var);
        return lmbVar.h(t99VarArr, bl7Var, iArr3, iMax4, iMax5, iArr, i8, i6, i7);
    }

    public static final void D(Collection collection) {
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            if (it2.next() == null) {
                z72.c("Container 'requests' cannot contain null values");
                return;
            }
        }
        if (collection.isEmpty()) {
            ywb.g("Container 'requests' cannot be empty");
        }
    }

    public static final void E(String str, String str2) {
        if (str == null || str.length() <= 0) {
            ywb.g(ev6.x("Argument '", str2, "' cannot be null or empty"));
        }
    }

    public static TimeInterpolator F(Context context, TimeInterpolator timeInterpolator) {
        TypedValue typedValue = new TypedValue();
        if (!context.getTheme().resolveAttribute(R.attr.motionEasingEmphasizedInterpolator, typedValue, true)) {
            return timeInterpolator;
        }
        if (typedValue.type != 3) {
            ay0.e("Motion easing theme attribute must be an @interpolator resource for ?attr/motionEasing*Interpolator attributes or a string for ?attr/motionEasing* attributes.");
            return null;
        }
        String strValueOf = String.valueOf(typedValue.string);
        if (!z(strValueOf, "cubic-bezier") && !z(strValueOf, "path")) {
            return AnimationUtils.loadInterpolator(context, typedValue.resourceId);
        }
        if (z(strValueOf, "cubic-bezier")) {
            String[] strArrSplit = strValueOf.substring(13, strValueOf.length() - 1).split(",");
            if (strArrSplit.length == 4) {
                return new PathInterpolator(t(0, strArrSplit), t(1, strArrSplit), t(2, strArrSplit), t(3, strArrSplit));
            }
            ik4.d(strArrSplit.length, "Motion easing theme attribute must have 4 control points if using bezier curve format; instead got: ");
            return null;
        }
        if (!z(strValueOf, "path")) {
            ay0.e("Invalid motion easing type: ".concat(strValueOf));
            return null;
        }
        String strSubstring = strValueOf.substring(5, strValueOf.length() - 1);
        Path path = new Path();
        try {
            wo7.r(wo7.m(strSubstring), path);
            return new PathInterpolator(path);
        } catch (RuntimeException e) {
            lg8.p("Error in parsing ".concat(strSubstring), e);
            return null;
        }
    }

    public static final void G() {
        if (!f94.q.get()) {
            throw new FacebookSdkNotInitializedException("The SDK has not been initialized, make sure to call FacebookSdk.sdkInitialize() first.");
        }
    }

    public static final ExtractedText H(uid uidVar) {
        ExtractedText extractedText = new ExtractedText();
        String str = uidVar.a.b;
        extractedText.text = str;
        extractedText.startOffset = 0;
        extractedText.partialEndOffset = str.length();
        extractedText.partialStartOffset = -1;
        long j = uidVar.b;
        extractedText.selectionStart = bkd.f(j);
        extractedText.selectionEnd = bkd.e(j);
        extractedText.flags = !muc.R(uidVar.a.b, '\n') ? 1 : 0;
        return extractedText;
    }

    public static String I(int i) {
        return i == 1 ? "Clip" : i == 2 ? "Ellipsis" : i == 5 ? "MiddleEllipsis" : i == 3 ? "Visible" : i == 4 ? "StartEllipsis" : "Invalid";
    }

    public static final wwb J(final o72 o72Var, final ym0 ym0Var, wwb wwbVar) {
        int i = ym0Var.c;
        int i2 = ym0Var.b;
        boolean z = o72Var.b;
        final int i3 = z ? i2 : i;
        qjd qjdVar = (qjd) ym0Var.e;
        int i4 = ym0Var.d;
        yw6 yw6Var = yw6.NONE;
        final vq6 vq6VarD0 = vx0.d0(yw6Var, new hz8(i3, 1, ym0Var));
        final int i5 = z ? i : i2;
        vq6 vq6VarD02 = vx0.d0(yw6Var, new m45() { // from class: zwb
            @Override // defpackage.m45
            public final Object invoke() {
                ym0 ym0Var2 = ym0Var;
                qjd qjdVar2 = (qjd) ym0Var2.e;
                int iIntValue = ((Number) vq6VarD0.getValue()).intValue();
                o72 o72Var2 = o72Var;
                boolean z2 = o72Var2.b;
                boolean z3 = o72Var2.d() == gj2.CROSSED;
                int i6 = i3;
                long j = qjdVar2.j(i6);
                f58 f58Var = qjdVar2.b;
                int i7 = bkd.c;
                int iG = (int) (j >> 32);
                int i8 = f58Var.f;
                if (f58Var.d(iG) != iIntValue) {
                    iG = iIntValue >= i8 ? qjdVar2.g(i8 - 1) : qjdVar2.g(iIntValue);
                }
                int iC = (int) (j & 4294967295L);
                if (f58Var.d(iC) != iIntValue) {
                    iC = iIntValue >= i8 ? f58Var.c(i8 - 1, false) : f58Var.c(iIntValue, false);
                }
                int i9 = i5;
                if (iG == i9) {
                    return ym0Var2.d(iC);
                }
                if (iC == i9) {
                    return ym0Var2.d(iG);
                }
                if (!(z2 ^ z3) ? i6 >= iG : i6 > iC) {
                    iG = iC;
                }
                return ym0Var2.d(iG);
            }
        });
        if (1 != wwbVar.c) {
            return (wwb) vq6VarD02.getValue();
        }
        if (i3 == i4) {
            return wwbVar;
        }
        if (((Number) vq6VarD0.getValue()).intValue() != qjdVar.b.d(i4)) {
            return (wwb) vq6VarD02.getValue();
        }
        int i6 = wwbVar.b;
        long j = qjdVar.j(i6);
        if (i4 != -1) {
            if (i3 != i4) {
                if (((z ? 1 : 0) ^ ((i2 < i ? gj2.NOT_CROSSED : i2 > i ? gj2.CROSSED : gj2.COLLAPSED) != gj2.CROSSED ? 0 : 1)) == 0) {
                }
            }
            return ym0Var.d(i3);
        }
        int i7 = bkd.c;
        return (i6 == ((int) (j >> 32)) || i6 == ((int) (j & 4294967295L))) ? (wwb) vq6VarD02.getValue() : ym0Var.d(i3);
    }

    public static String K(Object obj) {
        if (obj == null) {
            return "null";
        }
        try {
            return obj.toString();
        } catch (Exception e) {
            String strX = ev6.x(obj.getClass().getName(), "@", Integer.toHexString(System.identityHashCode(obj)));
            Logger.getLogger("com.google.common.base.Strings").logp(Level.WARNING, "com.google.common.base.Strings", "lenientToString", "Exception during lenientFormat for ".concat(strX), (Throwable) e);
            return ev6.y("<", strX, " threw ", e.getClass().getName(), ">");
        }
    }

    public static String L(String str, Object... objArr) {
        int iIndexOf;
        StringBuilder sb = new StringBuilder((objArr.length * 16) + str.length());
        int i = 0;
        int i2 = 0;
        while (i < objArr.length && (iIndexOf = str.indexOf("%s", i2)) != -1) {
            sb.append((CharSequence) str, i2, iIndexOf);
            sb.append(K(objArr[i]));
            i2 = iIndexOf + 2;
            i++;
        }
        sb.append((CharSequence) str, i2, str.length());
        if (i < objArr.length) {
            String str2 = " [";
            while (i < objArr.length) {
                sb.append(str2);
                sb.append(K(objArr[i]));
                i++;
                str2 = ", ";
            }
            sb.append(']');
        }
        return sb.toString();
    }

    public static boolean M(int i) {
        Boolean bool;
        if (i - 1 == 0) {
            return !yjg.a();
        }
        if (!yjg.a()) {
            return true;
        }
        try {
            bool = (Boolean) Class.forName("org.conscrypt.Conscrypt").getMethod("isBoringSslFIPSBuild", null).invoke(null, null);
        } catch (Exception unused) {
            yjg.a.logp(Level.INFO, "com.google.crypto.tink.config.internal.TinkFipsUtil", "checkConscryptIsAvailableAndUsesFipsBoringSsl", "Conscrypt is not available or does not support checking for FIPS build.");
            bool = Boolean.FALSE;
        }
        return bool.booleanValue();
    }

    public static /* synthetic */ boolean N(Unsafe unsafe, vzf vzfVar, long j, Object obj, Object obj2) {
        while (!unsafe.compareAndSwapObject(vzfVar, j, obj, obj2)) {
            if (unsafe.getObject(vzfVar, j) != obj && unsafe.getObject(vzfVar, j) != obj) {
                return false;
            }
        }
        return true;
    }

    public static final void a(mz1 mz1Var, String str, m45 m45Var, x12 x12Var, int i) {
        int i2;
        String str2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-782960309);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(mz1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            str2 = str;
            i2 |= p65Var.f(str2) ? 32 : 16;
        } else {
            str2 = str;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(m45Var) ? 256 : 128;
        }
        int i3 = i & 3072;
        o28 o28Var = o28.b;
        if (i3 == 0) {
            i2 |= p65Var.f(o28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            amb ambVarA = bmb.a(8.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarF = w2g.F(hlg.r(r40.y(bo.B(o28Var, 1.0f, ((zo7) p65Var.j(sn3Var)).x, ambVarA), ambVarA), false, null, new vkb(0), m45Var, 11), 10.0f, 6.0f, 12.0f, 6.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarF);
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
            mz1Var.invoke(p65Var, Integer.valueOf(i2 & 14));
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            jjd.b(str2, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, new bb9(true), null, 16252926), p65Var, (i2 >> 3) & 14, 0, 131070);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 10, mz1Var, str, m45Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x01d1  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01df  */
    /* JADX WARN: Removed duplicated region for block: B:70:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(boolean r48, defpackage.x45 r49, defpackage.r28 r50, boolean r51, defpackage.m68 r52, defpackage.m5d r53, defpackage.x12 r54, int r55, int r56) {
        /*
            Method dump skipped, instruction units count: 496
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hk7.b(boolean, x45, r28, boolean, m68, m5d, x12, int, int):void");
    }

    public static final void c(int i, long j, x12 x12Var, r28 r28Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(124770650);
        int i2 = i | 6;
        if ((i & 48) == 0) {
            i2 |= p65Var.e(j) ? 32 : 16;
        }
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                r28Var = o28.b;
            } else {
                p65Var.S();
            }
            p65Var.q();
            dy0.a(flb.a0(jfc.e(jfc.p(r28Var, 52.0f), 32.0f), j, bmb.a(16.0f)), p65Var, 0);
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j, i, 8);
        }
    }

    public static final void d(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-618540324);
        if (p65Var.P(i & 1, i != 0)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i2));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new be7(14);
                p65Var.j0(objM);
            }
            b(true, (x45) objM, null, false, null, null, p65Var, 54, 60);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new be7(15);
                p65Var.j0(objM2);
            }
            b(false, (x45) objM2, null, false, null, null, p65Var, 54, 60);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new be7(16);
                p65Var.j0(objM3);
            }
            b(false, (x45) objM3, null, false, null, null, p65Var, 3126, 52);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new be7(17);
                p65Var.j0(objM4);
            }
            b(true, (x45) objM4, null, false, null, null, p65Var, 3126, 52);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 19);
        }
    }

    public static final void e(cv7 cv7Var, te9 te9Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-864505175);
        int i2 = (p65Var.f(cv7Var) ? 4 : 2) | i | (p65Var.f(te9Var) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i4 = i2 & 14;
            boolean z = (i3 == 32) | (i4 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new n79(te9Var, cv7Var, null, 3);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
            mz1 mz1Var = guc.g;
            String strR = vo7.R(p65Var, R.string.chip_member_only);
            boolean z2 = (i3 == 32) | (i4 == 4);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new ps5(te9Var, 27, cv7Var);
                p65Var.j0(objM2);
            }
            a(mz1Var, strR, (m45) objM2, p65Var, 3078);
            r28Var = o28.b;
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i, 29, cv7Var, te9Var, r28Var2);
        }
    }

    public static final void f(int i, long j, x12 x12Var, r28 r28Var) {
        long j2;
        int i2;
        long j3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(410488739);
        int i3 = i | (p65Var.f(r28Var) ? 4 : 2) | 16;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                i2 = i3 & (-113);
                j3 = ((zo7) p65Var.j(kt7.b)).c;
            } else {
                p65Var.S();
                i2 = i3 & (-113);
                j3 = j;
            }
            p65Var.q();
            r28 r28VarV = m40.V(r28Var, p65Var, i2 & 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            char c2 = ' ';
            int i4 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
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
            p65Var.Y(270414384);
            int iR = 0;
            while (iR < 25) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, false);
                long j5 = p65Var.T;
                int i5 = (int) (j5 ^ (j5 >>> c2));
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
                Integer numValueOf = Integer.valueOf(i5);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                char c3 = c2;
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, false);
                long j6 = p65Var.T;
                int i6 = (int) (j6 ^ (j6 >>> c3));
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
                ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                tr7.d(0, j3, p65Var, null);
                tp7.c(0.0f, 0, 5, j3, p65Var, null);
                iR = wgd.r(p65Var, true, true, iR, 1);
                c2 = c3;
            }
            p65Var.p(false);
            p65Var.p(true);
            j2 = j3;
        } else {
            p65Var.S();
            j2 = j;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var, j2, i, 13);
        }
    }

    public static final void g(ue9 ue9Var, te9 te9Var, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        ue9 ue9Var2 = ue9Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-271353173);
        int i2 = i | (p65Var.f(ue9Var2) ? 4 : 2);
        if ((i & 48) == 0) {
            i2 |= p65Var.f(te9Var) ? 32 : 16;
        }
        int i3 = i2 | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            float f = ue9Var2.a;
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), w2g.F(o28Var, 24.0f, f, 24.0f, 15.0f), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
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
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            ue9Var2 = ue9Var;
            m40.p(null, new h70(8.0f, true, new z10(21)), null, null, 0, 0, pxf.E(-1898218503, new g64(ue9Var2, 29, te9Var), p65Var), p65Var, 1572912, 61);
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 11, ue9Var2, te9Var, r28Var2);
        }
    }

    public static final void h(String str, String str2, r28 r28Var, String str3, x12 x12Var, int i, int i2) {
        String str4;
        int i3;
        String str5;
        String str6;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1624404992);
        int i4 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16);
        int i5 = i2 & 8;
        if (i5 != 0) {
            i3 = i4 | 3072;
            str4 = str3;
        } else {
            str4 = str3;
            i3 = i4 | (p65Var.f(str4) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            String str7 = i5 != 0 ? null : str4;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i6 = (int) (j ^ (j >>> 32));
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            sn3 sn3Var = jt7.c;
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).m;
            o28 o28Var = o28.b;
            int i7 = i3;
            jjd.b(str, bgf.N(o28Var, "stats_post_top"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var, (i3 & 14) | 48, 0, 131068);
            hp7.t(p65Var, jfc.l(o28Var, 6.0f));
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i8 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            mkd mkdVar2 = ((bu7) p65Var.j(sn3Var)).o;
            sn3 sn3Var2 = kt7.b;
            jjd.b(str2, bgf.N(o28Var, "stats_post_bottom"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(mkdVar2, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, ((i7 >> 3) & 14) | 48, 0, 131068);
            p65Var = p65Var;
            if (str7 != null) {
                km4.F(4.0f, -1025212351, p65Var, p65Var, o28Var);
                str6 = str7;
                vx0.p(str6, bgf.N(o28Var, "tooltip"), ((zo7) p65Var.j(sn3Var2)).o, p65Var, ((i7 >> 9) & 14) | 48, 8);
                z = false;
            } else {
                str6 = str7;
                z = false;
                p65Var.Y(-1033218628);
            }
            p65Var.p(z);
            p65Var.p(true);
            p65Var.p(true);
            str5 = str6;
        } else {
            p65Var.S();
            str5 = str4;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(str, str2, r28Var, str5, i, i2, 19);
        }
    }

    public static final void i(tf9 tf9Var, te9 te9Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(680843823);
        int i2 = 4;
        int i3 = (p65Var.f(tf9Var) ? 4 : 2) | i | (p65Var.f(te9Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i5 = i3 & 14;
            boolean z = (i4 == 32) | (i5 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new n79(te9Var, tf9Var, null, i2);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
            mz1 mz1Var = guc.f;
            String strR = vo7.R(p65Var, R.string.chip_featured);
            boolean z2 = (i4 == 32) | (i5 == 4);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new ps5(te9Var, 28, tf9Var);
                p65Var.j0(objM2);
            }
            a(mz1Var, strR, (m45) objM2, p65Var, 3078);
            r28Var = o28.b;
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 0, tf9Var, te9Var, r28Var2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0637  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0642  */
    /* JADX WARN: Removed duplicated region for block: B:135:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0053  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0435  */
    /* JADX WARN: Type inference failed for: r10v10, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r10v14, types: [p65] */
    /* JADX WARN: Type inference failed for: r10v15, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r10v17 */
    /* JADX WARN: Type inference failed for: r10v19 */
    /* JADX WARN: Type inference failed for: r10v2, types: [p65] */
    /* JADX WARN: Type inference failed for: r10v20, types: [p65] */
    /* JADX WARN: Type inference failed for: r10v21, types: [p65] */
    /* JADX WARN: Type inference failed for: r10v22, types: [p65] */
    /* JADX WARN: Type inference failed for: r10v25 */
    /* JADX WARN: Type inference failed for: r10v26 */
    /* JADX WARN: Type inference failed for: r10v27 */
    /* JADX WARN: Type inference failed for: r10v28 */
    /* JADX WARN: Type inference failed for: r10v29 */
    /* JADX WARN: Type inference failed for: r10v3, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r10v30 */
    /* JADX WARN: Type inference failed for: r10v31 */
    /* JADX WARN: Type inference failed for: r10v32 */
    /* JADX WARN: Type inference failed for: r10v33 */
    /* JADX WARN: Type inference failed for: r10v34 */
    /* JADX WARN: Type inference failed for: r10v35 */
    /* JADX WARN: Type inference failed for: r10v36 */
    /* JADX WARN: Type inference failed for: r10v37 */
    /* JADX WARN: Type inference failed for: r10v38 */
    /* JADX WARN: Type inference failed for: r10v4, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r10v5, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r10v6, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r10v7, types: [p65] */
    /* JADX WARN: Type inference failed for: r10v8, types: [p65] */
    /* JADX WARN: Type inference failed for: r11v21, types: [x12] */
    /* JADX WARN: Type inference failed for: r11v24, types: [x12] */
    /* JADX WARN: Type inference failed for: r11v27, types: [x12] */
    /* JADX WARN: Type inference failed for: r14v12 */
    /* JADX WARN: Type inference failed for: r14v13 */
    /* JADX WARN: Type inference failed for: r14v14 */
    /* JADX WARN: Type inference failed for: r14v15 */
    /* JADX WARN: Type inference failed for: r14v22 */
    /* JADX WARN: Type inference failed for: r14v23 */
    /* JADX WARN: Type inference failed for: r24v0, types: [x12] */
    /* JADX WARN: Type inference failed for: r24v3, types: [x12] */
    /* JADX WARN: Type inference failed for: r24v4, types: [x12] */
    /* JADX WARN: Type inference failed for: r4v32 */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r4v6, types: [boolean, int] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void j(defpackage.wqc r62, defpackage.qqc r63, defpackage.r28 r64, defpackage.x12 r65, int r66, int r67) {
        /*
            Method dump skipped, instruction units count: 1620
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hk7.j(wqc, qqc, r28, x12, int, int):void");
    }

    public static final void k(boolean z, m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i) {
        int i2;
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-999941594);
        if ((i & 6) == 0) {
            i2 = (p65Var.g(z) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(m45Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(m45Var2) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            int i4 = i2;
            ek7.h(vo7.R(p65Var, R.string.withdraw_submission_confirmation_title), m45Var2, null, vo7.R(p65Var, R.string.withdraw_submission_confirmation_description), vo7.R(p65Var, R.string.withdraw_submission_confirmation_cta_withdraw), m45Var, vo7.R(p65Var, R.string.common_cancel), m45Var2, p65Var, ((i4 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i4 << 12) & 458752) | ((i4 << 15) & 29360128), 4);
            if (z) {
                p65Var.Y(-1374931281);
                iy0 iy0Var = iy0.a;
                o28 o28Var = o28.b;
                r28 r28VarA0 = flb.a0(iy0Var.b(o28Var), uu1.b(0.6f, ((zo7) p65Var.j(kt7.b)).c), rv8.r);
                zk7 zk7VarC2 = dy0.c(ar0Var, false);
                long j2 = p65Var.T;
                int i5 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarA0);
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
                xz5.o(iy0Var.a(o28Var, z46.h), null, 0.0f, 0L, 0L, 0, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                z2 = true;
                p65Var.p(true);
            } else {
                z2 = true;
                p65Var.Y(-1377758698);
            }
            p65Var.p(false);
            p65Var.p(z2);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w61(z, m45Var, m45Var2, r28Var, i);
        }
    }

    public static final void l(String str, String str2, boolean z, r6f r6fVar, r28 r28Var, w6f w6fVar, x12 x12Var, int i) {
        p65 p65Var;
        r6f r6fVar2;
        r28 r28Var2;
        w6f w6fVar2;
        w6f w6fVar3;
        int i2;
        r28 r28Var3;
        w6f w6fVar4;
        int i3;
        w6f w6fVar5;
        str.getClass();
        str2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1308478745);
        int i4 = i | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(str2) ? 32 : 16) | (p65Var2.g(z) ? 256 : 128) | (p65Var2.f(r6fVar) ? 2048 : 1024) | 90112;
        if (p65Var2.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var2.U();
            int i5 = i & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var2.z()) {
                boolean z2 = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 896) == 256);
                Object objM = p65Var2.M();
                if (z2 || objM == uobVar) {
                    objM = new rb(str, str2, z);
                    p65Var2.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var2);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    w6fVar3 = (w6f) to7.z(n1b.a.b(w6f.class), wueVarA, t40.E(wueVarA, p65Var2), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var2);
                    i2 = i4 & (-458753);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var2.S();
                i2 = i4 & (-458753);
                r28Var3 = r28Var;
                w6fVar3 = w6fVar;
            }
            p65Var2.q();
            boolean zBooleanValue = ((Boolean) guc.z(w6fVar3.g, p65Var2, 0).getValue()).booleanValue();
            boolean zH = p65Var2.h(w6fVar3);
            Object objM2 = p65Var2.M();
            if (zH || objM2 == uobVar) {
                w6fVar4 = w6fVar3;
                objM2 = new k8e(0, w6fVar4, w6f.class, "withdrawSubmission", "withdrawSubmission()V", 0, 26);
                p65Var2.j0(objM2);
            } else {
                w6fVar4 = w6fVar3;
            }
            m45 m45Var = (m45) ((qh6) objM2);
            int i6 = i2 & 7168;
            boolean z3 = i6 == 2048;
            Object objM3 = p65Var2.M();
            if (z3 || objM3 == uobVar) {
                i3 = i6;
                w6fVar5 = w6fVar4;
                k8e k8eVar = new k8e(0, r6fVar, r6f.class, "onClose", "onClose()V", 0, 27);
                r6fVar2 = r6fVar;
                p65Var2.j0(k8eVar);
                objM3 = k8eVar;
            } else {
                r6fVar2 = r6fVar;
                i3 = i6;
                w6fVar5 = w6fVar4;
            }
            m45 m45Var2 = (m45) ((qh6) objM3);
            p65Var = p65Var2;
            r28 r28Var4 = r28Var3;
            k(zBooleanValue, m45Var, m45Var2, r28Var4, p65Var, 3072);
            boolean zH2 = p65Var.h(w6fVar5) | (i3 == 2048);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                objM4 = new cfd(w6fVar5, r6fVar2, null, 28);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            r28Var2 = r28Var4;
            w6fVar2 = w6fVar5;
        } else {
            p65Var = p65Var2;
            r6fVar2 = r6fVar;
            p65Var.S();
            r28Var2 = r28Var;
            w6fVar2 = w6fVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ke0(str, str2, z, r6fVar2, r28Var2, w6fVar2, i, 5);
        }
    }

    public static final xwb m(o72 o72Var, ux0 ux0Var) {
        gj2 gj2VarD = o72Var.d();
        ym0 ym0Var = (ym0) o72Var.d;
        boolean z = gj2VarD == gj2.CROSSED;
        return new xwb(n(ym0Var, z, true, ux0Var), n(ym0Var, z, false, ux0Var), z);
    }

    public static final wwb n(ym0 ym0Var, boolean z, boolean z2, ux0 ux0Var) {
        long j;
        long jG = ux0Var.g(z2 ? ym0Var.b : ym0Var.c, ym0Var);
        if (z ^ z2) {
            int i = bkd.c;
            j = jG >> 32;
        } else {
            int i2 = bkd.c;
            j = 4294967295L & jG;
        }
        return ym0Var.d((int) j);
    }

    public static final ku3 o(hec hecVar, do1 do1Var, int i) {
        if (do1Var == null || l24.f(do1Var)) {
            return null;
        }
        int size = do1Var.g0().size() + i;
        if (do1Var.g()) {
            List listSubList = hecVar.h0().subList(i, size);
            yv2 yv2VarH = do1Var.h();
            return new ku3(do1Var, listSubList, o(hecVar, yv2VarH instanceof do1 ? (do1) yv2VarH : null, size));
        }
        if (size != hecVar.h0().size()) {
            d93.n(do1Var);
        }
        return new ku3(do1Var, hecVar.h0().subList(i, hecVar.h0().size()), (ku3) null);
    }

    public static final float p(float f, long j, long j2, long j3) {
        long jM = op8.M(uu1.b(f, j), j3);
        float fF0 = op8.f0(op8.M(j2, jM)) + 0.05f;
        float fF02 = op8.f0(jM) + 0.05f;
        return Math.max(fF0, fF02) / Math.min(fF0, fF02);
    }

    public static final wwb q(wwb wwbVar, ym0 ym0Var, int i) {
        return new wwb(((qjd) ym0Var.e).a(i), i, wwbVar.c);
    }

    public static final List r(do1 do1Var) {
        List parameters;
        Object next;
        zvd zvdVarN;
        List listG0 = do1Var.g0();
        listG0.getClass();
        if (!do1Var.g() && !(do1Var.h() instanceof c41)) {
            return listG0;
        }
        int i = f93.a;
        xx xxVar = xx.z;
        List listO0 = szb.O0(new ym4(new zh4(new hi3(szb.G0(szb.K0(do1Var, xxVar), 1), zkc.m), true, zkc.n), zkc.o, uzb.a));
        Iterator it2 = szb.G0(szb.K0(do1Var, xxVar), 1).iterator();
        while (true) {
            parameters = null;
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (next instanceof y28) {
                break;
            }
        }
        y28 y28Var = (y28) next;
        if (y28Var != null && (zvdVarN = y28Var.n()) != null) {
            parameters = zvdVarN.getParameters();
        }
        if (parameters == null) {
            parameters = ey3.a;
        }
        if (listO0.isEmpty() && parameters.isEmpty()) {
            List listG02 = do1Var.g0();
            listG02.getClass();
            return listG02;
        }
        ArrayList<swd> arrayListQ0 = bu1.Q0(parameters, listO0);
        ArrayList arrayList = new ArrayList(cu1.k0(arrayListQ0, 10));
        for (swd swdVar : arrayListQ0) {
            swdVar.getClass();
            arrayList.add(new q61(swdVar, do1Var, listG0.size()));
        }
        return bu1.Q0(arrayList, listG0);
    }

    public static final long s(long j) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32)) / 2.0f;
        return (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (j & 4294967295L)) / 2.0f)) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
    }

    public static float t(int i, String[] strArr) {
        float f = Float.parseFloat(strArr[i]);
        if (f >= 0.0f && f <= 1.0f) {
            return f;
        }
        throw new IllegalArgumentException("Motion easing control point value must be between 0 and 1; instead got: " + f);
    }

    public static final int u(int i, int i2, int i3) {
        if (i3 > 0) {
            if (i < i2) {
                int i4 = i2 % i3;
                if (i4 < 0) {
                    i4 += i3;
                }
                int i5 = i % i3;
                if (i5 < 0) {
                    i5 += i3;
                }
                int i6 = (i4 - i5) % i3;
                if (i6 < 0) {
                    i6 += i3;
                }
                return i2 - i6;
            }
        } else {
            if (i3 >= 0) {
                ay0.e("Step is zero.");
                return 0;
            }
            if (i > i2) {
                int i7 = -i3;
                int i8 = i % i7;
                if (i8 < 0) {
                    i8 += i7;
                }
                int i9 = i2 % i7;
                if (i9 < 0) {
                    i9 += i7;
                }
                int i10 = (i8 - i9) % i7;
                if (i10 < 0) {
                    i10 += i7;
                }
                return i10 + i2;
            }
        }
        return i2;
    }

    public static final y0e v(x12 x12Var) {
        WeakHashMap weakHashMap = f5f.w;
        return new y0e(tr7.o(x12Var).g, tr7.o(x12Var).b);
    }

    public static final boolean w(Context context, String str) {
        List<ResolveInfo> listQueryIntentActivities;
        str.getClass();
        PackageManager packageManager = context.getPackageManager();
        if (packageManager != null) {
            Intent intent = new Intent();
            intent.setAction("android.intent.action.VIEW");
            intent.addCategory("android.intent.category.DEFAULT");
            intent.addCategory("android.intent.category.BROWSABLE");
            intent.setData(Uri.parse(str));
            listQueryIntentActivities = packageManager.queryIntentActivities(intent, 64);
        } else {
            listQueryIntentActivities = null;
        }
        if (listQueryIntentActivities != null) {
            Iterator<ResolveInfo> it2 = listQueryIntentActivities.iterator();
            boolean z = false;
            while (it2.hasNext()) {
                ActivityInfo activityInfo = it2.next().activityInfo;
                if (g76.L(activityInfo.name, "com.facebook.CustomTabActivity") && g76.L(activityInfo.packageName, context.getPackageName())) {
                    z = true;
                }
            }
            return z;
        }
        return false;
    }

    public static final void x(Context context) {
        ActivityInfo activityInfo;
        PackageManager packageManager = context.getPackageManager();
        if (packageManager != null) {
            try {
                activityInfo = packageManager.getActivityInfo(new ComponentName(context, "com.facebook.FacebookActivity"), 1);
            } catch (PackageManager.NameNotFoundException unused) {
                activityInfo = null;
            }
        } else {
            activityInfo = null;
        }
        if (activityInfo == null) {
            Log.w("hk7", "FacebookActivity is not declared in the AndroidManifest.xml. If you are using the facebook-common module or dependent modules please add com.facebook.FacebookActivity to your AndroidManifest.xml file. See https://developers.facebook.com/docs/android/getting-started for more info.");
        }
    }

    public static final boolean y(zx8 zx8Var, y05 y05Var) {
        zx8Var.getClass();
        y05Var.getClass();
        return zx8Var.a(y05Var);
    }

    public static boolean z(String str, String str2) {
        return str.startsWith(str2.concat("(")) && str.endsWith(")");
    }

    public static final void C(String str, String str2) {
        str.getClass();
        if (str.length() > 0) {
            return;
        }
        ywb.g(ev6.x("Argument '", str2, PqkdNGCEoxOKZk.KqBVNtlye));
    }
}

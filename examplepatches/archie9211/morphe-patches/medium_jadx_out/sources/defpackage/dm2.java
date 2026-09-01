package defpackage;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Trace;
import android.widget.EdgeEffect;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.iptc.IptcDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.data.preferences.DarkMode;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import kotlin.KotlinNullPointerException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class dm2 {
    public static final String[] a = {"com.android.chrome", MaAxRJinch.FnMQp, "com.chrome.dev"};
    public static final hz0 b = new hz0();
    public static final mz1 c = new mz1(new p02(8), false, -1990107579);
    public static final mz1 d = new mz1(new yz1(24), false, -49607410);
    public static final mz1 e;
    public static final mz1 f;
    public static final mz1 g;
    public static final tk4 h;
    public static final StackTraceElement[] i;
    public static final /* synthetic */ int[] j;
    public static final /* synthetic */ int k = 0;

    public static final void A(long j2, long j3, long j4) {
        if ((j3 | j4) < 0 || j3 > j2 || j2 - j3 < j4) {
            StringBuilder sbD = b09.D("size=", " offset=", j2);
            sbD.append(j3);
            sbD.append(" byteCount=");
            sbD.append(j4);
            throw new ArrayIndexOutOfBoundsException(sbD.toString());
        }
    }

    public static final boolean B(st0 st0Var, Set set, String str, Set set2) {
        if (st0Var.equals(tt0.w)) {
            return true;
        }
        if (st0Var.equals(tt0.v)) {
            return false;
        }
        return bu1.p0(st0Var.v.a, str);
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object C(defpackage.bo4 r7, defpackage.p92 r8) {
        /*
            d1g r0 = defpackage.flb.i
            boolean r1 = r8 instanceof defpackage.lp4
            if (r1 == 0) goto L15
            r1 = r8
            lp4 r1 = (defpackage.lp4) r1
            int r2 = r1.e
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.e = r2
            goto L1a
        L15:
            lp4 r1 = new lp4
            r1.<init>(r8)
        L1a:
            java.lang.Object r8 = r1.d
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.e
            r4 = 0
            r5 = 1
            if (r3 == 0) goto L36
            if (r3 != r5) goto L30
            jp4 r7 = r1.c
            rya r2 = r1.b
            defpackage.br7.v(r8)     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L2e
            goto L60
        L2e:
            r8 = move-exception
            goto L55
        L30:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r4
        L36:
            rya r8 = defpackage.ev6.p(r8)
            r8.a = r0
            jp4 r3 = new jp4
            r6 = 0
            r3.<init>(r8, r6)
            r1.b = r8     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L51
            r1.c = r3     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L51
            r1.e = r5     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L51
            java.lang.Object r7 = r7.b(r3, r1)     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L51
            if (r7 != r2) goto L4f
            return r2
        L4f:
            r2 = r8
            goto L60
        L51:
            r7 = move-exception
            r2 = r8
            r8 = r7
            r7 = r3
        L55:
            java.lang.Object r3 = r8.a
            if (r3 != r7) goto L6b
            ib2 r7 = r1.getContext()
            defpackage.bo.N(r7)
        L60:
            java.lang.Object r7 = r2.a
            if (r7 == r0) goto L65
            return r7
        L65:
            java.lang.String r7 = "Expected at least one element"
            defpackage.ywb.h(r7)
            return r4
        L6b:
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dm2.C(bo4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object D(defpackage.bo4 r7, defpackage.b55 r8, defpackage.n92 r9) {
        /*
            d1g r0 = defpackage.flb.i
            boolean r1 = r9 instanceof defpackage.mp4
            if (r1 == 0) goto L15
            r1 = r9
            mp4 r1 = (defpackage.mp4) r1
            int r2 = r1.e
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.e = r2
            goto L1a
        L15:
            mp4 r1 = new mp4
            r1.<init>(r9)
        L1a:
            java.lang.Object r9 = r1.d
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.e
            r4 = 0
            r5 = 1
            if (r3 == 0) goto L36
            if (r3 != r5) goto L30
            q9 r7 = r1.c
            rya r8 = r1.b
            defpackage.br7.v(r9)     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L2e
            goto L61
        L2e:
            r9 = move-exception
            goto L56
        L30:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r4
        L36:
            rya r9 = defpackage.ev6.p(r9)
            r9.a = r0
            q9 r3 = new q9
            r6 = 14
            r3.<init>(r8, r6, r9)
            r1.b = r9     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L52
            r1.c = r3     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L52
            r1.e = r5     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L52
            java.lang.Object r7 = r7.b(r3, r1)     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L52
            if (r7 != r2) goto L50
            return r2
        L50:
            r8 = r9
            goto L61
        L52:
            r7 = move-exception
            r8 = r9
            r9 = r7
            r7 = r3
        L56:
            java.lang.Object r2 = r9.a
            if (r2 != r7) goto L6c
            ib2 r7 = r1.getContext()
            defpackage.bo.N(r7)
        L61:
            java.lang.Object r7 = r8.a
            if (r7 == r0) goto L66
            return r7
        L66:
            java.lang.String r7 = "Expected at least one element matching the predicate"
            defpackage.ywb.h(r7)
            return r4
        L6c:
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dm2.D(bo4, b55, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object E(defpackage.bo4 r4, defpackage.p92 r5) {
        /*
            boolean r0 = r5 instanceof defpackage.np4
            if (r0 == 0) goto L13
            r0 = r5
            np4 r0 = (defpackage.np4) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            np4 r0 = new np4
            r0.<init>(r5)
        L18:
            java.lang.Object r5 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            jp4 r4 = r0.c
            rya r1 = r0.b
            defpackage.br7.v(r5)     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L2b
            goto L5b
        L2b:
            r5 = move-exception
            goto L50
        L2d:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L34:
            rya r5 = defpackage.ev6.p(r5)
            jp4 r2 = new jp4
            r2.<init>(r5, r3)
            r0.b = r5     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L4c
            r0.c = r2     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L4c
            r0.e = r3     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L4c
            java.lang.Object r4 = r4.b(r2, r0)     // Catch: kotlinx.coroutines.flow.internal.AbortFlowException -> L4c
            if (r4 != r1) goto L4a
            return r1
        L4a:
            r1 = r5
            goto L5b
        L4c:
            r4 = move-exception
            r1 = r5
            r5 = r4
            r4 = r2
        L50:
            java.lang.Object r2 = r5.a
            if (r2 != r4) goto L5e
            ib2 r4 = r0.getContext()
            defpackage.bo.N(r4)
        L5b:
            java.lang.Object r4 = r1.a
            return r4
        L5e:
            throw r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dm2.E(bo4, p92):java.lang.Object");
    }

    public static final Bundle F(j15 j15Var) {
        j15Var.getClass();
        Bundle bundle = j15Var.f;
        if (bundle != null) {
            bundle.setClassLoader(j15Var.getClass().getClassLoader());
        }
        Bundle bundle2 = j15Var.f;
        if (bundle2 != null) {
            return bundle2;
        }
        ygf.f("Arguments may not be null for this fragment!");
        return null;
    }

    public static final String H() {
        if (!ec2.a.contains(dm2.class)) {
            try {
                Context contextA = f94.a();
                List<ResolveInfo> listQueryIntentServices = contextA.getPackageManager().queryIntentServices(new Intent("android.support.customtabs.action.CustomTabsService"), 0);
                listQueryIntentServices.getClass();
                String[] strArr = a;
                HashSet hashSet = new HashSet(ei7.P(3));
                k80.L0(strArr, hashSet);
                Iterator<ResolveInfo> it2 = listQueryIntentServices.iterator();
                while (it2.hasNext()) {
                    ServiceInfo serviceInfo = it2.next().serviceInfo;
                    if (serviceInfo != null && hashSet.contains(serviceInfo.packageName)) {
                        return serviceInfo.packageName;
                    }
                }
            } catch (Throwable th) {
                ec2.a(dm2.class, th);
                return null;
            }
        }
        return null;
    }

    public static final String I() {
        if (ec2.a.contains(dm2.class)) {
            return null;
        }
        try {
            return "fbconnect://cct." + f94.a().getPackageName();
        } catch (Throwable th) {
            ec2.a(dm2.class, th);
            return null;
        }
    }

    public static final String J(String str) {
        if (ec2.a.contains(dm2.class)) {
            return null;
        }
        try {
            return hk7.w(f94.a(), str) ? str : hk7.w(f94.a(), I()) ? I() : "";
        } catch (Throwable th) {
            ec2.a(dm2.class, th);
            return null;
        }
    }

    public static boolean K(f41 f41Var) {
        if (!b11.d.contains(f41Var.getName())) {
            return false;
        }
        if (bu1.p0(b11.c, f93.c(f41Var)) && f41Var.I().isEmpty()) {
            return true;
        }
        if (!vm6.z(f41Var)) {
            return false;
        }
        Collection collectionI = f41Var.i();
        collectionI.getClass();
        Collection<f41> collection = collectionI;
        if (collection.isEmpty()) {
            return false;
        }
        for (f41 f41Var2 : collection) {
            f41Var2.getClass();
            if (K(f41Var2)) {
                return true;
            }
        }
        return false;
    }

    public static final boolean L(aq6 aq6Var) {
        if (aq6Var.h == null) {
            return false;
        }
        aq6 aq6VarV = aq6Var.v();
        return (aq6VarV != null ? aq6VarV.h : null) == null || aq6Var.G.b;
    }

    public static final r28 M(r28 r28Var, c55 c55Var) {
        return r28Var.b(new jp6(c55Var));
    }

    public static final st0 Q(String... strArr) {
        return new st0(new rl0(k80.S0(strArr)));
    }

    public static final g90 S(rx5 rx5Var, gx5 gx5Var, p65 p65Var) {
        return T(new n90(rx5Var, (z80) p65Var.j(t57.a), gx5Var), g90.v, null, v82.b, p65Var);
    }

    public static final g90 T(n90 n90Var, x45 x45Var, pi9 pi9Var, w82 w82Var, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(-1242991349);
        Trace.beginSection("rememberAsyncImagePainter");
        try {
            rx5 rx5VarC = ppe.c(n90Var.a, p65Var);
            ppe.f(rx5VarC);
            a90 a90Var = new a90(n90Var.c, rx5VarC, n90Var.b);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new g90(a90Var);
                p65Var.j0(objM);
            }
            g90 g90Var = (g90) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            g90Var.l = (sb2) objM2;
            g90Var.m = x45Var;
            g90Var.n = pi9Var;
            g90Var.o = w82Var;
            g90Var.p = 1;
            g90Var.q = ppe.a(p65Var);
            g90Var.k(a90Var);
            p65Var.p(false);
            return g90Var;
        } finally {
            Trace.endSection();
        }
    }

    public static final int U(int i2) {
        return ((i2 & 255) << 24) | (((-16777216) & i2) >>> 24) | ((16711680 & i2) >>> 8) | ((65280 & i2) << 8);
    }

    public static final long V(long j2) {
        return ((j2 & 255) << 56) | (((-72057594037927936L) & j2) >>> 56) | ((71776119061217280L & j2) >>> 40) | ((280375465082880L & j2) >>> 24) | ((1095216660480L & j2) >>> 8) | ((4278190080L & j2) << 8) | ((16711680 & j2) << 24) | ((65280 & j2) << 40);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object W(defpackage.bo4 r7, defpackage.p92 r8) {
        /*
            d1g r0 = defpackage.flb.i
            boolean r1 = r8 instanceof defpackage.op4
            if (r1 == 0) goto L15
            r1 = r8
            op4 r1 = (defpackage.op4) r1
            int r2 = r1.d
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.d = r2
            goto L1a
        L15:
            op4 r1 = new op4
            r1.<init>(r8)
        L1a:
            java.lang.Object r8 = r1.c
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.d
            r4 = 0
            r5 = 1
            if (r3 == 0) goto L32
            if (r3 != r5) goto L2c
            rya r7 = r1.b
            defpackage.br7.v(r8)
            goto L4a
        L2c:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r4
        L32:
            rya r8 = defpackage.ev6.p(r8)
            r8.a = r0
            jp4 r3 = new jp4
            r6 = 2
            r3.<init>(r8, r6)
            r1.b = r8
            r1.d = r5
            java.lang.Object r7 = r7.b(r3, r1)
            if (r7 != r2) goto L49
            return r2
        L49:
            r7 = r8
        L4a:
            java.lang.Object r7 = r7.a
            if (r7 == r0) goto L4f
            return r7
        L4f:
            java.lang.String r7 = "Flow is empty"
            defpackage.ywb.h(r7)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dm2.W(bo4, p92):java.lang.Object");
    }

    public static final fm6 X(Collection collection, gm6 gm6Var) {
        Iterator it2 = collection.iterator();
        fm6 fm6Var = null;
        while (it2.hasNext()) {
            fm6 fm6Var2 = (fm6) it2.next();
            if (g76.L(fm6Var2.getType(), gm6Var)) {
                if (fm6Var != null) {
                    ik4.o("Multiple extensions handle the same extension type: ", gm6Var);
                    return null;
                }
                fm6Var = fm6Var2;
            }
        }
        if (fm6Var != null) {
            return fm6Var;
        }
        ik4.o("No extensions handle the extension type: ", gm6Var);
        return null;
    }

    public static String Y(int i2) {
        switch (i2) {
            case 0:
                return "NOT_STARTED";
            case 1:
                return "STARTED";
            case 2:
                return "REDIRECT_RECEIVED";
            case 3:
                return "AWAITING_FOLLOW_REDIRECT";
            case 4:
                return "AWAITING_READ";
            case 5:
                return "READING";
            case 6:
                return "ERROR";
            case 7:
                return "COMPLETE";
            case 8:
                return "CANCELLED";
            default:
                ay0.e(b09.w(i2, "Unknown state "));
                return null;
        }
    }

    public static ixd Z(List list, exd exdVar, yv2 yv2Var, ArrayList arrayList) throws gxd {
        if (exdVar == null) {
            a(1);
            throw null;
        }
        if (yv2Var == null) {
            a(2);
            throw null;
        }
        if (arrayList == null) {
            a(3);
            throw null;
        }
        ixd ixdVarA0 = a0(list, exdVar, yv2Var, arrayList, null);
        if (ixdVarA0 != null) {
            return ixdVarA0;
        }
        ay0.d("Substitution failed");
        return null;
    }

    public static /* synthetic */ void a(int i2) {
        String str = i2 != 4 ? "Argument for @NotNull parameter '%s' of %s.%s must not be null" : "@NotNull method %s.%s must not return null";
        Object[] objArr = new Object[i2 != 4 ? 3 : 2];
        switch (i2) {
            case 1:
            case 6:
                objArr[0] = "originalSubstitution";
                break;
            case 2:
            case 7:
                objArr[0] = "newContainingDeclaration";
                break;
            case 3:
            case 8:
                objArr[0] = "result";
                break;
            case 4:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/types/DescriptorSubstitutor";
                break;
            case 5:
            default:
                objArr[0] = "typeParameters";
                break;
        }
        if (i2 != 4) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/types/DescriptorSubstitutor";
        } else {
            objArr[1] = "substituteTypeParameters";
        }
        if (i2 != 4) {
            objArr[2] = "substituteTypeParameters";
        }
        String str2 = String.format(str, objArr);
        if (i2 == 4) {
            throw new IllegalStateException(str2);
        }
    }

    public static ixd a0(List list, exd exdVar, yv2 yv2Var, List list2, boolean[] zArr) throws gxd {
        if (exdVar == null) {
            a(6);
            throw null;
        }
        if (yv2Var == null) {
            a(7);
            throw null;
        }
        if (list2 == null) {
            a(8);
            throw null;
        }
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        Iterator it2 = list.iterator();
        int i2 = 0;
        while (it2.hasNext()) {
            swd swdVar = (swd) it2.next();
            int i3 = i2 + 1;
            twd twdVarA0 = twd.A0(i2, swdVar.getAnnotations(), yv2Var, swdVar.N(), swdVar.getName(), swdVar.z(), swdVar.t());
            map.put(swdVar.n(), new onc(twdVarA0.T()));
            map2.put(swdVar, twdVarA0);
            list2.add(twdVarA0);
            i2 = i3;
        }
        int i4 = 1;
        pnc pncVar = new pnc(i4, map);
        ixd ixdVarE = ixd.e(exdVar, pncVar);
        ixd ixdVarE2 = ixd.e(new o61(exdVar, i4), pncVar);
        Iterator it3 = list.iterator();
        while (it3.hasNext()) {
            swd swdVar2 = (swd) it3.next();
            twd twdVar = (twd) map2.get(swdVar2);
            for (mn6 mn6Var : swdVar2.getUpperBounds()) {
                co1 co1VarA = mn6Var.j0().a();
                mn6 mn6VarH = (((co1VarA instanceof swd) && ok7.E((swd) co1VarA, null, null)) ? ixdVarE : ixdVarE2).h(mn6Var, pqe.OUT_VARIANCE);
                if (mn6VarH == null) {
                    return null;
                }
                if (mn6VarH != mn6Var && zArr != null) {
                    zArr[0] = true;
                }
                if (twdVar.m) {
                    ygf.f("Type parameter descriptor is already initialized: ".concat(twdVar.C0()));
                    return null;
                }
                if (!kyd.a0(mn6VarH)) {
                    twdVar.l.add(mn6VarH);
                }
            }
            if (twdVar.m) {
                ygf.f("Type parameter descriptor is already initialized: ".concat(twdVar.C0()));
                return null;
            }
            twdVar.m = true;
        }
        return ixdVarE;
    }

    /* JADX WARN: Removed duplicated region for block: B:119:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0199  */
    /* JADX WARN: Removed duplicated region for block: B:124:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0053  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x00da  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(defpackage.m45 r26, defpackage.r28 r27, boolean r28, defpackage.m3c r29, defpackage.r61 r30, defpackage.t61 r31, defpackage.cu0 r32, defpackage.mz1 r33, defpackage.x12 r34, int r35, int r36) {
        /*
            Method dump skipped, instruction units count: 423
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dm2.b(m45, r28, boolean, m3c, r61, t61, cu0, mz1, x12, int, int):void");
    }

    public static final Bitmap b0(ew5 ew5Var, int i2, int i3) {
        boolean z = ew5Var instanceof yr0;
        Bitmap.Config config = z ? ((yr0) ew5Var).a.getConfig() : null;
        if (config == null) {
            config = Bitmap.Config.ARGB_8888;
        }
        if (z) {
            Bitmap bitmap = ((yr0) ew5Var).a;
            if (bitmap.getWidth() == i2 && bitmap.getHeight() == i3 && bitmap.getConfig() == config) {
                return bitmap;
            }
        }
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i2, i3, config);
        ew5Var.d(new Canvas(bitmapCreateBitmap));
        return bitmapCreateBitmap;
    }

    public static final void c(r28 r28Var, m3c m3cVar, r61 r61Var, t61 t61Var, cu0 cu0Var, mz1 mz1Var, x12 x12Var, int i2) {
        t61 t61Var2;
        int i3;
        t61 t61VarB;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1359693790);
        int i4 = i2 | (p65Var.f(r28Var) ? 4 : 2) | (p65Var.f(m3cVar) ? 32 : 16) | (p65Var.f(r61Var) ? 256 : 128) | 1024 | (p65Var.f(cu0Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        int i5 = 0;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                i3 = i4 & (-7169);
                t61VarB = gx1.B(63);
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
                t61VarB = t61Var;
            }
            p65Var.q();
            g3d.a(r28Var, m3cVar, r61Var.a, r61Var.b, 0.0f, ((vj3) t61VarB.a(true, null, p65Var, 54).getValue()).a, cu0Var, pxf.E(-97109725, new u61(mz1Var, i5), p65Var), p65Var, (i3 & 14) | 12582912 | (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 << 6) & 3670016), 16);
            t61Var2 = t61VarB;
        } else {
            p65Var.S();
            t61Var2 = t61Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(r28Var, m3cVar, r61Var, t61Var2, cu0Var, mz1Var, i2);
        }
    }

    public static final String c0(byte b2) {
        char[] cArr = gx1.b;
        return new String(new char[]{cArr[(b2 >> 4) & 15], cArr[b2 & 15]});
    }

    public static final void d(x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-375038227);
        int i3 = 0;
        if (p65Var.P(i2 & 1, i2 != 0)) {
            tp7.c(0.0f, 0, 5, ((zo7) p65Var.j(kt7.b)).x, p65Var, null);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new n2c(i2, i3);
        }
    }

    public static final String d0(int i2) {
        if (i2 == 0) {
            return "0";
        }
        char[] cArr = gx1.b;
        int i3 = 0;
        char[] cArr2 = {cArr[(i2 >> 28) & 15], cArr[(i2 >> 24) & 15], cArr[(i2 >> 20) & 15], cArr[(i2 >> 16) & 15], cArr[(i2 >> 12) & 15], cArr[(i2 >> 8) & 15], cArr[(i2 >> 4) & 15], cArr[i2 & 15]};
        while (i3 < 8 && cArr2[i3] == '0') {
            i3++;
        }
        k1.Companion.getClass();
        g1.a(i3, 8, 8);
        return new String(cArr2, i3, 8 - i3);
    }

    public static final void e(int i2, x12 x12Var, m45 m45Var, r28 r28Var, boolean z) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1012745252);
        int i3 = (p65Var2.g(z) ? 4 : 2) | i2 | (p65Var2.h(m45Var) ? 256 : 128);
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            sn3 sn3Var = kt7.b;
            r28 r28VarF = w2g.F(jfc.f(jfc.d(hlg.r(flb.a0(r28Var, ((zo7) p65Var2.j(sn3Var)).a, rv8.r), false, null, new vkb(0), m45Var, 11), 1.0f), 48.0f, 0.0f, 2), 24.0f, 8.0f, 24.0f, 8.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var2, 48);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarF);
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
            tp7.B(p65Var2, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            String strR = vo7.R(p65Var2, R.string.settings_find_friends);
            sn3 sn3Var2 = jt7.c;
            jjd.b(strR, new sq6(1.0f, true), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var2)).m, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 131068);
            p65Var = p65Var2;
            o28 o28Var = o28.b;
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            if (z) {
                p65Var.Y(1944863575);
                jjd.b(vo7.R(p65Var, R.string.settings_sync_contacts), bgf.N(o28Var, "settings_sync_contacts"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var2)).m, 0L, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16773119), p65Var, 48, 0, 131068);
            } else {
                p65Var.Y(1925214690);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new us4(z, r28Var, m45Var, i2);
        }
    }

    public static final r28 e0(r28 r28Var, boolean z, m68 m68Var, boolean z2, vkb vkbVar, x45 x45Var) {
        return r28Var.b(new lnd(z, m68Var, z2, vkbVar, x45Var));
    }

    public static final void f(final ll5 ll5Var, final ek8 ek8Var, x12 x12Var, int i2) {
        String str = ll5Var.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1473854596);
        int i3 = (p65Var.f(ll5Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            boolean z = ll5Var.a;
            String str2 = ll5Var.e;
            kx kxVarW = ho2.w(p65Var, -964920827);
            String strQ = vo7.Q(R.string.notification_type_highlight_was_piled_onto_simple, new Object[]{str}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ);
                p65Var.p(false);
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_quote);
                mz1 mz1VarE = pxf.E(409484491, new so1(18, ll5Var), p65Var);
                int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i5 = i3 & 14;
                boolean z2 = (i4 == 32) | (i5 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: ml5
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i6 = i;
                            c1e c1eVar = c1e.a;
                            ll5 ll5Var2 = ll5Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i6) {
                                case 0:
                                    ek8Var2.j(ll5Var2.f, ll5Var2.k);
                                    break;
                                default:
                                    ek8Var2.k(ll5Var2.c, ll5Var2.k);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i6 = (i4 == 32 ? 1 : 0) | (i5 == 4 ? 1 : 0);
                Object objM2 = p65Var.M();
                if (i6 != 0 || objM2 == uobVar) {
                    final int i7 = 1;
                    objM2 = new m45() { // from class: ml5
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i62 = i7;
                            c1e c1eVar = c1e.a;
                            ll5 ll5Var2 = ll5Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i62) {
                                case 0:
                                    ek8Var2.j(ll5Var2.f, ll5Var2.k);
                                    break;
                                default:
                                    ek8Var2.k(ll5Var2.c, ll5Var2.k);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.g(z, str2, numValueOf, mxVarC, mz1VarE, 2, m45Var, (m45) objM2, p65Var, 221184, 0);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(ll5Var, ek8Var, i2, 11);
        }
    }

    public static int[] f0() {
        return (int[]) j.clone();
    }

    public static final void g(String str, r28 r28Var, long j2, m45 m45Var, x12 x12Var, int i2, int i3) {
        int i4;
        p65 p65Var;
        long j3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(2090905564);
        if ((i2 & 6) == 0) {
            i4 = i2 | (p65Var2.f(str) ? 4 : 2);
        } else {
            i4 = i2;
        }
        long j4 = j2;
        int i5 = i4 | (((i3 & 4) == 0 && p65Var2.e(j4)) ? 256 : 128) | (p65Var2.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i5 & 1, (i5 & 1171) != 1170)) {
            p65Var2.U();
            if ((i2 & 1) == 0 || p65Var2.z()) {
                if ((i3 & 4) != 0) {
                    j4 = ((zo7) p65Var2.j(kt7.b)).o;
                    i5 &= -897;
                }
                long j5 = j4;
                p65Var2.q();
                p65Var = p65Var2;
                jjd.b(str, w2g.F(jfc.d(hlg.r(flb.a0(r28Var, ((zo7) p65Var2.j(kt7.b)).a, rv8.r), false, null, new vkb(0), m45Var, 11), 1.0f), 24.0f, 14.0f, 24.0f, 14.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).m, j5, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, i5 & 14, 0, 131068);
                j3 = j5;
            } else {
                p65Var2.S();
                if ((i3 & 4) != 0) {
                    i5 &= -897;
                }
                long j52 = j4;
                p65Var2.q();
                p65Var = p65Var2;
                jjd.b(str, w2g.F(jfc.d(hlg.r(flb.a0(r28Var, ((zo7) p65Var2.j(kt7.b)).a, rv8.r), false, null, new vkb(0), m45Var, 11), 1.0f), 24.0f, 14.0f, 24.0f, 14.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).m, j52, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, i5 & 14, 0, 131068);
                j3 = j52;
            }
        } else {
            p65Var = p65Var2;
            p65Var.S();
            j3 = j4;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zb(str, r28Var, j3, m45Var, i2, i3, 2);
        }
    }

    public static final void h(int i2, int i3, x12 x12Var, r28 r28Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1919171332);
        int i4 = (p65Var.d(i2) ? 4 : 2) | i3 | 48;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            sn3 sn3Var = kt7.b;
            long j2 = ((zo7) p65Var.j(sn3Var)).a;
            nr5 nr5Var = rv8.r;
            r28 r28VarF = w2g.F(flb.a0(r28VarD, j2, nr5Var), 24.0f, 14.0f, 24.0f, 14.0f);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            dy0.a(flb.a0(jfc.e(jfc.p(o28Var, gq7.c(i2).c(48, 240)), 20.0f), ((zo7) p65Var.j(sn3Var)).b, nr5Var), p65Var, 0);
            p65Var.p(true);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(i2, r28Var, i3, 14);
        }
    }

    public static final void i(zw7 zw7Var, r28 r28Var, d2c d2cVar, m45 m45Var, x12 x12Var, int i2) {
        int i3;
        f09 f09Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1725241565);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.d(zw7Var.ordinal()) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(d2cVar) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            f3c f3cVarJ1 = d2cVar.a.j1();
            yx2 yx2Var = f3cVarJ1.g;
            UpsellInfo upsellInfo = new UpsellInfo(UpsellReferrer.SETTINGS, "profile_menu", null, null, null, null, 60, null);
            String str = f3cVarJ1.y;
            SourceParameter sourceParameter = f3cVarJ1.z;
            yx2Var.f(upsellInfo, str, gp7.u(sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : "profile_menu", ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : null, ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null)), f3cVarJ1.b);
            sn3 sn3Var = kt7.b;
            r28 r28VarF = w2g.F(jfc.f(jfc.d(hlg.r(flb.a0(r28Var, ((zo7) p65Var.j(sn3Var)).a, rv8.r), false, null, new vkb(0), m45Var, 11), 1.0f), 48.0f, 0.0f, 2), 24.0f, 8.0f, 24.0f, 8.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            int i5 = q2c.c[zw7Var.ordinal()];
            if (i5 == 1) {
                p65Var.Y(2005837217);
                f09Var = new f09(vo7.R(p65Var, R.string.settings_become_a_friend_of_medium), vn7.J(R.drawable.ic_premium_24, 0, p65Var));
                p65Var.p(false);
            } else if (i5 == 2) {
                p65Var.Y(2005841748);
                f09Var = new f09(vo7.R(p65Var, R.string.settings_manage_membership), null);
                p65Var.p(false);
            } else {
                if (i5 != 3) {
                    throw ho2.L(p65Var, 2005831156, false);
                }
                p65Var.Y(2005832982);
                f09Var = new f09(vo7.R(p65Var, R.string.settings_become_a_member), vn7.J(R.drawable.ic_member_24, 0, p65Var));
                p65Var.p(false);
            }
            String str2 = (String) f09Var.a;
            c09 c09Var = (c09) f09Var.b;
            mkd mkdVarA = mkd.a(((bu7) p65Var.j(jt7.c)).m, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
            o28 o28Var = o28.b;
            jjd.b(str2, km4.u(1.0f, bgf.N(o28Var, "membership_title"), true), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVarA, p65Var, 0, 24960, 110588);
            p65Var = p65Var;
            if (c09Var != null) {
                p65Var.Y(2052008893);
                w2g.e(c09Var, null, bgf.N(o28Var, "membership_icon"), null, null, 0.0f, null, p65Var, 440, 120);
            } else {
                p65Var.Y(2022877449);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(zw7Var, r28Var, d2cVar, m45Var, i2, 14);
        }
    }

    public static final void j(z2c z2cVar, r28 r28Var, d2c d2cVar, x12 x12Var, int i2) {
        int i3;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1814841440);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(z2cVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(d2cVar) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarA0 = flb.a0(r28Var, ((zo7) p65Var.j(kt7.b)).a, rv8.r);
            vkb vkbVar = new vkb(0);
            boolean z = ((i3 & 896) == 256) | ((i3 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new nbb(z2cVar, 5, d2cVar);
                p65Var.j0(objM);
            }
            r28 r28VarF = w2g.F(jfc.f(jfc.d(hlg.r(r28VarA0, false, null, vkbVar, (m45) objM, 11), 1.0f), 48.0f, 0.0f, 2), 24.0f, 14.0f, 24.0f, 14.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(1883727699);
            kx kxVar = new kx();
            String str = z2cVar.b;
            zw7 zw7Var = z2cVar.a;
            kxVar.d(vo7.Q(R.string.resubscribe_text, new Object[]{str}, p65Var) + "  ");
            p65Var.Y(1883731839);
            int iH = kxVar.h(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439));
            try {
                kxVar.d(vo7.R(p65Var, R.string.resubscribe_button));
                kxVar.f(iH);
                p65Var.p(false);
                mx mxVarI = kxVar.i();
                p65Var.p(false);
                mkd mkdVar = ((bu7) p65Var.j(jt7.c)).m;
                o28 o28Var = o28.b;
                jjd.c(mxVarI, km4.u(1.0f, bgf.N(o28Var, "text"), true), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, mkdVar, p65Var, 0, 0, 262140);
                p65Var = p65Var;
                hp7.t(p65Var, jfc.l(o28Var, 8.0f));
                int i6 = q2c.c[zw7Var.ordinal()];
                int i7 = R.drawable.ic_member_24;
                if (i6 == 1) {
                    i4 = 0;
                } else if (i6 != 2) {
                    String str2 = "Membership type: " + zw7Var + " not supported";
                    i4 = 0;
                    wld.a.c(str2, new Object[0]);
                } else {
                    i4 = 0;
                    i7 = R.drawable.ic_premium_24;
                }
                w2g.e(vn7.J(i7, i4, p65Var), null, bgf.N(o28Var, "member_only_icon"), null, null, 0.0f, null, p65Var, 440, 120);
                p65Var.p(true);
            } catch (Throwable th) {
                kxVar.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i2, 29, z2cVar, r28Var, d2cVar);
        }
    }

    public static final void k(String str, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(422712917);
        int i3 = i2 | (p65Var2.f(str) ? 4 : 2);
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var = p65Var2;
            jjd.b(str, w2g.F(jfc.d(r28Var, 1.0f), 24.0f, 24.0f, 24.0f, 16.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).j, p65Var, i3 & 14, 0, 131068);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fe(str, r28Var, i2, 4);
        }
    }

    public static final void l(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1364867613);
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            dy0.a(flb.a0(jfc.e(w2g.F(r28Var, 24.0f, 24.0f, 24.0f, 16.0f), 20.0f), ((zo7) p65Var.j(kt7.b)).b, rv8.r), p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 24);
        }
    }

    public static final void m(b3c b3cVar, d2c d2cVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1458672034);
        int i3 = (p65Var.f(b3cVar) ? 4 : 2) | i2 | (p65Var.f(d2cVar) ? 32 : 16);
        if (!p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.S();
        } else if (b3cVar instanceof y2c) {
            p65Var.Y(-1624479465);
            n(r28Var, p65Var, 6);
            p65Var.p(false);
        } else {
            if (!(b3cVar instanceof a3c)) {
                throw ho2.L(p65Var, -1624481419, false);
            }
            p65Var.Y(-1624477023);
            o((a3c) b3cVar, d2cVar, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i2, 17, b3cVar, d2cVar, r28Var);
        }
    }

    public static final void n(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1356731990);
        int i3 = (i2 & 6) == 0 ? (p65Var.f(r28Var) ? 4 : 2) | i2 : i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarV = m40.V(r28Var, p65Var, i3 & 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            o28 o28Var = o28.b;
            l(jfc.p(o28Var, 160.0f), p65Var, 6);
            d(p65Var, 0);
            p65Var.Y(-894173216);
            for (int i5 = 0; i5 < 4; i5++) {
                h(i5, 0, p65Var, null);
                d(p65Var, 0);
            }
            p65Var.p(false);
            l(jfc.p(o28Var, 144.0f), p65Var, 6);
            d(p65Var, 0);
            p65Var.Y(-894166048);
            for (int i6 = 0; i6 < 5; i6++) {
                h(i6, 0, p65Var, null);
                d(p65Var, 0);
            }
            p65Var.p(false);
            l(jfc.p(o28Var, 160.0f), p65Var, 6);
            d(p65Var, 0);
            p65Var.Y(-894159200);
            for (int i7 = 0; i7 < 2; i7++) {
                h(i7, 0, p65Var, null);
                d(p65Var, 0);
            }
            p65Var.p(false);
            l(jfc.p(o28Var, 144.0f), p65Var, 6);
            d(p65Var, 0);
            p65Var.Y(-894152160);
            for (int i8 = 0; i8 < 4; i8++) {
                h(i8, 0, p65Var, null);
                d(p65Var, 0);
            }
            p65Var.p(false);
            l(jfc.p(o28Var, 160.0f), p65Var, 6);
            d(p65Var, 0);
            p65Var.Y(-894145120);
            for (int i9 = 0; i9 < 2; i9++) {
                h(i9, 0, p65Var, null);
                d(p65Var, 0);
            }
            p65Var.p(false);
            hp7.t(p65Var, w2g.F(jfc.e(jfc.d(r28Var, 1.0f), 20.0f), 24.0f, 14.0f, 24.0f, 14.0f));
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i2, 15);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:219:0x06e8  */
    /* JADX WARN: Removed duplicated region for block: B:220:0x06ea  */
    /* JADX WARN: Removed duplicated region for block: B:224:0x06f3  */
    /* JADX WARN: Removed duplicated region for block: B:227:0x072b  */
    /* JADX WARN: Removed duplicated region for block: B:228:0x072d  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x0736  */
    /* JADX WARN: Removed duplicated region for block: B:235:0x076e  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x0770  */
    /* JADX WARN: Removed duplicated region for block: B:240:0x0779  */
    /* JADX WARN: Removed duplicated region for block: B:243:0x07c2  */
    /* JADX WARN: Removed duplicated region for block: B:244:0x07c4  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x07cd  */
    /* JADX WARN: Removed duplicated region for block: B:253:0x0803  */
    /* JADX WARN: Removed duplicated region for block: B:271:0x0885  */
    /* JADX WARN: Removed duplicated region for block: B:274:0x08a5  */
    /* JADX WARN: Removed duplicated region for block: B:275:0x08a7  */
    /* JADX WARN: Removed duplicated region for block: B:279:0x08b0  */
    /* JADX WARN: Removed duplicated region for block: B:284:0x096a  */
    /* JADX WARN: Removed duplicated region for block: B:285:0x096c  */
    /* JADX WARN: Removed duplicated region for block: B:289:0x0975  */
    /* JADX WARN: Type inference failed for: r0v14, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r0v18 */
    /* JADX WARN: Type inference failed for: r0v21 */
    /* JADX WARN: Type inference failed for: r12v4, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r12v6 */
    /* JADX WARN: Type inference failed for: r12v7 */
    /* JADX WARN: Type inference failed for: r22v3, types: [x12] */
    /* JADX WARN: Type inference failed for: r4v120 */
    /* JADX WARN: Type inference failed for: r4v121 */
    /* JADX WARN: Type inference failed for: r4v125 */
    /* JADX WARN: Type inference failed for: r4v126 */
    /* JADX WARN: Type inference failed for: r4v129 */
    /* JADX WARN: Type inference failed for: r4v130 */
    /* JADX WARN: Type inference failed for: r4v131 */
    /* JADX WARN: Type inference failed for: r4v132 */
    /* JADX WARN: Type inference failed for: r4v133 */
    /* JADX WARN: Type inference failed for: r4v136 */
    /* JADX WARN: Type inference failed for: r4v81 */
    /* JADX WARN: Type inference failed for: r4v82 */
    /* JADX WARN: Type inference failed for: r4v86 */
    /* JADX WARN: Type inference failed for: r4v87 */
    /* JADX WARN: Type inference failed for: r4v92 */
    /* JADX WARN: Type inference failed for: r4v93 */
    /* JADX WARN: Type inference failed for: r4v98 */
    /* JADX WARN: Type inference failed for: r4v99 */
    /* JADX WARN: Type inference failed for: r5v115 */
    /* JADX WARN: Type inference failed for: r5v85 */
    /* JADX WARN: Type inference failed for: r5v86 */
    /* JADX WARN: Type inference failed for: r5v88, types: [x12] */
    /* JADX WARN: Type inference failed for: r7v23 */
    /* JADX WARN: Type inference failed for: r7v24 */
    /* JADX WARN: Type inference failed for: r7v27 */
    /* JADX WARN: Type inference failed for: r9v2, types: [p65] */
    /* JADX WARN: Type inference failed for: r9v27, types: [x12] */
    /* JADX WARN: Type inference failed for: r9v29, types: [x12] */
    /* JADX WARN: Type inference failed for: r9v31, types: [x12] */
    /* JADX WARN: Type inference failed for: r9v33, types: [x12] */
    /* JADX WARN: Type inference failed for: r9v38, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r9v39, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r9v41, types: [x12] */
    /* JADX WARN: Type inference failed for: r9v43, types: [x12] */
    /* JADX WARN: Type inference failed for: r9v60 */
    /* JADX WARN: Type inference failed for: r9v61 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void o(final defpackage.a3c r48, final defpackage.d2c r49, defpackage.r28 r50, defpackage.x12 r51, int r52) {
        /*
            Method dump skipped, instruction units count: 2466
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dm2.o(a3c, d2c, r28, x12, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x020c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void p(defpackage.vpc r37, defpackage.bo4 r38, defpackage.vpc r39, defpackage.d2c r40, defpackage.r28 r41, defpackage.x12 r42, int r43) {
        /*
            Method dump skipped, instruction units count: 1058
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dm2.p(vpc, bo4, vpc, d2c, r28, x12, int):void");
    }

    public static final void q(d2c d2cVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1800426281);
        int i3 = (p65Var2.f(d2cVar) ? 4 : 2) | i2 | 48;
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            String strR = vo7.R(p65Var2, R.string.settings_title);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new xib(0, d2cVar, d2c.class, "onBackPressed", "onBackPressed()V", 0, 28);
                p65Var2.j0(objM);
            }
            m45 m45Var = (m45) ((qh6) objM);
            long j2 = ((zo7) p65Var2.j(kt7.b)).c;
            p65Var = p65Var2;
            r28Var2 = o28.b;
            qk7.g(r28Var2, strR, m45Var, null, null, null, 0L, j2, null, p65Var, 6, IptcDirectory.TAG_ARM_IDENTIFIER);
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(d2cVar, r28Var2, i2, 28);
        }
    }

    public static final void r(int i2, String str, boolean z, String str2, r28 r28Var, x45 x45Var, x12 x12Var, int i3) {
        int i4;
        int i5;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2083303565);
        int i6 = i3 | (p65Var.d(i2) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.g(z) ? 256 : 128) | (p65Var.h(x45Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        if (p65Var.P(i6 & 1, (74899 & i6) != 74898)) {
            if (z) {
                i4 = -1418851444;
                i5 = R.string.settings_disconnect_action;
            } else {
                i4 = -1418779121;
                i5 = R.string.settings_connect_action;
            }
            String strW = km4.w(p65Var, i4, i5, p65Var, false);
            sn3 sn3Var = kt7.b;
            r28 r28VarA0 = flb.a0(r28Var, ((zo7) p65Var.j(sn3Var)).a, rv8.r);
            vkb vkbVar = new vkb(0);
            boolean z2 = ((458752 & i6) == 131072) | ((i6 & 896) == 256);
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new ic0(x45Var, z, 5);
                p65Var.j0(objM);
            }
            r28 r28VarF = w2g.F(jfc.f(jfc.d(hlg.r(r28VarA0, false, null, vkbVar, (m45) objM, 11), 1.0f), 48.0f, 0.0f, 2), 24.0f, 8.0f, 24.0f, 8.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i7 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i7));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            c09 c09VarJ = vn7.J(i2, i6 & 14, p65Var);
            long j3 = ((zo7) p65Var.j(sn3Var)).o;
            o28 o28Var = o28.b;
            qv5.b(c09VarJ, null, bgf.N(o28Var, "social_icon"), j3, p65Var, 440, 0);
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            sn3 sn3Var2 = jt7.c;
            jjd.b(str, km4.u(1.0f, bgf.N(o28Var, "social_title"), true), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var.j(sn3Var2)).m, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, (i6 >> 3) & 14, 24960, 110588);
            jjd.b(strW, bgf.N(o28Var, str2), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) lv8.n(o28Var, 8.0f, p65Var, sn3Var2)).m, 0L, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16773119), p65Var, 0, 0, 131068);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mq(i2, str, z, str2, r28Var, x45Var, i3);
        }
    }

    public static final void s(int i2, x12 x12Var, x45 x45Var, r28 r28Var, String str, boolean z) {
        r28 r28Var2;
        Object fr0Var;
        m62 m62Var;
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(413339578);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.g(z) ? 32 : 16) | (p65Var.h(x45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            r28Var2 = r28Var;
            r28 r28VarF = w2g.F(jfc.f(jfc.d(flb.a0(r28Var2, ((zo7) p65Var.j(kt7.b)).a, rv8.r), 1.0f), 48.0f, 0.0f, 2), 24.0f, 8.0f, 24.0f, 8.0f);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var2 = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                fr0Var = new fr0(l78Var3, hl7Var, m62Var2, l78Var2, 25);
                m62Var = m62Var2;
                l78Var = l78Var2;
                p65Var.j0(fr0Var);
            } else {
                fr0Var = objM6;
                m62Var = m62Var2;
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) fr0Var;
            Object objM7 = p65Var.M();
            int i4 = 25;
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, i4);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, i4);
                p65Var.j0(objM8);
            }
            hlg.j(wxb.a(r28VarF, false, (x45) objM8), pxf.E(1200550679, new jw(l78Var3, z52Var, m45Var, str, z, x45Var), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            r28Var2 = r28Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ov0(i2, x45Var, r28Var2, str, z);
        }
    }

    public static final void t(DarkMode darkMode, r28 r28Var, m45 m45Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1770405710);
        int i3 = i2 | (p65Var.d(darkMode.ordinal()) ? 4 : 2) | (p65Var.h(m45Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28Var2 = r28Var;
            r28 r28VarF = w2g.F(jfc.d(hlg.r(flb.a0(r28Var2, ((zo7) p65Var.j(kt7.b)).a, rv8.r), false, null, new vkb(0), m45Var, 11), 1.0f), 24.0f, 14.0f, 24.0f, 14.0f);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var2 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                fr0 fr0Var = new fr0(l78Var2, hl7Var, m62Var, l78Var, 26);
                p65Var.j0(fr0Var);
                objM6 = fr0Var;
            }
            zk7 zk7Var = (zk7) objM6;
            Object objM7 = p65Var.M();
            int i4 = 26;
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, i4);
                p65Var.j0(objM7);
            }
            m45 m45Var2 = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, i4);
                p65Var.j0(objM8);
            }
            hlg.j(wxb.a(r28VarF, false, (x45) objM8), pxf.E(1200550679, new kj2(l78Var2, z52Var, m45Var2, darkMode, 3), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            r28Var2 = r28Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i2, 16, darkMode, r28Var2, m45Var);
        }
    }

    public static float u(EdgeEffect edgeEffect, float f2, float f3, m73 m73Var) {
        float f4 = co3.a;
        double dB = m73Var.b() * 386.0878f * 160.0f * 0.84f;
        double dAbs = Math.abs(f2) * 0.35f;
        double d2 = ((double) co3.a) * dB;
        float fExp = (float) (Math.exp((co3.b / co3.c) * Math.log(dAbs / d2)) * d2);
        int i2 = Build.VERSION.SDK_INT;
        if (fExp > (i2 >= 31 ? io.i(edgeEffect) : 0.0f) * f3) {
            return 0.0f;
        }
        int iW0 = nk7.w0(f2);
        if (i2 >= 31) {
            edgeEffect.onAbsorb(iW0);
            return f2;
        }
        if (edgeEffect.isFinished()) {
            edgeEffect.onAbsorb(iW0);
        }
        return f2;
    }

    public static final void v(y4 y4Var, zxb zxbVar) {
        txb txbVar = zxbVar.d;
        f78 f78Var = txbVar.a;
        Object objG = txbVar.a.g(eyb.z);
        if (objG == null) {
            objG = null;
        }
        vkb vkbVar = (vkb) objG;
        if (bo.M(zxbVar)) {
            if (vkbVar != null && vkbVar.a == 8) {
                return;
            }
            Object objG2 = f78Var.g(sxb.y);
            if (objG2 == null) {
                objG2 = null;
            }
            i4 i4Var = (i4) objG2;
            if (i4Var != null) {
                y4Var.b(new t4(android.R.id.accessibilityActionPageUp, i4Var.a));
            }
            Object objG3 = f78Var.g(sxb.A);
            if (objG3 == null) {
                objG3 = null;
            }
            i4 i4Var2 = (i4) objG3;
            if (i4Var2 != null) {
                y4Var.b(new t4(android.R.id.accessibilityActionPageDown, i4Var2.a));
            }
            Object objG4 = f78Var.g(sxb.z);
            if (objG4 == null) {
                objG4 = null;
            }
            i4 i4Var3 = (i4) objG4;
            if (i4Var3 != null) {
                y4Var.b(new t4(android.R.id.accessibilityActionPageLeft, i4Var3.a));
            }
            Object objG5 = f78Var.g(sxb.B);
            i4 i4Var4 = (i4) (objG5 != null ? objG5 : null);
            if (i4Var4 != null) {
                y4Var.b(new t4(android.R.id.accessibilityActionPageRight, i4Var4.a));
            }
        }
    }

    public static final boolean w(int i2, int i3, int i4, byte[] bArr, byte[] bArr2) {
        bArr.getClass();
        bArr2.getClass();
        for (int i5 = 0; i5 < i4; i5++) {
            if (bArr[i5 + i2] != bArr2[i5 + i3]) {
                return false;
            }
        }
        return true;
    }

    public static final Drawable x(ew5 ew5Var, Resources resources) {
        return ew5Var instanceof em3 ? ((em3) ew5Var).a : ew5Var instanceof yr0 ? new BitmapDrawable(resources, ((yr0) ew5Var).a) : new t5(1, ew5Var);
    }

    public static final ew5 y(Drawable drawable) {
        return drawable instanceof BitmapDrawable ? new yr0(((BitmapDrawable) drawable).getBitmap()) : new em3(drawable);
    }

    public static final Object z(d37 d37Var, n92 n92Var) throws Throwable {
        try {
            if (d37Var.isDone()) {
                return j2.h(d37Var);
            }
            x51 x51Var = new x51(1, pwd.Q(n92Var));
            d37Var.a(new omd(d37Var, x51Var, 1), cf3.INSTANCE);
            x51Var.v(new ce(26, d37Var));
            return x51Var.q();
        } catch (ExecutionException e2) {
            Throwable cause = e2.getCause();
            if (cause != null) {
                throw cause;
            }
            KotlinNullPointerException kotlinNullPointerException = new KotlinNullPointerException();
            g76.d0(kotlinNullPointerException, g76.class.getName());
            throw kotlinNullPointerException;
        }
    }

    public abstract long G();

    public abstract void N(si2 si2Var);

    public abstract void O(long j2, qi2 qi2Var, xi2 xi2Var, ti2 ti2Var);

    public abstract void P(long j2, wi2 wi2Var);

    public abstract void R(String str);

    static {
        new mz1(new zz1(4), false, -1440551700);
        e = new mz1(new zz1(6), false, 1067398560);
        f = new mz1(new j02(23), false, -948998934);
        g = new mz1(new zz1(13), false, 1540524264);
        h = new tk4(0);
        i = new StackTraceElement[0];
        j = new int[]{1, 2, 3, 4, 5, 6, 7};
    }
}

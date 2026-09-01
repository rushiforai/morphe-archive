package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.DisplayCutout;
import android.view.View;
import android.widget.TextView;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.android.recaptcha.internal.zzaek;
import com.medium.android.common.post.iframe.ParagraphEditIframeLayout;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.LinkedHashSet;
import java.util.regex.Pattern;
import javax.crypto.Cipher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class jzb implements yx0, n73, an4, q09, f4, erd, w82, k9f, uc8, hmc, r44, xlf, rhg, thg {
    public static final jzb a = new jzb();
    public static final jzb b = new jzb();
    public static final jzb c = new jzb();
    public static final jzb d = new jzb();
    public static final jzb e = new jzb();
    public static final /* synthetic */ jzb f = new jzb();
    public static final jzb g = new jzb();

    public static dt2 B(qo7 qo7Var) {
        if (qo7Var instanceof io8) {
            f09[] f09VarArr = {new f09("catalog_type", "catalog_type:catalog"), new f09("catalog_id", ((io8) qo7Var).f)};
            ct2 ct2Var = new ct2(0, false);
            for (int i = 0; i < 2; i++) {
                f09 f09Var = f09VarArr[i];
                ct2Var.d((String) f09Var.a, f09Var.b);
            }
            return ct2Var.a();
        }
        if (!(qo7Var instanceof jo8)) {
            ygf.a();
            return null;
        }
        f09[] f09VarArr2 = {new f09("catalog_type", "catalog_type:reading_list")};
        ct2 ct2Var2 = new ct2(0, false);
        f09 f09Var2 = f09VarArr2[0];
        ct2Var2.d((String) f09Var2.a, f09Var2.b);
        return ct2Var2.a();
    }

    public static String C(mg6 mg6Var) {
        String desc;
        mg6Var.getClass();
        if (mg6Var instanceof jg6) {
            return "[".concat(C(((jg6) mg6Var).i));
        }
        if (mg6Var instanceof lg6) {
            pf6 pf6Var = ((lg6) mg6Var).i;
            return (pf6Var == null || (desc = pf6Var.getDesc()) == null) ? "V" : desc;
        }
        if (mg6Var instanceof kg6) {
            return ev6.z(new StringBuilder("L"), ((kg6) mg6Var).i, ';');
        }
        ygf.a();
        return null;
    }

    public static boolean D(int i, ym0 ym0Var, Object obj) throws zzaek {
        up1 up1Var = (up1) ym0Var.e;
        int i2 = ym0Var.b;
        int i3 = i2 >>> 3;
        int i4 = i2 & 7;
        if (i4 == 0) {
            ym0Var.z(0);
            ((epf) obj).d(i3 << 3, Long.valueOf(up1Var.e0()));
            return true;
        }
        if (i4 == 1) {
            ym0Var.z(1);
            ((epf) obj).d((i3 << 3) | 1, Long.valueOf(up1Var.h0()));
            return true;
        }
        if (i4 == 2) {
            ym0Var.z(2);
            ((epf) obj).d((i3 << 3) | 2, up1Var.p0());
            return true;
        }
        if (i4 != 3) {
            if (i4 == 4) {
                if (i != 0) {
                    return false;
                }
                ygf.j("Protocol message end-group tag did not match expected tag.");
                return false;
            }
            if (i4 != 5) {
                ygf.g();
                return false;
            }
            ym0Var.z(5);
            ((epf) obj).d(5 | (i3 << 3), Integer.valueOf(up1Var.i0()));
            return true;
        }
        epf epfVarA = epf.a();
        int i5 = i3 << 3;
        int i6 = i + 1;
        if (i6 >= 100) {
            ygf.j("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
            return false;
        }
        while (ym0Var.J() != Integer.MAX_VALUE && D(i6, ym0Var, epfVarA)) {
        }
        if ((i5 | 4) != ym0Var.b) {
            ygf.j("Protocol message end-group tag did not match expected tag.");
            return false;
        }
        if (epfVarA.e) {
            epfVarA.e = false;
        }
        ((epf) obj).d(i5 | 3, epfVarA);
        return true;
    }

    public static final epf E(Object obj) {
        fnf fnfVar = (fnf) obj;
        epf epfVar = fnfVar.zzc;
        if (epfVar != epf.f) {
            return epfVar;
        }
        epf epfVarA = epf.a();
        fnfVar.zzc = epfVarA;
        return epfVarA;
    }

    public static void f(gnb gnbVar, Object obj) {
        int i;
        c8f c8fVar = (c8f) obj;
        gnbVar.getClass();
        String str = c8fVar.a;
        int i2 = 1;
        gnbVar.M(1, str);
        gnbVar.c(2, en7.R(c8fVar.b));
        gnbVar.M(3, c8fVar.c);
        gnbVar.M(4, c8fVar.d);
        dt2 dt2Var = dt2.b;
        gnbVar.d(5, ht2.E0(c8fVar.e));
        gnbVar.d(6, ht2.E0(c8fVar.f));
        gnbVar.c(7, c8fVar.g);
        gnbVar.c(8, c8fVar.h);
        gnbVar.c(9, c8fVar.i);
        gnbVar.c(10, c8fVar.k);
        tm0 tm0Var = c8fVar.l;
        tm0Var.getClass();
        int i3 = j8f.b[tm0Var.ordinal()];
        if (i3 == 1) {
            i = 0;
        } else {
            if (i3 != 2) {
                ygf.a();
                return;
            }
            i = 1;
        }
        gnbVar.c(11, i);
        gnbVar.c(12, c8fVar.m);
        gnbVar.c(13, c8fVar.n);
        gnbVar.c(14, c8fVar.o);
        gnbVar.c(15, c8fVar.p);
        gnbVar.c(16, c8fVar.q ? 1L : 0L);
        lw8 lw8Var = c8fVar.r;
        lw8Var.getClass();
        int i4 = j8f.d[lw8Var.ordinal()];
        if (i4 == 1) {
            i2 = 0;
        } else if (i4 != 2) {
            ygf.a();
            return;
        }
        gnbVar.c(17, i2);
        gnbVar.c(18, c8fVar.s);
        gnbVar.c(19, c8fVar.t);
        gnbVar.c(20, c8fVar.u);
        gnbVar.c(21, c8fVar.v);
        gnbVar.c(22, c8fVar.w);
        String str2 = c8fVar.x;
        if (str2 == null) {
            gnbVar.g(23);
        } else {
            gnbVar.M(23, str2);
        }
        Boolean bool = c8fVar.y;
        if ((bool != null ? Integer.valueOf(bool.booleanValue() ? 1 : 0) : null) == null) {
            gnbVar.g(24);
        } else {
            gnbVar.c(24, r1.intValue());
        }
        e72 e72Var = c8fVar.j;
        gnbVar.c(25, en7.L(e72Var.a));
        gnbVar.d(26, en7.w(e72Var.b));
        gnbVar.c(27, e72Var.c ? 1L : 0L);
        gnbVar.c(28, e72Var.d ? 1L : 0L);
        gnbVar.c(29, e72Var.e ? 1L : 0L);
        gnbVar.c(30, e72Var.f ? 1L : 0L);
        gnbVar.c(31, e72Var.g);
        gnbVar.c(32, e72Var.h);
        gnbVar.d(33, en7.Q(e72Var.i));
        gnbVar.M(34, str);
    }

    public static String[] h(String... strArr) {
        ArrayList arrayList = new ArrayList(strArr.length);
        for (String str : strArr) {
            arrayList.add("<init>(" + str + ")V");
        }
        return (String[]) arrayList.toArray(new String[0]);
    }

    public static mg6 j(String str) {
        pf6 pf6Var;
        char cCharAt = str.charAt(0);
        pf6[] pf6VarArrValues = pf6.values();
        int length = pf6VarArrValues.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                pf6Var = null;
                break;
            }
            pf6Var = pf6VarArrValues[i];
            if (pf6Var.getDesc().charAt(0) == cCharAt) {
                break;
            }
            i++;
        }
        if (pf6Var != null) {
            return new lg6(pf6Var);
        }
        if (cCharAt == 'V') {
            return new lg6(null);
        }
        if (cCharAt == '[') {
            return new jg6(j(str.substring(1)));
        }
        if (cCharAt == 'L') {
            muc.U(str, ';');
        }
        return new kg6(str.substring(1, str.length() - 1));
    }

    public static LinkedHashSet t(String str, String... strArr) {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (String str2 : strArr) {
            linkedHashSet.add(str + '.' + str2);
        }
        return linkedHashSet;
    }

    public static LinkedHashSet u(String str, String... strArr) {
        return t("java/lang/".concat(str), (String[]) Arrays.copyOf(strArr, strArr.length));
    }

    public static LinkedHashSet w(String str, String... strArr) {
        return t("java/util/".concat(str), (String[]) Arrays.copyOf(strArr, strArr.length));
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x005a A[Catch: all -> 0x00c1, TRY_LEAVE, TryCatch #1 {all -> 0x00c1, blocks: (B:5:0x000f, B:7:0x0013, B:19:0x0037, B:21:0x0040, B:30:0x005a, B:39:0x0073, B:48:0x008b, B:62:0x00ba, B:47:0x0088, B:38:0x0070, B:29:0x0057, B:17:0x0031, B:11:0x001f, B:14:0x0029, B:24:0x004c, B:42:0x007f, B:51:0x0097, B:54:0x00a1, B:56:0x00a7, B:59:0x00ae, B:33:0x0066), top: B:74:0x000f, inners: #0, #2, #3, #4, #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0073 A[Catch: all -> 0x00c1, TRY_LEAVE, TryCatch #1 {all -> 0x00c1, blocks: (B:5:0x000f, B:7:0x0013, B:19:0x0037, B:21:0x0040, B:30:0x005a, B:39:0x0073, B:48:0x008b, B:62:0x00ba, B:47:0x0088, B:38:0x0070, B:29:0x0057, B:17:0x0031, B:11:0x001f, B:14:0x0029, B:24:0x004c, B:42:0x007f, B:51:0x0097, B:54:0x00a1, B:56:0x00a7, B:59:0x00ae, B:33:0x0066), top: B:74:0x000f, inners: #0, #2, #3, #4, #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x008b A[Catch: all -> 0x00c1, TRY_LEAVE, TryCatch #1 {all -> 0x00c1, blocks: (B:5:0x000f, B:7:0x0013, B:19:0x0037, B:21:0x0040, B:30:0x005a, B:39:0x0073, B:48:0x008b, B:62:0x00ba, B:47:0x0088, B:38:0x0070, B:29:0x0057, B:17:0x0031, B:11:0x001f, B:14:0x0029, B:24:0x004c, B:42:0x007f, B:51:0x0097, B:54:0x00a1, B:56:0x00a7, B:59:0x00ae, B:33:0x0066), top: B:74:0x000f, inners: #0, #2, #3, #4, #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:84:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final boolean y(android.view.View r7) {
        /*
            Method dump skipped, instruction units count: 201
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jzb.y(android.view.View):boolean");
    }

    public void A(dd9 dd9Var, int i, int i2) {
    }

    @Override // defpackage.f4
    public String Q() {
        return "oauth/access_token";
    }

    @Override // defpackage.q09
    public void a(ParagraphEditIframeLayout paragraphEditIframeLayout) {
    }

    @Override // defpackage.uc8
    public void b(yu2 yu2Var) {
    }

    @Override // defpackage.n73
    public float c(Context context) {
        return context.getResources().getDisplayMetrics().density;
    }

    @Override // defpackage.xlf
    public /* bridge */ /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? Cipher.getInstance(str) : Cipher.getInstance(str, provider);
    }

    @Override // defpackage.q09
    public void e(ParagraphEditIframeLayout paragraphEditIframeLayout) {
    }

    @Override // defpackage.w82
    public long g(long j, long j2) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j2 & 4294967295L)) / Float.intBitsToFloat((int) (j & 4294967295L));
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat)) & 4294967295L);
        int i = fqb.a;
        return jFloatToRawIntBits;
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) {
        r2g r2gVar = (r2g) bzfVar;
        hsg hsgVarT = isg.t();
        hsgVarT.g("type.googleapis.com/google.crypto.tink.AesGcmSivKey");
        mng mngVarX = ong.x();
        int i = r2gVar.a;
        mngVarX.c();
        ((ong) mngVarX.b).zze = i;
        hsgVarT.h(((ong) mngVarX.b()).b());
        hsgVarT.e(u6g.b(r2gVar.b));
        return lig.p0((isg) hsgVarT.b());
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object k(android.content.Context r19, defpackage.qo7 r20, defpackage.p92 r21) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 244
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jzb.k(android.content.Context, qo7, p92):java.lang.Object");
    }

    @Override // defpackage.k9f
    public sr0 l(String str, xm0 xm0Var, EnumMap enumMap) {
        k9f wn3Var;
        int i = 2;
        int i2 = 1;
        int i3 = 0;
        switch (a58.a[xm0Var.ordinal()]) {
            case 1:
                wn3Var = new wn3(i2);
                break;
            case 2:
                wn3Var = new wn3(i);
                break;
            case 3:
                wn3Var = new wn3(i3);
                break;
            case 4:
                hha hhaVar = new hha();
                hhaVar.a = new wn3(i3);
                wn3Var = hhaVar;
                break;
            case 5:
                wn3Var = new fa4(22);
                break;
            case 6:
                wn3Var = new yu5(i);
                break;
            case 7:
                wn3Var = new yu5(3);
                break;
            case 8:
                wn3Var = new yu5(i2);
                break;
            case 9:
                wn3Var = new yu5(i3);
                break;
            case 10:
                wn3Var = new rz5(21);
                break;
            case 11:
                wn3Var = new kp1();
                break;
            case 12:
                wn3Var = new cd7();
                break;
            case 13:
                wn3Var = new wz7(12);
                break;
            default:
                ay0.e("No encoder available for format ".concat(String.valueOf(xm0Var)));
                return null;
        }
        return wn3Var.l(str, xm0Var, enumMap);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object m(android.content.Context r19, defpackage.qo7 r20, defpackage.p92 r21) throws java.lang.Throwable {
        /*
            r18 = this;
            r0 = r21
            boolean r1 = r0 instanceof defpackage.gj3
            if (r1 == 0) goto L15
            r1 = r0
            gj3 r1 = (defpackage.gj3) r1
            int r2 = r1.d
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.d = r2
            goto L1c
        L15:
            gj3 r1 = new gj3
            r2 = r18
            r1.<init>(r2, r0)
        L1c:
            java.lang.Object r0 = r1.b
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.d
            r4 = 0
            r5 = 1
            if (r3 == 0) goto L33
            if (r3 != r5) goto L2d
            defpackage.br7.v(r0)
            goto Lbb
        L2d:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r4
        L33:
            defpackage.br7.v(r0)
            le8 r0 = new le8
            java.util.LinkedHashSet r0 = new java.util.LinkedHashSet
            r0.<init>()
            te8 r8 = defpackage.te8.CONNECTED
            r8.getClass()
            le8 r7 = new le8
            r7.<init>(r4)
            int r3 = android.os.Build.VERSION.SDK_INT
            r4 = 24
            if (r3 < r4) goto L54
            java.util.Set r0 = defpackage.bu1.q1(r0)
        L51:
            r17 = r0
            goto L57
        L54:
            ny3 r0 = defpackage.ny3.a
            goto L51
        L57:
            e72 r6 = new e72
            r9 = 0
            r10 = 0
            r11 = 0
            r12 = 0
            r13 = -1
            r15 = r13
            r6.<init>(r7, r8, r9, r10, r11, r12, r13, r15, r17)
            vt8 r0 = new vt8
            java.lang.Class<com.medium.android.data.offline.DownloadCatalogWorker> r3 = com.medium.android.data.offline.DownloadCatalogWorker.class
            r0.<init>(r3)
            c8f r3 = r0.c
            r3.j = r6
            lw8 r3 = defpackage.lw8.RUN_AS_NON_EXPEDITED_WORK_REQUEST
            r3.getClass()
            c8f r4 = r0.c
            r4.q = r5
            r4.r = r3
            dt2 r3 = B(r20)
            c8f r4 = r0.c
            r4.e = r3
            java.lang.String r3 = "DownloadCatalogWorker"
            java.util.Set r4 = r0.d
            r4.add(r3)
            y7f r0 = r0.a()
            wt8 r0 = (defpackage.wt8) r0
            r19.getClass()
            m7f r3 = defpackage.m7f.f(r19)
            r3.getClass()
            java.lang.StringBuilder r4 = new java.lang.StringBuilder
            java.lang.String r6 = "UniqueDownloadCatalogWorker:"
            r4.<init>(r6)
            r6 = r20
            r4.append(r6)
            java.lang.String r4 = r4.toString()
            j54 r6 = defpackage.j54.REPLACE
            md5 r0 = r3.d(r4, r6, r0)
            java.lang.Object r0 = r0.b
            t41 r0 = (defpackage.t41) r0
            r1.d = r5
            java.lang.Object r0 = defpackage.dm2.z(r0, r1)
            if (r0 != r2) goto Lbb
            return r2
        Lbb:
            r0.getClass()
            c1e r0 = defpackage.c1e.a
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jzb.m(android.content.Context, qo7, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x004f  */
    @Override // defpackage.hmc
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.StackTraceElement[] n(java.lang.StackTraceElement[] r14) {
        /*
            r13 = this;
            java.util.HashMap r13 = new java.util.HashMap
            r13.<init>()
            int r0 = r14.length
            java.lang.StackTraceElement[] r0 = new java.lang.StackTraceElement[r0]
            r1 = 0
            r2 = 1
            r3 = r1
            r4 = r3
            r5 = r2
        Ld:
            int r6 = r14.length
            if (r3 >= r6) goto L61
            r6 = r14[r3]
            java.lang.Object r7 = r13.get(r6)
            java.lang.Integer r7 = (java.lang.Integer) r7
            if (r7 == 0) goto L4f
            int r8 = r7.intValue()
            int r9 = r3 - r8
            int r10 = r3 + r9
            int r11 = r14.length
            if (r10 <= r11) goto L26
            goto L4f
        L26:
            r10 = r1
        L27:
            if (r10 >= r9) goto L3b
            int r11 = r8 + r10
            r11 = r14[r11]
            int r12 = r3 + r10
            r12 = r14[r12]
            boolean r11 = r11.equals(r12)
            if (r11 != 0) goto L38
            goto L4f
        L38:
            int r10 = r10 + 1
            goto L27
        L3b:
            int r7 = r7.intValue()
            int r7 = r3 - r7
            r8 = 10
            if (r5 >= r8) goto L4b
            java.lang.System.arraycopy(r14, r3, r0, r4, r7)
            int r4 = r4 + r7
            int r5 = r5 + 1
        L4b:
            int r7 = r7 + (-1)
            int r7 = r7 + r3
            goto L57
        L4f:
            r5 = r14[r3]
            r0[r4] = r5
            int r4 = r4 + 1
            r5 = r2
            r7 = r3
        L57:
            java.lang.Integer r3 = java.lang.Integer.valueOf(r3)
            r13.put(r6, r3)
            int r3 = r7 + 1
            goto Ld
        L61:
            java.lang.StackTraceElement[] r13 = new java.lang.StackTraceElement[r4]
            java.lang.System.arraycopy(r0, r1, r13, r1, r4)
            int r0 = r14.length
            if (r4 >= r0) goto L6a
            return r13
        L6a:
            return r14
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jzb.n(java.lang.StackTraceElement[]):java.lang.StackTraceElement[]");
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0036 A[Catch: all -> 0x004e, TRY_LEAVE, TryCatch #3 {, blocks: (B:11:0x0018, B:15:0x0022, B:23:0x0036, B:29:0x004a, B:21:0x0031, B:18:0x002d, B:26:0x0046), top: B:44:0x0018, inners: #1, #2 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.x50 o() {
        /*
            r3 = this;
            java.lang.Class<x50> r0 = defpackage.x50.class
            java.util.Set r1 = defpackage.ec2.a
            boolean r1 = r1.contains(r0)
            r2 = 0
            if (r1 == 0) goto Ld
        Lb:
            r0 = r2
            goto L15
        Ld:
            x50 r0 = defpackage.x50.c     // Catch: java.lang.Throwable -> L10
            goto L15
        L10:
            r1 = move-exception
            defpackage.ec2.a(r0, r1)
            goto Lb
        L15:
            if (r0 != 0) goto L54
            monitor-enter(r3)
            java.util.concurrent.atomic.AtomicBoolean r0 = defpackage.f94.q     // Catch: java.lang.Throwable -> L4e
            boolean r0 = r0.get()     // Catch: java.lang.Throwable -> L4e
            if (r0 != 0) goto L22
            monitor-exit(r3)
            return r2
        L22:
            java.lang.Class<x50> r0 = defpackage.x50.class
            java.util.Set r1 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L4e
            boolean r1 = r1.contains(r0)     // Catch: java.lang.Throwable -> L4e
            if (r1 == 0) goto L2d
            goto L34
        L2d:
            x50 r2 = defpackage.x50.c     // Catch: java.lang.Throwable -> L30
            goto L34
        L30:
            r1 = move-exception
            defpackage.ec2.a(r0, r1)     // Catch: java.lang.Throwable -> L4e
        L34:
            if (r2 != 0) goto L50
            x50 r2 = new x50     // Catch: java.lang.Throwable -> L4e
            r2.<init>()     // Catch: java.lang.Throwable -> L4e
            java.lang.Class<x50> r0 = defpackage.x50.class
            java.util.Set r1 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L4e
            boolean r1 = r1.contains(r0)     // Catch: java.lang.Throwable -> L4e
            if (r1 == 0) goto L46
            goto L50
        L46:
            defpackage.x50.c = r2     // Catch: java.lang.Throwable -> L49
            goto L50
        L49:
            r1 = move-exception
            defpackage.ec2.a(r0, r1)     // Catch: java.lang.Throwable -> L4e
            goto L50
        L4e:
            r0 = move-exception
            goto L52
        L50:
            monitor-exit(r3)
            return r2
        L52:
            monitor-exit(r3)
            throw r0
        L54:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jzb.o():x50");
    }

    public void q(Rect rect, View view) {
        DisplayMetrics displayMetrics = view.getResources().getDisplayMetrics();
        rect.set(0, 0, displayMetrics.widthPixels, displayMetrics.heightPixels);
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        isg isgVar = (isg) ligVar.c;
        if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey")) {
            ay0.e(ka1.r("Wrong type URL in call to AesCtrHmacAeadProtoSerialization.parseParameters: ", isgVar.B()));
            return null;
        }
        try {
            tlg tlgVarU = tlg.u(isgVar.A(), ptf.a);
            if (tlgVarU.y().x() != 0) {
                ygf.l("Only version 0 keys are accepted");
                return null;
            }
            ing ingVarB = f1g.b();
            ingVarB.l(tlgVarU.x().t());
            ingVarB.n(tlgVarU.y().t());
            ingVarB.o(tlgVarU.x().y().t());
            ingVarB.p(tlgVarU.y().A().t());
            ingVarB.d = n5g.b(tlgVarU.y().A().w());
            ingVarB.e = n5g.a(isgVar.z());
            return ingVarB.i();
        } catch (zzale e2) {
            throw new GeneralSecurityException("Parsing AesCtrHmacAeadParameters failed: ", e2);
        }
    }

    @Override // defpackage.an4
    public mn6 s(s6a s6aVar, String str, hec hecVar, hec hecVar2) {
        s6aVar.getClass();
        str.getClass();
        hecVar.getClass();
        hecVar2.getClass();
        throw new IllegalArgumentException("This method should not be used.");
    }

    @Override // defpackage.f4
    public String v() {
        return "fb_extend_sso_token";
    }

    public boolean x(TextView textView) {
        if (!ec2.a.contains(this)) {
            try {
                String strJ = gue.j(textView);
                Pattern patternCompile = Pattern.compile("\\s");
                patternCompile.getClass();
                strJ.getClass();
                String strReplaceAll = patternCompile.matcher(strJ).replaceAll("");
                strReplaceAll.getClass();
                int length = strReplaceAll.length();
                if (length >= 12 && length <= 19) {
                    int i = length - 1;
                    int i2 = 0;
                    boolean z = false;
                    while (true) {
                        if (-1 < i) {
                            char cCharAt = strReplaceAll.charAt(i);
                            if (!Character.isDigit(cCharAt)) {
                                break;
                            }
                            int iDigit = Character.digit((int) cCharAt, 10);
                            if (iDigit < 0) {
                                throw new IllegalArgumentException("Char " + cCharAt + " is not a decimal digit");
                            }
                            if (z && (iDigit = iDigit * 2) > 9) {
                                iDigit = (iDigit % 10) + 1;
                            }
                            i2 += iDigit;
                            z = !z;
                            i--;
                        } else if (i2 % 10 == 0) {
                            return true;
                        }
                    }
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return false;
            }
        }
        return false;
    }

    public void z(String str, String str2) {
        Collections.singletonMap("track", str).getClass();
    }

    @Override // defpackage.yx0
    public Rect p(Activity activity) throws Exception {
        DisplayCutout displayCutoutK;
        Rect rect = new Rect();
        Configuration configuration = activity.getResources().getConfiguration();
        try {
            Field declaredField = Configuration.class.getDeclaredField(pUlNWdybf.cuPot);
            declaredField.setAccessible(true);
            Object obj = declaredField.get(configuration);
            if (o6.n(activity)) {
                Object objInvoke = obj.getClass().getDeclaredMethod("getBounds", null).invoke(obj, null);
                objInvoke.getClass();
                rect.set((Rect) objInvoke);
            } else {
                Object objInvoke2 = obj.getClass().getDeclaredMethod("getAppBounds", null).invoke(obj, null);
                objInvoke2.getClass();
                rect.set((Rect) objInvoke2);
            }
        } catch (Exception e2) {
            if (!(e2 instanceof NoSuchFieldException) && !(e2 instanceof NoSuchMethodException) && !(e2 instanceof IllegalAccessException) && !(e2 instanceof InvocationTargetException)) {
                throw e2;
            }
            yx0.U.getClass();
            Log.w(xx0.b, e2);
            activity.getWindowManager().getDefaultDisplay().getRectSize(rect);
        }
        Display defaultDisplay = activity.getWindowManager().getDefaultDisplay();
        Point point = new Point();
        defaultDisplay.getRealSize(point);
        if (!o6.n(activity)) {
            Resources resources = activity.getResources();
            int identifier = resources.getIdentifier("navigation_bar_height", "dimen", "android");
            int dimensionPixelSize = identifier > 0 ? resources.getDimensionPixelSize(identifier) : 0;
            int i = rect.bottom + dimensionPixelSize;
            if (i == point.y) {
                rect.bottom = i;
            } else {
                int i2 = rect.right + dimensionPixelSize;
                if (i2 == point.x) {
                    rect.right = i2;
                } else if (rect.left == dimensionPixelSize) {
                    rect.left = 0;
                }
            }
        }
        if ((rect.width() < point.x || rect.height() < point.y) && !o6.n(activity) && (displayCutoutK = uy.k(defaultDisplay)) != null) {
            if (rect.left == uy.D(displayCutoutK)) {
                rect.left = 0;
            }
            if (point.x - rect.right == uy.E(displayCutoutK)) {
                rect.right = uy.E(displayCutoutK) + rect.right;
            }
            if (rect.top == uy.F(displayCutoutK)) {
                rect.top = 0;
            }
            if (point.y - rect.bottom == uy.C(displayCutoutK)) {
                rect.bottom = uy.C(displayCutoutK) + rect.bottom;
            }
        }
        return rect;
    }
}

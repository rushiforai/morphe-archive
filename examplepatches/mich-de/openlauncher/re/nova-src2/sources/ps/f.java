package ps;

import android.app.AppOpsManager;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import b10.x1;
import c3.a1;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.ui.core.elements.AddressSpec;
import com.stripe.android.ui.core.elements.EmailSpec;
import com.stripe.android.ui.core.elements.FormItemSpec;
import com.stripe.android.ui.core.elements.NameSpec;
import com.stripe.android.ui.core.elements.PhoneSpec;
import com.stripe.android.ui.core.elements.SepaMandateTextSpec;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.t3;
import e00.x2;
import hv.j3;
import java.io.File;
import java.util.List;
import java.util.NoSuchElementException;
import k0.p1;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import kw.z0;
import l1.d1;
import l1.g1;
import l1.g9;
import l1.p9;
import l1.q9;
import o9.g3;
import ou.w0;
import p1.s2;
import p1.t1;
import p1.z2;
import t0.b2;
import t0.c2;
import t0.u1;

/* loaded from: classes4.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static String f82858a;

    /* renamed from: b, reason: collision with root package name */
    public static Integer f82859b;

    public static final void a(String str, p1.o oVar, int i5) {
        p1.t tVar;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1197997762);
        int i11 = i5 | (tVar2.f(str) ? 4 : 2);
        if ((i11 & 3) == 2 && tVar2.E()) {
            tVar2.V();
            tVar = tVar2;
        } else {
            tVar = tVar2;
            g9.b(str, androidx.compose.foundation.layout.d.n(b2.r.f17024a, 0.0f, 0.0f, 0.0f, 8, 7), ((d1) tVar2.j(g1.f73330a)).f73148a, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, m3.p0.a(((p9) tVar2.j(q9.f73875a)).f73806i, 0L, 0L, q3.b0.f83535i, null, w20.h.i(0.5d), 0, 0L, null, null, 16777083), tVar, (i11 & 14) | 48, 0, 65528);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new x2(str, i5, 13);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0038  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0152  */
    /* JADX WARN: Removed duplicated region for block: B:54:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(String str, boolean z11, boolean z12, Function0 function0, p1.o oVar, int i5, int i11) {
        boolean z13;
        int i12;
        boolean z14;
        int i13;
        boolean z15;
        boolean z16;
        t1 t1VarU;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(1195402663);
        int i14 = (tVar.f(str) ? 4 : 2) | i5;
        int i15 = i11 & 2;
        if (i15 == 0) {
            if ((i5 & 48) == 0) {
                z13 = z11;
                i14 |= tVar.g(z13) ? 32 : 16;
            }
            i12 = i11 & 4;
            if (i12 == 0) {
                i13 = i14 | 384;
                z14 = z12;
            } else {
                z14 = z12;
                i13 = i14 | (tVar.g(z14) ? 256 : 128);
            }
            if ((i5 & 3072) == 0) {
                i13 |= tVar.h(function0) ? 2048 : 1024;
            }
            if ((i13 & 1171) == 1170 || !tVar.E()) {
                if (i15 != 0) {
                    z13 = true;
                }
                boolean z17 = i12 == 0 ? true : z14;
                b2.r rVar = b2.r.f17024a;
                if (z13) {
                    tVar.b0(1707320855);
                    b2.t tVarL = androidx.compose.foundation.layout.d.l(androidx.compose.foundation.layout.e.e(rVar, 1.0f), 0.0f, 4, 1);
                    s0.g gVarC = s0.h.c(12);
                    p1 p1Var = l1.n0.f73676a;
                    z2 z2Var = g1.f73330a;
                    z15 = z17;
                    bh.g.a(function0, tVarL, z15, gVarC, l1.n0.a(((d1) tVar.j(z2Var)).f73163r, ((d1) tVar.j(z2Var)).f73162q, tVar, 12), null, null, null, x1.f.d(-1794583237, new x1(str, 13), tVar), tVar, ((i13 >> 9) & 14) | 805306416 | (i13 & 896), 480);
                    tVar = tVar;
                    tVar.p(false);
                } else {
                    tVar.b0(1706832574);
                    b2.t tVarL2 = androidx.compose.foundation.layout.d.l(androidx.compose.foundation.layout.e.e(rVar, 1.0f), 0.0f, 4, 1);
                    s0.g gVarC2 = s0.h.c(12);
                    p1 p1Var2 = l1.n0.f73676a;
                    z2 z2Var2 = g1.f73330a;
                    z15 = z17;
                    bh.g.a(function0, tVarL2, z15, gVarC2, l1.n0.a(((d1) tVar.j(z2Var2)).f73148a, ((d1) tVar.j(z2Var2)).f73149b, tVar, 12), null, null, null, x1.f.d(934818610, new x1(str, 12), tVar), tVar, (i13 & 896) | ((i13 >> 9) & 14) | 805306416, 480);
                    tVar = tVar;
                    tVar.p(false);
                }
                z16 = z15;
            } else {
                tVar.V();
                z16 = z14;
            }
            boolean z18 = z13;
            t1VarU = tVar.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new j3(str, z18, z16, function0, i5, i11);
                return;
            }
            return;
        }
        i14 |= 48;
        z13 = z11;
        i12 = i11 & 4;
        if (i12 == 0) {
        }
        if ((i5 & 3072) == 0) {
        }
        if ((i13 & 1171) == 1170) {
            if (i15 != 0) {
            }
            if (i12 == 0) {
            }
            b2.r rVar2 = b2.r.f17024a;
            if (z13) {
            }
            z16 = z15;
        }
        boolean z182 = z13;
        t1VarU = tVar.u();
        if (t1VarU == null) {
        }
    }

    public static x80.u c(x80.u uVar, x80.u uVar2) {
        o2.h hVar = new o2.h(1);
        int size = uVar.size();
        for (int i5 = 0; i5 < size; i5++) {
            String strC = uVar.c(i5);
            String strE = uVar.e(i5);
            if ((!"Warning".equalsIgnoreCase(strC) || !r70.j.I0(strE, "1", false)) && ("Content-Length".equalsIgnoreCase(strC) || "Content-Encoding".equalsIgnoreCase(strC) || "Content-Type".equalsIgnoreCase(strC) || !j(strC) || uVar2.b(strC) == null)) {
                hVar.a(strC, strE);
            }
        }
        int size2 = uVar2.size();
        for (int i11 = 0; i11 < size2; i11++) {
            String strC2 = uVar2.c(i11);
            if (!"Content-Length".equalsIgnoreCase(strC2) && !"Content-Encoding".equalsIgnoreCase(strC2) && !"Content-Type".equalsIgnoreCase(strC2) && j(strC2)) {
                hVar.a(strC2, uVar2.e(i11));
            }
        }
        return hVar.f();
    }

    public static y8.e d(View view) {
        return new y8.e(view);
    }

    public static int h(Context context) {
        if (f82859b == null) {
            try {
                f82859b = Integer.valueOf(context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode);
            } catch (PackageManager.NameNotFoundException e3) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("TeslaUtils");
                bVar.f(e3, "Package name not found", new Object[0]);
            }
            if (f82859b == null) {
                f82859b = 0;
            }
        }
        return f82859b.intValue();
    }

    public static boolean i(Context context) {
        return ((AccessibilityManager) context.getSystemService("accessibility")).isEnabled();
    }

    public static boolean j(String str) {
        return ("Connection".equalsIgnoreCase(str) || "Keep-Alive".equalsIgnoreCase(str) || "Proxy-Authenticate".equalsIgnoreCase(str) || "Proxy-Authorization".equalsIgnoreCase(str) || "TE".equalsIgnoreCase(str) || "Trailers".equalsIgnoreCase(str) || "Transfer-Encoding".equalsIgnoreCase(str) || "Upgrade".equalsIgnoreCase(str)) ? false : true;
    }

    public static boolean k(Context context, int i5) throws PackageManager.NameNotFoundException {
        if (w(context, i5, "com.google.android.gms")) {
            try {
                PackageInfo packageInfo = context.getPackageManager().getPackageInfo("com.google.android.gms", 64);
                pg.f fVarA = pg.f.a(context);
                fVarA.getClass();
                if (packageInfo != null) {
                    if (!pg.f.c(packageInfo, false)) {
                        if (pg.f.c(packageInfo, true)) {
                            if (!pg.e.a(fVarA.f82569a)) {
                                Log.w("GoogleSignatureVerifier", "Test-keys aren't accepted on this build.");
                            }
                        }
                    }
                    return true;
                }
            } catch (PackageManager.NameNotFoundException unused) {
            }
        }
        return false;
    }

    public static boolean l(Context context) {
        return i(context);
    }

    public static final Object m(z.j0 j0Var) {
        if (j0Var.d()) {
            throw new NoSuchElementException("List is empty.");
        }
        int i5 = j0Var.f97841b - 1;
        Object objB = j0Var.b(i5);
        j0Var.k(i5);
        return objB;
    }

    public static int n(int i5) {
        return 1 << (32 - Integer.numberOfLeadingZeros(i5 - 1));
    }

    public static void o(View view, int i5, String str) {
        if (view == null || !i(view.getContext())) {
            return;
        }
        AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain(i5);
        view.onInitializeAccessibilityEvent(accessibilityEventObtain);
        if (!TextUtils.isEmpty(str)) {
            accessibilityEventObtain.getText().add(str);
        }
        ((AccessibilityManager) view.getContext().getSystemService("accessibility")).sendAccessibilityEvent(accessibilityEventObtain);
    }

    public static void p(AccessibilityManager accessibilityManager, Context context, String str, Bundle bundle) {
        AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain(ReaderJsonLexerKt.BATCH_SIZE);
        accessibilityEventObtain.setClassName(str);
        accessibilityEventObtain.setParcelableData(bundle);
        accessibilityEventObtain.setPackageName(context.getApplicationContext().getPackageName());
        accessibilityManager.sendAccessibilityEvent(accessibilityEventObtain);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void q(Context context) {
        AccessibilityManager accessibilityManager;
        if (g3.f79855j) {
            accessibilityManager = (AccessibilityManager) context.getSystemService("accessibility");
            if (!accessibilityManager.isEnabled()) {
            }
        } else {
            accessibilityManager = null;
        }
        if (accessibilityManager == null) {
            return;
        }
        p(accessibilityManager, context, "TAPL_SCROLL_FINISHED", null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void r(Context context, int i5) {
        AccessibilityManager accessibilityManager;
        if (g3.f79855j) {
            accessibilityManager = (AccessibilityManager) context.getSystemService("accessibility");
            if (!accessibilityManager.isEnabled()) {
            }
        } else {
            accessibilityManager = null;
        }
        if (accessibilityManager == null) {
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putInt("state", i5);
        p(accessibilityManager, context, "TAPL_SWITCHED_TO_STATE", bundle);
    }

    public static FormItemSpec s(t3 field, List placeholderOverrideList, boolean z11, PaymentSheet$BillingDetailsCollectionConfiguration configuration, w0 w0Var) {
        Intrinsics.g(field, "field");
        Intrinsics.g(placeholderOverrideList, "placeholderOverrideList");
        Intrinsics.g(configuration, "configuration");
        ou.n0 n0Var = configuration.f44513a;
        ou.n0 n0Var2 = configuration.f44515c;
        ou.n0 n0Var3 = configuration.f44514b;
        ou.m0 m0Var = configuration.f44516d;
        int iOrdinal = field.ordinal();
        if (iOrdinal == 0) {
            NameSpec nameSpec = new NameSpec();
            if (n0Var == ou.n0.f80940c) {
                return nameSpec;
            }
            if (placeholderOverrideList.contains(nameSpec.f45323a) && n0Var != ou.n0.f80939b) {
                return nameSpec;
            }
        } else if (iOrdinal == 1) {
            EmailSpec emailSpec = new EmailSpec();
            if (n0Var2 == ou.n0.f80940c || (placeholderOverrideList.contains(emailSpec.f45309a) && n0Var2 != ou.n0.f80939b)) {
                return emailSpec;
            }
        } else if (iOrdinal == 2) {
            PhoneSpec phoneSpec = new PhoneSpec();
            if (n0Var3 == ou.n0.f80940c || (placeholderOverrideList.contains(phoneSpec.f45327a) && n0Var3 != ou.n0.f80939b)) {
                return phoneSpec;
            }
        } else if (iOrdinal == 3) {
            AddressSpec addressSpec = new AddressSpec(configuration.b(), 61);
            if (m0Var == ou.m0.f80933c || (placeholderOverrideList.contains(addressSpec.f45282a) && m0Var != ou.m0.f80932b)) {
                return addressSpec;
            }
        } else if (iOrdinal == 4) {
            AddressSpec addressSpec2 = new AddressSpec(configuration.b(), 29);
            if (m0Var == ou.m0.f80933c || (placeholderOverrideList.contains(addressSpec2.f45282a) && m0Var != ou.m0.f80932b)) {
                return addressSpec2;
            }
        } else if (iOrdinal == 5) {
            IdentifierSpec.Companion.getClass();
            SepaMandateTextSpec sepaMandateTextSpec = new SepaMandateTextSpec(2132020008, z0.a("sepa_mandate"));
            if (z11 && w0Var != w0.f80998b) {
                return sepaMandateTextSpec;
            }
        }
        return null;
    }

    public static File t(String str, String str2) {
        File file = new File(str);
        if (file.isFile()) {
            file.delete();
        }
        if (!file.exists()) {
            file.mkdirs();
        }
        return new File(file, str2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:14:0x002d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object u(int i5, Object obj, q3.n nVar, q3.b0 b0Var, int i11) {
        Object[] objArr;
        if (!(obj instanceof Typeface)) {
            return obj;
        }
        boolean z11 = false;
        int i12 = 0;
        z11 = false;
        if ((i5 & 1) == 0 || Intrinsics.b(nVar.a(), b0Var)) {
            objArr = false;
        } else {
            q3.b0 b0Var2 = q3.b0.f83530d;
            if (b0Var.compareTo(b0Var2) >= 0 && Intrinsics.h(nVar.a().f83539a, b0Var2.f83539a) < 0) {
                objArr = true;
            }
        }
        Object[] objArr2 = ((i5 & 2) == 0 || i11 == nVar.c()) ? false : true;
        if (objArr2 != true && objArr != true) {
            return obj;
        }
        if (Build.VERSION.SDK_INT >= 28) {
            int i13 = objArr != false ? b0Var.f83539a : nVar.a().f83539a;
            if (objArr2 == false ? nVar.c() == 1 : i11 == 1) {
                z11 = true;
            }
            return Typeface.create((Typeface) obj, i13, z11);
        }
        Object[] objArr3 = objArr2 == true && i11 == 1;
        if (objArr3 == true && objArr == true) {
            i12 = 3;
        } else if (objArr == true) {
            i12 = 1;
        } else if (objArr3 != false) {
            i12 = 2;
        }
        return Typeface.create((Typeface) obj, i12);
    }

    public static final b2.t v(b2.t tVar, u1 u1Var, r3.z zVar, r3.i0 i0Var, Function0 function0) {
        b2.t c2Var;
        g0.d1 d1Var = (g0.d1) ((s2) u1Var.f88231f).getValue();
        long j11 = zVar.f85472b;
        int i5 = m3.o0.f75945c;
        int iF = (int) (j11 >> 32);
        long j12 = u1Var.f88230e;
        if (iF == ((int) (j12 >> 32))) {
            int i11 = (int) (j11 & 4294967295L);
            iF = i11 != ((int) (4294967295L & j12)) ? i11 : m3.o0.f(j11);
        }
        u1Var.f88230e = j11;
        r3.f0 f0VarA = b2.a(i0Var, zVar.f85471a);
        int iOrdinal = d1Var.ordinal();
        if (iOrdinal == 0) {
            c2Var = new c2(u1Var, iF, f0VarA, function0);
        } else {
            if (iOrdinal != 1) {
                throw new NoWhenBranchMatchedException();
            }
            c2Var = new t0.m0(u1Var, iF, f0VarA, function0);
        }
        return fg.a.h(tVar).then(c2Var);
    }

    public static boolean w(Context context, int i5, String str) {
        a1 a1VarA = zg.b.a(context);
        a1VarA.getClass();
        try {
            AppOpsManager appOpsManager = (AppOpsManager) a1VarA.f19206a.getSystemService("appops");
            if (appOpsManager == null) {
                throw new NullPointerException("context.getSystemService(Context.APP_OPS_SERVICE) is null");
            }
            appOpsManager.checkPackage(i5, str);
            return true;
        } catch (SecurityException unused) {
            return false;
        }
    }

    public static File x(String str, String str2) {
        File file = new File(str);
        if (file.isFile()) {
            file.delete();
        }
        if (!file.exists()) {
            file.mkdirs();
        }
        return new File(file, b.c0.E(str2, ".temp"));
    }

    public abstract b2.t e();

    public abstract b2.t f();

    public abstract m3.p0 g();
}

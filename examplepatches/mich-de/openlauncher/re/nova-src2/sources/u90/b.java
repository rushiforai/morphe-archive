package u90;

import a7.h;
import ads_mobile_sdk.db0;
import ads_mobile_sdk.gq;
import ads_mobile_sdk.gu0;
import ads_mobile_sdk.hq;
import ads_mobile_sdk.sv2;
import android.app.UiModeManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.BadParcelableException;
import android.os.Build;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Process;
import android.os.UserHandle;
import android.util.Size;
import android.view.FocusFinder;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import androidx.compose.ui.draw.ShadowGraphicsLayerElement;
import androidx.compose.ui.platform.AndroidComposeView;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import androidx.fragment.app.m0;
import b.b4;
import b3.i;
import b3.l;
import b70.g;
import bg.d;
import c3.z1;
import com.google.android.gms.common.api.Status;
import com.teslacoilsw.launcher.preferences.fragments.SettingsGestures;
import com.teslacoilsw.launcher.util.NamedIntent;
import com.vungle.ads.internal.protos.Sdk;
import e10.k0;
import e10.n0;
import e10.p0;
import e10.s2;
import e10.w;
import e10.y2;
import e10.z;
import e10.z2;
import h10.f;
import h6.c1;
import i2.b0;
import i2.v0;
import io.ktor.utils.io.w0;
import java.io.File;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Pair;
import kotlin.UInt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import l1.b7;
import l1.c7;
import l1.g4;
import l1.g7;
import l1.m2;
import l1.n2;
import l1.p1;
import l1.y6;
import mx.c0;
import ni.d0;
import ni.e0;
import ni.f0;
import ni.n;
import o7.r;
import o9.g3;
import p1.a0;
import p1.n1;
import p1.o;
import p1.o0;
import p1.t1;
import p10.y1;
import p7.p;
import q70.c;
import r70.k;
import s50.j;
import t70.j0;
import tz.m;
import tz.t;
import tz.u;
import w20.e;
import z2.r0;

/* loaded from: classes.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static UiModeManager f90710a;

    public static InvocationHandler A() {
        return (InvocationHandler) Class.forName("org.chromium.support_lib_glue.SupportLibReflectionUtil", false, N()).getDeclaredMethod("createWebViewProviderFactory", null).invoke(null, null);
    }

    public static void B(int i5, int i11, Object obj, Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        Arrays.fill(objArr, i5, i11, obj);
    }

    public static void C(int i5, int i11, int i12, int[] iArr) {
        if ((i12 & 4) != 0) {
            i11 = iArr.length;
        }
        Arrays.fill(iArr, 0, i11, i5);
    }

    public static void D(long[] jArr, long j11) {
        int length = jArr.length;
        Intrinsics.g(jArr, "<this>");
        Arrays.fill(jArr, 0, length, j11);
    }

    public static void F(j jVar, Function2 function2) {
        for (Map.Entry entry : jVar.a()) {
            function2.invoke((String) entry.getKey(), (List) entry.getValue());
        }
    }

    public static final h G(View view) {
        Intrinsics.g(view, "<this>");
        while (view != null) {
            Object tag = view.getTag(2131429160);
            h hVar = tag instanceof h ? (h) tag : null;
            if (hVar != null) {
                return hVar;
            }
            Object objF = zg.a.F(view);
            view = objF instanceof View ? (View) objF : null;
        }
        return null;
    }

    public static final int H(Bitmap bitmap) {
        if (!bitmap.isRecycled()) {
            try {
                return bitmap.getAllocationByteCount();
            } catch (Exception unused) {
                int height = bitmap.getHeight() * bitmap.getWidth();
                Bitmap.Config config = bitmap.getConfig();
                return height * (config == Bitmap.Config.ALPHA_8 ? 1 : (config == Bitmap.Config.RGB_565 || config == Bitmap.Config.ARGB_4444) ? 2 : config == Bitmap.Config.RGBA_F16 ? 8 : 4);
            }
        }
        throw new IllegalStateException(("Cannot obtain size for recycled bitmap: " + bitmap + " [" + bitmap.getWidth() + " x " + bitmap.getHeight() + "] + " + bitmap.getConfig()).toString());
    }

    public static Size I(Resources resources, Size size, n0 n0Var, int i5, Rect rect, int i11) throws Resources.NotFoundException {
        int iK;
        int dimensionPixelSize = resources.getDimensionPixelSize(2131165522);
        int dimensionPixelSize2 = resources.getDimensionPixelSize(2131165521);
        int i12 = n0Var.f51680d;
        k0 k0Var = n0Var.f51685i;
        int iK2 = e.k(i12) / 3;
        if (dimensionPixelSize2 < iK2) {
            dimensionPixelSize2 = iK2;
        }
        int i13 = dimensionPixelSize + dimensionPixelSize2;
        int iD = g3.d(resources.getDimension(2131165524));
        int iK3 = e.k(24);
        if (iD < iK3) {
            iD = iK3;
        }
        int i14 = i13 + iD;
        int i15 = i5 * 2;
        int dimensionPixelSize3 = resources.getDimensionPixelSize(2131165518);
        int height = ((((size.getHeight() - rect.top) - i14) - i15) - resources.getDimensionPixelSize(2131165525)) - Math.max(rect.bottom, i11);
        int width = (size.getWidth() - dimensionPixelSize3) - i15;
        k0 k0Var2 = k0.f51621c;
        if (k0Var == k0Var2) {
            dimensionPixelSize3 = resources.getDimensionPixelSize(2131165519);
        }
        int i16 = width - dimensionPixelSize3;
        if (n0Var.f51677a == p0.f51735c) {
            if (k0Var == k0Var2) {
                iK = resources.getDimensionPixelSize(2131165519);
            } else if (n0Var.d()) {
                iK = e.k(8) * 2;
            }
            i16 -= iK;
        }
        return new Size(i16, height);
    }

    public static final long J(Context context, UserHandle userHandle) {
        if (Intrinsics.b(userHandle, Process.myUserHandle())) {
            return -1L;
        }
        return ((ja.h) ja.h.f69294h.h(context)).d(userHandle);
    }

    public static f K(c0 c0Var) {
        for (s2 s2Var : SettingsGestures.f46098l) {
            if (c0.c(((NamedIntent) s2Var.l()).f46369b) == c0Var) {
                String strD = s2Var.d();
                y2.f51877a.getClass();
                if (strD.equals(y2.v0().d())) {
                    return new f(2132017944, 2131231573, 2131428948);
                }
                if (strD.equals(y2.B0().d())) {
                    return new f(2132017948, 2131231582, 2131428951);
                }
                if (strD.equals(y2.z0().d())) {
                    return new f(2132017945, 2131231580, 2131429080);
                }
                if (strD.equals(y2.A0().d())) {
                    return new f(2132017949, 2131231581, 2131429081);
                }
                if (strD.equals(y2.u0().d())) {
                    return new f(2132017943, 2131231568, 2131428715);
                }
                if (strD.equals(y2.t0().d())) {
                    return new f(2132017942, 2131231569, 2131428714);
                }
                if (strD.equals(y2.r0().d())) {
                    return new f(2132017940, 2131231577, 2131428547);
                }
                if (strD.equals(y2.s0().d())) {
                    return new f(2132017941, 2131231578, 2131428548);
                }
                if (strD.equals(y2.m0().d())) {
                    return new f(2132017935, 2131231570, 2131427899);
                }
                if (strD.equals(y2.p0().d())) {
                    return new f(2132019238, 2131231574, 2131428152);
                }
                if (strD.equals(y2.q0().d())) {
                    return new f(2132019261, 2131231576, 2131428299);
                }
                if (strD.equals(y2.n0().d())) {
                    return new f(2132017936, 2131231571, 2131427900);
                }
                if (strD.equals(y2.o0().d())) {
                    return new f(2132017937, 2131231572, 2131427901);
                }
                if (strD.equals(y2.x0().d())) {
                    return new f(2132017946, 2131231575, 2131428949);
                }
                if (strD.equals(y2.y0().d())) {
                    return new f(2132017947, 2131231579, 2131428949);
                }
                throw new RuntimeException(strD.concat(" is not a valid gesture key"));
            }
        }
        return null;
    }

    public static final bg.e L() {
        b4.f15783a.getClass();
        f0 f0VarA = ((sv2) ((db0) gu0.a()).G0.get()).a();
        f0VarA.getClass();
        d0 d0Var = d0.f78259a;
        e0 e0Var = e0.f78267a;
        String str = f0VarA.f78270a.f78253a;
        ArrayList arrayList = f0VarA.f78271b;
        String strName = n.f78295a.name();
        d dVar = d.f17880a;
        return new bg.e(-1, -1, str, arrayList, (d) Enum.valueOf(d.class, strName));
    }

    public static final bg.f M() {
        hq hqVar = gq.f4020a;
        return new bg.f(1, 4, 0);
    }

    public static ClassLoader N() throws NoSuchMethodException, SecurityException {
        if (Build.VERSION.SDK_INT >= 28) {
            return WebView.getWebViewClassLoader();
        }
        try {
            Method declaredMethod = WebView.class.getDeclaredMethod("getFactory", null);
            declaredMethod.setAccessible(true);
            return declaredMethod.invoke(null, null).getClass().getClassLoader();
        } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException e3) {
            throw new RuntimeException(e3);
        }
    }

    public static c O(Function2 function2) {
        c cVar = new c();
        cVar.f83788d = IntrinsicsKt.a(cVar, cVar, function2);
        return cVar;
    }

    public static void P(int i5, SharedPreferences sharedPreferences, SharedPreferences.Editor editor) {
        String str;
        String str2;
        long jA;
        int iR;
        int i11;
        String str3;
        String str4;
        int iO0;
        String str5;
        int iR2;
        long jA2;
        u uVar;
        str = "160";
        str2 = "262914";
        if (i5 >= 71000) {
            if (i5 <= 80007) {
                String string = sharedPreferences.getString("folder_icon_config", "NONE:GRID:true:#00040302:160");
                ArrayList arrayListB = string != null ? z.b(string) : null;
                if (arrayListB != null && (str4 = (String) g.Z0(3, arrayListB)) != null) {
                    str2 = str4;
                }
                int iR3 = R(str2);
                if (arrayListB != null && (str3 = (String) g.Z0(4, arrayListB)) != null) {
                    str = str3;
                }
                int iR4 = R(str);
                if (iR3 == 262914) {
                    jA = S(-1);
                } else {
                    m mVar = tz.n.Companion;
                    UInt.Companion companion = UInt.f71696b;
                    mVar.getClass();
                    jA = m.a(iR3);
                }
                long jI = tz.n.i(iR4, jA);
                tz.n.Companion.getClass();
                u uVar2 = new u(0, jI, tz.n.f90140b, 0L, Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
                String string2 = sharedPreferences.getString("unread_count_badge_style", null);
                ArrayList arrayListB2 = z.b(string2 != null ? string2 : "#dcffffff:#dcffffff:#ff535353:12:4");
                String str6 = (String) g.Z0(1, arrayListB2);
                if (str6 != null) {
                    iR = R(str6);
                    UInt.Companion companion2 = UInt.f71696b;
                } else {
                    iR = -587202561;
                }
                long jA3 = m.a(iR);
                String str7 = (String) g.Z0(2, arrayListB2);
                if (str7 != null) {
                    int iR5 = R(str7);
                    UInt.Companion companion3 = UInt.f71696b;
                    i11 = iR5;
                } else {
                    i11 = -11316397;
                }
                long jA4 = m.a(i11);
                String str8 = (String) g.Z0(0, arrayListB2);
                if (str8 != null) {
                    iR = R(str8);
                    UInt.Companion companion4 = UInt.f71696b;
                }
                u uVar3 = new u(0, jA3, jA4, m.a(iR), 113);
                String string3 = sharedPreferences.getString("color_scheme_day", null);
                if (string3 == null) {
                    string3 = "{0:72057598316118028:72057598316118025:72057598316118023:72057598316118023:40:20}:{0:0:288230376151711744:72057598316118023:72057598316118023:40:20}:{0:72057598316118028:288230376151711744:72057598316118023:72057598316118023:40:20}:{0:72057598316118021:288230376151711744:288230376151711744:288230376151711744:40:20}:{0:72057598316118028:288230376151711744:72057598316118023:72057598316118023:40:20}:{0:72057598316118030:288230376151711744:72057598316118023:72057598316118023:40:20}:{0:72057598316118018:288230376151711744:72057598316118023:72057598316118023:40:20}:{0:72057598316118028:288230376151711744:72057598316118023:72057598316118023:40:20}:{1:72057598316118028:288230376151711744:72057598316118023:72057598316118023:40:20}::";
                }
                w wVar = w.f51855b;
                wVar.getClass();
                t tVar = u.Companion;
                editor.putString("color_scheme_day", a80.m.h(a80.m.h(string3, ":{", wVar.encodeToString(tVar.serializer(), uVar2), "}"), ":{", wVar.encodeToString(tVar.serializer(), uVar3), "}"));
                String string4 = sharedPreferences.getString("color_scheme_night", null);
                if (string4 == null) {
                    string4 = "{0:72057598316118038:72057598316118016:72057598316118021:72057598316118021:40:20}:{0:0:288230376151711744:72057598316118023:72057598316118023:40:20}:{0:72057598316118038:288230376151711744:72057598316118021:72057598316118021:40:20}:{0:72057598316118024:288230376151711744:72057598316118020:72057598316118020:40:20}:{0:72057598316118038:288230376151711744:72057598316118021:72057598316118021:40:20}:{0:72057598316118025:288230376151711744:72057598316118020:72057598316118020:40:20}:{0:72057598316118025:288230376151711744:72057598316118020:72057598316118020:40:20}:{0:72057598316118038:288230376151711744:72057598316118020:72057598316118020:40:20}:{0:72057598316118025:288230376151711744:72057598316118020:72057598316118020:40:20}::";
                }
                editor.putString("color_scheme_night", a80.m.h(a80.m.h(string4, ":{", wVar.encodeToString(tVar.serializer(), uVar2), "}"), ":{", wVar.encodeToString(tVar.serializer(), uVar3), "}"));
                return;
            }
            return;
        }
        m mVar2 = tz.n.Companion;
        UInt.Companion companion5 = UInt.f71696b;
        mVar2.getClass();
        long jC = m.c(5, -2734810, 0);
        long jS = S(sharedPreferences.getInt("drawer_fastscroll_color", -2734810));
        long j11 = tz.n.f90143e;
        long j12 = tz.n.f90140b;
        u uVar4 = new u(0, j11, j12, jC, 113);
        String string5 = sharedPreferences.getString("desktop_cellspecs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        Intrinsics.d(string5);
        long jQ = Q(string5);
        String string6 = sharedPreferences.getString("dock_cellspecs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        Intrinsics.d(string6);
        long jQ2 = Q(string6);
        String string7 = sharedPreferences.getString("drawer_cellspecs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        Intrinsics.d(string7);
        long jQ3 = Q(string7);
        String string8 = sharedPreferences.getString("folder_cellspecs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        Intrinsics.d(string8);
        long jQ4 = Q(string8);
        tz.c.Companion.getClass();
        u uVar5 = new u(0, m.a(0), jQ, tz.n.f90150l, 113);
        long jA5 = m.a(sharedPreferences.getInt("drawer_background_color", -1));
        u uVar6 = new u(0, jA5, jQ3, jS, 113);
        u uVar7 = new u(0, m.a(ul.b.o0(sharedPreferences.getInt("dock_color", -12627531), sharedPreferences.getInt("dock_alpha", 255))), jQ2, 0L, Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
        String string9 = sharedPreferences.getString("folder_window_config", null);
        if (string9 != null) {
            ArrayList arrayListB3 = z.b(string9);
            iO0 = ul.b.o0(R((String) arrayListB3.get(2)), R((String) arrayListB3.get(1)));
        } else {
            iO0 = -1;
        }
        u uVar8 = new u(0, m.a(iO0), jQ4, jS, 113);
        int i12 = iO0;
        String string10 = sharedPreferences.getString("desktop_searchbar_style", null);
        if (string10 != null) {
            ArrayList arrayListB4 = z.b(string10);
            str5 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            iR2 = R((String) z.b(k.d1((String) arrayListB4.get(0), "{", "}")).get(2));
        } else {
            str5 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            iR2 = -1;
        }
        u uVar9 = new u(0, m.a(iR2), j12, jC, 113);
        String string11 = sharedPreferences.getString("drawer_searchbar_style", null);
        int i13 = 113;
        int i14 = 0;
        u uVar10 = new u(i14, m.a(string11 != null ? R((String) z.b(k.d1((String) z.b(string11).get(0), "{", "}")).get(2)) : -1), j12, jC, i13);
        u uVar11 = new u(i14, m.a(sharedPreferences.getInt("appsearch_background", -1)), j12, jC, i13);
        u uVar12 = new u(0, m.a(-1), j12, 0L, Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
        String string12 = sharedPreferences.getString("folder_icon_config", "NONE:GRID:true:#00040302:160");
        if (string12 == null) {
            string12 = str5;
        }
        ArrayList arrayListB5 = z.b(string12);
        String str9 = (String) g.Z0(3, arrayListB5);
        int iR6 = R(str9 != null ? str9 : "262914");
        String str10 = (String) g.Z0(4, arrayListB5);
        u uVar13 = new u(0, tz.n.i(R(str10 != null ? str10 : "160"), iR6 == 262914 ? m.a(i12) : m.a(iR6)), j12, 0L, Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
        String string13 = sharedPreferences.getString("unread_count_badge_style", null);
        ArrayList arrayListB6 = z.b(string13 != null ? string13 : "#dcffffff:#dcffffff:#ff535353:12:4");
        String str11 = (String) g.Z0(2, arrayListB6);
        Integer numValueOf = str11 != null ? Integer.valueOf(R(str11)) : null;
        if (numValueOf != null && numValueOf.intValue() == 262914) {
            jA2 = tz.n.f90142d;
        } else {
            String str12 = (String) g.Z0(2, arrayListB6);
            jA2 = m.a(str12 != null ? ul.b.o0(R(str12), 255) : -11316397);
        }
        long j13 = jA2;
        String str13 = (String) g.Z0(1, arrayListB6);
        long jA6 = m.a(str13 != null ? R(str13) : -587202561);
        String str14 = (String) g.Z0(0, arrayListB6);
        u uVar14 = new u(0, jA6, j13, m.a(str14 != null ? R(str14) : -587202561), 113);
        tz.g gVar = new tz.g(uVar4, uVar5, uVar6, uVar7, uVar8, uVar9, uVar10, uVar11, uVar12, uVar13, uVar14, 26112);
        w wVar2 = w.f51855b;
        wVar2.getClass();
        tz.f fVar = tz.g.Companion;
        editor.putString("color_scheme_day", wVar2.encodeToString(fVar.serializer(), gVar));
        int iJ = sharedPreferences.getInt("night_mode_bg_color", -15592942);
        long jA7 = m.a(iJ);
        u uVar15 = new u(0, jA7, j12, jS, 113);
        if (sharedPreferences.getBoolean("night_mode_auto_drawer", false)) {
            uVar6 = uVar15;
        }
        if (sharedPreferences.getBoolean("night_mode_auto_drawer_searchbar", false)) {
            if (r4.a.g(tz.n.c(jA5), iJ) < 1.37d) {
                iJ = r4.a.j(536870911, iJ);
            }
            uVar = new u(0, m.a(iJ), j12, jC, 113);
        } else {
            uVar = uVar10;
        }
        editor.putString("color_scheme_night", wVar2.encodeToString(fVar.serializer(), new tz.g(new u(0, jA7, j12, jC, 113), uVar5, uVar6, uVar7, sharedPreferences.getBoolean("night_mode_auto_folder", false) ? uVar15 : uVar8, sharedPreferences.getBoolean("night_mode_auto_searchbar", false) ? uVar15 : uVar9, uVar, sharedPreferences.getBoolean("night_mode_auto_search_window", false) ? uVar15 : uVar11, uVar15, uVar13, uVar14, 26112)));
    }

    public static final long Q(String str) {
        String str2 = (String) g.Z0(3, z.b(str));
        return S(str2 != null ? R(str2) : 262914);
    }

    public static final int R(String str) {
        if (!r70.j.I0(str, "#", false)) {
            return Integer.parseInt(str);
        }
        String strL1 = k.l1('#', str, str);
        kotlin.text.a.a(16);
        return (int) Long.parseLong(strL1, 16);
    }

    public static final long S(int i5) {
        if (i5 == 262914) {
            tz.n.Companion.getClass();
            return tz.n.f90140b;
        }
        m mVar = tz.n.Companion;
        UInt.Companion companion = UInt.f71696b;
        mVar.getClass();
        return m.c(5, i5, 0);
    }

    public static final void T(Context context) {
        Intrinsics.g(context, "context");
        File databasePath = context.getDatabasePath("androidx.work.workdb");
        Intrinsics.f(databasePath, "context.getDatabasePath(WORK_DATABASE_NAME)");
        if (databasePath.exists()) {
            r rVarC = r.c();
            String str = p.f82365a;
            rVarC.getClass();
            File databasePath2 = context.getDatabasePath("androidx.work.workdb");
            Intrinsics.f(databasePath2, "context.getDatabasePath(WORK_DATABASE_NAME)");
            File file = new File(p7.a.f82315a.a(context), "androidx.work.workdb");
            String[] strArr = p.f82366b;
            int iD0 = b70.k.d0(strArr.length);
            if (iD0 < 16) {
                iD0 = 16;
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
            for (String str2 : strArr) {
                linkedHashMap.put(new File(databasePath2.getPath() + str2), new File(file.getPath() + str2));
            }
            for (Map.Entry entry : MapsKt.n0(linkedHashMap, new Pair(databasePath2, file)).entrySet()) {
                File file2 = (File) entry.getKey();
                File file3 = (File) entry.getValue();
                if (file2.exists()) {
                    if (file3.exists()) {
                        r.c().f(p.f82365a, "Over-writing contents of " + file3);
                    }
                    if (file2.renameTo(file3)) {
                        file2.toString();
                        file3.toString();
                    } else {
                        file2.toString();
                        file3.toString();
                    }
                    r rVarC2 = r.c();
                    String str3 = p.f82365a;
                    rVarC2.getClass();
                }
            }
        }
    }

    public static final String U(String str) {
        return r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(str, "{APP_SEARCH}", "{APP_SEARCH:{favicon://}}", false), "{APP_SEARCH:{android.resource://com.teslacoilsw.launcher/drawable/ic_qsb_appsearch}}", "{APP_SEARCH}", false), "{TEXT_SEARCH}", "{{GOOGLE_SEARCH:{android.resource://com.teslacoilsw.launcher/drawable/ic_qsb_fatter_search?monochrome=true}}}", false), "{TEXT_SEARCH:{android.resource://com.teslacoilsw.launcher/drawable/ic_qsb_m_letter_color_google}}", "{GOOGLE_SEARCH}", false);
    }

    public static byte[] V(byte[] bArr, byte[] elements) {
        Intrinsics.g(elements, "elements");
        int length = bArr.length;
        int length2 = elements.length;
        byte[] bArrCopyOf = Arrays.copyOf(bArr, length + length2);
        System.arraycopy(elements, 0, bArrCopyOf, length, length2);
        Intrinsics.d(bArrCopyOf);
        return bArrCopyOf;
    }

    public static long[] W(long[] jArr, long j11) {
        Intrinsics.g(jArr, "<this>");
        int length = jArr.length;
        long[] jArrCopyOf = Arrays.copyOf(jArr, length + 1);
        jArrCopyOf[length] = j11;
        return jArrCopyOf;
    }

    public static long[] X(long[] jArr, long[] elements) {
        Intrinsics.g(jArr, "<this>");
        Intrinsics.g(elements, "elements");
        int length = jArr.length;
        int length2 = elements.length;
        long[] jArrCopyOf = Arrays.copyOf(jArr, length + length2);
        System.arraycopy(elements, 0, jArrCopyOf, length, length2);
        Intrinsics.d(jArrCopyOf);
        return jArrCopyOf;
    }

    public static Object[] Y(Object[] objArr, Object[] elements) {
        Intrinsics.g(objArr, "<this>");
        Intrinsics.g(elements, "elements");
        int length = objArr.length;
        int length2 = elements.length;
        Object[] objArrCopyOf = Arrays.copyOf(objArr, length + length2);
        System.arraycopy(elements, 0, objArrCopyOf, length, length2);
        Intrinsics.d(objArrCopyOf);
        return objArrCopyOf;
    }

    public static final boolean Z(View view, Integer num, Rect rect) {
        if (num == null) {
            return view.requestFocus();
        }
        if (!(view instanceof ViewGroup)) {
            return view.requestFocus(num.intValue(), rect);
        }
        ViewGroup viewGroup = (ViewGroup) view;
        if (viewGroup.isFocused()) {
            return true;
        }
        if (viewGroup.isFocusable() && !viewGroup.hasFocus()) {
            return viewGroup.requestFocus(num.intValue(), rect);
        }
        if (view instanceof AndroidComposeView) {
            return ((AndroidComposeView) view).requestFocus(num.intValue(), rect);
        }
        if (rect != null) {
            View viewFindNextFocusFromRect = FocusFinder.getInstance().findNextFocusFromRect(viewGroup, rect, num.intValue());
            return viewFindNextFocusFromRect != null ? viewFindNextFocusFromRect.requestFocus(num.intValue(), rect) : viewGroup.requestFocus(num.intValue(), rect);
        }
        View viewFindNextFocus = FocusFinder.getInstance().findNextFocus(viewGroup, viewGroup.hasFocus() ? viewGroup.findFocus() : null, num.intValue());
        return viewFindNextFocus != null ? viewFindNextFocus.requestFocus(num.intValue()) : view.requestFocus(num.intValue());
    }

    public static w0 a(byte[] content) {
        int length = content.length;
        Intrinsics.g(content, "content");
        e80.a aVar = new e80.a();
        aVar.l(length, content);
        return new w0(aVar);
    }

    public static final void a0(View view, h hVar) {
        Intrinsics.g(view, "<this>");
        view.setTag(2131429160, hVar);
    }

    public static final void b(y6 y6Var, b2.t tVar, o oVar, int i5) {
        y6 y6Var2;
        x1.e eVar = p1.f73771a;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1316639904);
        int i11 = (i5 & 6) == 0 ? (tVar2.f(y6Var) ? 4 : 2) | i5 : i5;
        if ((i5 & 48) == 0) {
            i11 |= tVar2.f(tVar) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.h(eVar) ? 256 : 128;
        }
        if ((i11 & 147) == 146 && tVar2.E()) {
            tVar2.V();
            y6Var2 = y6Var;
        } else {
            Object objP = tVar2.P();
            Object obj = objP;
            if (objP == p1.n.f81514a) {
                n2 n2Var = new n2();
                n2Var.f73684a = new Object();
                n2Var.f73685b = new ArrayList();
                tVar2.m0(n2Var);
                obj = n2Var;
            }
            n2 n2Var2 = (n2) obj;
            tVar2.b0(-1256811491);
            Object obj2 = n2Var2.f73684a;
            ArrayList arrayList = n2Var2.f73685b;
            if (!Intrinsics.b(y6Var, obj2)) {
                n2Var2.f73684a = y6Var;
                ArrayList arrayList2 = new ArrayList(arrayList.size());
                int size = arrayList.size();
                for (int i12 = 0; i12 < size; i12++) {
                    arrayList2.add((y6) ((m2) arrayList.get(i12)).c());
                }
                ArrayList arrayListK1 = g.K1(arrayList2);
                if (!arrayListK1.contains(y6Var)) {
                    arrayListK1.add(y6Var);
                }
                arrayList.clear();
                ArrayList arrayListA = a4.b.a(arrayListK1);
                int size2 = arrayListA.size();
                int i13 = 0;
                while (i13 < size2) {
                    y6 y6Var3 = (y6) arrayListA.get(i13);
                    y6 y6Var4 = y6Var;
                    arrayList.add(new m2(y6Var3, x1.f.d(-1654683077, new b0.j(y6Var3, y6Var4, arrayListK1, n2Var2, 1), tVar2)));
                    i13++;
                    y6Var = y6Var4;
                }
            }
            y6Var2 = y6Var;
            tVar2.p(false);
            r0 r0VarD = k0.p.d(b2.d.f16997a, false);
            int iHashCode = Long.hashCode(tVar2.T);
            n1 n1VarL = tVar2.l();
            b2.t tVarI = fg.a.I(tVar, tVar2);
            l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            a0.j(r0VarD, b3.k.f17275g, tVar2);
            a0.j(n1VarL, b3.k.f17274f, tVar2);
            i iVar = b3.k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar2, iHashCode, iVar);
            }
            a0.j(tVarI, b3.k.f17272d, tVar2);
            n2Var2.f73686c = a0.g(tVar2);
            tVar2.b0(1748085441);
            int size3 = arrayList.size();
            for (int i14 = 0; i14 < size3; i14++) {
                m2 m2Var = (m2) arrayList.get(i14);
                y6 y6Var5 = (y6) m2Var.a();
                Function3 function3B = m2Var.b();
                tVar2.Z(1201076541, y6Var5);
                ((x1.e) function3B).invoke(x1.f.d(-1135367807, new b7(y6Var5), tVar2), tVar2, 6);
                tVar2.p(false);
            }
            tVar2.p(false);
            tVar2.p(true);
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new c7(y6Var2, tVar, i5);
        }
    }

    public static void b0(Context context, SharedPreferences.Editor editor) {
        String country = context.getResources().getConfiguration().getLocales().get(0).getCountry();
        int iHashCode = country.hashCode();
        if (iHashCode != 2129) {
            if (iHashCode != 2136) {
                if (iHashCode != 2247) {
                    if (iHashCode != 2414) {
                        if (iHashCode != 2459) {
                            if (iHashCode != 2562) {
                                if (iHashCode != 2567) {
                                    if (iHashCode != 2712) {
                                        if (iHashCode != 2718) {
                                            if (iHashCode != 2739 || !country.equals("VI")) {
                                                return;
                                            }
                                        } else if (!country.equals("US")) {
                                            return;
                                        }
                                    } else if (!country.equals("UM")) {
                                        return;
                                    }
                                } else if (!country.equals("PW")) {
                                    return;
                                }
                            } else if (!country.equals("PR")) {
                                return;
                            }
                        } else if (!country.equals("MH")) {
                            return;
                        }
                    } else if (!country.equals("KY")) {
                        return;
                    }
                } else if (!country.equals("FM")) {
                    return;
                }
            } else if (!country.equals("BZ")) {
                return;
            }
        } else if (!country.equals("BS")) {
            return;
        }
        editor.putString("weather_units", "FAHRENHEIT");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final tz.k c(m0 m0Var) {
        return new tz.k(m0Var.getApplicationContext(), (j0) m0Var);
    }

    public static void c0(Status status, Object obj, fi.j jVar) {
        if (status.d()) {
            jVar.a(obj);
        } else {
            jVar.f55135a.v(y1.C(status));
        }
    }

    public static final void d(g7 g7Var, b2.t tVar, Function3 function3, o oVar, int i5) {
        b2.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(464178177);
        if (((i5 | 432) & 147) == 146 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar;
        } else {
            function3 = p1.f73771a;
            y6 y6Var = (y6) ((p1.s2) g7Var.f73353b).getValue();
            c3.g gVar = (c3.g) tVar3.j(z1.f19490a);
            boolean zF = tVar3.f(y6Var) | tVar3.h(gVar);
            Object objP = tVar3.P();
            if (zF || objP == p1.n.f81514a) {
                objP = new g4(y6Var, gVar, null, 2);
                tVar3.m0(objP);
            }
            o0.f(y6Var, (Function2) objP, tVar3);
            y6 y6Var2 = (y6) ((p1.s2) g7Var.f73353b).getValue();
            b2.r rVar = b2.r.f17024a;
            b(y6Var2, rVar, tVar3, 432);
            tVar2 = rVar;
        }
        Function3 function32 = function3;
        t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new c3.w0(g7Var, tVar2, function32, i5, 2);
        }
    }

    public static b2.t d0(b2.t tVar, float f11, v0 v0Var, int i5) {
        boolean z11;
        if ((i5 & 4) != 0) {
            z11 = Float.compare(f11, (float) 0) > 0;
        } else {
            z11 = false;
        }
        long j11 = b0.f61098a;
        return (Float.compare(f11, (float) 0) > 0 || z11) ? tVar.then(new ShadowGraphicsLayerElement(f11, v0Var, z11, j11, j11)) : tVar;
    }

    public static final tz.o e(Context context, int i5, tz.w wVar) {
        Object obj;
        Object next;
        if (i5 == 0 && Build.VERSION.SDK_INT >= 31) {
            tz.o oVar = tz.o.f90164b;
            return x7.f.A(context);
        }
        if (i5 != 1) {
            tz.o oVar2 = tz.o.f90164b;
            UInt.Companion companion = UInt.f71696b;
            return x7.f.z(ul.b.o0(i5, 255));
        }
        if (wVar.f90185b == 0) {
            return tz.o.f90164b;
        }
        tz.o oVar3 = tz.o.f90164b;
        ArrayList arrayList = new ArrayList();
        arrayList.add(new tz.c(wVar.f90185b));
        tz.c cVar = wVar.f90186c;
        if (cVar != null) {
            arrayList.add(cVar);
            tz.c cVar2 = wVar.f90187d;
            if (cVar2 != null) {
                arrayList.add(cVar2);
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(Integer.valueOf(((tz.c) it.next()).f90097a));
        }
        Iterator it2 = g.P0(arrayList2).iterator();
        while (true) {
            obj = null;
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            int iIntValue = ((Number) next).intValue();
            if (uz.a.a(iIntValue).f91791b >= 15.0f && uz.b.c(iIntValue) >= 10.0f) {
                break;
            }
        }
        Integer num = (Integer) next;
        vz.a aVarA = vz.a.a(num != null ? num.intValue() : -14979341);
        ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            arrayList3.add(Integer.valueOf(((tz.c) it3.next()).f90097a));
        }
        Iterator it4 = g.P0(arrayList3).iterator();
        while (true) {
            if (!it4.hasNext()) {
                break;
            }
            Object next2 = it4.next();
            int iIntValue2 = ((Number) next2).intValue();
            vz.a aVarA2 = vz.a.a(iIntValue2);
            tz.o oVar4 = tz.o.f90164b;
            if (180.0f - Math.abs(Math.abs(aVarA.f93388a - aVarA2.f93388a) - 180.0f) >= 30.0f && aVarA2.f93389b >= 15.0f && uz.b.c(iIntValue2) >= 10.0f) {
                obj = next2;
                break;
            }
        }
        if (((Integer) obj) == null) {
            int iB = MathKt.b(aVarA.f93388a + 60);
            if (iB < 0) {
                iB = (iB % 360) + 360;
            } else if (iB >= 360) {
                iB %= 360;
            }
            new vz.a(iB, aVarA.f93389b, aVarA.f93390c).b();
        }
        int iB2 = aVarA.b();
        UInt.Companion companion2 = UInt.f71696b;
        return x7.f.z(iB2);
    }

    public static void e0(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        if (objArr.length > 1) {
            Arrays.sort(objArr);
        }
    }

    public static List f(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        List listAsList = Arrays.asList(objArr);
        Intrinsics.f(listAsList, "asList(...)");
        return listAsList;
    }

    public static void f0(Object[] objArr, Comparator comparator) {
        Intrinsics.g(objArr, "<this>");
        Intrinsics.g(comparator, "comparator");
        if (objArr.length > 1) {
            Arrays.sort(objArr, comparator);
        }
    }

    public static void g(d7.e eVar, Object[] objArr) {
        if (objArr == null) {
            return;
        }
        int length = objArr.length;
        int i5 = 0;
        while (i5 < length) {
            Object obj = objArr[i5];
            i5++;
            if (obj == null) {
                eVar.bindNull(i5);
            } else if (obj instanceof byte[]) {
                eVar.bindBlob(i5, (byte[]) obj);
            } else if (obj instanceof Float) {
                eVar.bindDouble(i5, ((Number) obj).floatValue());
            } else if (obj instanceof Double) {
                eVar.bindDouble(i5, ((Number) obj).doubleValue());
            } else if (obj instanceof Long) {
                eVar.bindLong(i5, ((Number) obj).longValue());
            } else if (obj instanceof Integer) {
                eVar.bindLong(i5, ((Number) obj).intValue());
            } else if (obj instanceof Short) {
                eVar.bindLong(i5, ((Number) obj).shortValue());
            } else if (obj instanceof Byte) {
                eVar.bindLong(i5, ((Number) obj).byteValue());
            } else if (obj instanceof String) {
                eVar.bindString(i5, (String) obj);
            } else {
                if (!(obj instanceof Boolean)) {
                    throw new IllegalArgumentException("Cannot bind " + obj + " at index " + i5 + " Supported types: Null, ByteArray, Float, Double, Long, Int, Short, Byte, String");
                }
                eVar.bindLong(i5, ((Boolean) obj).booleanValue() ? 1L : 0L);
            }
        }
    }

    public static void g0(Object[] objArr, Comparator comparator, int i5, int i11) {
        Intrinsics.g(objArr, "<this>");
        Intrinsics.g(comparator, "comparator");
        Arrays.sort(objArr, i5, i11, comparator);
    }

    public static final h2.c h(View view, AndroidComposeView androidComposeView) {
        int[] iArr = g2.g.f56865a;
        view.getLocationInWindow(iArr);
        int i5 = iArr[0];
        int i11 = iArr[1];
        androidComposeView.getLocationInWindow(iArr);
        float f11 = i5 - iArr[0];
        float f12 = i11 - iArr[1];
        return new h2.c(f11, f12, view.getWidth() + f11, view.getHeight() + f12);
    }

    public static final Integer h0(int i5) {
        if (g2.d.b(i5, 5)) {
            return 33;
        }
        if (g2.d.b(i5, 6)) {
            return Integer.valueOf(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE);
        }
        if (g2.d.b(i5, 3)) {
            return 17;
        }
        if (g2.d.b(i5, 4)) {
            return 66;
        }
        if (g2.d.b(i5, 1)) {
            return 2;
        }
        return g2.d.b(i5, 2) ? 1 : null;
    }

    public static Object i(Class cls, InvocationHandler invocationHandler) {
        if (invocationHandler == null) {
            return null;
        }
        return cls.cast(Proxy.newProxyInstance(b.class.getClassLoader(), new Class[]{cls}, invocationHandler));
    }

    public static final g2.d i0(int i5) {
        if (i5 == 1) {
            return g2.d.a(2);
        }
        if (i5 == 2) {
            return g2.d.a(1);
        }
        if (i5 == 17) {
            return g2.d.a(3);
        }
        if (i5 == 33) {
            return g2.d.a(5);
        }
        if (i5 == 66) {
            return g2.d.a(4);
        }
        if (i5 != 130) {
            return null;
        }
        return g2.d.a(6);
    }

    public static final Charset j(l50.b bVar) {
        o50.e eVarO0;
        Intrinsics.g(bVar, "<this>");
        o50.m mVarA = bVar.a();
        List list = o50.p.f79582a;
        String strD = mVarA.d("Content-Type");
        if (strD != null) {
            o50.e eVar = o50.e.f79552r;
            eVarO0 = z2.o0(strD);
        } else {
            eVarO0 = null;
        }
        if (eVarO0 != null) {
            return g90.k.I(eVarO0);
        }
        return null;
    }

    public static Parcelable j0(Parcel parcel, Parcelable.Creator creator) {
        if (parcel.readInt() == 0) {
            return null;
        }
        return (Parcelable) creator.createFromParcel(parcel);
    }

    public static void k0(Parcel parcel, IInterface iInterface) {
        if (iInterface == null) {
            parcel.writeStrongBinder(null);
        } else {
            parcel.writeStrongBinder(iInterface.asBinder());
        }
    }

    public static final long l(o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        Context context = (Context) tVar.j(AndroidCompositionLocals_androidKt.f14166b);
        Resources resources = (Resources) tVar.j(AndroidCompositionLocals_androidKt.f14167c);
        Resources.Theme theme = context.getTheme();
        ThreadLocal threadLocal = q4.k.f83638a;
        return i2.r0.b(resources.getColor(i5, theme));
    }

    public static void l0(Parcel parcel) {
        int iDataAvail = parcel.dataAvail();
        if (iDataAvail > 0) {
            throw new BadParcelableException(b.c0.p(new StringBuilder(String.valueOf(iDataAvail).length() + 45), "Parcel data not fully consumed, unread size: ", iDataAvail));
        }
    }

    public static final Long m(l50.b bVar) {
        Intrinsics.g(bVar, "<this>");
        o50.m mVarA = bVar.a();
        List list = o50.p.f79582a;
        String strD = mVarA.d("Content-Length");
        if (strD != null) {
            return Long.valueOf(Long.parseLong(strD));
        }
        return null;
    }

    public static final o50.e n(o50.r rVar) {
        Intrinsics.g(rVar, "<this>");
        o50.n nVarA = rVar.a();
        List list = o50.p.f79582a;
        String strH = nVarA.h("Content-Type");
        if (strH == null) {
            return null;
        }
        o50.e eVar = o50.e.f79552r;
        return z2.o0(strH);
    }

    public static final void o(k50.c cVar, o50.e type) {
        Intrinsics.g(type, "type");
        o50.n nVar = cVar.f71119c;
        List list = o50.p.f79582a;
        String value = type.toString();
        nVar.getClass();
        Intrinsics.g(value, "value");
        nVar.j(value);
        List listF = nVar.f("Content-Type");
        listF.clear();
        listF.add(value);
    }

    public static void p(int i5, int i11, int[] iArr, int[] destination, int i12) {
        Intrinsics.g(iArr, "<this>");
        Intrinsics.g(destination, "destination");
        System.arraycopy(iArr, i11, destination, i5, i12 - i11);
    }

    public static void q(byte[] bArr, int i5, byte[] destination, int i11, int i12) {
        Intrinsics.g(bArr, "<this>");
        Intrinsics.g(destination, "destination");
        System.arraycopy(bArr, i11, destination, i5, i12 - i11);
    }

    public static void r(char[] cArr, char[] destination, int i5, int i11, int i12) {
        Intrinsics.g(cArr, "<this>");
        Intrinsics.g(destination, "destination");
        System.arraycopy(cArr, i11, destination, i5, i12 - i11);
    }

    public static void s(long[] jArr, long[] destination, int i5, int i11, int i12) {
        Intrinsics.g(jArr, "<this>");
        Intrinsics.g(destination, "destination");
        System.arraycopy(jArr, i11, destination, i5, i12 - i11);
    }

    public static void t(Object[] objArr, int i5, Object[] destination, int i11, int i12) {
        Intrinsics.g(objArr, "<this>");
        Intrinsics.g(destination, "destination");
        System.arraycopy(objArr, i11, destination, i5, i12 - i11);
    }

    public static /* synthetic */ void u(int i5, int i11, int[] iArr, int[] iArr2, int i12) {
        if ((i12 & 2) != 0) {
            i5 = 0;
        }
        if ((i12 & 8) != 0) {
            i11 = iArr.length;
        }
        p(i5, 0, iArr, iArr2, i11);
    }

    public static /* synthetic */ void v(byte[] bArr, int i5, byte[] bArr2, int i11, int i12) {
        if ((i12 & 4) != 0) {
            i5 = 0;
        }
        if ((i12 & 8) != 0) {
            i11 = bArr.length;
        }
        q(bArr, 0, bArr2, i5, i11);
    }

    public static /* synthetic */ void w(Object[] objArr, int i5, Object[] objArr2, int i11, int i12) {
        if ((i12 & 4) != 0) {
            i5 = 0;
        }
        if ((i12 & 8) != 0) {
            i11 = objArr.length;
        }
        t(objArr, 0, objArr2, i5, i11);
    }

    public static byte[] x(int i5, int i11, byte[] bArr) {
        Intrinsics.g(bArr, "<this>");
        z(i11, bArr.length);
        byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr, i5, i11);
        Intrinsics.f(bArrCopyOfRange, "copyOfRange(...)");
        return bArrCopyOfRange;
    }

    public static Object[] y(Object[] objArr, int i5, int i11) {
        Intrinsics.g(objArr, "<this>");
        z(i11, objArr.length);
        Object[] objArrCopyOfRange = Arrays.copyOfRange(objArr, i5, i11);
        Intrinsics.f(objArrCopyOfRange, "copyOfRange(...)");
        return objArrCopyOfRange;
    }

    public static final void z(int i5, int i11) {
        if (i5 > i11) {
            throw new IndexOutOfBoundsException(c1.n(i5, "toIndex (", ") is greater than size (", i11, ")."));
        }
    }

    public abstract List k(String str, List list);
}

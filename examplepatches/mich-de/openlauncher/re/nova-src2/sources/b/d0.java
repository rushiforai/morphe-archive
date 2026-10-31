package b;

import ads_mobile_sdk.a21;
import ads_mobile_sdk.cd3;
import ads_mobile_sdk.d62;
import ads_mobile_sdk.fn1;
import ads_mobile_sdk.mu0;
import ads_mobile_sdk.s23;
import ads_mobile_sdk.ww2;
import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.text.TextUtils;
import android.util.Base64;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.view.Window;
import android.webkit.WebResourceResponse;
import android.widget.FrameLayout;
import androidx.compose.ui.node.LayoutNode;
import java.io.ByteArrayInputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.math.MathKt;
import kotlin.text.Charsets;

/* loaded from: classes2.dex */
public abstract class d0 {

    /* renamed from: a, reason: collision with root package name */
    public static final c f15792a = new c(4);

    /* renamed from: b, reason: collision with root package name */
    public static final a f15793b = new a(1);

    /* renamed from: c, reason: collision with root package name */
    public static final a f15794c = new a(2);

    /* renamed from: d, reason: collision with root package name */
    public static final a f15795d = new a(3);

    /* renamed from: e, reason: collision with root package name */
    public static final c f15796e = new c(7);

    /* renamed from: f, reason: collision with root package name */
    public static final c f15797f = new c(11);

    /* renamed from: g, reason: collision with root package name */
    public static final a f15798g = new a(5);

    /* renamed from: h, reason: collision with root package name */
    public static final a f15799h = new a(6);

    /* renamed from: i, reason: collision with root package name */
    public static final a f15800i = new a(7);

    /* renamed from: j, reason: collision with root package name */
    public static final c f15801j = new c(14);

    /* renamed from: k, reason: collision with root package name */
    public static final a f15802k = new a(8);

    /* renamed from: l, reason: collision with root package name */
    public static final a f15803l = new a(10);

    /* renamed from: m, reason: collision with root package name */
    public static final a f15804m = new a(12);
    public static final a n = new a(13);
    public static final a o = new a(14);

    /* renamed from: p, reason: collision with root package name */
    public static final c f15805p = new c(18);

    /* renamed from: q, reason: collision with root package name */
    public static final a f15806q = new a(16);

    /* renamed from: r, reason: collision with root package name */
    public static final a f15807r = new a(17);

    /* renamed from: s, reason: collision with root package name */
    public static final c f15808s = new c(21);

    public static float a(Context context, float f11) {
        Intrinsics.g(context, "<this>");
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        return TypedValue.applyDimension(1, f11, displayMetrics);
    }

    public static int b(Context context, int i5) {
        Intrinsics.g(context, "<this>");
        return (int) TypedValue.applyDimension(1, i5, g(context));
    }

    public static /* synthetic */ ads_mobile_sdk.c7 c(qd qdVar) {
        return new ads_mobile_sdk.c7(qdVar, 2);
    }

    public static cd3 d(com.google.gson.r rVar) {
        s23 s23Var;
        com.google.gson.m mVarE;
        if (rVar.f34795a.containsKey("video_auto_play_start_time")) {
            String strO = rVar.v("video_auto_play_start_time").o();
            try {
                Intrinsics.d(strO);
                String upperCase = strO.toUpperCase(Locale.ROOT);
                Intrinsics.f(upperCase, "toUpperCase(...)");
                s23Var = (s23) Enum.valueOf(s23.class, upperCase);
            } catch (IllegalArgumentException e3) {
                throw new Exception(c0.m("Invalid for value enum ", d0.class.getName(), ": ", strO), e3);
            }
        } else {
            s23Var = null;
        }
        com.google.gson.r rVarA = d62.a(rVar, "url_mapping", (com.google.gson.r) null);
        String strA = rVarA != null ? d62.a(rVarA, "click_url", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b) : null;
        ArrayList arrayList = new ArrayList();
        if (rVarA != null && (mVarE = d62.e(rVarA, "interaction_types")) != null) {
            Iterator it = mVarE.f34793a.iterator();
            int i5 = 0;
            while (it.hasNext()) {
                Object next = it.next();
                int i11 = i5 + 1;
                if (i5 < 0) {
                    ul.b.e0();
                    throw null;
                }
                com.google.gson.p pVar = (com.google.gson.p) next;
                Intrinsics.d(pVar);
                String strO2 = pVar.o();
                if (strO2 != null) {
                    arrayList.add(strO2);
                }
                i5 = i11;
            }
        }
        return new cd3(d62.a(rVar, "required_screen_hold_sec", 0), s23Var, strA, arrayList);
    }

    public static fn1 e(LinkedHashMap linkedHashMap, String str, m5 m5Var, LinkedHashMap linkedHashMap2) {
        linkedHashMap.put(str, m5Var);
        return new fn1(linkedHashMap2);
    }

    public static Rect f(Context context, Rect rect) {
        int iB = MathKt.b(rect.left / g(context).density);
        float f11 = rect.top;
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        int iB2 = MathKt.b(f11 / displayMetrics.density);
        float f12 = rect.right;
        DisplayMetrics displayMetrics2 = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics2, "getDisplayMetrics(...)");
        int iB3 = MathKt.b(f12 / displayMetrics2.density);
        float f13 = rect.bottom;
        DisplayMetrics displayMetrics3 = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics3, "getDisplayMetrics(...)");
        return new Rect(iB, iB2, iB3, MathKt.b(f13 / displayMetrics3.density));
    }

    public static DisplayMetrics g(Context context) {
        Intrinsics.g(context, "<this>");
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        return displayMetrics;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00b5 A[PHI: r1
      0x00b5: PHI (r1v5 java.lang.String) = (r1v4 java.lang.String), (r1v7 java.lang.String), (r1v7 java.lang.String), (r1v7 java.lang.String) binds: [B:14:0x003e, B:31:0x0092, B:33:0x00a2, B:35:0x00b3] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final WebResourceResponse h(a21 a21Var) {
        Object next;
        String str;
        String str2;
        Object next2;
        String string;
        Intrinsics.g(a21Var, "<this>");
        Iterator it = a21Var.f811c.entrySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (r70.j.B0((String) ((Map.Entry) next).getKey(), "Content-Type", true)) {
                break;
            }
        }
        Map.Entry entry = (Map.Entry) next;
        String str3 = entry != null ? (String) entry.getValue() : null;
        String str4 = "text/html";
        if (str3 != null) {
            List listI1 = r70.k.i1(str3, new String[]{";"}, 6);
            String str5 = (String) b70.g.Y0(listI1);
            String string2 = str5 != null ? r70.k.u1(str5).toString() : null;
            if (string2 != null && r70.k.K0(string2, "/", false)) {
                str4 = string2;
            }
            Iterator it2 = b70.g.Q0(listI1, 1).iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next2 = null;
                    break;
                }
                next2 = it2.next();
                if (r70.j.I0(r70.k.u1((String) next2).toString(), "charset=", true)) {
                    break;
                }
            }
            String str6 = (String) next2;
            if (str6 == null || (string = r70.k.u1(r70.k.m1(str6, "=", str6)).toString()) == null) {
                str = str4;
                str2 = "UTF-8";
            } else {
                String upperCase = string.toUpperCase(Locale.ROOT);
                Intrinsics.f(upperCase, "toUpperCase(...)");
                if (upperCase.length() != 0) {
                    str2 = upperCase;
                    str = str4;
                }
            }
        }
        int i5 = a21Var.f809a;
        String str7 = a21Var.f810b;
        if (str7 == null || str7.length() == 0) {
            str7 = "OK";
        }
        String str8 = str7;
        Map map = a21Var.f811c;
        ww2 ww2Var = a21Var.f812d;
        return new WebResourceResponse(str, str2, i5, str8, map, ww2Var != null ? new ByteArrayInputStream(ww2Var.f11503a) : null);
    }

    public static final String i(String str) throws NoSuchAlgorithmException {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = str.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            messageDigest.update(bytes);
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            return String.format(Locale.US, "%032X", Arrays.copyOf(new Object[]{new BigInteger(1, messageDigest.digest())}, 1));
        } catch (Exception unused) {
            return null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final Throwable j(Throwable th2) {
        return th2 instanceof a4 ? ((a4) th2).a() : th2;
    }

    public static LinkedHashMap k(int i5) {
        return new LinkedHashMap(i5 < 3 ? i5 + 1 : i5 < 1073741824 ? (int) ((i5 / 0.75f) + 1.0f) : LayoutNode.NotPlacedPlaceOrder);
    }

    public static Pair l(Activity activity) {
        Window window = activity.getWindow();
        View viewFindViewById = window != null ? window.findViewById(16908290) : null;
        Pair pair = viewFindViewById != null ? new Pair(Integer.valueOf(viewFindViewById.getTop()), Integer.valueOf(viewFindViewById.getBottom())) : new Pair(0, 0);
        int iIntValue = ((Number) pair.f71683a).intValue();
        int iIntValue2 = ((Number) pair.f71684b).intValue();
        DisplayMetrics displayMetrics = activity.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        Integer numValueOf = Integer.valueOf(MathKt.b(iIntValue / displayMetrics.density));
        DisplayMetrics displayMetrics2 = activity.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics2, "getDisplayMetrics(...)");
        return new Pair(numValueOf, Integer.valueOf(MathKt.b(iIntValue2 / displayMetrics2.density)));
    }

    public static void m(Context context, FrameLayout frameLayout, String str) {
        DisplayMetrics displayMetrics;
        frameLayout.setClickable(false);
        frameLayout.setFocusable(false);
        if (TextUtils.isEmpty(str)) {
            return;
        }
        Context applicationContext = context.getApplicationContext();
        if (applicationContext != null) {
            context = applicationContext;
        }
        Resources resources = context.getResources();
        if (resources == null || (displayMetrics = resources.getDisplayMetrics()) == null) {
            return;
        }
        try {
            byte[] bArrDecode = Base64.decode(str, 0);
            Intrinsics.d(bArrDecode);
            BitmapDrawable bitmapDrawable = new BitmapDrawable(resources, BitmapFactory.decodeByteArray(bArrDecode, 0, bArrDecode.length));
            bitmapDrawable.setTargetDensity(displayMetrics.densityDpi);
            Shader.TileMode tileMode = Shader.TileMode.REPEAT;
            bitmapDrawable.setTileModeXY(tileMode, tileMode);
            frameLayout.setBackground(bitmapDrawable);
        } catch (IllegalArgumentException unused) {
        }
    }

    public static void n(Class cls, StringBuilder sb2) {
        sb2.append(cls.getName());
        sb2.append('@');
    }

    public static void o(String str) {
        cz.b bVar = mu0.f7335a;
        mu0.b("4: ".concat(str), null);
    }

    public static int p(Context context, int i5) {
        Intrinsics.g(context, "<this>");
        return MathKt.b(i5 / g(context).density);
    }

    public static List q(int i5) {
        return i5 == 0 ? Collections.EMPTY_LIST : new ArrayList(i5);
    }

    public static Pair r(Activity activity) {
        Intrinsics.g(activity, "<this>");
        Window window = activity.getWindow();
        View viewFindViewById = window != null ? window.findViewById(16908290) : null;
        Pair pair = viewFindViewById != null ? new Pair(Integer.valueOf(viewFindViewById.getWidth()), Integer.valueOf(viewFindViewById.getHeight())) : new Pair(0, 0);
        int iIntValue = ((Number) pair.f71683a).intValue();
        int iIntValue2 = ((Number) pair.f71684b).intValue();
        DisplayMetrics displayMetrics = activity.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        Integer numValueOf = Integer.valueOf(MathKt.b(iIntValue / displayMetrics.density));
        DisplayMetrics displayMetrics2 = activity.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics2, "getDisplayMetrics(...)");
        return new Pair(numValueOf, Integer.valueOf(MathKt.b(iIntValue2 / displayMetrics2.density)));
    }
}

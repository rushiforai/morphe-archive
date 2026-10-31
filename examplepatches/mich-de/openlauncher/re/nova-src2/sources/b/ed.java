package b;

import ads_mobile_sdk.bn0;
import ads_mobile_sdk.d42;
import ads_mobile_sdk.d62;
import ads_mobile_sdk.e42;
import ads_mobile_sdk.jr0;
import ads_mobile_sdk.jx1;
import ads_mobile_sdk.nl0;
import ads_mobile_sdk.qi;
import ads_mobile_sdk.yu;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ServiceConfigurationError;
import java.util.logging.Level;
import java.util.logging.Logger;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes.dex */
public abstract class ed {

    /* renamed from: a, reason: collision with root package name */
    public static final c f15815a = new c(2);

    /* renamed from: b, reason: collision with root package name */
    public static final c f15816b = new c(3);

    /* renamed from: c, reason: collision with root package name */
    public static final c f15817c = new c(5);

    /* renamed from: d, reason: collision with root package name */
    public static final c f15818d = new c(6);

    /* renamed from: e, reason: collision with root package name */
    public static final c f15819e = new c(8);

    /* renamed from: f, reason: collision with root package name */
    public static final c f15820f = new c(9);

    /* renamed from: g, reason: collision with root package name */
    public static final a f15821g = new a(4);

    /* renamed from: h, reason: collision with root package name */
    public static final c f15822h = new c(10);

    /* renamed from: i, reason: collision with root package name */
    public static final c f15823i = new c(12);

    /* renamed from: j, reason: collision with root package name */
    public static final c f15824j = new c(13);

    /* renamed from: k, reason: collision with root package name */
    public static final c f15825k = new c(15);

    /* renamed from: l, reason: collision with root package name */
    public static final a f15826l = new a(9);

    /* renamed from: m, reason: collision with root package name */
    public static final c f15827m = new c(16);
    public static final c n = new c(17);
    public static final a o = new a(11);

    /* renamed from: p, reason: collision with root package name */
    public static final a f15828p = new a(15);

    /* renamed from: q, reason: collision with root package name */
    public static final c f15829q = new c(19);

    /* renamed from: r, reason: collision with root package name */
    public static final bg.g f15830r = new bg.g(1);

    /* renamed from: s, reason: collision with root package name */
    public static final c f15831s = new c(20);

    /* renamed from: t, reason: collision with root package name */
    public static final c f15832t = new c(0);

    /* renamed from: u, reason: collision with root package name */
    public static final c f15833u = new c(1);

    /* renamed from: v, reason: collision with root package name */
    public static final a f15834v = new a(0);

    public static e42 a(com.google.gson.r rVar) {
        try {
            kc kcVar = d42.f2174a;
            int iA = d62.a(rVar, "impression_prerequisite", 0);
            kcVar.getClass();
            d42 d42Var = iA != 0 ? iA != 1 ? iA != 2 ? d42.f2175b : d42.f2177d : d42.f2176c : d42.f2175b;
            int iA2 = d62.a(rVar, "click_prerequisite", 0);
            return new e42(d42Var, iA2 != 0 ? iA2 != 1 ? iA2 != 2 ? d42.f2175b : d42.f2177d : d42.f2176c : d42.f2175b, d62.a(rVar, "notification_flow_enabled", false));
        } catch (Exception e3) {
            ArrayList arrayList = k9.e(e3, e3).f1803s;
            String message = e3.getMessage();
            if (message == null) {
                message = e3.getClass().getName();
            }
            arrayList.add(message);
            return null;
        }
    }

    public static nl0 b() {
        ClassLoader classLoader = ed.class.getClassLoader();
        if (nl0.class.equals(nl0.class)) {
            try {
                try {
                    k9.B(Class.forName("com.google.protobuf.BlazeGeneratedExtensionRegistryLiteLoader", true, classLoader).getConstructor(null).newInstance(null));
                    throw null;
                } catch (ReflectiveOperationException e3) {
                    throw new IllegalStateException(e3);
                }
            } catch (ClassNotFoundException unused) {
            }
        }
        Iterator itN = c9.n();
        ArrayList arrayList = new ArrayList();
        while (itN.hasNext()) {
            try {
                k9.B(itN.next());
                throw null;
            } catch (ServiceConfigurationError e11) {
                Logger.getLogger(yu.class.getName()).log(Level.SEVERE, "Unable to load nl0", (Throwable) e11);
            }
        }
        if (arrayList.size() == 1) {
            return (nl0) arrayList.get(0);
        }
        if (arrayList.size() == 0) {
            return null;
        }
        try {
            return (nl0) nl0.class.getMethod("combine", Collection.class).invoke(null, arrayList);
        } catch (ReflectiveOperationException e12) {
            throw new IllegalStateException(e12);
        }
    }

    public static Bundle c(com.google.gson.r serverParameterData) {
        Intrinsics.g(serverParameterData, "serverParameterData");
        Bundle bundle = new Bundle();
        Iterator it = ((hn.m) serverParameterData.f34795a.keySet()).iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            try {
                Intrinsics.d(str);
                String strO = serverParameterData.v(str).o();
                Intrinsics.f(strO, "getAsString(...)");
                bundle.putString(str, strO);
            } catch (IllegalStateException unused) {
            }
        }
        bundle.remove("max_ad_content_rating");
        return bundle;
    }

    public static Bundle d(ni.q baseRequest, eg.o oVar) {
        Intrinsics.g(baseRequest, "baseRequest");
        Bundle bundle = (Bundle) baseRequest.f78314g.get(oVar.getClass().getName());
        return bundle == null ? new Bundle() : bundle;
    }

    public static hg.b e(ui.q nativeRequest) {
        int i5;
        int i11;
        bg.g gVarB;
        Intrinsics.g(nativeRequest, "nativeRequest");
        hg.b bVar = new hg.b();
        int i12 = w7.f16017c[nativeRequest.getMediaAspectRatio().ordinal()];
        int i13 = 0;
        if (i12 == 1) {
            i5 = 0;
        } else if (i12 == 2) {
            i5 = 1;
        } else if (i12 == 3) {
            i5 = 2;
        } else if (i12 == 4) {
            i5 = 3;
        } else {
            if (i12 != 5) {
                throw new NoWhenBranchMatchedException();
            }
            i5 = 4;
        }
        bVar.d(i5);
        int i14 = w7.f16016b[nativeRequest.e().ordinal()];
        if (i14 == 1) {
            i11 = 0;
        } else if (i14 == 2) {
            i11 = 1;
        } else if (i14 == 3) {
            i11 = 2;
        } else {
            if (i14 != 4) {
                throw new NoWhenBranchMatchedException();
            }
            i11 = 3;
        }
        bVar.c(i11);
        ui.c cVarB = nativeRequest.b();
        int i15 = cVarB == null ? -1 : w7.f16015a[cVarB.ordinal()];
        if (i15 == 1) {
            i13 = 1;
        } else if (i15 == 2) {
            i13 = 2;
        } else if (i15 == 3) {
            i13 = 4;
        } else if (i15 == 4) {
            i13 = 8;
        }
        bVar.b(i13, nativeRequest.f());
        bVar.e(nativeRequest.j());
        ni.i0 i0VarC = nativeRequest.c();
        if (i0VarC != null) {
            bg.g gVar = new bg.g(0);
            gVar.g(i0VarC.c());
            gVar.e(i0VarC.a());
            gVar.f(i0VarC.b());
            gVarB = gVar.b();
        } else {
            gVarB = null;
        }
        if (gVarB != null) {
            bVar.f(gVarB);
        }
        return bVar.a();
    }

    public static final Integer f(com.google.gson.r rVar, String str) {
        com.google.gson.r rVarX;
        int i5 = jx1.f5430h;
        if (rVar == null) {
            rVarX = null;
        } else {
            try {
                rVarX = rVar.x(str);
            } catch (Exception unused) {
            }
        }
        if (rVarX == null) {
            return null;
        }
        try {
            return Integer.valueOf(Color.rgb(rVarX.v("r").g(), rVarX.v("g").g(), rVarX.v("b").g()));
        } catch (Exception unused2) {
            return null;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x002b, code lost:
    
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String g(qi qiVar, String adUnitId, String format) {
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(format, "format");
        Map mapR = qiVar.r();
        String lowerCase = format.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        ads_mobile_sdk.d9 d9Var = (ads_mobile_sdk.d9) mapR.get(lowerCase);
        if (d9Var == null) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        for (ads_mobile_sdk.z8 z8Var : d9Var.o()) {
            List listQ = z8Var.q();
            Intrinsics.f(listQ, "getIncludingRegexesList(...)");
            if (!(listQ instanceof Collection) || !listQ.isEmpty()) {
                Iterator it = listQ.iterator();
                while (true) {
                    if (it.hasNext()) {
                        String str = (String) it.next();
                        Intrinsics.d(str);
                        Regex regex = new Regex(str);
                        String lowerCase2 = adUnitId.toLowerCase(Locale.ROOT);
                        Intrinsics.f(lowerCase2, "toLowerCase(...)");
                        if (regex.f(lowerCase2)) {
                            e9<String> e9VarP$1 = z8Var.p$1();
                            Intrinsics.f(e9VarP$1, "getExcludingRegexesList(...)");
                            if (!(e9VarP$1 instanceof Collection) || !e9VarP$1.isEmpty()) {
                                for (String str2 : e9VarP$1) {
                                    Intrinsics.d(str2);
                                    Regex regex2 = new Regex(str2);
                                    String lowerCase3 = adUnitId.toLowerCase(Locale.ROOT);
                                    Intrinsics.f(lowerCase3, "toLowerCase(...)");
                                    if (regex2.f(lowerCase3)) {
                                        break;
                                    }
                                }
                            }
                            String strO = z8Var.o();
                            Intrinsics.f(strO, "getEffectiveAdUnitId(...)");
                            String lowerCase4 = strO.toLowerCase(Locale.ROOT);
                            Intrinsics.f(lowerCase4, "toLowerCase(...)");
                            return lowerCase4;
                        }
                    }
                }
            }
        }
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public static String h(com.google.gson.r serverParameterData, ni.f0 requestConfiguration) {
        Intrinsics.g(serverParameterData, "serverParameterData");
        Intrinsics.g(requestConfiguration, "requestConfiguration");
        if (!serverParameterData.f34795a.containsKey("max_ad_content_rating")) {
            return requestConfiguration.f78270a.f78253a;
        }
        String strO = serverParameterData.v("max_ad_content_rating").o();
        Intrinsics.f(strO, "getAsString(...)");
        return strO;
    }

    public static String i(String str, int i5) {
        return c0.h(i5, str);
    }

    public static final URL j(URL url, bn0 bn0Var, jr0 jr0Var) {
        String strR;
        String str = bn0Var.f1471c;
        String string = url.toString();
        Intrinsics.f(string, "toString(...)");
        if (jr0Var == null || (strR = jr0Var.R()) == null) {
            strR = "%5Bgw_fbsaeid%5D";
        }
        Uri.Builder builderBuildUpon = Uri.parse(r70.j.F0(string, strR, str, false)).buildUpon();
        builderBuildUpon.appendQueryParameter("gmp_app_id", bn0Var.f1469a);
        builderBuildUpon.appendQueryParameter("fbs_aiid", bn0Var.f1470b);
        if (builderBuildUpon.build().getQueryParameter("fbs_aeid") == null) {
            builderBuildUpon.appendQueryParameter("fbs_aeid", str);
        }
        return new URL(builderBuildUpon.build().toString());
    }

    public static Duration k(int i5, DurationUnit durationUnit, String str) {
        return new Duration(DurationKt.g(i5, durationUnit));
    }
}

package sp;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.InstallSourceInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.webkit.WebSettings;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.amplitude.common.android.AndroidContextProvider;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import java.lang.reflect.Method;
import java.util.Locale;

/* loaded from: classes4.dex */
public final class t {
    public final String A;
    public final long B;
    public final long C;
    public String D;
    public final String E;

    /* renamed from: a, reason: collision with root package name */
    public final String f87663a;

    /* renamed from: b, reason: collision with root package name */
    public final String f87664b;

    /* renamed from: c, reason: collision with root package name */
    public final String f87665c;

    /* renamed from: d, reason: collision with root package name */
    public final String f87666d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f87667e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f87668f;

    /* renamed from: g, reason: collision with root package name */
    public final String f87669g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f87670h;

    /* renamed from: i, reason: collision with root package name */
    public final String f87671i;

    /* renamed from: j, reason: collision with root package name */
    public final String f87672j;

    /* renamed from: k, reason: collision with root package name */
    public final String f87673k;

    /* renamed from: l, reason: collision with root package name */
    public final String f87674l;

    /* renamed from: m, reason: collision with root package name */
    public final String f87675m;
    public final String n;
    public final String o;

    /* renamed from: p, reason: collision with root package name */
    public final String f87676p;

    /* renamed from: q, reason: collision with root package name */
    public final String f87677q;

    /* renamed from: r, reason: collision with root package name */
    public final String f87678r;

    /* renamed from: s, reason: collision with root package name */
    public final String f87679s;

    /* renamed from: t, reason: collision with root package name */
    public final String f87680t;

    /* renamed from: u, reason: collision with root package name */
    public final String f87681u;

    /* renamed from: v, reason: collision with root package name */
    public final String f87682v;

    /* renamed from: w, reason: collision with root package name */
    public String f87683w;

    /* renamed from: x, reason: collision with root package name */
    public final String f87684x;

    /* renamed from: y, reason: collision with root package name */
    public final String f87685y;

    /* renamed from: z, reason: collision with root package name */
    public final String f87686z;

    static {
        new b50.d(t.class.getSimpleName());
    }

    public t(Application application, Boolean bool, boolean z11) throws PackageManager.NameNotFoundException, Settings.SettingNotFoundException {
        String[] strArr;
        String str;
        String string;
        Locale locale;
        boolean z12;
        String string2;
        boolean zBooleanValue;
        String str2;
        String strA;
        Object objB;
        String str3 = "unknown";
        int i5 = r0.f87655b;
        String str4 = null;
        try {
            strArr = (String[]) f0.c("android.os.Build", "SUPPORTED_ABIS", null);
        } catch (Throwable th2) {
            int i11 = f0.f87578a;
            r0.c(th2);
            strArr = null;
        }
        if (strArr == null || strArr.length == 0) {
            try {
                str = (String) f0.c("android.os.Build", "CPU_ABI", null);
            } catch (Throwable th3) {
                int i12 = f0.f87578a;
                r0.c(th3);
                str = null;
            }
        } else {
            str = strArr[0];
        }
        this.f87671i = str;
        this.f87673k = Build.BRAND;
        this.f87674l = Build.DEVICE;
        this.f87675m = application.getPackageName();
        this.n = Build.MANUFACTURER;
        this.o = Build.MODEL;
        this.f87677q = AndroidContextPlugin.PLATFORM;
        this.f87678r = Build.PRODUCT;
        this.f87680t = Build.VERSION.RELEASE;
        String str5 = Build.DISPLAY;
        this.f87679s = r.f87650a;
        try {
            PackageManager packageManager = application.getPackageManager();
            string = packageManager.getApplicationLabel(packageManager.getApplicationInfo(application.getPackageName(), 128)).toString();
        } catch (Throwable th4) {
            r0.c(th4);
            string = "unknown";
        }
        this.f87676p = string;
        try {
            PackageInfo packageInfo = application.getPackageManager().getPackageInfo(application.getPackageName(), 0);
            if (!TextUtils.isEmpty(packageInfo.versionName)) {
                str3 = packageInfo.versionName;
            }
        } catch (Throwable th5) {
            r0.c(th5);
        }
        this.f87672j = str3;
        try {
            Bundle bundle = application.getPackageManager().getApplicationInfo(application.getPackageName(), 128).metaData;
            this.f87685y = bundle.getString("SINGULAR_PRELOAD_CAMPAIGN");
            this.f87686z = bundle.getString("SINGULAR_PRELOAD_GROUP");
            this.A = bundle.getString("SINGULAR_PRELOAD_SOURCE");
        } catch (Throwable unused) {
        }
        Resources resources = application.getResources();
        DisplayMetrics displayMetrics = resources.getDisplayMetrics();
        Configuration configuration = resources.getConfiguration();
        int i13 = f0.f87578a;
        try {
            objB = f0.b(configuration, "getLocales", null, new Object[0]);
        } catch (Throwable th6) {
            r0.c(th6);
        }
        if (objB == null) {
            locale = null;
        } else {
            Object[] objArr = {0};
            Method method = objB.getClass().getMethod("get", Integer.TYPE);
            locale = (Locale) (method == null ? null : method.invoke(objB, objArr));
        }
        if (locale == null) {
            try {
                locale = (Locale) f0.c("android.content.res.Configuration", "locale", configuration);
            } catch (Throwable th7) {
                int i14 = f0.f87578a;
                r0.c(th7);
                locale = null;
            }
        }
        locale.getLanguage();
        locale.getCountry();
        int i15 = configuration.screenLayout & 15;
        this.f87681u = (i15 == 1 || i15 == 2) ? "phone" : (i15 == 3 || i15 == 4) ? "tablet" : null;
        int i16 = displayMetrics.densityDpi;
        int i17 = displayMetrics.widthPixels;
        int i18 = displayMetrics.heightPixels;
        boolean z13 = f0.a("com.google.android.gms.ads.identifier.AdvertisingIdClient") != null;
        this.f87667e = z13;
        if (!bool.booleanValue()) {
            int i19 = r0.f87655b;
            if (Looper.getMainLooper().getThread() != Thread.currentThread()) {
                if (z13) {
                    try {
                        Object[] objArr2 = {application};
                        Method method2 = AdvertisingIdClient.class.getMethod("getAdvertisingIdInfo", Context.class);
                        zBooleanValue = ((Boolean) f0.b(method2 == null ? null : method2.invoke(null, objArr2), "isLimitAdTrackingEnabled", null, new Object[0])).booleanValue();
                    } catch (Throwable th8) {
                        int i21 = r0.f87655b;
                        r0.c(th8);
                        zBooleanValue = false;
                    }
                    this.f87668f = zBooleanValue;
                    try {
                        Object[] objArr3 = {application};
                        int i22 = f0.f87578a;
                        Method method3 = AdvertisingIdClient.class.getMethod("getAdvertisingIdInfo", Context.class);
                        str2 = (String) f0.b(method3 == null ? null : method3.invoke(null, objArr3), "getId", null, new Object[0]);
                    } catch (Throwable th9) {
                        int i23 = r0.f87655b;
                        r0.c(th9);
                    }
                    str2 = r0.m(str2) ? null : str2;
                    this.f87666d = str2;
                }
                if (r0.l(this.f87666d)) {
                    try {
                        int i24 = z.f87693a;
                        try {
                            strA = z.a(application);
                        } catch (Throwable unused2) {
                            strA = null;
                        }
                    } catch (Throwable th10) {
                        int i25 = r0.f87655b;
                        r0.c(th10);
                    }
                    strA = r0.m(strA) ? null : strA;
                    this.f87666d = strA;
                }
                String string3 = Settings.Secure.getString(application.getContentResolver(), "android_id");
                this.f87665c = r0.g().contains(string3) ? "None" : string3;
            }
        }
        try {
            Settings.Secure.getInt(application.getContentResolver(), AndroidContextProvider.SETTING_LIMIT_AD_TRACKING);
            z12 = true;
        } catch (Settings.SettingNotFoundException e3) {
            int i26 = r0.f87655b;
            r0.c(e3);
            z12 = false;
        }
        this.f87670h = z12;
        if (z12) {
            try {
                Settings.Secure.getInt(application.getContentResolver(), AndroidContextProvider.SETTING_LIMIT_AD_TRACKING);
            } catch (Settings.SettingNotFoundException unused3) {
            }
            try {
                string2 = Settings.Secure.getString(application.getContentResolver(), AndroidContextProvider.SETTING_ADVERTISING_ID);
            } catch (Throwable th11) {
                int i27 = r0.f87655b;
                r0.c(th11);
                string2 = null;
            }
            this.f87669g = string2;
        }
        if (z11) {
            String strD = r0.d(application);
            this.f87663a = strD;
            if (!r0.l(strD)) {
                String str6 = this.f87663a;
                SharedPreferences.Editor editorEdit = application.getSharedPreferences("pref_persisted_asid", 0).edit();
                editorEdit.putString("persisted_asid", str6);
                editorEdit.commit();
            }
        } else if (application.getSharedPreferences("pref_asid_is_singular_id", 0).getBoolean("asid_is_singular_id", false)) {
            this.f87663a = r0.h(application).toString();
        } else {
            this.f87663a = r0.d(application);
            this.f87664b = application.getSharedPreferences("pref_persisted_asid", 0).getString("persisted_asid", null);
            if (r0.l(this.f87663a)) {
                this.f87663a = this.f87664b;
            } else if (!this.f87663a.equalsIgnoreCase(this.f87664b)) {
                String str7 = this.f87663a;
                SharedPreferences.Editor editorEdit2 = application.getSharedPreferences("pref_persisted_asid", 0).edit();
                editorEdit2.putString("persisted_asid", str7);
                editorEdit2.commit();
            }
        }
        if (r0.l(this.f87663a)) {
            this.f87663a = r0.h(application).toString();
            SharedPreferences.Editor editorEdit3 = application.getSharedPreferences("pref_asid_is_singular_id", 0).edit();
            editorEdit3.putBoolean("asid_is_singular_id", true);
            editorEdit3.commit();
        }
        try {
            PackageManager packageManager2 = application.getPackageManager();
            if (Build.VERSION.SDK_INT >= 30) {
                InstallSourceInfo installSourceInfo = packageManager2.getInstallSourceInfo(application.getPackageName());
                if (installSourceInfo != null) {
                    this.f87684x = installSourceInfo.getInitiatingPackageName();
                }
            } else {
                this.f87684x = packageManager2.getInstallerPackageName(application.getPackageName());
            }
            str4 = this.f87684x;
        } catch (Throwable th12) {
            r0.c(th12);
        }
        this.f87684x = str4;
        this.f87683w = application.getSharedPreferences("singular-pref-session", 0).getString("fcm_device_token_key", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        this.f87682v = application.getSharedPreferences("singular-pref-session", 0).getString("gcm_device_token_key", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        try {
            PackageInfo packageInfo2 = application.getPackageManager().getPackageInfo(application.getPackageName(), 0);
            this.B = packageInfo2.firstInstallTime;
            this.C = packageInfo2.lastUpdateTime;
        } catch (PackageManager.NameNotFoundException e11) {
            r0.c(e11);
        } catch (RuntimeException unused4) {
        }
        this.D = application.getSharedPreferences("singular-pref-session", 0).getString("custom_user_id", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        String property = System.getProperty("http.agent", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        if (TextUtils.isEmpty(property)) {
            try {
                Class.forName("android.os.AsyncTask");
                property = WebSettings.getDefaultUserAgent(application);
            } catch (VerifyError e12) {
                r0.c(e12);
            } catch (Throwable th13) {
                r0.c(th13);
            }
        }
        this.E = property;
    }
}

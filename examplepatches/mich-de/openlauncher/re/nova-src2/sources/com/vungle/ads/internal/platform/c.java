package com.vungle.ads.internal.platform;

import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageManager;
import android.media.AudioManager;
import android.os.Build;
import android.os.Environment;
import android.os.PowerManager;
import android.os.SystemClock;
import android.provider.Settings;
import com.amplitude.common.android.AndroidContextProvider;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.appset.AppSet;
import com.google.android.gms.appset.AppSetIdClient;
import com.google.android.gms.appset.AppSetIdInfo;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.tasks.Task;
import com.iab.omid.library.vungle.internal.l;
import com.vungle.ads.internal.executor.j;
import com.vungle.ads.internal.model.j0;
import com.vungle.ads.internal.network.w;
import com.vungle.ads.internal.persistence.FilePreferences;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import f10.o;
import fa.l0;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements f {

    /* renamed from: a, reason: collision with root package name */
    public final Context f47342a;

    /* renamed from: b, reason: collision with root package name */
    public final j f47343b;

    /* renamed from: c, reason: collision with root package name */
    public final PowerManager f47344c;

    /* renamed from: d, reason: collision with root package name */
    public final AudioManager f47345d;

    /* renamed from: e, reason: collision with root package name */
    public Long f47346e;

    /* renamed from: f, reason: collision with root package name */
    public String f47347f;

    /* renamed from: g, reason: collision with root package name */
    public Integer f47348g;

    /* renamed from: h, reason: collision with root package name */
    public j0 f47349h;

    /* renamed from: i, reason: collision with root package name */
    public String f47350i;

    public c(Context context, j uaExecutor, PowerManager powerManager, AudioManager audioManager) {
        Intrinsics.g(context, "context");
        Intrinsics.g(uaExecutor, "uaExecutor");
        Intrinsics.g(powerManager, "powerManager");
        Intrinsics.g(audioManager, "audioManager");
        this.f47342a = context;
        this.f47343b = uaExecutor;
        this.f47344c = powerManager;
        this.f47345d = audioManager;
        p();
    }

    public final void a(w consumer) {
        Intrinsics.g(consumer, "consumer");
        this.f47343b.execute(new l0(24, this, consumer));
    }

    public final String b() {
        return this.f47347f;
    }

    public final Integer c() {
        return this.f47348g;
    }

    public final long d() {
        return Build.TIME;
    }

    public final String e() {
        return a.a(this.f47342a);
    }

    public final String f() {
        String str = this.f47350i;
        if (str != null) {
            return str;
        }
        try {
            String str2 = (Build.VERSION.SDK_INT >= 33 ? this.f47342a.getPackageManager().getPackageInfo("com.android.vending", PackageManager.PackageInfoFlags.of(0L)) : this.f47342a.getPackageManager().getPackageInfo("com.android.vending", 0)).versionName;
            this.f47350i = str2;
            return str2;
        } catch (PackageManager.NameNotFoundException unused) {
            return null;
        }
    }

    public final long g() {
        return System.currentTimeMillis() - SystemClock.elapsedRealtime();
    }

    public final long h() {
        Object objA;
        try {
            int i5 = Result.f71687b;
            objA = Long.valueOf((Build.VERSION.SDK_INT >= 33 ? this.f47342a.getPackageManager().getPackageInfo("android", PackageManager.PackageInfoFlags.of(0L)) : this.f47342a.getPackageManager().getPackageInfo("android", 0)).firstInstallTime);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            if (thA instanceof PackageManager.NameNotFoundException) {
                boolean z11 = u.f47714a;
                StringBuilder sbA = l.a("Error getting OS installation time: ");
                sbA.append(((PackageManager.NameNotFoundException) thA).getLocalizedMessage());
                t.b("AndroidPlatform", sbA.toString());
            }
            objA = -1L;
        }
        return ((Number) objA).longValue();
    }

    public final long i() {
        Lazy lazyB = LazyKt.b(LazyThreadSafetyMode.f71679a, new b(this.f47342a));
        Long l9 = this.f47346e;
        if (l9 != null) {
            return l9.longValue();
        }
        long jA = ((FilePreferences) lazyB.getValue()).a("sit", 0L);
        if (jA == 0) {
            jA = System.currentTimeMillis();
            ((FilePreferences) lazyB.getValue()).b("sit", jA).b();
        }
        this.f47346e = Long.valueOf(jA);
        return jA;
    }

    public final String j() {
        return System.getProperty("http.agent");
    }

    public final float k() {
        try {
            float streamVolume = this.f47345d.getStreamVolume(3) / this.f47345d.getStreamMaxVolume(3);
            if (!Float.isNaN(streamVolume)) {
                if (!Float.isInfinite(streamVolume) && streamVolume >= 0.0f) {
                    if (streamVolume > 1.0f) {
                        return 1.0f;
                    }
                    return streamVolume;
                }
            }
        } catch (Exception unused) {
        }
        return 0.0f;
    }

    public final boolean l() {
        return this.f47344c.isPowerSaveMode();
    }

    public final boolean m() {
        try {
            return Intrinsics.b(Environment.getExternalStorageState(), "mounted");
        } catch (Exception e3) {
            boolean z11 = u.f47714a;
            t.a("AndroidPlatform", "Acquiring external storage state failed", e3);
            return false;
        }
    }

    public final boolean n() {
        try {
            if (this.f47345d.getRingerMode() != 0) {
                if (this.f47345d.getRingerMode() != 1) {
                    return false;
                }
            }
            return true;
        } catch (Exception unused) {
            return false;
        }
    }

    public final boolean o() {
        try {
            return this.f47345d.getStreamVolume(3) > 0;
        } catch (Exception unused) {
            return true;
        }
    }

    public final void p() {
        String str = this.f47347f;
        if (str == null || str.length() == 0) {
            try {
                AppSetIdClient client = AppSet.getClient(this.f47342a);
                Intrinsics.f(client, "getClient(context)");
                Task<AppSetIdInfo> appSetIdInfo = client.getAppSetIdInfo();
                Intrinsics.f(appSetIdInfo, "client.appSetIdInfo");
                appSetIdInfo.f(new o(this, 27));
            } catch (Exception e3) {
                boolean z11 = u.f47714a;
                StringBuilder sbA = l.a("Error getting AppSetID: ");
                sbA.append(e3.getLocalizedMessage());
                t.b("AndroidPlatform", sbA.toString());
            } catch (NoClassDefFoundError e11) {
                boolean z12 = u.f47714a;
                StringBuilder sbA2 = l.a("Required libs to get AppSetID Not available: ");
                sbA2.append(e11.getLocalizedMessage());
                t.b("AndroidPlatform", sbA2.toString());
            }
        }
    }

    public static final void a(c this$0, z4.a consumer) {
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(consumer, "$consumer");
        g.a(this$0.f47342a, consumer);
    }

    public final j0 a() {
        j0 j0Var;
        String strA;
        j0 j0Var2 = this.f47349h;
        if (j0Var2 != null && (strA = j0Var2.a()) != null && strA.length() != 0) {
            return j0Var2;
        }
        boolean z11 = true;
        if (r70.j.B0(Build.MANUFACTURER, "Amazon", true)) {
            j0Var = new j0();
            try {
                ContentResolver contentResolver = this.f47342a.getContentResolver();
                if (Settings.Secure.getInt(contentResolver, AndroidContextProvider.SETTING_LIMIT_AD_TRACKING) != 1) {
                    z11 = false;
                }
                j0Var.f47065b = z11;
                j0Var.f47064a = Settings.Secure.getString(contentResolver, AndroidContextProvider.SETTING_ADVERTISING_ID);
            } catch (Settings.SettingNotFoundException e3) {
                boolean z12 = u.f47714a;
                t.a("AndroidPlatform", "Error getting Amazon advertising info: Setting not found.", e3);
            } catch (Exception e11) {
                boolean z13 = u.f47714a;
                t.a("AndroidPlatform", "Error getting Amazon advertising info", e11);
            }
        } else {
            j0 j0Var3 = new j0();
            try {
                AdvertisingIdClient.Info advertisingIdInfo = AdvertisingIdClient.getAdvertisingIdInfo(this.f47342a);
                Intrinsics.f(advertisingIdInfo, "getAdvertisingIdInfo(context)");
                j0Var3.a(advertisingIdInfo.getId());
                j0Var3.a(advertisingIdInfo.isLimitAdTrackingEnabled());
            } catch (GooglePlayServicesNotAvailableException e12) {
                boolean z14 = u.f47714a;
                StringBuilder sbA = l.a("Play services Not available: ");
                sbA.append(e12.getLocalizedMessage());
                t.b("AndroidPlatform", sbA.toString());
            } catch (Exception e13) {
                boolean z15 = u.f47714a;
                StringBuilder sbA2 = l.a("Error getting Google advertising info: ");
                sbA2.append(e13.getLocalizedMessage());
                t.b("AndroidPlatform", sbA2.toString());
            } catch (NoClassDefFoundError e14) {
                boolean z16 = u.f47714a;
                StringBuilder sbA3 = l.a("Play services Not available: ");
                sbA3.append(e14.getLocalizedMessage());
                t.b("AndroidPlatform", sbA3.toString());
                j0Var3.a(Settings.Secure.getString(this.f47342a.getContentResolver(), AndroidContextProvider.SETTING_ADVERTISING_ID));
            }
            j0Var = j0Var3;
        }
        this.f47349h = j0Var;
        return j0Var;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ c(Context context, j jVar) {
        Object systemService = context.getSystemService("power");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.os.PowerManager");
        Object systemService2 = context.getSystemService("audio");
        Intrinsics.e(systemService2, "null cannot be cast to non-null type android.media.AudioManager");
        this(context, jVar, (PowerManager) systemService, (AudioManager) systemService2);
    }

    public static final void a(c this$0, AppSetIdInfo appSetIdInfo) {
        Intrinsics.g(this$0, "this$0");
        if (appSetIdInfo != null) {
            this$0.f47347f = appSetIdInfo.getId();
            this$0.f47348g = Integer.valueOf(appSetIdInfo.f31693b);
        }
    }
}

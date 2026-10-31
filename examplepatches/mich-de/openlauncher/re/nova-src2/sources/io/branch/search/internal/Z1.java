package io.branch.search.internal;

import android.app.ActivityManager;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.os.Binder;
import android.os.Build;
import android.os.Process;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.I0;
import io.branch.search.internal.services.model.BranchJob;
import io.branch.search.internal.shared.BranchAndroidDependentUtilsKt;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Z1 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f63784a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final P1 f63785b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final InterfaceC3272mf f63786c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public String f63787d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public String f63788e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public DisplayMetrics f63789f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public String f63790g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f63791h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final String f63792i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f63793j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public String f63794k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f63795l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f63796m;
    public final boolean n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    @NotNull
    public final Object f63797p;

    /* renamed from: q, reason: collision with root package name */
    @NotNull
    public final TelephonyManager f63798q;

    /* renamed from: r, reason: collision with root package name */
    @NotNull
    public final WindowManager f63799r;

    /* renamed from: s, reason: collision with root package name */
    @NotNull
    public final ConnectivityManager f63800s;

    /* renamed from: t, reason: collision with root package name */
    @NotNull
    public P5 f63801t;

    public static final class a {
    }

    public Z1(@NotNull Context context, @NotNull P1 branchConfiguration, @NotNull InterfaceC3272mf userAgentFetcher) {
        Intrinsics.g(context, "context");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(userAgentFetcher, "userAgentFetcher");
        this.f63784a = context;
        this.f63785b = branchConfiguration;
        this.f63786c = userAgentFetcher;
        this.f63787d = "bnc_no_value";
        this.f63788e = "bnc_no_value";
        this.f63790g = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f63794k = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f63797p = new Object();
        this.f63801t = new P5(null, null);
        Object systemService = context.getSystemService((Class<Object>) TelephonyManager.class);
        Intrinsics.f(systemService, "context.getSystemService…phonyManager::class.java)");
        this.f63798q = (TelephonyManager) systemService;
        Object systemService2 = context.getSystemService((Class<Object>) WindowManager.class);
        Intrinsics.f(systemService2, "context.getSystemService…indowManager::class.java)");
        this.f63799r = (WindowManager) systemService2;
        Object systemService3 = context.getSystemService((Class<Object>) ConnectivityManager.class);
        Intrinsics.f(systemService3, "context.getSystemService…ivityManager::class.java)");
        this.f63800s = (ConnectivityManager) systemService3;
        this.n = ((ActivityManager) context.getSystemService(ActivityManager.class)).isLowRamDevice();
        this.f63789f = b();
        String packageName = context.getPackageName();
        Intrinsics.f(packageName, "context.packageName");
        this.f63791h = packageName;
        this.f63792i = a(context);
    }

    public final C3342r1 a() {
        Double dValueOf = Double.valueOf(0.0d);
        String MANUFACTURER = Build.MANUFACTURER;
        Intrinsics.f(MANUFACTURER, "MANUFACTURER");
        String str = this.f63787d;
        String str2 = this.f63788e;
        String languageTag = Locale.getDefault().toLanguageTag();
        Intrinsics.f(languageTag, "getDefault().toLanguageTag()");
        String languageTag2 = Locale.getDefault().toLanguageTag();
        Intrinsics.f(languageTag2, "getDefault().toLanguageTag()");
        String str3 = this.f63790g;
        String MODEL = Build.MODEL;
        Intrinsics.f(MODEL, "MODEL");
        int i5 = Build.VERSION.SDK_INT;
        String sDKVersion = BranchAndroidDependentUtilsKt.getSDKVersion();
        boolean z11 = this.f63793j;
        String str4 = this.f63794k;
        boolean z12 = this.f63795l;
        boolean z13 = this.f63796m;
        String str5 = this.f63786c.get();
        DisplayMetrics displayMetrics = this.f63789f;
        Integer numValueOf = displayMetrics != null ? Integer.valueOf(displayMetrics.densityDpi) : null;
        DisplayMetrics displayMetrics2 = this.f63789f;
        Integer numValueOf2 = displayMetrics2 != null ? Integer.valueOf(displayMetrics2.widthPixels) : null;
        DisplayMetrics displayMetrics3 = this.f63789f;
        return new C3342r1(MANUFACTURER, str, str2, languageTag, languageTag2, str3, MODEL, i5, "ANDROID", "discovery_android", sDKVersion, z11, str4, z12, z13, str5, numValueOf, numValueOf2, displayMetrics3 != null ? Integer.valueOf(displayMetrics3.heightPixels) : null, this.f63785b.h() ? null : dValueOf, this.f63785b.h() ? null : dValueOf, this.n, this.f63791h, this.f63792i);
    }

    public final DisplayMetrics b() {
        Display defaultDisplay = this.f63799r.getDefaultDisplay();
        if (defaultDisplay == null) {
            return null;
        }
        DisplayMetrics displayMetrics = new DisplayMetrics();
        defaultDisplay.getMetrics(displayMetrics);
        return displayMetrics;
    }

    public final T5 c() {
        Object systemService = this.f63784a.getSystemService("jobscheduler");
        JobScheduler jobScheduler = systemService instanceof JobScheduler ? (JobScheduler) systemService : null;
        if (jobScheduler == null) {
            return null;
        }
        int size = Sa.a(jobScheduler).size();
        List<JobInfo> allPendingJobs = jobScheduler.getAllPendingJobs();
        Intrinsics.f(allPendingJobs, "allPendingJobs");
        ArrayList arrayList = new ArrayList();
        for (Object obj : allPendingJobs) {
            if (((JobInfo) obj).getExtras().containsKey(BranchJob.AggregateAnalyticsPing.EXTRAS_KEY_AA_PING_SCHEDULING_TIMESTAMP)) {
                arrayList.add(obj);
            }
        }
        return new T5(size, arrayList.size());
    }

    public final void d() {
        a(true);
    }

    public final void b(boolean z11) {
        synchronized (this.f63797p) {
            try {
                if (System.currentTimeMillis() > this.o + 3600000) {
                    a(z11);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final String a(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(this.f63791h, 0).versionName;
        } catch (PackageManager.NameNotFoundException e3) {
            C3296o5.a(UUID.randomUUID().toString(), e3, "BranchDeviceInfo.sync");
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00e1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(boolean z11) {
        boolean z12;
        String packageName;
        ResolveInfo resolveInfoResolveActivity;
        try {
            String networkOperatorName = this.f63798q.getNetworkOperatorName();
            Intrinsics.f(networkOperatorName, "telephonyManager.networkOperatorName");
            this.f63787d = networkOperatorName;
            String simOperatorName = this.f63798q.getSimOperatorName();
            Intrinsics.f(simOperatorName, "telephonyManager.simOperatorName");
            this.f63788e = simOperatorName;
        } catch (Exception e3) {
            C3296o5.a(UUID.randomUUID().toString(), e3, "BranchDeviceInfo.sync");
        }
        if (TextUtils.isEmpty(this.f63787d)) {
            this.f63787d = "bnc_no_value";
        }
        if (TextUtils.isEmpty(this.f63788e)) {
            this.f63788e = "bnc_no_value";
        }
        if (this.f63789f == null) {
            this.f63789f = b();
        }
        try {
            NetworkCapabilities networkCapabilities = this.f63800s.getNetworkCapabilities(this.f63800s.getActiveNetwork());
            if (networkCapabilities != null) {
                this.f63796m = networkCapabilities.hasTransport(4);
            }
        } catch (Exception e11) {
            C3296o5.a(UUID.randomUUID().toString(), e11, "BranchDeviceInfo.sync");
        }
        I0.a aVar = I0.Companion;
        Context context = this.f63784a;
        aVar.getClass();
        O0 o0A = I0.a.a(context);
        this.f63793j = o0A.f63002d;
        this.f63794k = R0.a(o0A.a());
        Context context2 = this.f63784a;
        Intrinsics.g(context2, "context");
        try {
            packageName = context2.getPackageName();
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.addCategory("android.intent.category.HOME");
            resolveInfoResolveActivity = context2.getPackageManager().resolveActivity(intent, SQLiteDatabase.OPEN_FULLMUTEX);
        } catch (Exception e12) {
            String str = "Process uId " + Process.myUid() + " Binder uId " + Binder.getCallingUid();
            C3296o5.a aVar2 = C3296o5.f65426a;
            C3296o5.a(new F6("Util.isDefaultLauncher", str, null, e12, null));
        }
        if (resolveInfoResolveActivity != null) {
            z12 = packageName.equals(resolveInfoResolveActivity.activityInfo.packageName);
        }
        this.f63795l = z12;
        Locale localeA = C3390tf.a(this.f63784a);
        if (localeA != null) {
            String languageTag = localeA.toLanguageTag();
            Intrinsics.f(languageTag, "localeObject.toLanguageTag()");
            this.f63790g = languageTag;
        }
        this.f63801t = new P5(this.f63801t.f63067a, z11 ? c() : null);
        this.o = System.currentTimeMillis();
    }
}

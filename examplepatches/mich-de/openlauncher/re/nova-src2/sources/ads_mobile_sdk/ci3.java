package ads_mobile_sdk;

import ads_mobile_sdk.ci3;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import b.d0;
import b.k9;
import b.o2;
import b.x0;
import b3.b1;
import b70.h;
import cw.l2;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.Thread;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.AbstractPlatformRandom;
import kotlin.random.Random;
import t70.m0;

/* loaded from: classes2.dex */
public final class ci3 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f1888a;

    /* renamed from: b, reason: collision with root package name */
    public final jr0 f1889b;

    /* renamed from: c, reason: collision with root package name */
    public final o2 f1890c;

    /* renamed from: d, reason: collision with root package name */
    public final oi3 f1891d;

    /* renamed from: e, reason: collision with root package name */
    public final dl0 f1892e;

    /* renamed from: f, reason: collision with root package name */
    public final b41 f1893f;

    /* renamed from: g, reason: collision with root package name */
    public final String f1894g;

    /* renamed from: h, reason: collision with root package name */
    public final String f1895h;

    /* renamed from: i, reason: collision with root package name */
    public final b.w4 f1896i;

    /* renamed from: j, reason: collision with root package name */
    public final fi0 f1897j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f1898k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f1899l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f1900m;
    public boolean n;
    public Object o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f1901p;

    /* renamed from: q, reason: collision with root package name */
    public int f1902q;

    /* renamed from: r, reason: collision with root package name */
    public final HashSet f1903r;

    public ci3(Context applicationContext, jr0 flags, o2 clock, oi3 traceReporter, dl0 exceptionReporter, b41 initializationConfigWrapper, String afmaVersionString, String gmaVersion, b.w4 chromeVariationsProvider, fi0 deviceTierManager) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(traceReporter, "traceReporter");
        Intrinsics.g(exceptionReporter, "exceptionReporter");
        Intrinsics.g(initializationConfigWrapper, "initializationConfigWrapper");
        Intrinsics.g(afmaVersionString, "afmaVersionString");
        Intrinsics.g(gmaVersion, "gmaVersion");
        Intrinsics.g(chromeVariationsProvider, "chromeVariationsProvider");
        Intrinsics.g(deviceTierManager, "deviceTierManager");
        this.f1888a = applicationContext;
        this.f1889b = flags;
        this.f1890c = clock;
        this.f1891d = traceReporter;
        this.f1892e = exceptionReporter;
        this.f1893f = initializationConfigWrapper;
        this.f1894g = afmaVersionString;
        this.f1895h = gmaVersion;
        this.f1896i = chromeVariationsProvider;
        this.f1897j = deviceTierManager;
        this.o = h.f17594a;
        this.f1903r = new HashSet();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(ci3 ci3Var, String str, c0.g0 g0Var, ContinuationImpl continuationImpl) {
        vh3 vh3Var;
        if (continuationImpl instanceof vh3) {
            vh3Var = (vh3) continuationImpl;
            int i5 = vh3Var.f10791e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vh3Var.f10791e = i5 - Integer.MIN_VALUE;
            } else {
                vh3Var = new vh3(ci3Var, continuationImpl);
            }
        }
        Object obj = vh3Var.f10789c;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = vh3Var.f10791e;
        try {
            if (i11 != 0) {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                String str2 = vh3Var.f10788b;
                ci3 ci3Var2 = vh3Var.f10787a;
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            vh3Var.f10787a = ci3Var;
            vh3Var.f10788b = str;
            vh3Var.f10791e = 1;
            Object objInvoke = g0Var.invoke(vh3Var);
            return objInvoke == obj2 ? obj2 : objInvoke;
        } catch (Exception e3) {
            ci3Var.a(str, (Throwable) e3);
            return null;
        }
    }

    public final void b(Throwable exception) throws Throwable {
        Intrinsics.g(exception, "exception");
        mu0.a(new ai3(0, exception));
        if (this.f1900m) {
            boolean z11 = false;
            boolean z12 = false;
            for (Throwable cause = exception; cause != null; cause = cause.getCause()) {
                StackTraceElement[] stackTrace = cause.getStackTrace();
                Intrinsics.d(stackTrace);
                for (StackTraceElement stackTraceElement : stackTrace) {
                    String className = stackTraceElement.getClassName();
                    Intrinsics.f(className, "getClassName(...)");
                    if (r70.j.I0(className, "com.google.android.libraries.ads.mobile.sdk", false)) {
                        z11 = true;
                    }
                    if (Intrinsics.b(stackTraceElement.getClassName(), ci3.class.getName()) || Intrinsics.b(stackTraceElement.getClassName(), dl0.class.getName())) {
                        z12 = true;
                        break;
                    }
                }
            }
            if (z11 && !z12) {
                this.f1890c.getClass();
                this.f1892e.a(new fl0(exception, "UNTRAPPED_EXCEPTION", null, false, System.currentTimeMillis(), -1, false));
            }
        }
        m0.u(t70.c2.f88780b, new a60.a(this, null, 3));
    }

    public final void a(t70.j0 backgroundScope) {
        String str;
        PackageManager packageManager;
        ApplicationInfo applicationInfo;
        Bundle bundle;
        PackageInfo packageInfo;
        jn jnVar = jn.a$12;
        Double dValueOf = Double.valueOf(0.1d);
        Double dValueOf2 = Double.valueOf(0.03d);
        Intrinsics.g(backgroundScope, "backgroundScope");
        fi0 fi0Var = this.f1897j;
        fi0Var.b();
        l2.f48204a = this;
        jr0 jr0Var = this.f1889b;
        Integer numQ = k9.q(jr0Var, "gads:max_duplicate_crash:amount", 10);
        x0 x0Var = (x0) jr0Var.f18817a;
        this.f1902q = ((Number) jr0Var.a("gads:max_duplicate_crash:amount", numQ, jn.a$15)).intValue();
        Context context = this.f1888a;
        String packageName = context.getPackageName();
        PackageManager packageManager2 = context.getPackageManager();
        if (packageManager2 == null || (packageInfo = packageManager2.getPackageInfo(context.getPackageName(), 128)) == null || (str = packageInfo.versionName) == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        try {
            packageManager = context.getPackageManager();
        } catch (PackageManager.NameNotFoundException unused) {
        }
        String string = (packageManager == null || (applicationInfo = packageManager.getApplicationInfo(context.getPackageName(), 128)) == null || (bundle = applicationInfo.metaData) == null) ? null : bundle.getString("com.google.unity.ads.UNITY_VERSION");
        b.eb ebVarO = ew0.o();
        Intrinsics.f(ebVarO, "newBuilder(...)");
        ebVarO.b();
        ew0 ew0Var = (ew0) ebVarO.f1095b;
        ew0Var.getClass();
        ew0Var.os_ = zv0.OS_ANDROID.getNumber();
        String value = Build.VERSION.RELEASE;
        Intrinsics.f(value, "RELEASE");
        ebVarO.b();
        ((ew0) ebVarO.f1095b).q();
        String value2 = Build.MODEL;
        Intrinsics.f(value2, "MODEL");
        ebVarO.b();
        ((ew0) ebVarO.f1095b).l(value2);
        int i5 = Build.VERSION.SDK_INT;
        ebVarO.b();
        ((ew0) ebVarO.f1095b).targetVersion_ = i5;
        String value3 = this.f1894g;
        Intrinsics.g(value3, "value");
        ebVarO.b();
        ((ew0) ebVarO.f1095b).z(value3);
        String value4 = this.f1895h;
        Intrinsics.g(value4, "value");
        ebVarO.b();
        ((ew0) ebVarO.f1095b).h(value4);
        Intrinsics.d(packageName);
        ebVarO.b();
        ((ew0) ebVarO.f1095b).e(packageName);
        ebVarO.b();
        ((ew0) ebVarO.f1095b).f(str);
        String country = Locale.getDefault().getCountry();
        Intrinsics.f(country, "getCountry(...)");
        ebVarO.b();
        ((ew0) ebVarO.f1095b).j(country);
        b41 b41Var = this.f1893f;
        b41Var.a();
        Object obj = fi0Var.f3358b.get();
        Intrinsics.f(obj, "get(...)");
        ph0 ph0Var = (ph0) obj;
        ebVarO.b();
        ew0 ew0Var2 = (ew0) ebVarO.f1095b;
        ew0Var2.getClass();
        ew0Var2.deviceAdvertisedMemTier_ = ph0Var.getNumber();
        Object obj2 = fi0Var.f3359c.get();
        Intrinsics.f(obj2, "get(...)");
        ebVarO.b();
        ew0 ew0Var3 = (ew0) ebVarO.f1095b;
        ew0Var3.getClass();
        ew0Var3.deviceAvailableProcessorTier_ = ((rh0) obj2).getNumber();
        qh0 value5 = fi0Var.a();
        Intrinsics.g(value5, "value");
        ebVarO.b();
        ew0 ew0Var4 = (ew0) ebVarO.f1095b;
        ew0Var4.getClass();
        ew0Var4.deviceAvailableMemoryTier_ = value5.getNumber();
        boolean z11 = ((pn) x0Var).f8340r;
        ebVarO.b();
        ((ew0) ebVarO.f1095b).isFirstSessionAfterInstall_ = z11;
        boolean z12 = ((pn) x0Var).f8338p;
        ebVarO.b();
        ((ew0) ebVarO.f1095b).hadCachedFlags_ = z12;
        boolean z13 = ((pn) x0Var).f8339q;
        ebVarO.b();
        ((ew0) ebVarO.f1095b).wereCachedFlagsReset_ = z13;
        if (string != null) {
            ebVarO.b();
            ((ew0) ebVarO.f1095b).E(string);
        }
        ew0 ew0Var5 = (ew0) ebVarO.a();
        b.c4 c4VarP = kv0.p();
        Intrinsics.f(c4VarP, "newBuilder(...)");
        c4VarP.e();
        Intrinsics.g(value, "value");
        c4VarP.b();
        ((kv0) c4VarP.f1095b).p(value);
        Intrinsics.g(value2, "value");
        c4VarP.b();
        ((kv0) c4VarP.f1095b).j(value2);
        c4VarP.d(i5);
        c4VarP.b();
        ((kv0) c4VarP.f1095b).t(value4);
        c4VarP.b();
        ((kv0) c4VarP.f1095b).d(value3);
        c4VarP.b();
        ((kv0) c4VarP.f1095b).f(packageName);
        c4VarP.b();
        ((kv0) c4VarP.f1095b).g(str);
        String country2 = Locale.getDefault().getCountry();
        Intrinsics.f(country2, "getCountry(...)");
        c4VarP.b();
        ((kv0) c4VarP.f1095b).i(country2);
        if (string != null) {
            c4VarP.b();
            ((kv0) c4VarP.f1095b).y(string);
        }
        b41Var.a();
        kv0 kv0Var = (kv0) c4VarP.a();
        Random.f71890a.getClass();
        AbstractPlatformRandom abstractPlatformRandom = Random.f71891b;
        this.f1898k = abstractPlatformRandom.d() < ((Number) jr0Var.a("gads:cui_monitoring_session_sample_rate", dValueOf2, jnVar)).doubleValue();
        this.f1899l = abstractPlatformRandom.d() < ((Number) jr0Var.a("gads:trapped_exception_monitoring_session_sample_rate", dValueOf2, jnVar)).doubleValue();
        this.f1900m = abstractPlatformRandom.d() < ((Number) jr0Var.a("gads:untrapped_exception_monitoring_session_sample_rate", dValueOf, jnVar)).doubleValue();
        this.n = abstractPlatformRandom.d() < ((Number) jr0Var.a("gads:cui_monitoring_trace_failure_stacktrace_rate", Double.valueOf(0.01d), jnVar)).doubleValue();
        Map mapL0 = jr0Var.l0();
        LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(mapL0.size()));
        for (Map.Entry entry : mapL0.entrySet()) {
            Object key = entry.getKey();
            Random.f71890a.getClass();
            linkedHashMap.put(key, Boolean.valueOf(Random.f71891b.d() < ((Number) entry.getValue()).doubleValue()));
        }
        this.o = linkedHashMap;
        hs hsVar = (hs) this.f1896i.get();
        double dDoubleValue = ((Number) jr0Var.a("gads:cui_monitoring_session_sample_rate", dValueOf2, jnVar)).doubleValue();
        oi3 oi3Var = this.f1891d;
        oi3Var.f7933l = dDoubleValue;
        Map mapL02 = jr0Var.l0();
        Intrinsics.g(mapL02, "<set-?>");
        oi3Var.f7934m = mapL02;
        Intrinsics.d(hsVar);
        oi3Var.a(backgroundScope, ew0Var5, hsVar);
        dl0 dl0Var = this.f1892e;
        dl0Var.getClass();
        jr0 jr0Var2 = dl0Var.f4959c;
        jr0Var2.getClass();
        if (((Number) jr0Var2.a("gads:trapped_exception_monitoring_session_sample_rate", dValueOf2, jnVar)).doubleValue() > 0.0d) {
            dl0Var.f2558l = (long) (1 / ((Number) jr0Var2.a("gads:trapped_exception_monitoring_session_sample_rate", dValueOf2, jnVar)).doubleValue());
        }
        if (((Number) jr0Var2.a("gads:untrapped_exception_monitoring_session_sample_rate", dValueOf, jnVar)).doubleValue() > 0.0d) {
            dl0Var.f2559m = (long) (1 / ((Number) jr0Var2.a("gads:untrapped_exception_monitoring_session_sample_rate", dValueOf, jnVar)).doubleValue());
        }
        dl0Var.a(backgroundScope, kv0Var, hsVar);
        b41Var.a();
        boolean zBooleanValue = ((Boolean) jr0Var.a("gads:uncaught_exception_handler", Boolean.FALSE, jn.a$10)).booleanValue();
        this.f1901p = zBooleanValue;
        if (zBooleanValue) {
            final Thread.UncaughtExceptionHandler defaultUncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
            Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: b.v0
                @Override // java.lang.Thread.UncaughtExceptionHandler
                public final void uncaughtException(Thread thread, Throwable th2) {
                    Thread.UncaughtExceptionHandler uncaughtExceptionHandler = defaultUncaughtExceptionHandler;
                    ci3 this$0 = this.f16004a;
                    Intrinsics.g(this$0, "this$0");
                    try {
                        Intrinsics.d(th2);
                        this$0.a(th2);
                        if (uncaughtExceptionHandler == null) {
                            return;
                        }
                    } catch (Throwable unused2) {
                        if (uncaughtExceptionHandler == null) {
                            return;
                        }
                    }
                    uncaughtExceptionHandler.uncaughtException(thread, th2);
                }
            });
            Thread thread = Looper.getMainLooper().getThread();
            Intrinsics.f(thread, "getThread(...)");
            thread.setUncaughtExceptionHandler(new xh3(this, thread.getUncaughtExceptionHandler()));
        }
    }

    public final Object b(String str, Function0 function0) {
        try {
            return function0.invoke();
        } catch (Exception e3) {
            a(str, (Throwable) e3);
            return null;
        }
    }

    public final void a(Throwable th2) throws Throwable {
        if (this.f1901p) {
            Throwable thJ = d0.j(th2);
            boolean z11 = false;
            while (thJ != null) {
                StackTraceElement[] stackTrace = thJ.getStackTrace();
                Intrinsics.f(stackTrace, "getStackTrace(...)");
                for (StackTraceElement stackTraceElement : stackTrace) {
                    if (ci3.class.getName().equals(stackTraceElement.getClassName())) {
                        return;
                    }
                    String className = stackTraceElement.getClassName();
                    Intrinsics.f(className, "getClassName(...)");
                    jr0 jr0Var = this.f1889b;
                    jr0Var.getClass();
                    List defaultValue = ul.b.Q("com.google", "ads_mobile_sdk", "org.chromium", "android.webkit");
                    Intrinsics.g(defaultValue, "defaultValue");
                    List list = (List) jr0Var.a("gads:uncaught_exception_handler_prefix", defaultValue, jn.a$20);
                    if (!(list instanceof Collection) || !list.isEmpty()) {
                        Iterator it = list.iterator();
                        while (true) {
                            if (it.hasNext()) {
                                if (r70.j.I0(className, (String) it.next(), false)) {
                                    z11 = true;
                                    break;
                                }
                            } else {
                                break;
                            }
                        }
                    }
                }
                Throwable cause = thJ.getCause();
                thJ = cause != null ? d0.j(cause) : null;
            }
            if (z11) {
                if (this.f1902q > 0) {
                    HashSet hashSet = this.f1903r;
                    if (hashSet.size() >= this.f1902q) {
                        return;
                    }
                    Throwable exception = d0.j(th2);
                    Intrinsics.g(exception, "exception");
                    StringWriter stringWriter = new StringWriter();
                    exception.printStackTrace(new PrintWriter(stringWriter));
                    String string = stringWriter.toString();
                    Intrinsics.f(string, "toString(...)");
                    String strI = d0.i(string);
                    if (strI == null) {
                        strI = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    if (hashSet.contains(strI)) {
                        return;
                    } else {
                        hashSet.add(strI);
                    }
                }
                b(th2);
            }
        }
    }

    public final void a(String label, Throwable th2) {
        Intrinsics.g(label, "label");
        mu0.a(new b1(3, label, th2));
        if (this.f1899l) {
            dl0 dl0Var = this.f1892e;
            th3 th3Var = ji3.b().f4777a;
            mi3 mi3Var = th3Var != null ? th3Var.f9923a : null;
            this.f1890c.getClass();
            dl0Var.a(new fl0(th2, label, mi3Var, true, System.currentTimeMillis(), -1, false));
        }
    }

    public final void a(String str, Exception exc) {
        mu0.a(new b1(4, str, exc));
        dl0 dl0Var = this.f1892e;
        th3 th3Var = ji3.b().f4777a;
        mi3 mi3Var = th3Var != null ? th3Var.f9923a : null;
        this.f1890c.getClass();
        dl0Var.a(new fl0(exc, str, mi3Var, true, System.currentTimeMillis(), -1, true));
    }
}

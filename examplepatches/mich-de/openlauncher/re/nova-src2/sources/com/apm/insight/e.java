package com.apm.insight;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import com.apm.insight.runtime.ConfigManager;
import com.apm.insight.runtime.g;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    private static Context f21542a = null;

    /* renamed from: b, reason: collision with root package name */
    private static Application f21543b = null;

    /* renamed from: c, reason: collision with root package name */
    private static long f21544c = 0;

    /* renamed from: d, reason: collision with root package name */
    private static String f21545d = "default";

    /* renamed from: e, reason: collision with root package name */
    private static boolean f21546e = false;

    /* renamed from: f, reason: collision with root package name */
    @SuppressLint({"StaticFieldLeak"})
    private static com.apm.insight.nativecrash.b f21547f;

    /* renamed from: i, reason: collision with root package name */
    private static volatile ConcurrentHashMap<Integer, String> f21550i;
    private static volatile String n;

    /* renamed from: g, reason: collision with root package name */
    private static ConfigManager f21548g = new ConfigManager();

    /* renamed from: h, reason: collision with root package name */
    private static a f21549h = new a();

    /* renamed from: j, reason: collision with root package name */
    private static g f21551j = null;

    /* renamed from: k, reason: collision with root package name */
    private static volatile String f21552k = null;

    /* renamed from: l, reason: collision with root package name */
    private static Object f21553l = new Object();

    /* renamed from: m, reason: collision with root package name */
    private static volatile int f21554m = 0;
    private static int o = 0;

    /* renamed from: p, reason: collision with root package name */
    private static boolean f21555p = true;

    /* renamed from: q, reason: collision with root package name */
    private static boolean f21556q = true;

    /* renamed from: r, reason: collision with root package name */
    private static boolean f21557r = false;

    /* renamed from: s, reason: collision with root package name */
    private static boolean f21558s = true;

    /* renamed from: t, reason: collision with root package name */
    private static boolean f21559t = true;

    /* renamed from: u, reason: collision with root package name */
    private static boolean f21560u = true;

    public static com.apm.insight.nativecrash.b a() {
        if (f21547f == null) {
            f21547f = g.a(f21542a);
        }
        return f21547f;
    }

    public static a b() {
        return f21549h;
    }

    public static g c() {
        if (f21551j == null) {
            synchronized (e.class) {
                f21551j = new g();
            }
        }
        return f21551j;
    }

    public static void d(boolean z11) {
        f21558s = z11;
    }

    public static String e() {
        return f() + '_' + Long.toHexString(new Random().nextLong()) + "G";
    }

    public static String f() {
        if (f21552k == null) {
            synchronized (f21553l) {
                try {
                    if (f21552k == null) {
                        f21552k = Long.toHexString(new Random().nextLong()) + "U";
                    }
                } finally {
                }
            }
        }
        return f21552k;
    }

    public static Context g() {
        return f21542a;
    }

    public static Application h() {
        return f21543b;
    }

    public static ConfigManager i() {
        return f21548g;
    }

    public static long j() {
        return f21544c;
    }

    public static String k() {
        return f21545d;
    }

    public static void l() {
        o = 1;
    }

    public static int m() {
        return o;
    }

    public static boolean n() {
        return f21546e;
    }

    public static void o() {
        f21546e = true;
    }

    public static ConcurrentHashMap<Integer, String> p() {
        return f21550i;
    }

    public static int q() {
        return f21554m;
    }

    public static String r() {
        return n;
    }

    public static boolean s() {
        return f21555p;
    }

    public static boolean t() {
        return f21556q;
    }

    public static boolean u() {
        return f21557r;
    }

    public static boolean v() {
        return f21558s;
    }

    public static boolean w() {
        return f21560u;
    }

    public static boolean x() {
        return f21559t;
    }

    public static boolean y() {
        return false;
    }

    public static void b(int i5, String str) {
        f21554m = i5;
        n = str;
    }

    public static boolean d() {
        if (!f21548g.isDebugMode()) {
            return false;
        }
        Object obj = a().a().get("channel");
        return (obj == null ? "unknown" : String.valueOf(obj)).contains("local_test");
    }

    public static void e(boolean z11) {
        f21560u = z11;
    }

    public static void a(com.apm.insight.nativecrash.b bVar) {
        f21547f = bVar;
    }

    public static void b(boolean z11) {
        f21556q = z11;
    }

    public static void a(Application application) {
        if (application != null) {
            f21543b = application;
        }
    }

    public static void a(Application application, Context context) {
        if (f21543b == null) {
            f21544c = System.currentTimeMillis();
            f21542a = context;
            f21543b = application;
            f21552k = Long.toHexString(new Random().nextLong()) + "G";
        }
    }

    public static void c(boolean z11) {
        f21557r = z11;
    }

    public static void f(boolean z11) {
        f21559t = z11;
    }

    public static void a(Application application, Context context, ICommonParams iCommonParams) {
        a(application, context);
        f21547f = new com.apm.insight.nativecrash.b(f21542a, iCommonParams, a());
    }

    public static String a(long j11, CrashType crashType, boolean z11, boolean z12) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(j11);
        sb2.append("_");
        sb2.append(crashType.getName());
        sb2.append('_');
        sb2.append(f());
        sb2.append('_');
        sb2.append(z11 ? "oom_" : "normal_");
        sb2.append(f21544c);
        sb2.append('_');
        sb2.append(z12 ? "ignore_" : "normal_");
        sb2.append(Long.toHexString(new Random().nextLong()));
        sb2.append("G");
        return sb2.toString();
    }

    public static void a(String str) {
        f21545d = str;
    }

    public static void a(int i5, String str) {
        if (f21550i == null) {
            synchronized (e.class) {
                try {
                    if (f21550i == null) {
                        f21550i = new ConcurrentHashMap<>();
                    }
                } finally {
                }
            }
        }
        f21550i.put(Integer.valueOf(i5), str);
    }

    public static void a(boolean z11) {
        f21555p = z11;
    }
}

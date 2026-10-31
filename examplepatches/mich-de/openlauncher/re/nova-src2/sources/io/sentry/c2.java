package io.sentry;

import com.amplitude.android.TrackingOptions;
import io.branch.search.internal.C3125e3;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class c2 implements i1 {
    public final Map A;
    public ConcurrentHashMap C;

    /* renamed from: a, reason: collision with root package name */
    public final File f67129a;

    /* renamed from: b, reason: collision with root package name */
    public final Callable f67130b;

    /* renamed from: c, reason: collision with root package name */
    public int f67131c;

    /* renamed from: e, reason: collision with root package name */
    public String f67133e;

    /* renamed from: f, reason: collision with root package name */
    public String f67134f;

    /* renamed from: g, reason: collision with root package name */
    public String f67135g;

    /* renamed from: h, reason: collision with root package name */
    public String f67136h;

    /* renamed from: i, reason: collision with root package name */
    public String f67137i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f67138j;

    /* renamed from: k, reason: collision with root package name */
    public String f67139k;

    /* renamed from: m, reason: collision with root package name */
    public String f67141m;
    public String n;
    public String o;

    /* renamed from: p, reason: collision with root package name */
    public final ArrayList f67142p;

    /* renamed from: q, reason: collision with root package name */
    public String f67143q;

    /* renamed from: r, reason: collision with root package name */
    public String f67144r;

    /* renamed from: s, reason: collision with root package name */
    public String f67145s;

    /* renamed from: t, reason: collision with root package name */
    public String f67146t;

    /* renamed from: u, reason: collision with root package name */
    public String f67147u;

    /* renamed from: v, reason: collision with root package name */
    public String f67148v;

    /* renamed from: w, reason: collision with root package name */
    public String f67149w;

    /* renamed from: x, reason: collision with root package name */
    public String f67150x;

    /* renamed from: y, reason: collision with root package name */
    public String f67151y;

    /* renamed from: z, reason: collision with root package name */
    public Date f67152z;

    /* renamed from: l, reason: collision with root package name */
    public List f67140l = new ArrayList();
    public String B = null;

    /* renamed from: d, reason: collision with root package name */
    public String f67132d = Locale.getDefault().toString();

    public c2(File file, Date date, ArrayList arrayList, String str, String str2, String str3, String str4, int i5, String str5, Callable callable, String str6, String str7, String str8, Boolean bool, String str9, String str10, String str11, String str12, String str13, Map map) {
        this.f67129a = file;
        this.f67152z = date;
        this.f67139k = str5;
        this.f67130b = callable;
        this.f67131c = i5;
        String str14 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f67133e = str6 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str6;
        this.f67134f = str7 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str7;
        this.f67137i = str8 != null ? str8 : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f67138j = bool != null ? bool.booleanValue() : false;
        this.f67141m = str9 != null ? str9 : "0";
        this.f67135g = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f67136h = "android";
        this.n = "android";
        this.o = str10 != null ? str10 : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f67142p = arrayList;
        this.f67143q = str.isEmpty() ? "unknown" : str;
        this.f67144r = str4;
        this.f67145s = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f67146t = str11 != null ? str11 : str14;
        this.f67147u = str2;
        this.f67148v = str3;
        this.f67149w = UUID.randomUUID().toString();
        this.f67150x = str12 != null ? str12 : "production";
        this.f67151y = str13;
        if (!str13.equals("normal") && !this.f67151y.equals("timeout") && !this.f67151y.equals("backgrounded")) {
            this.f67151y = "normal";
        }
        this.A = map;
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o("android_api_level");
        e3Var.x(iLogger, Integer.valueOf(this.f67131c));
        e3Var.o("device_locale");
        e3Var.x(iLogger, this.f67132d);
        e3Var.o(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MANUFACTURER);
        e3Var.A(this.f67133e);
        e3Var.o(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MODEL);
        e3Var.A(this.f67134f);
        e3Var.o("device_os_build_number");
        e3Var.A(this.f67135g);
        e3Var.o("device_os_name");
        e3Var.A(this.f67136h);
        e3Var.o("device_os_version");
        e3Var.A(this.f67137i);
        e3Var.o("device_is_emulator");
        e3Var.B(this.f67138j);
        e3Var.o("architecture");
        e3Var.x(iLogger, this.f67139k);
        e3Var.o("device_cpu_frequencies");
        e3Var.x(iLogger, this.f67140l);
        e3Var.o("device_physical_memory_bytes");
        e3Var.A(this.f67141m);
        e3Var.o(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM);
        e3Var.A(this.n);
        e3Var.o("build_id");
        e3Var.A(this.o);
        e3Var.o("transaction_name");
        e3Var.A(this.f67143q);
        e3Var.o("duration_ns");
        e3Var.A(this.f67144r);
        e3Var.o(TrackingOptions.AMP_TRACKING_OPTION_VERSION_NAME);
        e3Var.A(this.f67146t);
        e3Var.o("version_code");
        e3Var.A(this.f67145s);
        ArrayList arrayList = this.f67142p;
        if (!arrayList.isEmpty()) {
            e3Var.o("transactions");
            e3Var.x(iLogger, arrayList);
        }
        e3Var.o("transaction_id");
        e3Var.A(this.f67147u);
        e3Var.o("trace_id");
        e3Var.A(this.f67148v);
        e3Var.o("profile_id");
        e3Var.A(this.f67149w);
        e3Var.o("environment");
        e3Var.A(this.f67150x);
        e3Var.o("truncation_reason");
        e3Var.A(this.f67151y);
        if (this.B != null) {
            e3Var.o("sampled_profile");
            e3Var.A(this.B);
        }
        e3Var.o("measurements");
        e3Var.x(iLogger, this.A);
        e3Var.o("timestamp");
        e3Var.x(iLogger, this.f67152z);
        ConcurrentHashMap concurrentHashMap = this.C;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.C, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}

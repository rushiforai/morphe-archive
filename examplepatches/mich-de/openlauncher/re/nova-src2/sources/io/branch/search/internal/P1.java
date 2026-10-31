package io.branch.search.internal;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.UserHandle;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import io.branch.search.internal.util.CorosKt;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class P1 {

    @NotNull
    public static final b Companion = new b();

    @NotNull
    public final y40.y A;

    @NotNull
    public final ArrayList B;

    @NotNull
    public final LinkedHashSet C;

    @NotNull
    public final ArrayList D;

    /* renamed from: a, reason: collision with root package name */
    public F4 f63034a;

    /* renamed from: b, reason: collision with root package name */
    public long f63035b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Object f63036c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public String f63037d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public String f63038e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f63039f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public String f63040g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public String f63041h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public String f63042i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final String f63043j;

    /* renamed from: k, reason: collision with root package name */
    @Nullable
    public final String f63044k;

    /* renamed from: l, reason: collision with root package name */
    @Nullable
    public final String f63045l;

    /* renamed from: m, reason: collision with root package name */
    @Nullable
    public final String f63046m;

    @Nullable
    public final Map<String, String> n;

    @Nullable
    public final String o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f63047p;

    /* renamed from: q, reason: collision with root package name */
    @NotNull
    public final LinkedHashMap f63048q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f63049r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f63050s;

    /* renamed from: t, reason: collision with root package name */
    @Nullable
    public final LinkedHashMap f63051t;

    /* renamed from: u, reason: collision with root package name */
    @NotNull
    public final InterfaceC3281n7 f63052u;

    /* renamed from: v, reason: collision with root package name */
    @Nullable
    public C3095c7 f63053v;

    /* renamed from: w, reason: collision with root package name */
    @NotNull
    public final List<String> f63054w;

    /* renamed from: x, reason: collision with root package name */
    @NotNull
    public final AtomicReference<a> f63055x;

    /* renamed from: y, reason: collision with root package name */
    @NotNull
    public final AtomicLong f63056y;

    /* renamed from: z, reason: collision with root package name */
    @NotNull
    public final y40.m f63057z;

    public enum a {
        OPTED_OUT(0),
        OPTED_IN(1);


        /* renamed from: a, reason: collision with root package name */
        public final int f63061a;

        a(int i5) {
            this.f63061a = i5;
        }
    }

    public static final class b {
    }

    public interface c {
        void a();
    }

    public static final class d implements InterfaceC3281n7 {
        @Override // io.branch.search.internal.InterfaceC3281n7
        @Nullable
        public final void a(@NotNull String packageId, @NotNull UserHandle handle) {
            Intrinsics.g(packageId, "packageId");
            Intrinsics.g(handle, "handle");
        }
    }

    public P1() {
        this.f63036c = new Object();
        this.f63037d = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f63047p = true;
        this.f63048q = new LinkedHashMap();
        this.f63051t = new LinkedHashMap();
        this.f63052u = new d();
        this.f63054w = new ArrayList();
        this.f63055x = new AtomicReference<>(a.OPTED_OUT);
        this.f63056y = new AtomicLong();
        this.f63057z = y40.m.f96675a;
        this.A = new y40.y();
        this.B = new ArrayList();
        this.C = new LinkedHashSet();
        this.D = new ArrayList();
    }

    @NotNull
    public final C3278n4 a() {
        synchronized (this.f63036c) {
            try {
                if (System.currentTimeMillis() > this.f63035b + 3600000) {
                    i();
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        String str = this.f63037d;
        String str2 = TextUtils.isEmpty(this.f63040g) ? null : this.f63040g;
        String str3 = TextUtils.isEmpty(this.f63042i) ? null : this.f63042i;
        String str4 = TextUtils.isEmpty(this.f63041h) ? null : this.f63041h;
        boolean z11 = this.f63039f;
        boolean z12 = !h();
        String str5 = TextUtils.isEmpty(this.f63043j) ? null : this.f63043j;
        String str6 = TextUtils.isEmpty(this.f63044k) ? null : this.f63044k;
        String str7 = TextUtils.isEmpty(this.f63045l) ? null : this.f63045l;
        String str8 = TextUtils.isEmpty(this.f63046m) ? null : this.f63046m;
        Map<String, String> map = this.n;
        Map<String, String> map2 = (map == null || !(map.isEmpty() ^ true)) ? null : this.n;
        a aVar = this.f63055x.get();
        Intrinsics.f(aVar, "trackingStatus.get()");
        return new C3278n4(str, str2, str3, str4, null, z11 ? 1 : 0, z12, str5, str6, str7, str8, map2, aVar, Long.valueOf(this.f63056y.get()), this.f63049r, this.f63050s, h() ? null : this.f63038e, this.f63048q.keySet().isEmpty() ? null : this.f63048q, this.f63051t);
    }

    @NotNull
    public final F4 b() {
        F4 f42 = this.f63034a;
        if (f42 != null) {
            return f42;
        }
        Intrinsics.m("context");
        throw null;
    }

    @NotNull
    public final y40.m c() {
        return this.f63057z;
    }

    @NotNull
    public final y40.y d() {
        return this.A;
    }

    @Nullable
    public final C3095c7 e() {
        return this.f63053v;
    }

    @Nullable
    public final String f() {
        return this.o;
    }

    public final void g() {
        if (this.C.isEmpty()) {
            synchronized (this.B) {
                try {
                    Iterator it = this.B.iterator();
                    while (it.hasNext()) {
                        InterfaceC3348r7 interfaceC3348r7 = (InterfaceC3348r7) it.next();
                        if (interfaceC3348r7 != null) {
                            interfaceC3348r7.a(this);
                        }
                    }
                    Unit unit = Unit.f71706a;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }

    public final boolean h() {
        return this.f63055x.get() != a.OPTED_IN;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0117  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0126  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0136 A[Catch: Exception -> 0x0139, TryCatch #1 {Exception -> 0x0139, blocks: (B:69:0x012e, B:71:0x0136, B:76:0x013e), top: B:101:0x012e }] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x013e A[Catch: Exception -> 0x0139, TRY_LEAVE, TryCatch #1 {Exception -> 0x0139, blocks: (B:69:0x012e, B:71:0x0136, B:76:0x013e), top: B:101:0x012e }] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0171 A[Catch: Exception -> 0x0174, TryCatch #3 {Exception -> 0x0174, blocks: (B:81:0x0169, B:83:0x0171, B:88:0x0179), top: B:104:0x0169 }] */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0176  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0179 A[Catch: Exception -> 0x0174, TRY_LEAVE, TryCatch #3 {Exception -> 0x0174, blocks: (B:81:0x0169, B:83:0x0171, B:88:0x0179), top: B:104:0x0169 }] */
    /* JADX WARN: Removed duplicated region for block: B:94:0x01b2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void i() throws PackageManager.NameNotFoundException {
        String string;
        String upperCase;
        String country;
        String upperCase2;
        String networkCountryIso;
        F4 f4B;
        TelephonyManager telephonyManager;
        TelephonyManager telephonyManager2;
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (TextUtils.isEmpty(this.f63037d) || (!r70.j.I0(this.f63037d, "key_live", false) && !r70.j.I0(this.f63037d, "key_test", false))) {
            Context context = b().f62438a;
            if (context != null) {
                try {
                    ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
                    Intrinsics.f(applicationInfo, "context.packageManager\n …ageManager.GET_META_DATA)");
                    Bundle bundle = applicationInfo.metaData;
                    if (bundle != null) {
                        String str2 = (bundle.containsKey("io.branch.sdk.BranchTestKey") && applicationInfo.metaData.getBoolean("io.branch.sdk.TestMode")) ? "io.branch.sdk.BranchTestKey" : "io.branch.sdk.BranchKey";
                        if ("io.branch.sdk.BranchTestKey".equals(str2)) {
                            throw new RuntimeException("Branch test key is used in release environment. Please switch to the live key.");
                        }
                        string = applicationInfo.metaData.getString(str2);
                    }
                } catch (Exception e3) {
                    C3296o5.a(UUID.randomUUID().toString(), e3, "Util.fetchBranchKey");
                }
                if (string != null) {
                }
                if (!TextUtils.isEmpty(this.f63037d)) {
                }
                throw new RuntimeException("Invalid Branch Key. Clients must either have a valid key in the manifest or initialize BranchSearch passing in a BranchConfiguration object that has a preconfigured and valid branchKey");
            }
            string = null;
            if (string != null) {
                this.f63037d = string;
            }
            if (!TextUtils.isEmpty(this.f63037d) || (!r70.j.I0(this.f63037d, "key_live", false) && !r70.j.I0(this.f63037d, "key_test", false))) {
                throw new RuntimeException("Invalid Branch Key. Clients must either have a valid key in the manifest or initialize BranchSearch passing in a BranchConfiguration object that has a preconfigured and valid branchKey");
            }
        }
        F4 f4B2 = b();
        Context context2 = f4B2.f62438a;
        Intrinsics.g(context2, "context");
        if (TextUtils.isEmpty(C3390tf.f65931a)) {
            try {
                Object systemService = context2.getSystemService("phone");
                TelephonyManager telephonyManager3 = systemService instanceof TelephonyManager ? (TelephonyManager) systemService : null;
                if (telephonyManager3 != null) {
                    upperCase = telephonyManager3.getSimCountryIso();
                    try {
                        if (TextUtils.isEmpty(upperCase) && telephonyManager3.getPhoneType() != 2) {
                            upperCase = telephonyManager3.getNetworkCountryIso();
                        }
                    } catch (Exception e11) {
                        e = e11;
                        C3296o5.a(UUID.randomUUID().toString(), e, "Util.getCountryCode");
                        if (upperCase != null) {
                        }
                        C3390tf.f65931a = upperCase;
                        country = C3390tf.f65931a;
                        if (TextUtils.isEmpty(country)) {
                        }
                        if (TextUtils.isEmpty(country)) {
                        }
                        if (country == null) {
                        }
                        this.f63040g = upperCase2;
                        Context context3 = f4B2.f62438a;
                        Intrinsics.g(context3, "context");
                        Object systemService2 = context3.getSystemService("phone");
                        if (!(systemService2 instanceof TelephonyManager)) {
                        }
                        if (telephonyManager2 == null) {
                        }
                        Locale locale = Locale.getDefault();
                        Intrinsics.f(locale, "getDefault()");
                        String upperCase3 = networkCountryIso.toUpperCase(locale);
                        Intrinsics.f(upperCase3, "this as java.lang.String).toUpperCase(locale)");
                        this.f63041h = upperCase3;
                        Context context4 = f4B2.f62438a;
                        Intrinsics.g(context4, "context");
                        Object systemService3 = context4.getSystemService("phone");
                        if (!(systemService3 instanceof TelephonyManager)) {
                        }
                        if (telephonyManager != null) {
                        }
                        Locale locale2 = Locale.getDefault();
                        Intrinsics.f(locale2, "getDefault()");
                        String upperCase4 = str.toUpperCase(locale2);
                        Intrinsics.f(upperCase4, "this as java.lang.String).toUpperCase(locale)");
                        this.f63042i = upperCase4;
                        f4B = b();
                        this.C.add("SyncLockGAID");
                        S1 s12 = new S1(this);
                        if (f4B != null) {
                        }
                        this.f63035b = System.currentTimeMillis();
                        g();
                    }
                } else {
                    upperCase = null;
                }
            } catch (Exception e12) {
                e = e12;
                upperCase = null;
            }
            if (upperCase != null) {
                Locale locale3 = Locale.getDefault();
                Intrinsics.f(locale3, "getDefault()");
                upperCase = upperCase.toUpperCase(locale3);
                Intrinsics.f(upperCase, "this as java.lang.String).toUpperCase(locale)");
            }
            C3390tf.f65931a = upperCase;
        }
        country = C3390tf.f65931a;
        if (TextUtils.isEmpty(country)) {
            country = C3390tf.a(context2).getCountry();
        }
        if (TextUtils.isEmpty(country)) {
            country = "US";
        }
        if (country == null) {
            Locale locale4 = Locale.getDefault();
            Intrinsics.f(locale4, "getDefault()");
            upperCase2 = country.toUpperCase(locale4);
            Intrinsics.f(upperCase2, "this as java.lang.String).toUpperCase(locale)");
        } else {
            upperCase2 = null;
        }
        this.f63040g = upperCase2;
        Context context32 = f4B2.f62438a;
        Intrinsics.g(context32, "context");
        try {
            Object systemService22 = context32.getSystemService("phone");
            telephonyManager2 = !(systemService22 instanceof TelephonyManager) ? (TelephonyManager) systemService22 : null;
        } catch (Exception e13) {
            C3296o5.a(UUID.randomUUID().toString(), e13, "Util.getCountryCode");
        }
        if (telephonyManager2 == null) {
            networkCountryIso = telephonyManager2.getNetworkCountryIso();
            Intrinsics.f(networkCountryIso, "tm.networkCountryIso");
        } else {
            networkCountryIso = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Locale locale5 = Locale.getDefault();
        Intrinsics.f(locale5, "getDefault()");
        String upperCase32 = networkCountryIso.toUpperCase(locale5);
        Intrinsics.f(upperCase32, "this as java.lang.String).toUpperCase(locale)");
        this.f63041h = upperCase32;
        Context context42 = f4B2.f62438a;
        Intrinsics.g(context42, "context");
        try {
            Object systemService32 = context42.getSystemService("phone");
            telephonyManager = !(systemService32 instanceof TelephonyManager) ? (TelephonyManager) systemService32 : null;
            if (telephonyManager != null) {
                String simCountryIso = telephonyManager.getSimCountryIso();
                Intrinsics.f(simCountryIso, "tm.simCountryIso");
                str = simCountryIso;
            }
        } catch (Exception e14) {
            C3296o5.a(UUID.randomUUID().toString(), e14, "Util.getCountryCode");
        }
        Locale locale22 = Locale.getDefault();
        Intrinsics.f(locale22, "getDefault()");
        String upperCase42 = str.toUpperCase(locale22);
        Intrinsics.f(upperCase42, "this as java.lang.String).toUpperCase(locale)");
        this.f63042i = upperCase42;
        f4B = b();
        this.C.add("SyncLockGAID");
        S1 s122 = new S1(this);
        if (f4B != null) {
            t70.m0.t(CorosKt.getBNCScope(), a80.d.f488c, null, new E1(new T1(f4B, this), new U1(s122), new V1(s122), null), 2);
        }
        this.f63035b = System.currentTimeMillis();
        g();
    }

    public final void b(@NotNull InterfaceC3348r7 listener) {
        Intrinsics.g(listener, "listener");
        synchronized (this.B) {
            this.B.remove(listener);
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public P1(@NotNull y40.u config) {
        this();
        Intrinsics.g(config, "config");
        this.f63037d = config.f96701b;
        AtomicReference<a> atomicReference = this.f63055x;
        C3095c7 c3095c7 = config.f96702c;
        atomicReference.set(c3095c7.d());
        this.f63053v = c3095c7;
        this.f63057z = config.f96703d;
        this.f63049r = config.f96704e;
        this.f63050s = config.f96705f;
        this.f63043j = config.f96706g;
        this.f63044k = config.f96707h;
        this.f63045l = config.f96708i;
        this.f63046m = config.f96709j;
        this.n = config.f96710k;
        this.f63052u = config.f96712m;
        this.f63054w = config.n;
        this.A = config.f96713p;
        F4 f42 = config.f96700a;
        a(f42);
        this.o = config.f96715r;
        this.f63047p = config.f96714q;
        if (b().f()) {
            this.f63051t = C6.a(f42.b());
        }
    }

    public final void a(@NotNull F4 f42) {
        Intrinsics.g(f42, "<set-?>");
        this.f63034a = f42;
    }

    public final void a(@NotNull InterfaceC3348r7 listener) {
        Intrinsics.g(listener, "listener");
        synchronized (this.B) {
            this.B.add(listener);
        }
    }
}

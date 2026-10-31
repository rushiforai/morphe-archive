package k30;

import android.content.Context;
import android.content.Intent;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkRequest;
import android.net.Uri;
import com.teslacoilsw.launcher.NovaLauncher;
import e00.q4;
import e10.y2;
import java.io.File;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.AbstractPlatformRandom;
import kotlin.random.Random;
import t70.g2;
import t70.m0;
import t70.y0;

/* loaded from: classes.dex */
public final class h0 {

    /* renamed from: r, reason: collision with root package name */
    public static h0 f70974r;

    /* renamed from: a, reason: collision with root package name */
    public final Context f70975a;

    /* renamed from: b, reason: collision with root package name */
    public final ConnectivityManager f70976b;

    /* renamed from: c, reason: collision with root package name */
    public final LocationManager f70977c;

    /* renamed from: d, reason: collision with root package name */
    public g2 f70978d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f70979e;

    /* renamed from: f, reason: collision with root package name */
    public Pair f70980f;

    /* renamed from: g, reason: collision with root package name */
    public x f70981g;

    /* renamed from: h, reason: collision with root package name */
    public int f70982h;

    /* renamed from: i, reason: collision with root package name */
    public w4.d f70983i;

    /* renamed from: j, reason: collision with root package name */
    public final y70.d f70984j;

    /* renamed from: k, reason: collision with root package name */
    public final a70.d f70985k;

    /* renamed from: l, reason: collision with root package name */
    public final a70.d f70986l;

    /* renamed from: m, reason: collision with root package name */
    public final d0 f70987m;
    public boolean n;
    public final LinkedHashSet o;

    /* renamed from: p, reason: collision with root package name */
    public int f70988p;

    /* renamed from: q, reason: collision with root package name */
    public Location f70989q;

    static {
        Intent intent = new Intent();
        intent.setData(Uri.parse("dynact://velour/weather/ProxyActivity"));
        intent.setClassName("com.google.android.googlequicksearchbox", "com.google.android.apps.gsa.velour.DynamicActivityTrampoline");
        intent.putExtra("com.google.android.libraries.velour.INNER_INTENT_URI", new Intent());
        intent.addFlags(268468224);
    }

    public h0(Context context) {
        this.f70975a = context;
        this.f70976b = (ConnectivityManager) context.getSystemService(ConnectivityManager.class);
        this.f70977c = (LocationManager) context.getSystemService(LocationManager.class);
        Location location = new Location(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        c.Companion.getClass();
        this.f70980f = new Pair(location, c.f70909h);
        x.Companion.getClass();
        this.f70981g = x.f71082l;
        y70.d dVarB = t70.k0.b();
        this.f70984j = dVarB;
        final int i5 = 0;
        this.f70985k = LazyKt.a(new Function0(this) { // from class: k30.y

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ h0 f71094b;

            {
                this.f71094b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i5) {
                    case 0:
                        return new x80.f(new File(this.f71094b.f70975a.getCacheDir(), "okweather"), 1048576L);
                    default:
                        x7.h hVar = new x7.h(5);
                        hVar.a(w20.f.f93676b);
                        a40.b.f189a.getClass();
                        hVar.b("https://weather.novalauncher.com/");
                        x80.d0 d0Var = new x80.d0();
                        d0Var.a(w20.n.f93704a);
                        d0Var.f95442k = (x80.f) this.f71094b.f70985k.getValue();
                        d0Var.f95435d.add(new com.instabridge.mobilesdk.internal.auth.b(1));
                        hVar.f95137b = new x80.e0(d0Var);
                        return (a40.b) hVar.c().l(a40.b.class);
                }
            }
        });
        final int i11 = 1;
        this.f70986l = LazyKt.a(new Function0(this) { // from class: k30.y

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ h0 f71094b;

            {
                this.f71094b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        return new x80.f(new File(this.f71094b.f70975a.getCacheDir(), "okweather"), 1048576L);
                    default:
                        x7.h hVar = new x7.h(5);
                        hVar.a(w20.f.f93676b);
                        a40.b.f189a.getClass();
                        hVar.b("https://weather.novalauncher.com/");
                        x80.d0 d0Var = new x80.d0();
                        d0Var.a(w20.n.f93704a);
                        d0Var.f95442k = (x80.f) this.f71094b.f70985k.getValue();
                        d0Var.f95435d.add(new com.instabridge.mobilesdk.internal.auth.b(1));
                        hVar.f95137b = new x80.e0(d0Var);
                        return (a40.b) hVar.c().l(a40.b.class);
                }
            }
        });
        this.f70987m = new d0(this, i5);
        this.o = new LinkedHashSet();
        a80.e eVar = y0.f88884a;
        m0.t(dVarB, a80.d.f488c, null, new a0(this, null), 2);
        m0.t(dVarB, null, null, new b0(this, null, i5), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x031c  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0338  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x033a A[Catch: Exception -> 0x0054, TryCatch #0 {Exception -> 0x0054, blocks: (B:16:0x004e, B:103:0x0321, B:105:0x0332, B:109:0x0340, B:113:0x0392, B:114:0x03ae, B:116:0x03b9, B:123:0x03cd, B:126:0x03d5, B:132:0x03e4, B:134:0x03ee, B:139:0x03fa, B:155:0x042e, B:157:0x043b, B:145:0x040e, B:147:0x0418, B:152:0x0424, B:125:0x03d3, B:118:0x03be, B:120:0x03c6, B:108:0x033a, B:23:0x0073, B:91:0x02c7, B:93:0x02cd, B:96:0x02d9, B:99:0x02e2, B:104:0x0326, B:26:0x008f, B:87:0x02a0, B:29:0x00a2, B:78:0x021a, B:80:0x0226, B:82:0x023c, B:83:0x027c, B:43:0x0101, B:45:0x011d, B:46:0x0137, B:48:0x013d, B:50:0x0145, B:52:0x014b, B:55:0x0161, B:57:0x0173, B:59:0x0177, B:61:0x0181, B:63:0x0185, B:65:0x018d, B:67:0x01af, B:69:0x01bb, B:72:0x01cc, B:74:0x01d7), top: B:163:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:111:0x038e  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x03b9 A[Catch: Exception -> 0x0054, TryCatch #0 {Exception -> 0x0054, blocks: (B:16:0x004e, B:103:0x0321, B:105:0x0332, B:109:0x0340, B:113:0x0392, B:114:0x03ae, B:116:0x03b9, B:123:0x03cd, B:126:0x03d5, B:132:0x03e4, B:134:0x03ee, B:139:0x03fa, B:155:0x042e, B:157:0x043b, B:145:0x040e, B:147:0x0418, B:152:0x0424, B:125:0x03d3, B:118:0x03be, B:120:0x03c6, B:108:0x033a, B:23:0x0073, B:91:0x02c7, B:93:0x02cd, B:96:0x02d9, B:99:0x02e2, B:104:0x0326, B:26:0x008f, B:87:0x02a0, B:29:0x00a2, B:78:0x021a, B:80:0x0226, B:82:0x023c, B:83:0x027c, B:43:0x0101, B:45:0x011d, B:46:0x0137, B:48:0x013d, B:50:0x0145, B:52:0x014b, B:55:0x0161, B:57:0x0173, B:59:0x0177, B:61:0x0181, B:63:0x0185, B:65:0x018d, B:67:0x01af, B:69:0x01bb, B:72:0x01cc, B:74:0x01d7), top: B:163:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:118:0x03be A[Catch: Exception -> 0x0054, TryCatch #0 {Exception -> 0x0054, blocks: (B:16:0x004e, B:103:0x0321, B:105:0x0332, B:109:0x0340, B:113:0x0392, B:114:0x03ae, B:116:0x03b9, B:123:0x03cd, B:126:0x03d5, B:132:0x03e4, B:134:0x03ee, B:139:0x03fa, B:155:0x042e, B:157:0x043b, B:145:0x040e, B:147:0x0418, B:152:0x0424, B:125:0x03d3, B:118:0x03be, B:120:0x03c6, B:108:0x033a, B:23:0x0073, B:91:0x02c7, B:93:0x02cd, B:96:0x02d9, B:99:0x02e2, B:104:0x0326, B:26:0x008f, B:87:0x02a0, B:29:0x00a2, B:78:0x021a, B:80:0x0226, B:82:0x023c, B:83:0x027c, B:43:0x0101, B:45:0x011d, B:46:0x0137, B:48:0x013d, B:50:0x0145, B:52:0x014b, B:55:0x0161, B:57:0x0173, B:59:0x0177, B:61:0x0181, B:63:0x0185, B:65:0x018d, B:67:0x01af, B:69:0x01bb, B:72:0x01cc, B:74:0x01d7), top: B:163:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:123:0x03cd A[Catch: Exception -> 0x0054, TryCatch #0 {Exception -> 0x0054, blocks: (B:16:0x004e, B:103:0x0321, B:105:0x0332, B:109:0x0340, B:113:0x0392, B:114:0x03ae, B:116:0x03b9, B:123:0x03cd, B:126:0x03d5, B:132:0x03e4, B:134:0x03ee, B:139:0x03fa, B:155:0x042e, B:157:0x043b, B:145:0x040e, B:147:0x0418, B:152:0x0424, B:125:0x03d3, B:118:0x03be, B:120:0x03c6, B:108:0x033a, B:23:0x0073, B:91:0x02c7, B:93:0x02cd, B:96:0x02d9, B:99:0x02e2, B:104:0x0326, B:26:0x008f, B:87:0x02a0, B:29:0x00a2, B:78:0x021a, B:80:0x0226, B:82:0x023c, B:83:0x027c, B:43:0x0101, B:45:0x011d, B:46:0x0137, B:48:0x013d, B:50:0x0145, B:52:0x014b, B:55:0x0161, B:57:0x0173, B:59:0x0177, B:61:0x0181, B:63:0x0185, B:65:0x018d, B:67:0x01af, B:69:0x01bb, B:72:0x01cc, B:74:0x01d7), top: B:163:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:125:0x03d3 A[Catch: Exception -> 0x0054, TryCatch #0 {Exception -> 0x0054, blocks: (B:16:0x004e, B:103:0x0321, B:105:0x0332, B:109:0x0340, B:113:0x0392, B:114:0x03ae, B:116:0x03b9, B:123:0x03cd, B:126:0x03d5, B:132:0x03e4, B:134:0x03ee, B:139:0x03fa, B:155:0x042e, B:157:0x043b, B:145:0x040e, B:147:0x0418, B:152:0x0424, B:125:0x03d3, B:118:0x03be, B:120:0x03c6, B:108:0x033a, B:23:0x0073, B:91:0x02c7, B:93:0x02cd, B:96:0x02d9, B:99:0x02e2, B:104:0x0326, B:26:0x008f, B:87:0x02a0, B:29:0x00a2, B:78:0x021a, B:80:0x0226, B:82:0x023c, B:83:0x027c, B:43:0x0101, B:45:0x011d, B:46:0x0137, B:48:0x013d, B:50:0x0145, B:52:0x014b, B:55:0x0161, B:57:0x0173, B:59:0x0177, B:61:0x0181, B:63:0x0185, B:65:0x018d, B:67:0x01af, B:69:0x01bb, B:72:0x01cc, B:74:0x01d7), top: B:163:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:128:0x03d9  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x042a  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x042e A[Catch: Exception -> 0x0054, TryCatch #0 {Exception -> 0x0054, blocks: (B:16:0x004e, B:103:0x0321, B:105:0x0332, B:109:0x0340, B:113:0x0392, B:114:0x03ae, B:116:0x03b9, B:123:0x03cd, B:126:0x03d5, B:132:0x03e4, B:134:0x03ee, B:139:0x03fa, B:155:0x042e, B:157:0x043b, B:145:0x040e, B:147:0x0418, B:152:0x0424, B:125:0x03d3, B:118:0x03be, B:120:0x03c6, B:108:0x033a, B:23:0x0073, B:91:0x02c7, B:93:0x02cd, B:96:0x02d9, B:99:0x02e2, B:104:0x0326, B:26:0x008f, B:87:0x02a0, B:29:0x00a2, B:78:0x021a, B:80:0x0226, B:82:0x023c, B:83:0x027c, B:43:0x0101, B:45:0x011d, B:46:0x0137, B:48:0x013d, B:50:0x0145, B:52:0x014b, B:55:0x0161, B:57:0x0173, B:59:0x0177, B:61:0x0181, B:63:0x0185, B:65:0x018d, B:67:0x01af, B:69:0x01bb, B:72:0x01cc, B:74:0x01d7), top: B:163:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:157:0x043b A[Catch: Exception -> 0x0054, TRY_LEAVE, TryCatch #0 {Exception -> 0x0054, blocks: (B:16:0x004e, B:103:0x0321, B:105:0x0332, B:109:0x0340, B:113:0x0392, B:114:0x03ae, B:116:0x03b9, B:123:0x03cd, B:126:0x03d5, B:132:0x03e4, B:134:0x03ee, B:139:0x03fa, B:155:0x042e, B:157:0x043b, B:145:0x040e, B:147:0x0418, B:152:0x0424, B:125:0x03d3, B:118:0x03be, B:120:0x03c6, B:108:0x033a, B:23:0x0073, B:91:0x02c7, B:93:0x02cd, B:96:0x02d9, B:99:0x02e2, B:104:0x0326, B:26:0x008f, B:87:0x02a0, B:29:0x00a2, B:78:0x021a, B:80:0x0226, B:82:0x023c, B:83:0x027c, B:43:0x0101, B:45:0x011d, B:46:0x0137, B:48:0x013d, B:50:0x0145, B:52:0x014b, B:55:0x0161, B:57:0x0173, B:59:0x0177, B:61:0x0181, B:63:0x0185, B:65:0x018d, B:67:0x01af, B:69:0x01bb, B:72:0x01cc, B:74:0x01d7), top: B:163:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0299  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x029b  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x02be  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x02bf  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(h0 h0Var, ContinuationImpl continuationImpl) {
        e0 e0Var;
        String strA;
        Location locationO;
        String str;
        Location location;
        Object objB;
        String str2;
        h0 h0Var2;
        c cVar;
        String str3;
        Object objC;
        c cVar2;
        String str4;
        Location location2;
        List list;
        List list2;
        a40.k kVar;
        List list3;
        a40.w wVarA;
        Object objA;
        List list4;
        a40.k kVar2;
        long jCurrentTimeMillis;
        LocalDate localDate;
        long jLongValue;
        long jLongValue2;
        s sVar;
        s sVar2;
        u uVarB;
        u uVar;
        k0 k0Var;
        k0 k0Var2;
        String strA2;
        String strA3;
        h0 h0Var3 = h0Var;
        LocationManager locationManager = h0Var3.f70977c;
        Context context = h0Var3.f70975a;
        if (continuationImpl instanceof e0) {
            e0Var = (e0) continuationImpl;
            int i5 = e0Var.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e0Var.A = i5 - Integer.MIN_VALUE;
            } else {
                e0Var = new e0(h0Var3, continuationImpl);
            }
        }
        Object obj = e0Var.f70939y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = e0Var.A;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                Object systemService = context.getSystemService("connectivity");
                Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
                ConnectivityManager connectivityManager = (ConnectivityManager) systemService;
                mc0.b bVar = mc0.d.f76206a;
                LocalTime localTimeNow = LocalTime.now();
                NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
                bVar.m("fetchWeatherAccuWeather %s connectivity %s", localTimeNow, activeNetworkInfo != null ? Boolean.valueOf(activeNetworkInfo.isConnected()) : null);
                NetworkInfo activeNetworkInfo2 = connectivityManager.getActiveNetworkInfo();
                if (activeNetworkInfo2 == null || !activeNetworkInfo2.isConnected() || context.checkSelfPermission("android.permission.INTERNET") != 0) {
                    bVar.n("No internet connection, cannot fetch weather", new Object[0]);
                    x.Companion.getClass();
                    return x.f71082l;
                }
                a40.a aVar = a40.b.f189a;
                Locale locale = Locale.getDefault();
                aVar.getClass();
                strA = a40.a.a(locale);
                y2.f51877a.getClass();
                c cVar3 = (c) y2.C1().l();
                c.Companion.getClass();
                c cVar4 = c.f70909h;
                if (!Intrinsics.b(cVar3, cVar4)) {
                    location = new Location(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                    location.setLatitude(cVar3.f70914e);
                    location.setLongitude(cVar3.f70915f);
                    h0Var3.f70980f = new Pair(location, cVar3);
                    c cVar5 = (c) h0Var3.f70980f.f71684b;
                    a40.b bVarD = h0Var3.d();
                    String str5 = cVar5.f70910a;
                    e0Var.f70934t = h0Var3;
                    e0Var.f70935u = strA;
                    e0Var.f70936v = location;
                    e0Var.f70937w = cVar5;
                    e0Var.A = 2;
                    objB = bVarD.b(str5, strA, true, e0Var);
                    if (objB == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    str2 = strA;
                    obj = objB;
                    h0Var2 = h0Var3;
                    cVar = cVar5;
                    List list5 = (List) obj;
                    a40.b bVarD2 = h0Var2.d();
                    String str6 = cVar.f70910a;
                    e0Var.f70934t = h0Var2;
                    e0Var.f70935u = str2;
                    e0Var.f70936v = location;
                    e0Var.f70937w = cVar;
                    e0Var.f70938x = list5;
                    e0Var.A = 3;
                    objC = bVarD2.c(str6, str2, e0Var);
                    if (objC != coroutineSingletons) {
                    }
                } else {
                    if (j10.m.i(context)) {
                        x.Companion.getClass();
                        return x.f71082l;
                    }
                    locationO = lm.e.o(context);
                    if (locationO == null) {
                        Location location3 = h0Var3.f70989q;
                        Criteria criteria = new Criteria();
                        criteria.setHorizontalAccuracy(2);
                        criteria.setCostAllowed(false);
                        String bestProvider = locationManager.getBestProvider(criteria, true);
                        if (bestProvider == null) {
                            bestProvider = "gps";
                        }
                        u4.b.a(locationManager, bestProvider, h0Var3.f70983i, ya.j.f97146a, new z(h0Var3));
                        locationO = location3;
                    }
                    if (locationO == null) {
                        NovaLauncher novaLauncher = NovaLauncher.f45649u1;
                        Boolean boolValueOf = novaLauncher != null ? Boolean.valueOf(novaLauncher.a0()) : null;
                        NovaLauncher novaLauncher2 = NovaLauncher.f45649u1;
                        bVar.n("Couldn't fetch location using DEFAULT " + boolValueOf + " " + (novaLauncher2 != null ? Boolean.valueOf(novaLauncher2.f79930t) : null), new Object[0]);
                        x.Companion.getClass();
                        return x.f71082l;
                    }
                    h0Var3.f70989q = locationO;
                    if (!Intrinsics.b(h0Var3.f70980f.f71684b, cVar4) && locationO.distanceTo((Location) h0Var3.f70980f.f71683a) <= 1000.0f) {
                        bVar.h("using cached location", new Object[0]);
                        location = locationO;
                        c cVar52 = (c) h0Var3.f70980f.f71684b;
                        a40.b bVarD3 = h0Var3.d();
                        String str52 = cVar52.f70910a;
                        e0Var.f70934t = h0Var3;
                        e0Var.f70935u = strA;
                        e0Var.f70936v = location;
                        e0Var.f70937w = cVar52;
                        e0Var.A = 2;
                        objB = bVarD3.b(str52, strA, true, e0Var);
                        if (objB == coroutineSingletons) {
                        }
                    }
                    bVar.h("requesting location key...", new Object[0]);
                    a40.b bVarD4 = h0Var3.d();
                    String str7 = String.format(Locale.US, "%.2f,%.2f", Arrays.copyOf(new Object[]{new Double(locationO.getLatitude()), new Double(locationO.getLongitude())}, 2));
                    e0Var.f70934t = h0Var3;
                    e0Var.f70935u = strA;
                    e0Var.f70936v = locationO;
                    e0Var.A = 1;
                    Object objE = bVarD4.e(str7, strA, e0Var);
                    if (objE == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    str = strA;
                    obj = objE;
                }
            } else if (i11 == 1) {
                Location location4 = (Location) e0Var.f70936v;
                str = (String) e0Var.f70935u;
                h0 h0Var4 = (h0) e0Var.f70934t;
                ResultKt.b(obj);
                locationO = location4;
                h0Var3 = h0Var4;
            } else if (i11 == 2) {
                cVar = (c) e0Var.f70937w;
                location = (Location) e0Var.f70936v;
                String str8 = (String) e0Var.f70935u;
                h0 h0Var5 = (h0) e0Var.f70934t;
                ResultKt.b(obj);
                h0Var2 = h0Var5;
                str2 = str8;
                List list52 = (List) obj;
                a40.b bVarD22 = h0Var2.d();
                String str62 = cVar.f70910a;
                e0Var.f70934t = h0Var2;
                e0Var.f70935u = str2;
                e0Var.f70936v = location;
                e0Var.f70937w = cVar;
                e0Var.f70938x = list52;
                e0Var.A = 3;
                objC = bVarD22.c(str62, str2, e0Var);
                if (objC != coroutineSingletons) {
                    return coroutineSingletons;
                }
                cVar2 = cVar;
                str4 = str2;
                location2 = location;
                list = list52;
                obj = objC;
                list2 = (List) obj;
                if (cVar2.f70916g) {
                    a40.b bVarD5 = h0Var2.d();
                    String str9 = String.format(Locale.US, "%.2f,%.2f", Arrays.copyOf(new Object[]{new Double(location2.getLatitude()), new Double(location2.getLongitude())}, 2));
                    e0Var.f70934t = location2;
                    e0Var.f70935u = cVar2;
                    e0Var.f70936v = list;
                    e0Var.f70937w = list2;
                    kVar = null;
                    e0Var.f70938x = null;
                    e0Var.A = 4;
                    objA = bVarD5.a(str9, str4, e0Var);
                    if (objA != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                kVar = null;
                a40.w.Companion.getClass();
                list3 = list2;
                wVarA = a40.v.a();
                if (!list.isEmpty()) {
                }
                mc0.d.f76206a.m("currentConditions " + kVar2 + "\nminutecast " + wVarA, new Object[0]);
                jCurrentTimeMillis = System.currentTimeMillis();
                localDate = Instant.ofEpochMilli(jCurrentTimeMillis).atZone(ZoneId.systemDefault()).toLocalDate();
                Pair pairC = py.f.c(location2, localDate);
                Object obj2 = pairC.f71684b;
                Object obj3 = pairC.f71683a;
                jLongValue = ((Number) obj3).longValue() - jCurrentTimeMillis;
                jLongValue2 = ((Number) obj2).longValue() - jCurrentTimeMillis;
                if (jLongValue < 0) {
                }
                if (Math.abs(jLongValue) > 300000) {
                }
                sVar = sVar2;
                if (kVar2 == null) {
                }
                uVar = u.f71064d;
                if (uVarB != uVar) {
                }
                if (kVar2 != null) {
                }
            } else if (i11 == 3) {
                List list6 = e0Var.f70938x;
                c cVar6 = (c) e0Var.f70937w;
                Location location5 = (Location) e0Var.f70936v;
                String str10 = (String) e0Var.f70935u;
                h0Var2 = (h0) e0Var.f70934t;
                ResultKt.b(obj);
                list = list6;
                str4 = str10;
                location2 = location5;
                cVar2 = cVar6;
                list2 = (List) obj;
                if (cVar2.f70916g && location2.getLatitude() != 0.0d && location2.getLongitude() != 0.0d) {
                    a40.b bVarD52 = h0Var2.d();
                    String str92 = String.format(Locale.US, "%.2f,%.2f", Arrays.copyOf(new Object[]{new Double(location2.getLatitude()), new Double(location2.getLongitude())}, 2));
                    e0Var.f70934t = location2;
                    e0Var.f70935u = cVar2;
                    e0Var.f70936v = list;
                    e0Var.f70937w = list2;
                    kVar = null;
                    e0Var.f70938x = null;
                    e0Var.A = 4;
                    objA = bVarD52.a(str92, str4, e0Var);
                    if (objA != coroutineSingletons) {
                        obj = objA;
                        list4 = list2;
                        wVarA = (a40.w) obj;
                        list3 = list4;
                        if (!list.isEmpty()) {
                        }
                        mc0.d.f76206a.m("currentConditions " + kVar2 + "\nminutecast " + wVarA, new Object[0]);
                        jCurrentTimeMillis = System.currentTimeMillis();
                        localDate = Instant.ofEpochMilli(jCurrentTimeMillis).atZone(ZoneId.systemDefault()).toLocalDate();
                        Pair pairC2 = py.f.c(location2, localDate);
                        Object obj22 = pairC2.f71684b;
                        Object obj32 = pairC2.f71683a;
                        jLongValue = ((Number) obj32).longValue() - jCurrentTimeMillis;
                        jLongValue2 = ((Number) obj22).longValue() - jCurrentTimeMillis;
                        if (jLongValue < 0) {
                            Pair pairC3 = py.f.c(location2, localDate.plusDays(1L));
                            jLongValue = ((Number) pairC3.f71683a).longValue() - jCurrentTimeMillis;
                            jLongValue2 = ((Number) pairC3.f71684b).longValue() - jCurrentTimeMillis;
                        }
                        if (Math.abs(jLongValue) > 300000) {
                        }
                        sVar = sVar2;
                        if (kVar2 == null) {
                        }
                        uVar = u.f71064d;
                        if (uVarB != uVar) {
                        }
                        if (kVar2 != null) {
                        }
                    }
                    return coroutineSingletons;
                }
                kVar = null;
                a40.w.Companion.getClass();
                list3 = list2;
                wVarA = a40.v.a();
                if (!list.isEmpty()) {
                }
                mc0.d.f76206a.m("currentConditions " + kVar2 + "\nminutecast " + wVarA, new Object[0]);
                jCurrentTimeMillis = System.currentTimeMillis();
                localDate = Instant.ofEpochMilli(jCurrentTimeMillis).atZone(ZoneId.systemDefault()).toLocalDate();
                Pair pairC22 = py.f.c(location2, localDate);
                Object obj222 = pairC22.f71684b;
                Object obj322 = pairC22.f71683a;
                jLongValue = ((Number) obj322).longValue() - jCurrentTimeMillis;
                jLongValue2 = ((Number) obj222).longValue() - jCurrentTimeMillis;
                if (jLongValue < 0) {
                }
                if (Math.abs(jLongValue) > 300000) {
                }
                sVar = sVar2;
                if (kVar2 == null) {
                }
                uVar = u.f71064d;
                if (uVarB != uVar) {
                }
                if (kVar2 != null) {
                }
            } else {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                list4 = (List) e0Var.f70937w;
                list = (List) e0Var.f70936v;
                cVar2 = (c) e0Var.f70935u;
                location2 = (Location) e0Var.f70934t;
                ResultKt.b(obj);
                kVar = null;
                wVarA = (a40.w) obj;
                list3 = list4;
                kVar2 = !list.isEmpty() ? kVar : (a40.k) b70.g.W0(list);
                mc0.d.f76206a.m("currentConditions " + kVar2 + "\nminutecast " + wVarA, new Object[0]);
                jCurrentTimeMillis = System.currentTimeMillis();
                localDate = Instant.ofEpochMilli(jCurrentTimeMillis).atZone(ZoneId.systemDefault()).toLocalDate();
                Pair pairC222 = py.f.c(location2, localDate);
                Object obj2222 = pairC222.f71684b;
                Object obj3222 = pairC222.f71683a;
                jLongValue = ((Number) obj3222).longValue() - jCurrentTimeMillis;
                jLongValue2 = ((Number) obj2222).longValue() - jCurrentTimeMillis;
                if (jLongValue < 0 && jLongValue2 < 0) {
                    Pair pairC32 = py.f.c(location2, localDate.plusDays(1L));
                    jLongValue = ((Number) pairC32.f71683a).longValue() - jCurrentTimeMillis;
                    jLongValue2 = ((Number) pairC32.f71684b).longValue() - jCurrentTimeMillis;
                }
                if (Math.abs(jLongValue) > 300000) {
                    sVar2 = s.f71057a;
                } else {
                    if (Math.abs(jLongValue2) > 300000) {
                        sVar = kVar;
                        if (kVar2 == null || (uVarB = kVar2.b()) == null) {
                            uVarB = u.f71064d;
                        }
                        uVar = u.f71064d;
                        if (uVarB != uVar) {
                            k0Var = kVar;
                        } else {
                            if (jLongValue <= 0 || jLongValue > 900000) {
                                if (jLongValue2 > 0 && jLongValue2 <= 900000) {
                                    k0Var2 = new k0(uVar, ((Number) obj2222).longValue(), (kVar2 == null || (strA2 = kVar2.a()) == null) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strA2, s.f71059c);
                                }
                                k0Var = kVar;
                            } else {
                                k0Var2 = new k0(uVar, ((Number) obj3222).longValue(), (kVar2 == null || (strA3 = kVar2.a()) == null) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strA3, s.f71057a);
                            }
                            k0Var = k0Var2;
                        }
                        if (kVar2 != null) {
                            return kVar2.c(list3, wVarA, cVar2.f70911b, k0Var, sVar);
                        }
                        x.Companion.getClass();
                        return x.f71082l;
                    }
                    sVar2 = s.f71059c;
                }
                sVar = sVar2;
                if (kVar2 == null) {
                    uVarB = u.f71064d;
                }
                uVar = u.f71064d;
                if (uVarB != uVar) {
                }
                if (kVar2 != null) {
                }
            }
            a40.t tVar = (a40.t) obj;
            String strX = lb0.b.x(tVar);
            if (tVar.c() != null) {
                str3 = ", " + lb0.b.y(tVar.c());
            } else {
                str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            h0Var3.f70980f = new Pair(locationO, new c(tVar.b(), strX + str3, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (float) locationO.getLatitude(), (float) locationO.getLongitude(), tVar.a().contains("MinuteCast")));
            strA = str;
            location = locationO;
            c cVar522 = (c) h0Var3.f70980f.f71684b;
            a40.b bVarD32 = h0Var3.d();
            String str522 = cVar522.f70910a;
            e0Var.f70934t = h0Var3;
            e0Var.f70935u = strA;
            e0Var.f70936v = location;
            e0Var.f70937w = cVar522;
            e0Var.A = 2;
            objB = bVarD32.b(str522, strA, true, e0Var);
            if (objB == coroutineSingletons) {
            }
        } catch (Exception e3) {
            mc0.d.f76206a.p(e3, "Error while fetching weather", new Object[0]);
            x.Companion.getClass();
            return x.f71082l;
        }
    }

    public final void b(Function1 function1) {
        if (!this.n) {
            h();
        }
        this.o.add(function1);
        function1.invoke(this.f70981g);
    }

    public final long c(x xVar) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        boolean zA = xVar.a();
        k0 k0Var = xVar.f71092j;
        if (!zA || this.f70981g.f71090h > jCurrentTimeMillis) {
            if (this.f70989q != null) {
                mc0.d.f76206a.h(b.c0.i(this.f70982h, "fetchAgainInMs not valid, location, ", " min"), new Object[0]);
                int i5 = this.f70982h;
                this.f70982h = i5 + 1;
                return i5 * 60000;
            }
            LocationManager locationManager = (LocationManager) this.f70975a.getSystemService(LocationManager.class);
            boolean z11 = locationManager.isProviderEnabled("gps") || locationManager.isProviderEnabled("network");
            mc0.d.f76206a.h(a2.c.l("fetchAgainInMs not valid, no location, NOW. ", z11), new Object[0]);
            if (!z11) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c;
            }
            this.f70982h = this.f70982h + 1;
            return r1 * r2 * 200;
        }
        Random.f71890a.getClass();
        AbstractPlatformRandom abstractPlatformRandom = Random.f71891b;
        long jI = abstractPlatformRandom.i(-550000L, 550000L) + 3300000;
        long j11 = jCurrentTimeMillis - this.f70981g.f71090h;
        if (j11 < 0) {
            j11 = 0;
        }
        long j12 = jI - j11;
        if (k0Var != null) {
            long jI2 = abstractPlatformRandom.i(-30000L, 30000L) + ((k0Var.a() - 300000) - jCurrentTimeMillis);
            long jI3 = abstractPlatformRandom.i(-30000L, 30000L) + ((k0Var.a() + 120000) - jCurrentTimeMillis);
            mc0.b bVar = mc0.d.f76206a;
            String strI = lm.e.i(j12);
            String strI2 = lm.e.i(jI2);
            String strI3 = lm.e.i(jI3);
            StringBuilder sbW = b.c0.w("Weather Pending, normal:", strI, " beforePending:", strI2, " afterPending:");
            sbW.append(strI3);
            bVar.h(sbW.toString(), new Object[0]);
            if (jI2 > 60000 && jI2 < j12) {
                bVar.h(b.c0.k("Weather Scheduling BEFORE pending ", lm.e.i(jI2)), new Object[0]);
                return jI2;
            }
            if (jI3 > 60000 && jI3 < j12) {
                bVar.h(b.c0.k("Weather Scheduling AFTER pending ", lm.e.i(jI3)), new Object[0]);
                return jI3;
            }
            bVar.h(b.c0.k("Weather Keeping normal schedule time ", lm.e.i(j12)), new Object[0]);
        }
        return j12;
    }

    public final a40.b d() {
        return (a40.b) this.f70986l.getValue();
    }

    public final Object e(x xVar, boolean z11, SuspendLambda suspendLambda) {
        if (xVar.a() || !this.f70981g.a() || new Date().getTime() - this.f70981g.f71090h > 10800000) {
            this.f70981g = xVar;
            w20.e0.c(new q4(28, b70.g.I1(this.o), xVar));
            if (z11) {
                a80.e eVar = y0.f88884a;
                Object objY = m0.y(a80.d.f488c, new f0(this, xVar, null), suspendLambda);
                return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
            }
        }
        return Unit.f71706a;
    }

    public final void f() {
        a80.e eVar = y0.f88884a;
        m0.t(this.f70984j, a80.d.f488c, null, new b0(this, null, 1), 2);
    }

    public final void g(Function1 function1) {
        LinkedHashSet linkedHashSet = this.o;
        linkedHashSet.remove(function1);
        if (linkedHashSet.isEmpty()) {
            mc0.d.f76206a.m("stopListening", new Object[0]);
            if (this.n) {
                this.n = false;
                try {
                    this.f70976b.unregisterNetworkCallback(this.f70987m);
                } catch (Exception e3) {
                    mc0.d.f76206a.p(e3, "Could not unregister Connectivity Listener", new Object[0]);
                }
            }
            g2 g2Var = this.f70978d;
            if (g2Var != null) {
                g2Var.c(null);
            }
            this.f70978d = null;
        }
        w4.d dVar = this.f70983i;
        if (dVar != null) {
            dVar.a();
        }
        this.f70983i = null;
    }

    public final void h() {
        if (this.f70979e && !this.n) {
            this.n = true;
            this.f70982h = 0;
            mc0.d.f76206a.m("startListening", new Object[0]);
            try {
                this.f70976b.registerNetworkCallback(new NetworkRequest.Builder().addCapability(12).build(), this.f70987m);
            } catch (SecurityException e3) {
                mc0.d.f76206a.p(e3, "Could not register Connectivity Listener. Xiaomi?", new Object[0]);
                i(c(this.f70981g));
            }
            this.f70983i = new w4.d();
        }
    }

    public final void i(long j11) {
        mc0.d.f76206a.i(new Throwable(), "scheduleFetch " + lm.e.i(j11) + " " + this.n, new Object[0]);
        int i5 = this.f70988p;
        this.f70988p = i5 + 1;
        g2 g2Var = this.f70978d;
        if (g2Var != null) {
            g2Var.c(null);
        }
        a80.e eVar = y0.f88884a;
        this.f70978d = m0.t(this.f70984j, a80.d.f488c, null, new g0(j11, i5, this, null), 2);
    }
}

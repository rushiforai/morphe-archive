package ads_mobile_sdk;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Rect;
import android.os.Build;
import android.os.Looper;
import android.view.WindowManager;
import b.k9;
import b.o2;
import b.sc;
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
import java.util.RandomAccess;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.text.Charsets;
import r70.i;
import t70.m0;

/* loaded from: classes2.dex */
public final class we {

    /* renamed from: a, reason: collision with root package name */
    public final Context f11230a;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f11231b;

    /* renamed from: c, reason: collision with root package name */
    public final fz f11232c;

    /* renamed from: d, reason: collision with root package name */
    public final hs f11233d;

    /* renamed from: e, reason: collision with root package name */
    public final jr0 f11234e;

    /* renamed from: g, reason: collision with root package name */
    public final b.y3 f11235g;

    /* renamed from: h, reason: collision with root package name */
    public final xj f11236h;

    /* renamed from: i, reason: collision with root package name */
    public final fi0 f11237i;

    /* renamed from: j, reason: collision with root package name */
    public final kv0 f11238j;

    public we(Context context, b41 initializationConfigWrapper, String afmaVersionString, String gmaVersion, o2 clock, fz consentManager, hs chromeVariationsProvider, jr0 flags, dj0 displayUtil, b.y3 userAgentProvider, xj appState, fi0 deviceTierManager) {
        Rect bounds;
        String str;
        PackageInfo packageInfo;
        Intrinsics.g(context, "context");
        Intrinsics.g(initializationConfigWrapper, "initializationConfigWrapper");
        Intrinsics.g(afmaVersionString, "afmaVersionString");
        Intrinsics.g(gmaVersion, "gmaVersion");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(consentManager, "consentManager");
        Intrinsics.g(chromeVariationsProvider, "chromeVariationsProvider");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(displayUtil, "displayUtil");
        Intrinsics.g(userAgentProvider, "userAgentProvider");
        Intrinsics.g(appState, "appState");
        Intrinsics.g(deviceTierManager, "deviceTierManager");
        this.f11230a = context;
        this.f11231b = clock;
        this.f11232c = consentManager;
        this.f11233d = chromeVariationsProvider;
        this.f11234e = flags;
        this.f11235g = userAgentProvider;
        this.f11236h = appState;
        this.f11237i = deviceTierManager;
        WindowManager windowManagerB = displayUtil.b(context);
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 30) {
            bounds = windowManagerB.getMaximumWindowMetrics().getBounds();
        } else {
            Rect rect = new Rect();
            windowManagerB.getDefaultDisplay().getRectSize(rect);
            bounds = rect;
        }
        Intrinsics.d(bounds);
        PackageManager packageManager = context.getPackageManager();
        String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        String str3 = (packageManager == null || (packageInfo = packageManager.getPackageInfo(context.getPackageName(), 128)) == null || (str3 = packageInfo.versionName) == null) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str3;
        b.c4 c4VarP = kv0.p();
        Intrinsics.f(c4VarP, "newBuilder(...)");
        c4VarP.b();
        ((kv0) c4VarP.f1095b).o("CUI_NAME_ANR_DETECTED");
        c4VarP.e();
        String value = Build.VERSION.RELEASE;
        Intrinsics.f(value, "RELEASE");
        Intrinsics.g(value, "value");
        c4VarP.b();
        ((kv0) c4VarP.f1095b).p(value);
        String value2 = Build.MODEL;
        Intrinsics.f(value2, "MODEL");
        Intrinsics.g(value2, "value");
        c4VarP.b();
        ((kv0) c4VarP.f1095b).j(value2);
        c4VarP.d(i5);
        c4VarP.b();
        ((kv0) c4VarP.f1095b).t(gmaVersion);
        c4VarP.b();
        ((kv0) c4VarP.f1095b).d(afmaVersionString);
        String packageName = context.getPackageName();
        Intrinsics.f(packageName, "getPackageName(...)");
        c4VarP.b();
        ((kv0) c4VarP.f1095b).f(packageName);
        c4VarP.b();
        ((kv0) c4VarP.f1095b).g(str3);
        x7.u uVarA = initializationConfigWrapper.a();
        if (uVarA != null && (str = (String) uVarA.f95208a) != null) {
            str2 = str;
        }
        c4VarP.b();
        ((kv0) c4VarP.f1095b).e(str2);
        String country = Locale.getDefault().getCountry();
        Intrinsics.f(country, "getCountry(...)");
        c4VarP.b();
        ((kv0) c4VarP.f1095b).i(country);
        int iWidth = bounds.width();
        c4VarP.b();
        ((kv0) c4VarP.f1095b).displayWidth_ = iWidth;
        int iHeight = bounds.height();
        c4VarP.b();
        ((kv0) c4VarP.f1095b).displayHeight_ = iHeight;
        this.f11238j = (kv0) c4VarP.a();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x04bb  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x04bf  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x0516  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0542  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x0559 A[LOOP:8: B:113:0x0553->B:115:0x0559, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:117:0x056f  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x021c  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0260  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x02a6 A[LOOP:1: B:65:0x02a0->B:67:0x02a6, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x02d5  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0301 A[LOOP:3: B:75:0x02fb->B:77:0x0301, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0384 A[LOOP:4: B:79:0x037e->B:81:0x0384, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x03b3  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x03df A[LOOP:6: B:89:0x03d9->B:91:0x03df, LOOP_END] */
    /* JADX WARN: Type inference failed for: r7v0, types: [kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r7v1, types: [ads_mobile_sdk.km1] */
    /* JADX WARN: Type inference failed for: r7v5 */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v7 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) throws NoSuchAlgorithmException {
        ve veVar;
        String str;
        ActivityManager.MemoryInfo memoryInfo;
        yr yrVar;
        th3 th3Var;
        we weVar;
        mi3 mi3Var;
        mv0 mv0Var;
        mv0 mv0Var2;
        th3 th3Var2;
        mv0 mv0Var3;
        mv0 mv0Var4;
        mv0 mv0Var5;
        mi3 mi3Var2;
        th3 th3Var3;
        we weVar2;
        String str2;
        Iterator it;
        RandomAccess randomAccess;
        Iterator it2;
        cc2 cc2VarE;
        wv0 wv0Var;
        km1 km1VarA;
        if (continuationImpl instanceof ve) {
            veVar = (ve) continuationImpl;
            int i5 = veVar.f10755k;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                veVar.f10755k = i5 - Integer.MIN_VALUE;
            } else {
                veVar = new ve(this, continuationImpl);
            }
        }
        Object objG = veVar.f10753i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = veVar.f10755k;
        int i12 = 1;
        ?? r72 = 0;
        r72 = 0;
        r72 = 0;
        if (i11 == 0) {
            ResultKt.b(objG);
            Thread thread = Looper.getMainLooper().getThread();
            Intrinsics.f(thread, "getThread(...)");
            StackTraceElement[] stackTrace = thread.getStackTrace();
            Intrinsics.f(stackTrace, "getStackTrace(...)");
            String value = kotlin.collections.c.O0(stackTrace, "\n", null, null, null, 62);
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                byte[] bytes = value.getBytes(Charsets.f72000b);
                Intrinsics.f(bytes, "getBytes(...)");
                messageDigest.update(bytes);
                StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
                str = String.format(Locale.US, "%032X", Arrays.copyOf(new Object[]{new BigInteger(1, messageDigest.digest())}, 1));
            } catch (Exception unused) {
                str = null;
            }
            if (str == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            Object systemService = this.f11230a.getSystemService("activity");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.app.ActivityManager");
            memoryInfo = new ActivityManager.MemoryInfo();
            ((ActivityManager) systemService).getMemoryInfo(memoryInfo);
            hs hsVar = this.f11233d;
            mg.l lVar = hsVar.f4503j;
            if (lVar == null) {
                m0.t(hsVar.f4496c, null, null, new ds(hsVar, r72, i12), 3);
            }
            yrVar = lVar != null ? (yr) lVar.f76310c : null;
            Thread thread2 = Looper.getMainLooper().getThread();
            Intrinsics.f(thread2, "getThread(...)");
            WeakHashMap weakHashMap = ji3.f5253a;
            synchronized (weakHashMap) {
                ii3 ii3Var = (ii3) weakHashMap.get(thread2);
                th3Var = ii3Var != null ? ii3Var.f4777a : null;
            }
            mi3 mi3Var3 = th3Var != null ? th3Var.f9923a : null;
            b.c4 c4Var = (b.c4) this.f11238j.n();
            mv0 mv0Var6 = new mv0(c4Var);
            this.f11231b.getClass();
            long jCurrentTimeMillis = System.currentTimeMillis();
            c4Var.b();
            ((kv0) c4Var.f1095b).timeMsec_ = jCurrentTimeMillis;
            Intrinsics.g(value, "value");
            c4Var.b();
            ((kv0) c4Var.f1095b).w(value);
            c4Var.b();
            ((kv0) c4Var.f1095b).v(str);
            fz fzVar = this.f11232c;
            veVar.f10745a = this;
            veVar.f10746b = memoryInfo;
            veVar.f10747c = yrVar;
            veVar.f10748d = th3Var;
            veVar.f10749e = mi3Var3;
            veVar.f10750f = mv0Var6;
            veVar.f10751g = mv0Var6;
            veVar.f10752h = mv0Var6;
            veVar.f10755k = 1;
            fzVar.getClass();
            objG = fz.g(fzVar, veVar);
            if (objG != coroutineSingletons) {
                weVar = this;
                mi3Var = mi3Var3;
                mv0Var = mv0Var6;
                mv0Var2 = mv0Var;
                th3Var2 = th3Var;
                mv0Var3 = mv0Var2;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            mv0Var4 = (mv0) veVar.f10749e;
            mv0Var5 = (mv0) veVar.f10748d;
            mi3Var2 = (mi3) veVar.f10747c;
            th3Var3 = (th3) veVar.f10746b;
            weVar2 = veVar.f10745a;
            ResultKt.b(objG);
            str2 = (String) objG;
            if (str2 != null) {
                mv0Var4.getClass();
                b.c4 c4Var2 = mv0Var4.f7336a;
                c4Var2.b();
                ((kv0) c4Var2.f1095b).z(str2);
            }
            Intrinsics.f(Collections.unmodifiableList(((kv0) mv0Var4.f7336a.f1095b).experimentId_), "getExperimentIdList(...)");
            List listI1 = r70.k.i1(weVar2.f11234e.f5357s.l(), new String[]{","}, 6);
            ArrayList arrayList = new ArrayList();
            it = listI1.iterator();
            while (it.hasNext()) {
                Long lV0 = i.v0((String) it.next());
                if (lV0 != null) {
                    arrayList.add(lV0);
                }
            }
            mv0Var4.f7336a.c(arrayList);
            int i13 = weVar2.f11236h.f11732a.f8726c;
            b.c4 c4Var3 = mv0Var4.f7336a;
            c4Var3.b();
            ((kv0) c4Var3.f1095b).liveWebviewCount_ = i13;
            ConcurrentHashMap concurrentHashMap = weVar2.f11236h.f11735d;
            LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(concurrentHashMap.size()));
            for (Map.Entry entry : concurrentHashMap.entrySet()) {
                linkedHashMap.put(entry.getKey(), Integer.valueOf(((AtomicInteger) entry.getValue()).get()));
            }
            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
            for (Map.Entry entry2 : linkedHashMap.entrySet()) {
                if (((Number) entry2.getValue()).intValue() > 0) {
                    linkedHashMap2.put(entry2.getKey(), entry2.getValue());
                }
            }
            for (Map.Entry entry3 : linkedHashMap2.entrySet()) {
                qw2 qw2Var = (qw2) entry3.getKey();
                int iIntValue = ((Number) entry3.getValue()).intValue();
                Intrinsics.f(Collections.unmodifiableList(((kv0) mv0Var4.f7336a.f1095b).loadedAdsStats_), "getLoadedAdsStatsList(...)");
                b.g3 g3VarO = gv0.o();
                Intrinsics.f(g3VarO, "newBuilder(...)");
                lm1 lm1VarH = k9.h(qw2Var);
                g3VarO.b();
                gv0 gv0Var = (gv0) g3VarO.f1095b;
                gv0Var.getClass();
                gv0Var.format_ = lm1VarH.getNumber();
                g3VarO.b();
                ((gv0) g3VarO.f1095b).count_ = iIntValue;
                gv0 gv0Var2 = (gv0) g3VarO.a();
                b.c4 c4Var4 = mv0Var4.f7336a;
                c4Var4.b();
                ((kv0) c4Var4.f1095b).a(gv0Var2);
            }
            ConcurrentHashMap concurrentHashMap2 = weVar2.f11236h.f11736e;
            LinkedHashMap linkedHashMap3 = new LinkedHashMap(b70.k.d0(concurrentHashMap2.size()));
            for (Map.Entry entry4 : concurrentHashMap2.entrySet()) {
                linkedHashMap3.put(entry4.getKey(), Integer.valueOf(((AtomicInteger) entry4.getValue()).get()));
            }
            LinkedHashMap linkedHashMap4 = new LinkedHashMap();
            for (Map.Entry entry5 : linkedHashMap3.entrySet()) {
                if (((Number) entry5.getValue()).intValue() > 0) {
                    linkedHashMap4.put(entry5.getKey(), entry5.getValue());
                }
            }
            for (Map.Entry entry6 : linkedHashMap4.entrySet()) {
                qw2 qw2Var2 = (qw2) entry6.getKey();
                int iIntValue2 = ((Number) entry6.getValue()).intValue();
                Intrinsics.f(Collections.unmodifiableList(((kv0) mv0Var4.f7336a.f1095b).showingAdsStats_), "getShowingAdsStatsList(...)");
                b.g3 g3VarO2 = gv0.o();
                Intrinsics.f(g3VarO2, "newBuilder(...)");
                lm1 lm1VarH2 = k9.h(qw2Var2);
                g3VarO2.b();
                gv0 gv0Var3 = (gv0) g3VarO2.f1095b;
                gv0Var3.getClass();
                gv0Var3.format_ = lm1VarH2.getNumber();
                g3VarO2.b();
                ((gv0) g3VarO2.f1095b).count_ = iIntValue2;
                gv0 gv0Var4 = (gv0) g3VarO2.a();
                b.c4 c4Var5 = mv0Var4.f7336a;
                c4Var5.b();
                ((kv0) c4Var5.f1095b).b(gv0Var4);
            }
            Object obj = weVar2.f11237i.f3358b.get();
            Intrinsics.f(obj, "get(...)");
            b.c4 c4Var6 = mv0Var4.f7336a;
            c4Var6.b();
            kv0 kv0Var = (kv0) c4Var6.f1095b;
            kv0Var.getClass();
            kv0Var.deviceAdvertisedMemTier_ = ((ph0) obj).getNumber();
            Object obj2 = weVar2.f11237i.f3359c.get();
            Intrinsics.f(obj2, "get(...)");
            b.c4 c4Var7 = mv0Var4.f7336a;
            c4Var7.b();
            kv0 kv0Var2 = (kv0) c4Var7.f1095b;
            kv0Var2.getClass();
            kv0Var2.deviceAvailableProcessorTier_ = ((rh0) obj2).getNumber();
            qh0 value2 = weVar2.f11237i.a();
            Intrinsics.g(value2, "value");
            b.c4 c4Var8 = mv0Var4.f7336a;
            c4Var8.b();
            kv0 kv0Var3 = (kv0) c4Var8.f1095b;
            kv0Var3.getClass();
            kv0Var3.deviceAvailableMemoryTier_ = value2.getNumber();
            if (th3Var3 != null && (cc2VarE = th3Var3.e()) != null && (wv0Var = cc2VarE.f1789c) != null) {
                km1VarA = km1.a(wv0Var.getNumber());
                r72 = km1VarA;
                if (km1VarA == null) {
                    r72 = km1.CUI_NAME_UNKNOWN;
                }
            }
            if (r72 != 0) {
                b.c4 c4Var9 = mv0Var4.f7336a;
                c4Var9.b();
                kv0 kv0Var4 = (kv0) c4Var9.f1095b;
                kv0Var4.getClass();
                kv0Var4.activeCui_ = r72.getNumber();
            }
            kv0 kv0Var5 = (kv0) mv0Var4.f7336a.f1095b;
            kv0Var5.getClass();
            new com.google.android.gms.internal.measurement.v1(1, kv0Var5.activeCuiStack_, kv0.activeCuiStack_converter_);
            b.c4 c4Var10 = mv0Var4.f7336a;
            c4Var10.b();
            kv0 kv0Var6 = (kv0) c4Var10.f1095b;
            kv0Var6.getClass();
            kv0Var6.activeCuiStack_ = jb1.f5202e;
            kv0 kv0Var7 = (kv0) mv0Var4.f7336a.f1095b;
            kv0Var7.getClass();
            new com.google.android.gms.internal.measurement.v1(1, kv0Var7.activeCuiStack_, kv0.activeCuiStack_converter_);
            ArrayList arrayList2 = new ArrayList();
            while (th3Var3 != null) {
                km1 km1VarA2 = km1.a(th3Var3.e().f1789c.getNumber());
                if (km1VarA2 == null) {
                    km1VarA2 = km1.CUI_NAME_UNKNOWN;
                }
                arrayList2.add(km1VarA2);
                th3Var3 = th3Var3.f9924b;
            }
            b.c4 c4Var11 = mv0Var4.f7336a;
            c4Var11.b();
            kv0 kv0Var8 = (kv0) c4Var11.f1095b;
            randomAccess = kv0Var8.activeCuiStack_;
            if (!((j) randomAccess).f5068a) {
                jb1 jb1Var = (jb1) randomAccess;
                kv0Var8.activeCuiStack_ = jb1Var.a(jb1Var.f5204c * 2);
            }
            it2 = arrayList2.iterator();
            while (it2.hasNext()) {
                ((jb1) kv0Var8.activeCuiStack_).b(((km1) it2.next()).getNumber());
            }
            if (mi3Var2 != null) {
                k9.w(mv0Var4, mi3Var2);
            }
            return (kv0) mv0Var5.f7336a.a();
        }
        mv0Var = veVar.f10752h;
        mv0Var3 = veVar.f10751g;
        mv0Var2 = veVar.f10750f;
        mi3Var = (mi3) veVar.f10749e;
        th3Var2 = (th3) veVar.f10748d;
        yrVar = (yr) veVar.f10747c;
        memoryInfo = (ActivityManager.MemoryInfo) veVar.f10746b;
        weVar = veVar.f10745a;
        ResultKt.b(objG);
        String str3 = (String) objG;
        if (str3 == null) {
            str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        mv0Var.getClass();
        b.c4 c4Var12 = mv0Var.f7336a;
        c4Var12.b();
        ((kv0) c4Var12.f1095b).u(str3);
        int iAvailableProcessors = Runtime.getRuntime().availableProcessors();
        b.c4 c4Var13 = mv0Var3.f7336a;
        c4Var13.b();
        ((kv0) c4Var13.f1095b).totalCpu_ = iAvailableProcessors;
        long j11 = memoryInfo.totalMem;
        b.c4 c4Var14 = mv0Var3.f7336a;
        c4Var14.b();
        ((kv0) c4Var14.f1095b).totalMemoryBytes_ = j11;
        long j12 = memoryInfo.availMem;
        b.c4 c4Var15 = mv0Var3.f7336a;
        c4Var15.b();
        ((kv0) c4Var15.f1095b).availableMemoryBytes_ = j12;
        long j13 = memoryInfo.threshold;
        b.c4 c4Var16 = mv0Var3.f7336a;
        c4Var16.b();
        ((kv0) c4Var16.f1095b).thresholdMemoryBytes_ = j13;
        boolean z11 = memoryInfo.lowMemory;
        b.c4 c4Var17 = mv0Var3.f7336a;
        c4Var17.b();
        ((kv0) c4Var17.f1095b).lowMemory_ = z11;
        if (yrVar == null) {
            sc scVarO = yr.o();
            Intrinsics.f(scVarO, "newBuilder(...)");
            yrVar = (yr) scVarO.a();
        }
        b.c4 c4Var18 = mv0Var3.f7336a;
        c4Var18.b();
        ((kv0) c4Var18.f1095b).a(yrVar);
        b.y3 y3Var = weVar.f11235g;
        veVar.f10745a = weVar;
        veVar.f10746b = th3Var2;
        veVar.f10747c = mi3Var;
        veVar.f10748d = mv0Var2;
        veVar.f10749e = mv0Var3;
        veVar.f10750f = null;
        veVar.f10751g = null;
        veVar.f10752h = null;
        veVar.f10755k = 2;
        y3Var.getClass();
        objG = b.y3.a(y3Var, veVar);
        if (objG != coroutineSingletons) {
            mv0Var4 = mv0Var3;
            mv0Var5 = mv0Var2;
            mi3Var2 = mi3Var;
            th3Var3 = th3Var2;
            weVar2 = weVar;
            str2 = (String) objG;
            if (str2 != null) {
            }
            Intrinsics.f(Collections.unmodifiableList(((kv0) mv0Var4.f7336a.f1095b).experimentId_), "getExperimentIdList(...)");
            List listI12 = r70.k.i1(weVar2.f11234e.f5357s.l(), new String[]{","}, 6);
            ArrayList arrayList3 = new ArrayList();
            it = listI12.iterator();
            while (it.hasNext()) {
            }
            mv0Var4.f7336a.c(arrayList3);
            int i132 = weVar2.f11236h.f11732a.f8726c;
            b.c4 c4Var32 = mv0Var4.f7336a;
            c4Var32.b();
            ((kv0) c4Var32.f1095b).liveWebviewCount_ = i132;
            ConcurrentHashMap concurrentHashMap3 = weVar2.f11236h.f11735d;
            LinkedHashMap linkedHashMap5 = new LinkedHashMap(b70.k.d0(concurrentHashMap3.size()));
            while (r0.hasNext()) {
            }
            LinkedHashMap linkedHashMap22 = new LinkedHashMap();
            while (r5.hasNext()) {
            }
            while (r0.hasNext()) {
            }
            ConcurrentHashMap concurrentHashMap22 = weVar2.f11236h.f11736e;
            LinkedHashMap linkedHashMap32 = new LinkedHashMap(b70.k.d0(concurrentHashMap22.size()));
            while (r0.hasNext()) {
            }
            LinkedHashMap linkedHashMap42 = new LinkedHashMap();
            while (r5.hasNext()) {
            }
            while (r0.hasNext()) {
            }
            Object obj3 = weVar2.f11237i.f3358b.get();
            Intrinsics.f(obj3, "get(...)");
            b.c4 c4Var62 = mv0Var4.f7336a;
            c4Var62.b();
            kv0 kv0Var9 = (kv0) c4Var62.f1095b;
            kv0Var9.getClass();
            kv0Var9.deviceAdvertisedMemTier_ = ((ph0) obj3).getNumber();
            Object obj22 = weVar2.f11237i.f3359c.get();
            Intrinsics.f(obj22, "get(...)");
            b.c4 c4Var72 = mv0Var4.f7336a;
            c4Var72.b();
            kv0 kv0Var22 = (kv0) c4Var72.f1095b;
            kv0Var22.getClass();
            kv0Var22.deviceAvailableProcessorTier_ = ((rh0) obj22).getNumber();
            qh0 value22 = weVar2.f11237i.a();
            Intrinsics.g(value22, "value");
            b.c4 c4Var82 = mv0Var4.f7336a;
            c4Var82.b();
            kv0 kv0Var32 = (kv0) c4Var82.f1095b;
            kv0Var32.getClass();
            kv0Var32.deviceAvailableMemoryTier_ = value22.getNumber();
            if (th3Var3 != null) {
                km1VarA = km1.a(wv0Var.getNumber());
                r72 = km1VarA;
                if (km1VarA == null) {
                }
            }
            if (r72 != 0) {
            }
            kv0 kv0Var52 = (kv0) mv0Var4.f7336a.f1095b;
            kv0Var52.getClass();
            new com.google.android.gms.internal.measurement.v1(1, kv0Var52.activeCuiStack_, kv0.activeCuiStack_converter_);
            b.c4 c4Var102 = mv0Var4.f7336a;
            c4Var102.b();
            kv0 kv0Var62 = (kv0) c4Var102.f1095b;
            kv0Var62.getClass();
            kv0Var62.activeCuiStack_ = jb1.f5202e;
            kv0 kv0Var72 = (kv0) mv0Var4.f7336a.f1095b;
            kv0Var72.getClass();
            new com.google.android.gms.internal.measurement.v1(1, kv0Var72.activeCuiStack_, kv0.activeCuiStack_converter_);
            ArrayList arrayList22 = new ArrayList();
            while (th3Var3 != null) {
            }
            b.c4 c4Var112 = mv0Var4.f7336a;
            c4Var112.b();
            kv0 kv0Var82 = (kv0) c4Var112.f1095b;
            randomAccess = kv0Var82.activeCuiStack_;
            if (!((j) randomAccess).f5068a) {
            }
            it2 = arrayList22.iterator();
            while (it2.hasNext()) {
            }
            if (mi3Var2 != null) {
            }
            return (kv0) mv0Var5.f7336a.a();
        }
        return coroutineSingletons;
    }
}

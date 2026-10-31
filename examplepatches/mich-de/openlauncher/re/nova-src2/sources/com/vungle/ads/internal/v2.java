package com.vungle.ads.internal;

import android.content.Context;
import android.os.Handler;
import b.u4;
import com.vungle.ads.InitializationListener;
import com.vungle.ads.InvalidAppId;
import com.vungle.ads.OutOfMemory;
import com.vungle.ads.SdkVersionTooLow;
import com.vungle.ads.VungleError;
import com.vungle.ads.internal.network.VungleApiClient;
import com.vungle.ads.internal.persistence.FilePreferences;
import com.vungle.ads.internal.privacy.PrivacyManager;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.util.PathProvider;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.Json;

/* loaded from: classes4.dex */
public final class v2 {

    /* renamed from: a, reason: collision with root package name */
    public AtomicBoolean f47724a = new AtomicBoolean(false);

    /* renamed from: b, reason: collision with root package name */
    public AtomicBoolean f47725b = new AtomicBoolean(false);

    /* renamed from: c, reason: collision with root package name */
    public final CopyOnWriteArrayList f47726c = new CopyOnWriteArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final l2 f47727d = new l2(Sdk.SDKMetric.SDKMetricType.INIT_TO_SUCCESS_CALLBACK_DURATION_MS);

    public final void a(Context context, String appId, InitializationListener initializationCallback) {
        Intrinsics.g(appId, "appId");
        Intrinsics.g(context, "context");
        Intrinsics.g(initializationCallback, "initializationCallback");
        AnalyticsClient.a(AnalyticsClient.INSTANCE, new k2(Sdk.SDKMetric.SDKMetricType.SDK_INIT_API), (com.vungle.ads.internal.util.s) null, 6);
        this.f47727d.e();
        this.f47726c.add(initializationCallback);
        if (!r70.k.U0(appId)) {
            for (int i5 = 0; i5 < appId.length(); i5++) {
                char cCharAt = appId.charAt(i5);
                if (Character.isLetterOrDigit(cCharAt) || cCharAt == '.') {
                }
            }
            if (com.vungle.ads.internal.util.z.a()) {
                boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.b("VungleInitializer", "Init: SDK is supported only for API versions 25 and above.");
                a(new SdkVersionTooLow("Init: SDK is supported only for API versions 25 and above.").logError$vungle_ads_release());
                return;
            }
            ConfigManager.INSTANCE.getClass();
            ConfigManager.b(appId);
            if (this.f47724a.get()) {
                boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("VungleInitializer", "init already complete");
                b();
                return;
            } else if (this.f47725b.getAndSet(true)) {
                boolean z13 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("VungleInitializer", "init already in progress");
                return;
            } else {
                LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71679a;
                ((com.vungle.ads.internal.executor.d) ((com.vungle.ads.internal.executor.a) LazyKt.b(lazyThreadSafetyMode, new q2(context)).getValue())).b().a(new c40.e(this, context, appId, LazyKt.b(lazyThreadSafetyMode, new r2(context)), 0), new aa.x(this, 15));
                return;
            }
        }
        StringBuilder sbK = u4.k("App id invalid: ", appId, ", package name: ");
        sbK.append(context.getPackageName());
        a(new InvalidAppId(sbK.toString()).logError$vungle_ads_release());
    }

    public final void b() throws Throwable {
        this.f47725b.set(false);
        this.f47727d.a(Sdk.SDKMetric.SDKMetricType.INIT_TO_SUCCESS_CALLBACK_DURATION_MS);
        this.f47727d.d();
        AnalyticsClient.a(AnalyticsClient.INSTANCE, this.f47727d, (com.vungle.ads.internal.util.s) null, 6);
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("onSuccess ");
        sbA.append(Thread.currentThread().getId());
        com.vungle.ads.internal.util.t.a("VungleInitializer", sbA.toString());
        Handler handler = com.vungle.ads.internal.util.y.f47718a;
        com.vungle.ads.internal.util.y.a(new u2(this));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v10, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r10v14, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r10v9, types: [kotlin.collections.EmptyList] */
    public static final void a(v2 this$0, Context context, String appId, Lazy vungleApiClient$delegate) {
        boolean z11;
        ?? arrayList;
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(context, "$context");
        Intrinsics.g(appId, "$appId");
        Intrinsics.g(vungleApiClient$delegate, "$vungleApiClient$delegate");
        boolean z12 = o4.a.a(context, "android.permission.ACCESS_NETWORK_STATE") == 0;
        boolean z13 = o4.a.a(context, "android.permission.INTERNET") == 0;
        if (z12 && z13) {
            PrivacyManager.INSTANCE.a(context);
            ((VungleApiClient) vungleApiClient$delegate.getValue()).c(appId);
            try {
                LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71679a;
                Lazy lazyB = LazyKt.b(lazyThreadSafetyMode, new m2(context));
                ConfigManager configManager = ConfigManager.INSTANCE;
                FilePreferences filePreferences = (FilePreferences) lazyB.getValue();
                configManager.getClass();
                com.vungle.ads.internal.model.w2 w2VarA = ConfigManager.a(filePreferences, appId);
                if (w2VarA != null) {
                    configManager.a(context, w2VarA, q0.INIT_CACHED, null);
                    ConfigManager.c();
                    z11 = true;
                } else {
                    z11 = false;
                }
                File[] fileArrListFiles = ((PathProvider) LazyKt.b(lazyThreadSafetyMode, new n2(context)).getValue()).getVmDir().listFiles();
                if (fileArrListFiles != null) {
                    ArrayList arrayList2 = new ArrayList();
                    for (File file : fileArrListFiles) {
                        if (file.isDirectory()) {
                            arrayList2.add(file);
                        }
                    }
                    arrayList = new ArrayList(b70.c.u0(arrayList2, 10));
                    Iterator it = arrayList2.iterator();
                    while (it.hasNext()) {
                        arrayList.add(((File) it.next()).getName());
                    }
                } else {
                    arrayList = EmptyList.f71733a;
                }
                Lazy lazyB2 = LazyKt.b(LazyThreadSafetyMode.f71679a, new o2(context));
                boolean z14 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("VungleInitializer", "Running cleanup jobs.");
                ((com.vungle.ads.internal.task.r) ((com.vungle.ads.internal.task.g) lazyB2.getValue())).a(com.vungle.ads.internal.task.a.a(null, arrayList, 1));
                this$0.f47724a.set(true);
                this$0.b();
                a(context);
                if (z11) {
                    return;
                }
                ConfigManager configManager2 = ConfigManager.INSTANCE;
                p2 p2Var = new p2(this$0, context);
                configManager2.getClass();
                ConfigManager.a(context, p2Var);
                return;
            } catch (Throwable th2) {
                boolean z15 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("VungleInitializer", "Cannot get config", th2);
                return;
            }
        }
        boolean z16 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.b("VungleInitializer", "Network permissions not granted");
        Handler handler = com.vungle.ads.internal.util.y.f47718a;
        com.vungle.ads.internal.util.y.a(new s2(this$0));
    }

    public static final void a(v2 this$0) {
        Intrinsics.g(this$0, "this$0");
        this$0.a(new OutOfMemory("Config: Out of Memory").logError$vungle_ads_release());
    }

    public final void a(VungleError vungleError) {
        this.f47725b.set(false);
        String localizedMessage = vungleError.getLocalizedMessage();
        if (localizedMessage == null) {
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Exception code is ");
            sbA.append(vungleError.getCom.tiktok.appevents.edp.TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE java.lang.String());
            localizedMessage = sbA.toString();
        }
        this.f47727d.a(Sdk.SDKMetric.SDKMetricType.INIT_TO_FAIL_CALLBACK_DURATION_MS);
        this.f47727d.d();
        AnalyticsClient.INSTANCE.a(this.f47727d, (com.vungle.ads.internal.util.s) null, localizedMessage);
        Handler handler = com.vungle.ads.internal.util.y.f47718a;
        com.vungle.ads.internal.util.y.a(new t2(this, vungleError));
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.b("VungleInitializer", localizedMessage);
    }

    public final void a() {
        s1 s1Var = ServiceLocator.f46726d;
        ServiceLocator serviceLocator = ServiceLocator.INSTANCE;
        if (serviceLocator != null && serviceLocator.c()) {
            ((com.vungle.ads.internal.downloader.t) serviceLocator.getService(com.vungle.ads.internal.downloader.t.class)).a();
        }
        synchronized (s1Var) {
            ServiceLocator.INSTANCE = null;
        }
        Json json = VungleApiClient.n;
        com.vungle.ads.internal.network.f0.f47245a = com.vungle.ads.internal.network.f0.a();
        com.vungle.ads.internal.presenter.f0.f47375c.set(false);
        ConfigManager.INSTANCE.a();
        this.f47724a.set(false);
        this.f47725b.set(false);
        this.f47726c.clear();
    }

    public static void a(Context context) {
        Intrinsics.g(context, "context");
        ConfigManager.INSTANCE.getClass();
        if (ConfigManager.q()) {
            com.vungle.ads.internal.presenter.f0.a(context);
        }
    }

    public final void a(String integrationName, String version) {
        Intrinsics.g(integrationName, "integrationName");
        Intrinsics.g(version, "version");
        if (r70.k.U0(integrationName)) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.b("VungleInitializer", "integrationName is empty");
            return;
        }
        String strD = com.vungle.ads.internal.network.f0.d();
        String strA = com.iab.omid.library.vungle.d.a(integrationName, !r70.k.U0(version) ? "/".concat(version) : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        if (r70.k.K0(strD, strA, false)) {
            boolean z12 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.c("VungleInitializer", "Wrapper info already set");
            return;
        }
        com.vungle.ads.internal.network.f0.c(strD + ';' + strA);
        if (this.f47724a.get()) {
            boolean z13 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.c("VungleInitializer", "VUNGLE WARNING: SDK already initialized, you should've set wrapper info before");
        }
    }
}

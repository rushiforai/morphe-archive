package com.vungle.ads;

import android.content.Context;
import android.content.IntentFilter;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.RelativeLayout;
import com.amplitude.android.TrackingOptions;
import com.iab.omid.library.vungle.internal.l;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.ServiceLocator;
import com.vungle.ads.internal.c1;
import com.vungle.ads.internal.h;
import com.vungle.ads.internal.i0;
import com.vungle.ads.internal.k2;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.omsdk.d;
import com.vungle.ads.internal.omsdk.e;
import com.vungle.ads.internal.presenter.a;
import com.vungle.ads.internal.presenter.f0;
import com.vungle.ads.internal.presenter.r;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.q1;
import com.vungle.ads.internal.ui.a0;
import com.vungle.ads.internal.ui.view.f;
import com.vungle.ads.internal.ui.view.j;
import com.vungle.ads.internal.ui.z;
import com.vungle.ads.internal.util.s;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import com.vungle.ads.internal.util.w;
import com.vungle.ads.internal.util.y;
import com.vungle.ads.internal.z0;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(bv = {}, d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u0000 <2\u00020\u00012\u00020\u0002:\u0001<B\u001f\u0012\u0006\u00109\u001a\u000208\u0012\u0006\u0010\u0013\u001a\u00020\u0007\u0012\u0006\u0010\u0018\u001a\u00020\u0003¢\u0006\u0004\b:\u0010;J\u0006\u0010\u0004\u001a\u00020\u0003J\u0006\u0010\u0006\u001a\u00020\u0005J\u0012\u0010\u0006\u001a\u00020\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007J\u000e\u0010\u0006\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\tJ\u0006\u0010\u000b\u001a\u00020\u0005J\u0010\u0010\u000e\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\fH\u0002R\u0017\u0010\u0013\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012R\u0017\u0010\u0018\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0014\u0010\u0015\u001a\u0004\b\u0016\u0010\u0017R$\u0010 \u001a\u0004\u0018\u00010\u00198\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u001a\u0010\u001b\u001a\u0004\b\u001c\u0010\u001d\"\u0004\b\u001e\u0010\u001fR\u001b\u0010&\u001a\u00020!8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\"\u0010#\u001a\u0004\b$\u0010%R\u0011\u0010*\u001a\u00020'8F¢\u0006\u0006\u001a\u0004\b(\u0010)R\u0013\u0010,\u001a\u0004\u0018\u00010\u00078F¢\u0006\u0006\u001a\u0004\b+\u0010\u0012R\u0013\u0010.\u001a\u0004\u0018\u00010\u00078F¢\u0006\u0006\u001a\u0004\b-\u0010\u0012R(\u00103\u001a\u0004\u0018\u00010\u00072\b\u0010/\u001a\u0004\u0018\u00010\u00078V@VX\u0096\u000e¢\u0006\f\u001a\u0004\b0\u0010\u0012\"\u0004\b1\u00102R\u0014\u00107\u001a\u0002048@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b5\u00106¨\u0006C²\u0006\f\u0010>\u001a\u00020=8\nX\u008a\u0084\u0002²\u0006\f\u0010@\u001a\u00020?8\nX\u008a\u0084\u0002²\u0006\f\u0010B\u001a\u00020A8\nX\u008a\u0084\u0002"}, d2 = {"Lcom/vungle/ads/VungleBannerView;", "Landroid/widget/RelativeLayout;", "Lcom/vungle/ads/VungleAdType;", "Lcom/vungle/ads/VungleAdSize;", "getAdViewSize", b.f42142b, "load", b.f42142b, "adMarkup", "Lcom/vungle/ads/VungleCSBData;", "csbData", "finishAd", b.f42142b, "isVisible", "setAdVisibility", "a", "Ljava/lang/String;", "getPlacementId", "()Ljava/lang/String;", "placementId", "b", "Lcom/vungle/ads/VungleAdSize;", "getAdSize", "()Lcom/vungle/ads/VungleAdSize;", "adSize", "Lcom/vungle/ads/BannerAdListener;", "d", "Lcom/vungle/ads/BannerAdListener;", "getAdListener", "()Lcom/vungle/ads/BannerAdListener;", "setAdListener", "(Lcom/vungle/ads/BannerAdListener;)V", "adListener", "Lcom/vungle/ads/internal/c1;", "q", "Lkotlin/Lazy;", "getImpressionTracker", "()Lcom/vungle/ads/internal/c1;", "impressionTracker", "Lcom/vungle/ads/AdConfig;", "getAdConfig", "()Lcom/vungle/ads/AdConfig;", "adConfig", "getCreativeId", "creativeId", "getEventId", "eventId", "value", "getAdapterAdFormat", "setAdapterAdFormat", "(Ljava/lang/String;)V", "adapterAdFormat", "Lcom/vungle/ads/internal/util/s;", "getLogEntry$vungle_ads_release", "()Lcom/vungle/ads/internal/util/s;", "logEntry", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;Ljava/lang/String;Lcom/vungle/ads/VungleAdSize;)V", k.O, "Lcom/vungle/ads/internal/executor/a;", "executors", "Lcom/vungle/ads/internal/omsdk/d;", "omTrackerFactory", "Lcom/vungle/ads/internal/platform/f;", TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class VungleBannerView extends RelativeLayout implements VungleAdType {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final String placementId;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    public final VungleAdSize adSize;

    /* renamed from: c, reason: collision with root package name */
    public final w f46645c;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    public BannerAdListener adListener;

    /* renamed from: e, reason: collision with root package name */
    public final i0 f46647e;

    /* renamed from: f, reason: collision with root package name */
    public int f46648f;

    /* renamed from: g, reason: collision with root package name */
    public int f46649g;

    /* renamed from: h, reason: collision with root package name */
    public j f46650h;

    /* renamed from: i, reason: collision with root package name */
    public r f46651i;

    /* renamed from: j, reason: collision with root package name */
    public a0 f46652j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f46653k;

    /* renamed from: l, reason: collision with root package name */
    public final AtomicBoolean f46654l;

    /* renamed from: m, reason: collision with root package name */
    public final AtomicBoolean f46655m;
    public final AtomicBoolean n;
    public final AtomicBoolean o;

    /* renamed from: p, reason: collision with root package name */
    public final AtomicBoolean f46656p;

    /* renamed from: q, reason: collision with root package name and from kotlin metadata */
    public final Lazy impressionTracker;

    /* renamed from: r, reason: collision with root package name */
    public boolean f46658r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public VungleBannerView(@NotNull final Context context, @NotNull String placementId, @NotNull VungleAdSize adSize) {
        super(context);
        Intrinsics.g(context, "context");
        Intrinsics.g(placementId, "placementId");
        Intrinsics.g(adSize, "adSize");
        this.placementId = placementId;
        this.adSize = adSize;
        this.f46645c = new w();
        i0 i0Var = new i0(context, placementId, adSize, new AdConfig());
        this.f46647e = i0Var;
        this.f46654l = new AtomicBoolean(false);
        this.f46655m = new AtomicBoolean(false);
        this.n = new AtomicBoolean(false);
        this.o = new AtomicBoolean(false);
        this.f46656p = new AtomicBoolean(false);
        this.impressionTracker = LazyKt.a(new Function0<c1>() { // from class: com.vungle.ads.VungleBannerView$impressionTracker$2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final c1 invoke() {
                return new c1(context);
            }
        });
        i0Var.setAdListener(new BannerAdListener() { // from class: com.vungle.ads.VungleBannerView.1
            @Override // com.vungle.ads.BaseAdListener
            public void onAdClicked(@NotNull BaseAd baseAd) {
                Intrinsics.g(baseAd, "baseAd");
                BannerAdListener adListener = VungleBannerView.this.getAdListener();
                if (adListener != null) {
                    adListener.onAdClicked(baseAd);
                }
            }

            @Override // com.vungle.ads.BaseAdListener
            public void onAdEnd(@NotNull BaseAd baseAd) {
                Intrinsics.g(baseAd, "baseAd");
                BannerAdListener adListener = VungleBannerView.this.getAdListener();
                if (adListener != null) {
                    adListener.onAdEnd(baseAd);
                }
            }

            @Override // com.vungle.ads.BaseAdListener
            public void onAdFailedToLoad(@NotNull BaseAd baseAd, @NotNull VungleError adError) {
                Intrinsics.g(baseAd, "baseAd");
                Intrinsics.g(adError, "adError");
                BannerAdListener adListener = VungleBannerView.this.getAdListener();
                if (adListener != null) {
                    adListener.onAdFailedToLoad(baseAd, adError);
                }
            }

            @Override // com.vungle.ads.BaseAdListener
            public void onAdFailedToPlay(@NotNull BaseAd baseAd, @NotNull VungleError adError) {
                Intrinsics.g(baseAd, "baseAd");
                Intrinsics.g(adError, "adError");
                BannerAdListener adListener = VungleBannerView.this.getAdListener();
                if (adListener != null) {
                    adListener.onAdFailedToPlay(baseAd, adError);
                }
            }

            @Override // com.vungle.ads.BaseAdListener
            public void onAdImpression(@NotNull BaseAd baseAd) {
                Intrinsics.g(baseAd, "baseAd");
                BannerAdListener adListener = VungleBannerView.this.getAdListener();
                if (adListener != null) {
                    adListener.onAdImpression(baseAd);
                }
            }

            @Override // com.vungle.ads.BaseAdListener
            public void onAdLeftApplication(@NotNull BaseAd baseAd) {
                Intrinsics.g(baseAd, "baseAd");
                BannerAdListener adListener = VungleBannerView.this.getAdListener();
                if (adListener != null) {
                    adListener.onAdLeftApplication(baseAd);
                }
            }

            @Override // com.vungle.ads.BaseAdListener
            public void onAdLoaded(@NotNull BaseAd baseAd) throws Throwable {
                Intrinsics.g(baseAd, "baseAd");
                VungleBannerView.access$onBannerAdLoaded(VungleBannerView.this, baseAd);
            }

            @Override // com.vungle.ads.BaseAdListener
            public void onAdStart(@NotNull BaseAd baseAd) {
                Intrinsics.g(baseAd, "baseAd");
                BannerAdListener adListener = VungleBannerView.this.getAdListener();
                if (adListener != null) {
                    adListener.onAdStart(baseAd);
                }
            }
        });
    }

    public static final void access$checkHardwareAcceleration(VungleBannerView vungleBannerView) {
        vungleBannerView.getClass();
        boolean z11 = u.f47714a;
        StringBuilder sbA = l.a("hardwareAccelerated = ");
        sbA.append(vungleBannerView.isHardwareAccelerated());
        t.c("VungleBannerView", sbA.toString());
        if (vungleBannerView.isHardwareAccelerated()) {
            return;
        }
        AnalyticsClient.a(AnalyticsClient.INSTANCE, Sdk.SDKMetric.SDKMetricType.HARDWARE_ACCELERATE_DISABLED, 0L, vungleBannerView.f46647e.getLogEntry(), null, 10);
    }

    public static final void access$finishAdInternal(VungleBannerView vungleBannerView, boolean z11) {
        if (vungleBannerView.f46654l.get()) {
            return;
        }
        vungleBannerView.f46654l.set(true);
        int i5 = (z11 ? 4 : 0) | 2;
        r rVar = vungleBannerView.f46651i;
        if (rVar != null) {
            boolean z12 = u.f47714a;
            t.a("MRAIDPresenter", "stop()");
            rVar.f47392a.b();
            rVar.f47395d.b(false);
        }
        r rVar2 = vungleBannerView.f46651i;
        if (rVar2 != null) {
            rVar2.a(i5);
        }
        vungleBannerView.getImpressionTracker().a();
        try {
            ViewParent parent = vungleBannerView.getParent();
            if (parent != null && (parent instanceof ViewGroup)) {
                ((ViewGroup) parent).removeView(vungleBannerView);
            }
            vungleBannerView.removeAllViews();
        } catch (Exception e3) {
            boolean z13 = u.f47714a;
            t.a("VungleBannerView", "Removing webView error: " + e3);
        }
    }

    public static final void access$logViewInvisibleOnPlay(VungleBannerView vungleBannerView) {
        if (vungleBannerView.f46656p.getAndSet(true)) {
            return;
        }
        boolean z11 = u.f47714a;
        StringBuilder sbA = l.a("ImpressionTracker checked the banner view invisible on play, log AD_VISIBILITY_INVISIBLE. ");
        sbA.append(vungleBannerView.hashCode());
        t.a("VungleBannerView", sbA.toString());
        AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
        k2 k2Var = new k2(Sdk.SDKMetric.SDKMetricType.AD_VISIBILITY);
        k2Var.f46865c = 1L;
        AnalyticsClient.a(analyticsClient, k2Var, vungleBannerView.f46647e.getLogEntry(), 4);
    }

    public static final void access$logViewVisibleOnPlay(VungleBannerView vungleBannerView) {
        long j11 = vungleBannerView.f46656p.get() ? 3L : 2L;
        AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
        k2 k2Var = new k2(Sdk.SDKMetric.SDKMetricType.AD_VISIBILITY);
        k2Var.f46865c = Long.valueOf(j11);
        AnalyticsClient.a(analyticsClient, k2Var, vungleBannerView.f46647e.getLogEntry(), 4);
        boolean z11 = u.f47714a;
        t.a("VungleBannerView", "Log metric AD_VISIBILITY: " + j11);
    }

    public static final void access$onBannerAdLoaded(VungleBannerView vungleBannerView, BaseAd baseAd) throws Throwable {
        vungleBannerView.getClass();
        AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
        AnalyticsClient.a(analyticsClient, new k2(Sdk.SDKMetric.SDKMetricType.PLAY_AD_API), vungleBannerView.f46647e.getLogEntry(), 4);
        vungleBannerView.f46647e.getResponseToShowMetric().d();
        q1 responseToShowMetric = vungleBannerView.f46647e.getResponseToShowMetric();
        analyticsClient.a(responseToShowMetric, vungleBannerView.f46647e.getLogEntry(), responseToShowMetric.f46813b);
        vungleBannerView.f46647e.getAdInternal$vungle_ads_release().f47470k.e();
        vungleBannerView.f46647e.getShowToCloseMetric().e();
        vungleBannerView.f46647e.getShowToFailMetric().e();
        VungleError vungleErrorA = vungleBannerView.f46647e.getAdInternal$vungle_ads_release().a(true);
        if (vungleErrorA != null) {
            if (vungleBannerView.f46647e.getAdInternal$vungle_ads_release().a(vungleErrorA.getCom.tiktok.appevents.edp.TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE java.lang.String())) {
                vungleBannerView.f46647e.getAdInternal$vungle_ads_release().a(h.f46849g);
            }
            BannerAdListener bannerAdListener = vungleBannerView.adListener;
            if (bannerAdListener != null) {
                bannerAdListener.onAdFailedToPlay(baseAd, vungleErrorA);
                return;
            }
            return;
        }
        com.vungle.ads.internal.model.i0 i0Var = vungleBannerView.f46647e.getAdInternal$vungle_ads_release().f47462c;
        j3 j3Var = vungleBannerView.f46647e.getAdInternal$vungle_ads_release().f47463d;
        if (i0Var == null || j3Var == null) {
            BannerAdListener bannerAdListener2 = vungleBannerView.adListener;
            if (bannerAdListener2 != null) {
                bannerAdListener2.onAdFailedToPlay(baseAd, new AdNotLoadedCantPlay("Ad or Placement is null").setLogEntry$vungle_ads_release(vungleBannerView.f46647e.getLogEntry()).logError$vungle_ads_release());
                return;
            }
            return;
        }
        vungleBannerView.f46647e.getAdInternal$vungle_ads_release().a();
        vungleBannerView.f46647e.getAdInternal$vungle_ads_release().f47470k.d();
        q1 q1Var = vungleBannerView.f46647e.getAdInternal$vungle_ads_release().f47470k;
        analyticsClient.a(q1Var, vungleBannerView.f46647e.getLogEntry(), q1Var.f46813b);
        vungleBannerView.f46647e.getAdInternal$vungle_ads_release().f47471l.e();
        try {
            vungleBannerView.a(i0Var, j3Var, vungleBannerView.getAdViewSize());
            vungleBannerView.n.set(true);
            BannerAdListener bannerAdListener3 = vungleBannerView.adListener;
            if (bannerAdListener3 != null) {
                bannerAdListener3.onAdLoaded(baseAd);
            }
            vungleBannerView.a();
        } catch (InstantiationException unused) {
        }
    }

    private final c1 getImpressionTracker() {
        return (c1) this.impressionTracker.getValue();
    }

    public static /* synthetic */ void load$default(VungleBannerView vungleBannerView, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = null;
        }
        vungleBannerView.load(str);
    }

    private final void setAdVisibility(boolean isVisible) {
        r rVar;
        if (!this.f46653k || this.f46654l.get() || (rVar = this.f46651i) == null) {
            return;
        }
        rVar.f47395d.b(isVisible);
    }

    public final void a() {
        if (this.f46654l.get()) {
            boolean z11 = u.f47714a;
            t.c("VungleBannerView", "renderAd() - destroyed");
            return;
        }
        if (!this.n.get()) {
            boolean z12 = u.f47714a;
            t.a("VungleBannerView", "renderAd() - not ready: not downloaded.");
            return;
        }
        if (!this.o.get()) {
            boolean z13 = u.f47714a;
            t.a("VungleBannerView", "renderAd() - not ready: not attached.");
            return;
        }
        if (!this.f46655m.getAndSet(true)) {
            r rVar = this.f46651i;
            if (rVar != null) {
                rVar.h();
            }
            getImpressionTracker().a(this, new z0() { // from class: com.vungle.ads.VungleBannerView$renderAd$1
                @Override // com.vungle.ads.internal.z0
                public void onImpression(@Nullable View view) {
                    boolean z14 = u.f47714a;
                    t.a("VungleBannerView", "ImpressionTracker checked the banner view become visible.");
                    this.f46665a.f46653k = true;
                    VungleBannerView.access$logViewVisibleOnPlay(this.f46665a);
                    VungleBannerView.access$checkHardwareAcceleration(this.f46665a);
                    r rVar2 = this.f46665a.f46651i;
                    if (rVar2 != null) {
                        t.a("MRAIDPresenter", "start()");
                        rVar2.f47392a.d();
                        rVar2.f47395d.b(true);
                    }
                }

                @Override // com.vungle.ads.internal.z0
                public void onViewInvisible(@Nullable View view) {
                    VungleBannerView.access$logViewInvisibleOnPlay(this.f46665a);
                }
            });
        }
        j jVar = this.f46650h;
        if (jVar != null && !Intrinsics.b(jVar.getParent(), this)) {
            ViewParent parent = jVar.getParent();
            ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
            if (viewGroup != null) {
                viewGroup.removeView(jVar);
            }
            addView(jVar, this.f46648f, this.f46649g);
        }
        a0 a0Var = this.f46652j;
        if (a0Var != null && !Intrinsics.b(a0Var.getParent(), this)) {
            ViewParent parent2 = a0Var.getParent();
            ViewGroup viewGroup2 = parent2 instanceof ViewGroup ? (ViewGroup) parent2 : null;
            if (viewGroup2 != null) {
                viewGroup2.removeView(a0Var);
            }
            addView(a0Var, this.f46648f, this.f46649g);
            a0Var.bringToFront();
        }
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        if (layoutParams != null) {
            layoutParams.height = this.f46649g;
            layoutParams.width = this.f46648f;
            requestLayout();
        }
    }

    public final void finishAd() {
        Handler handler = y.f47718a;
        y.a(new Function0<Unit>() { // from class: com.vungle.ads.VungleBannerView.finishAd.1
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public /* bridge */ /* synthetic */ Object invoke() {
                m292invoke();
                return Unit.f71706a;
            }

            /* renamed from: invoke, reason: collision with other method in class */
            public final void m292invoke() {
                VungleBannerView.access$finishAdInternal(VungleBannerView.this, true);
            }
        });
    }

    @NotNull
    public final AdConfig getAdConfig() {
        return this.f46647e.getAdConfig();
    }

    @Nullable
    public final BannerAdListener getAdListener() {
        return this.adListener;
    }

    @NotNull
    public final VungleAdSize getAdSize() {
        return this.adSize;
    }

    @NotNull
    public final VungleAdSize getAdViewSize() {
        return this.f46647e.getAdViewSize();
    }

    @Override // com.vungle.ads.VungleAdType
    @Nullable
    public String getAdapterAdFormat() {
        return this.f46647e.getAdapterAdFormat();
    }

    @Nullable
    public final String getCreativeId() {
        return this.f46647e.getCreativeId();
    }

    @Nullable
    public final String getEventId() {
        return this.f46647e.getEventId();
    }

    @NotNull
    public final s getLogEntry$vungle_ads_release() {
        return this.f46647e.getLogEntry();
    }

    @NotNull
    public final String getPlacementId() {
        return this.placementId;
    }

    public final void load() {
        this.f46647e.load();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        boolean z11 = u.f47714a;
        StringBuilder sbA = l.a("onAttachedToWindow(): ");
        sbA.append(hashCode());
        t.a("VungleBannerView", sbA.toString());
        this.o.set(true);
        if (this.f46647e.getAdInternal$vungle_ads_release().f47463d != null) {
            try {
                if (!this.f46658r) {
                    getContext().registerReceiver(this.f46645c, new IntentFilter("android.media.RINGER_MODE_CHANGED"));
                    this.f46658r = true;
                    t.a("VungleBannerView", "registerReceiver(): " + this.f46645c.hashCode());
                }
            } catch (Exception e3) {
                boolean z12 = u.f47714a;
                StringBuilder sbA2 = l.a("registerReceiver error: ");
                sbA2.append(e3.getLocalizedMessage());
                t.b("VungleBannerView", sbA2.toString());
            }
        }
        a();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        boolean z11 = u.f47714a;
        StringBuilder sbA = l.a("onDetachedFromWindow(): ");
        sbA.append(hashCode());
        t.a("VungleBannerView", sbA.toString());
        this.o.set(false);
        if (this.f46647e.getAdInternal$vungle_ads_release().f47463d != null) {
            try {
                if (this.f46658r) {
                    getContext().unregisterReceiver(this.f46645c);
                    this.f46658r = false;
                }
            } catch (Exception e3) {
                boolean z12 = u.f47714a;
                StringBuilder sbA2 = l.a("unregisterReceiver error: ");
                sbA2.append(e3.getLocalizedMessage());
                t.b("VungleBannerView", sbA2.toString());
            }
        }
    }

    @Override // android.view.View
    public final void onWindowVisibilityChanged(int i5) {
        super.onWindowVisibilityChanged(i5);
        setAdVisibility(i5 == 0);
    }

    public final void setAdListener(@Nullable BannerAdListener bannerAdListener) {
        this.adListener = bannerAdListener;
    }

    @Override // com.vungle.ads.VungleAdType
    public void setAdapterAdFormat(@Nullable String str) {
        this.f46647e.setAdapterAdFormat(str);
    }

    public final void load(@Nullable String adMarkup) {
        this.f46647e.load(adMarkup);
    }

    public final void load(@NotNull VungleCSBData csbData) {
        Intrinsics.g(csbData, "csbData");
        this.f46647e.load(csbData);
    }

    public final void a(com.vungle.ads.internal.model.i0 i0Var, j3 j3Var, VungleAdSize vungleAdSize) throws InstantiationException {
        Context context = getContext();
        Intrinsics.f(context, "context");
        this.f46649g = com.vungle.ads.internal.util.a0.a(context, vungleAdSize.getHeight());
        Context context2 = getContext();
        Intrinsics.f(context2, "context");
        this.f46648f = com.vungle.ads.internal.util.a0.a(context2, vungleAdSize.getWidth());
        a aVar = new a(this.f46647e.a(), this.f46647e.getAdInternal$vungle_ads_release().f());
        try {
            Context context3 = getContext();
            Intrinsics.f(context3, "context");
            j jVar = new j(context3, i0Var.h());
            this.f46650h = jVar;
            jVar.setCloseDelegate(new f() { // from class: com.vungle.ads.VungleBannerView$willPresentAdView$1
                @Override // com.vungle.ads.internal.ui.view.f
                public void close() {
                    VungleBannerView.access$finishAdInternal(this.f46666a, false);
                }
            });
            jVar.setOnViewTouchListener(new com.vungle.ads.internal.ui.view.h() { // from class: com.vungle.ads.VungleBannerView$willPresentAdView$2
                @Override // com.vungle.ads.internal.ui.view.h
                public boolean onTouch(@Nullable MotionEvent event) {
                    r rVar = this.f46667a.f46651i;
                    if (rVar == null) {
                        return false;
                    }
                    rVar.a(event);
                    return false;
                }
            });
            final Context context4 = getContext();
            Intrinsics.f(context4, "context");
            LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71679a;
            Lazy lazyB = LazyKt.b(lazyThreadSafetyMode, new Function0<com.vungle.ads.internal.executor.a>() { // from class: com.vungle.ads.VungleBannerView$willPresentAdView$$inlined$inject$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                /* JADX WARN: Type inference failed for: r0v2, types: [com.vungle.ads.internal.executor.a, java.lang.Object] */
                @Override // kotlin.jvm.functions.Function0
                @NotNull
                public final com.vungle.ads.internal.executor.a invoke() {
                    return ServiceLocator.f46726d.a(context4).getService(com.vungle.ads.internal.executor.a.class);
                }
            });
            final Context context5 = getContext();
            Intrinsics.f(context5, "context");
            d dVar = (d) LazyKt.b(lazyThreadSafetyMode, new Function0<d>() { // from class: com.vungle.ads.VungleBannerView$willPresentAdView$$inlined$inject$2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                /* JADX WARN: Type inference failed for: r0v2, types: [com.vungle.ads.internal.omsdk.d, java.lang.Object] */
                @Override // kotlin.jvm.functions.Function0
                @NotNull
                public final d invoke() {
                    return ServiceLocator.f46726d.a(context5).getService(d.class);
                }
            }).getValue();
            boolean zC = i0Var.C();
            dVar.getClass();
            e eVarA = d.a(zC);
            final Context context6 = getContext();
            Intrinsics.f(context6, "context");
            Lazy lazyB2 = LazyKt.b(lazyThreadSafetyMode, new Function0<com.vungle.ads.internal.platform.f>() { // from class: com.vungle.ads.VungleBannerView$willPresentAdView$$inlined$inject$3
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                /* JADX WARN: Type inference failed for: r0v2, types: [com.vungle.ads.internal.platform.f, java.lang.Object] */
                @Override // kotlin.jvm.functions.Function0
                @NotNull
                public final com.vungle.ads.internal.platform.f invoke() {
                    return ServiceLocator.f46726d.a(context6).getService(com.vungle.ads.internal.platform.f.class);
                }
            });
            com.vungle.ads.internal.executor.j jVarF = ((com.vungle.ads.internal.executor.d) ((com.vungle.ads.internal.executor.a) lazyB.getValue())).f();
            ReentrantLock reentrantLock = f0.f47373a;
            z zVarA = f0.a(i0Var, j3Var, jVarF, (com.vungle.ads.internal.platform.f) lazyB2.getValue());
            this.f46645c.a(zVarA);
            zVarA.a(eVarA);
            r rVar = new r(jVar, i0Var, j3Var, zVarA, ((com.vungle.ads.internal.executor.d) ((com.vungle.ads.internal.executor.a) lazyB.getValue())).d(), eVarA, (com.vungle.ads.internal.platform.f) lazyB2.getValue());
            rVar.a(aVar);
            this.f46651i = rVar;
            String watermark$vungle_ads_release = getAdConfig().getWatermark$vungle_ads_release();
            if (watermark$vungle_ads_release != null) {
                Context context7 = getContext();
                Intrinsics.f(context7, "context");
                this.f46652j = new a0(context7, watermark$vungle_ads_release);
            }
        } catch (InstantiationException e3) {
            aVar.a(new AdCantPlayWithoutWebView(e3.getMessage()).setLogEntry$vungle_ads_release(this.f46647e.getLogEntry()).logError$vungle_ads_release(), this.placementId);
            throw e3;
        }
    }
}

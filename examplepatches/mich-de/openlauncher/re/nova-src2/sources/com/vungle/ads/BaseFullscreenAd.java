package com.vungle.ads;

import android.content.Context;
import android.os.Handler;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.k2;
import com.vungle.ads.internal.model.i0;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.q1;
import com.vungle.ads.internal.s;
import com.vungle.ads.internal.signals.j;
import com.vungle.ads.internal.signals.m;
import com.vungle.ads.internal.util.y;
import com.vungle.ads.internal.y0;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(bv = {}, d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\b&\u0018\u00002\u00020\u00012\u00020\u0002B\u001f\u0012\u0006\u0010\r\u001a\u00020\f\u0012\u0006\u0010\u000f\u001a\u00020\u0003\u0012\u0006\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0012\u0010\u0013J\u0012\u0010\u0006\u001a\u00020\u00052\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003H\u0016J\u0017\u0010\u000b\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0010¢\u0006\u0004\b\t\u0010\nJ\u0012\u0010\u000e\u001a\u00020\u00052\b\u0010\r\u001a\u0004\u0018\u00010\fH\u0016¨\u0006\u0014"}, d2 = {"Lcom/vungle/ads/BaseFullscreenAd;", "Lcom/vungle/ads/BaseAd;", "Lcom/vungle/ads/FullscreenAd;", b.f42142b, "adMarkup", b.f42142b, "load", "Lcom/vungle/ads/internal/model/i0;", "advertisement", "onAdLoaded$vungle_ads_release", "(Lcom/vungle/ads/internal/model/i0;)V", "onAdLoaded", "Landroid/content/Context;", "context", "play", "placementId", "Lcom/vungle/ads/AdConfig;", "adConfig", "<init>", "(Landroid/content/Context;Ljava/lang/String;Lcom/vungle/ads/AdConfig;)V", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public abstract class BaseFullscreenAd extends BaseAd implements FullscreenAd {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public BaseFullscreenAd(@NotNull Context context, @NotNull String placementId, @NotNull AdConfig adConfig) {
        super(context, placementId, adConfig);
        Intrinsics.g(context, "context");
        Intrinsics.g(placementId, "placementId");
        Intrinsics.g(adConfig, "adConfig");
    }

    @Override // com.vungle.ads.BaseAd, com.vungle.ads.Ad
    public void load(@Nullable String adMarkup) {
        setSignaledAd$vungle_ads_release(getSignalManager$vungle_ads_release().a(getPlacementId()));
        super.load(adMarkup);
    }

    @Override // com.vungle.ads.BaseAd
    public void onAdLoaded$vungle_ads_release(@NotNull i0 advertisement) {
        Intrinsics.g(advertisement, "advertisement");
        super.onAdLoaded$vungle_ads_release(advertisement);
        m signaledAd = getSignaledAd();
        if (signaledAd == null) {
            return;
        }
        signaledAd.a(System.currentTimeMillis());
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v4, types: [com.vungle.ads.BaseFullscreenAd$play$2] */
    @Override // com.vungle.ads.FullscreenAd
    public void play(@Nullable Context context) {
        AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
        AnalyticsClient.a(analyticsClient, new k2(Sdk.SDKMetric.SDKMetricType.PLAY_AD_API), getLogEntry(), 4);
        getResponseToShowMetric().d();
        AnalyticsClient.a(analyticsClient, getResponseToShowMetric(), getLogEntry());
        getShowToFailMetric().e();
        getShowToCloseMetric().e();
        m signaledAd = getSignaledAd();
        if (signaledAd != null) {
            signaledAd.f47524i = System.currentTimeMillis();
            signaledAd.f47521f = m.a(Long.valueOf(signaledAd.f47523h), signaledAd.f47524i);
            getSignalManager$vungle_ads_release().a(context, signaledAd);
        }
        s adInternal$vungle_ads_release = getAdInternal$vungle_ads_release();
        Intrinsics.e(adInternal$vungle_ads_release, "null cannot be cast to non-null type com.vungle.ads.internal.FullscreenAdInternal");
        ((y0) adInternal$vungle_ads_release).a(context, new com.vungle.ads.internal.presenter.b() { // from class: com.vungle.ads.BaseFullscreenAd.play.2
            @Override // com.vungle.ads.internal.presenter.b
            public void onAdClick(@Nullable String id2) throws Throwable {
                Handler handler = y.f47718a;
                final BaseFullscreenAd baseFullscreenAd = BaseFullscreenAd.this;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.BaseFullscreenAd$play$2$onAdClick$1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m279invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m279invoke() {
                        BaseAdListener adListener = baseFullscreenAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdClicked(baseFullscreenAd);
                        }
                    }
                });
                BaseFullscreenAd.this.getDisplayToClickMetric().d();
                AnalyticsClient analyticsClient2 = AnalyticsClient.INSTANCE;
                q1 displayToClickMetric = BaseFullscreenAd.this.getDisplayToClickMetric();
                analyticsClient2.a(displayToClickMetric, BaseFullscreenAd.this.getLogEntry(), displayToClickMetric.f46813b);
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onAdEnd(@Nullable String id2) throws Throwable {
                Handler handler = y.f47718a;
                final BaseFullscreenAd baseFullscreenAd = BaseFullscreenAd.this;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.BaseFullscreenAd$play$2$onAdEnd$1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m280invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m280invoke() {
                        BaseAdListener adListener = baseFullscreenAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdEnd(baseFullscreenAd);
                        }
                    }
                });
                BaseFullscreenAd.this.getShowToCloseMetric().d();
                AnalyticsClient analyticsClient2 = AnalyticsClient.INSTANCE;
                q1 showToCloseMetric = BaseFullscreenAd.this.getShowToCloseMetric();
                analyticsClient2.a(showToCloseMetric, BaseFullscreenAd.this.getLogEntry(), showToCloseMetric.f46813b);
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onAdImpression(@Nullable String id2) throws Throwable {
                Handler handler = y.f47718a;
                final BaseFullscreenAd baseFullscreenAd = BaseFullscreenAd.this;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.BaseFullscreenAd$play$2$onAdImpression$1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m281invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m281invoke() {
                        BaseAdListener adListener = baseFullscreenAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdImpression(baseFullscreenAd);
                        }
                    }
                });
                BaseFullscreenAd.this.getPresentToDisplayMetric().d();
                AnalyticsClient analyticsClient2 = AnalyticsClient.INSTANCE;
                q1 presentToDisplayMetric = BaseFullscreenAd.this.getPresentToDisplayMetric();
                analyticsClient2.a(presentToDisplayMetric, BaseFullscreenAd.this.getLogEntry(), presentToDisplayMetric.f46813b);
                BaseFullscreenAd.this.getDisplayToClickMetric().e();
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onAdLeftApplication(@Nullable String id2) {
                Handler handler = y.f47718a;
                final BaseFullscreenAd baseFullscreenAd = BaseFullscreenAd.this;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.BaseFullscreenAd$play$2$onAdLeftApplication$1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m282invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m282invoke() {
                        BaseAdListener adListener = baseFullscreenAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdLeftApplication(baseFullscreenAd);
                        }
                    }
                });
                AnalyticsClient.a(AnalyticsClient.INSTANCE, BaseFullscreenAd.this.getLeaveApplicationMetric(), BaseFullscreenAd.this.getLogEntry(), 4);
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onAdRewarded(@Nullable String id2) {
                Handler handler = y.f47718a;
                final BaseFullscreenAd baseFullscreenAd = BaseFullscreenAd.this;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.BaseFullscreenAd$play$2$onAdRewarded$1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m283invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m283invoke() {
                        BaseAdListener adListener = baseFullscreenAd.getAdListener();
                        RewardedAdListener rewardedAdListener = adListener instanceof RewardedAdListener ? (RewardedAdListener) adListener : null;
                        if (rewardedAdListener != null) {
                            rewardedAdListener.onAdRewarded(baseFullscreenAd);
                        }
                    }
                });
                AnalyticsClient.a(AnalyticsClient.INSTANCE, BaseFullscreenAd.this.getRewardedMetric(), BaseFullscreenAd.this.getLogEntry(), 4);
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onAdStart(@Nullable String id2) {
                j signalManager$vungle_ads_release = BaseFullscreenAd.this.getSignalManager$vungle_ads_release();
                synchronized (signalManager$vungle_ads_release) {
                    signalManager$vungle_ads_release.f47510h.f47490f++;
                }
                BaseFullscreenAd.this.getPresentToDisplayMetric().e();
                Handler handler = y.f47718a;
                final BaseFullscreenAd baseFullscreenAd = BaseFullscreenAd.this;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.BaseFullscreenAd$play$2$onAdStart$1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m284invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m284invoke() {
                        BaseAdListener adListener = baseFullscreenAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdStart(baseFullscreenAd);
                        }
                    }
                });
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onFailure(@NotNull final VungleError error) throws Throwable {
                Intrinsics.g(error, "error");
                Handler handler = y.f47718a;
                final BaseFullscreenAd baseFullscreenAd = BaseFullscreenAd.this;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.BaseFullscreenAd$play$2$onFailure$1
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m285invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m285invoke() {
                        BaseAdListener adListener = baseFullscreenAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdFailedToPlay(baseFullscreenAd, error);
                        }
                    }
                });
                BaseFullscreenAd.this.getShowToFailMetric().d();
                AnalyticsClient.INSTANCE.a(BaseFullscreenAd.this.getShowToFailMetric(), BaseFullscreenAd.this.getLogEntry(), error.getCom.tiktok.appevents.edp.TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE java.lang.String() + '-' + error.getErrorMessage());
            }
        });
    }
}

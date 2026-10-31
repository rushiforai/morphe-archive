package com.vungle.ads;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.iab.omid.library.vungle.internal.l;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.h;
import com.vungle.ads.internal.k2;
import com.vungle.ads.internal.l2;
import com.vungle.ads.internal.o1;
import com.vungle.ads.internal.presenter.w;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.q1;
import com.vungle.ads.internal.s;
import com.vungle.ads.internal.signals.j;
import com.vungle.ads.internal.ui.view.MediaView;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import com.vungle.ads.internal.util.y;
import com.vungle.ads.nativead.NativeVideoOptions;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(bv = {}, d1 = {"\u0000r\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u0006\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u001e\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\t\u0018\u0000 >2\u00020\u0001:\u0002?>B\u0019\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010;\u001a\u00020\b¢\u0006\u0004\b<\u0010=J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0010¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u000b\u001a\u00020\bH\u0000¢\u0006\u0004\b\t\u0010\nJ\u0006\u0010\f\u001a\u00020\bJ\u0006\u0010\r\u001a\u00020\bJ\u0006\u0010\u000e\u001a\u00020\bJ\u0006\u0010\u000f\u001a\u00020\bJ\u000f\u0010\u0011\u001a\u0004\u0018\u00010\u0010¢\u0006\u0004\b\u0011\u0010\u0012J\u0006\u0010\u0013\u001a\u00020\bJ\u0006\u0010\u0015\u001a\u00020\u0014J\u0006\u0010\u0017\u001a\u00020\u0016J\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018J\u0006\u0010\u001b\u001a\u00020\u001aJ\u0006\u0010\u001c\u001a\u00020\u0014J0\u0010%\u001a\u00020\u001a2\u0006\u0010\u001e\u001a\u00020\u001d2\u0006\u0010\u001f\u001a\u00020\u00182\b\u0010!\u001a\u0004\u0018\u00010 2\u000e\u0010$\u001a\n\u0012\u0004\u0012\u00020#\u0018\u00010\"J\u0006\u0010&\u001a\u00020\u001aR(\u00100\u001a\u00020'8\u0006@\u0006X\u0087\u000e¢\u0006\u0018\n\u0004\b(\u0010)\u0012\u0004\b.\u0010/\u001a\u0004\b*\u0010+\"\u0004\b,\u0010-R\u001a\u00106\u001a\u0002018\u0000X\u0080\u0004¢\u0006\f\n\u0004\b2\u00103\u001a\u0004\b4\u00105R\u0011\u0010:\u001a\u0002078F¢\u0006\u0006\u001a\u0004\b8\u00109¨\u0006@"}, d2 = {"Lcom/vungle/ads/NativeAd;", "Lcom/vungle/ads/BaseAd;", "Landroid/content/Context;", "context", "Lcom/vungle/ads/internal/o1;", "constructAdInternal$vungle_ads_release", "(Landroid/content/Context;)Lcom/vungle/ads/internal/o1;", "constructAdInternal", b.f42142b, "adOptionsPositionMeta$vungle_ads_release", "()Ljava/lang/String;", "adOptionsPositionMeta", "getAppIcon", "getAdTitle", "getAdBodyText", "getAdCallToActionText", b.f42142b, "getAdStarRating", "()Ljava/lang/Double;", "getAdSponsoredText", b.f42142b, "hasCallToAction", b.f42142b, "getMediaAspectRatio", "Lcom/vungle/ads/internal/ui/view/MediaView;", "getMediaView", b.f42142b, "unregisterView", "hasVideoContent", "Landroid/widget/FrameLayout;", "rootView", "mediaView", "Landroid/widget/ImageView;", "adIconView", b.f42142b, "Landroid/view/View;", "clickableViews", "registerViewForInteraction", "performCTA", b.f42142b, "x", "I", "getAdOptionsPosition", "()I", "setAdOptionsPosition", "(I)V", "getAdOptionsPosition$annotations", "()V", "adOptionsPosition", "Lcom/vungle/ads/internal/l2;", "A", "Lcom/vungle/ads/internal/l2;", "getNativeDisplayDurationMetric$vungle_ads_release", "()Lcom/vungle/ads/internal/l2;", "nativeDisplayDurationMetric", "Lcom/vungle/ads/nativead/NativeVideoOptions;", "getVideoOptions", "()Lcom/vungle/ads/nativead/NativeVideoOptions;", "videoOptions", "placementId", "<init>", "(Landroid/content/Context;Ljava/lang/String;)V", k.O, "AdOptionsPosition", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class NativeAd extends BaseAd {
    public static final int BOTTOM_LEFT = 2;
    public static final int BOTTOM_RIGHT = 3;
    public static final int TOP_LEFT = 0;
    public static final int TOP_RIGHT = 1;

    /* renamed from: A, reason: from kotlin metadata */
    public final l2 nativeDisplayDurationMetric;
    public final AtomicBoolean B;
    public final NativeAd$adPlayCallback$1 C;

    /* renamed from: s, reason: collision with root package name */
    public ImageView f46621s;

    /* renamed from: t, reason: collision with root package name */
    public MediaView f46622t;

    /* renamed from: u, reason: collision with root package name */
    public FrameLayout f46623u;

    /* renamed from: v, reason: collision with root package name */
    public Collection f46624v;

    /* renamed from: w, reason: collision with root package name */
    public com.vungle.ads.internal.ui.view.k f46625w;

    /* renamed from: x, reason: collision with root package name and from kotlin metadata */
    public int adOptionsPosition;

    /* renamed from: y, reason: collision with root package name */
    public final o1 f46627y;

    /* renamed from: z, reason: collision with root package name */
    public int f46628z;

    @Retention(RetentionPolicy.RUNTIME)
    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\b\u0086\u0002\u0018\u00002\u00020\u0001B\u0000¨\u0006\u0002"}, d2 = {"Lcom/vungle/ads/NativeAd$AdOptionsPosition;", b.f42142b, "vungle-ads_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public @interface AdOptionsPosition {
    }

    /* JADX WARN: Type inference failed for: r1v6, types: [com.vungle.ads.NativeAd$adPlayCallback$1] */
    public NativeAd(Context context, String str, AdConfig adConfig) {
        super(context, str, adConfig);
        this.adOptionsPosition = 1;
        s adInternal$vungle_ads_release = getAdInternal$vungle_ads_release();
        Intrinsics.e(adInternal$vungle_ads_release, "null cannot be cast to non-null type com.vungle.ads.internal.NativeAdInternal");
        this.f46627y = (o1) adInternal$vungle_ads_release;
        this.nativeDisplayDurationMetric = new l2(Sdk.SDKMetric.SDKMetricType.NATIVE_AD_DISPLAY_DURATION);
        this.B = new AtomicBoolean(false);
        this.C = new com.vungle.ads.internal.presenter.b() { // from class: com.vungle.ads.NativeAd$adPlayCallback$1
            @Override // com.vungle.ads.internal.presenter.b
            public void onAdClick(@Nullable String id2) throws Throwable {
                Handler handler = y.f47718a;
                final NativeAd nativeAd = this.f46629a;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.NativeAd$adPlayCallback$1$onAdClick$1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m286invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m286invoke() {
                        BaseAdListener adListener = nativeAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdClicked(nativeAd);
                        }
                    }
                });
                this.f46629a.getDisplayToClickMetric().d();
                AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
                q1 displayToClickMetric = this.f46629a.getDisplayToClickMetric();
                analyticsClient.a(displayToClickMetric, this.f46629a.getLogEntry(), displayToClickMetric.f46813b);
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onAdEnd(@Nullable String id2) throws Throwable {
                if (this.f46629a.getAdInternal$vungle_ads_release().i()) {
                    this.f46629a.getAdInternal$vungle_ads_release().a(h.f46845c);
                }
                Handler handler = y.f47718a;
                final NativeAd nativeAd = this.f46629a;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.NativeAd$adPlayCallback$1$onAdEnd$1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m287invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m287invoke() {
                        BaseAdListener adListener = nativeAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdEnd(nativeAd);
                        }
                    }
                });
                this.f46629a.getShowToCloseMetric().d();
                AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
                q1 showToCloseMetric = this.f46629a.getShowToCloseMetric();
                analyticsClient.a(showToCloseMetric, this.f46629a.getLogEntry(), showToCloseMetric.f46813b);
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onAdImpression(@Nullable String id2) throws Throwable {
                this.f46629a.getAdInternal$vungle_ads_release().a(h.f46847e);
                Handler handler = y.f47718a;
                final NativeAd nativeAd = this.f46629a;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.NativeAd$adPlayCallback$1$onAdImpression$1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m288invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m288invoke() {
                        BaseAdListener adListener = nativeAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdImpression(nativeAd);
                        }
                    }
                });
                this.f46629a.getPresentToDisplayMetric().d();
                AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
                q1 presentToDisplayMetric = this.f46629a.getPresentToDisplayMetric();
                analyticsClient.a(presentToDisplayMetric, this.f46629a.getLogEntry(), presentToDisplayMetric.f46813b);
                this.f46629a.getDisplayToClickMetric().e();
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onAdLeftApplication(@Nullable String id2) {
                Handler handler = y.f47718a;
                final NativeAd nativeAd = this.f46629a;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.NativeAd$adPlayCallback$1$onAdLeftApplication$1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m289invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m289invoke() {
                        BaseAdListener adListener = nativeAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdLeftApplication(nativeAd);
                        }
                    }
                });
                AnalyticsClient.a(AnalyticsClient.INSTANCE, this.f46629a.getLeaveApplicationMetric(), this.f46629a.getLogEntry(), 4);
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onAdRewarded(@Nullable String id2) {
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onAdStart(@Nullable String id2) throws Throwable {
                this.f46629a.getAdInternal$vungle_ads_release().a(h.f46846d);
                j signalManager$vungle_ads_release = this.f46629a.getSignalManager$vungle_ads_release();
                synchronized (signalManager$vungle_ads_release) {
                    signalManager$vungle_ads_release.f47510h.f47490f++;
                }
                this.f46629a.getAdInternal$vungle_ads_release().f47471l.d();
                AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
                q1 q1Var = this.f46629a.getAdInternal$vungle_ads_release().f47471l;
                analyticsClient.a(q1Var, this.f46629a.getLogEntry(), q1Var.f46813b);
                this.f46629a.getPresentToDisplayMetric().e();
                Handler handler = y.f47718a;
                final NativeAd nativeAd = this.f46629a;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.NativeAd$adPlayCallback$1$onAdStart$1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m290invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m290invoke() {
                        BaseAdListener adListener = nativeAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdStart(nativeAd);
                        }
                    }
                });
            }

            @Override // com.vungle.ads.internal.presenter.b
            public void onFailure(@NotNull final VungleError error) throws Throwable {
                Intrinsics.g(error, "error");
                this.f46629a.getAdInternal$vungle_ads_release().a(h.f46849g);
                Handler handler = y.f47718a;
                final NativeAd nativeAd = this.f46629a;
                y.a(new Function0<Unit>() { // from class: com.vungle.ads.NativeAd$adPlayCallback$1$onFailure$1
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Object invoke() {
                        m291invoke();
                        return Unit.f71706a;
                    }

                    /* renamed from: invoke, reason: collision with other method in class */
                    public final void m291invoke() {
                        BaseAdListener adListener = nativeAd.getAdListener();
                        if (adListener != null) {
                            adListener.onAdFailedToPlay(nativeAd, error);
                        }
                    }
                });
                this.f46629a.getShowToFailMetric().d();
                AnalyticsClient.INSTANCE.a(this.f46629a.getShowToFailMetric(), this.f46629a.getLogEntry(), error.getCom.tiktok.appevents.edp.TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE java.lang.String() + '-' + error.getErrorMessage());
            }
        };
    }

    public static final void a(NativeAd this$0, View view) {
        Intrinsics.g(this$0, "this$0");
        this$0.f46627y.y();
    }

    @AdOptionsPosition
    public static /* synthetic */ void getAdOptionsPosition$annotations() {
    }

    @NotNull
    public final String adOptionsPositionMeta$vungle_ads_release() {
        int i5 = this.adOptionsPosition;
        return i5 != 0 ? i5 != 2 ? i5 != 3 ? "top_right" : "bottom_right" : "bottom_left" : "top_left";
    }

    @NotNull
    public final String getAdBodyText() {
        String str;
        LinkedHashMap linkedHashMap = this.f46627y.f47301u;
        return (linkedHashMap == null || (str = (String) linkedHashMap.get("APP_DESCRIPTION")) == null) ? b.f42142b : str;
    }

    @NotNull
    public final String getAdCallToActionText() {
        String str;
        LinkedHashMap linkedHashMap = this.f46627y.f47301u;
        return (linkedHashMap == null || (str = (String) linkedHashMap.get("CTA_BUTTON_TEXT")) == null) ? b.f42142b : str;
    }

    public final int getAdOptionsPosition() {
        return this.adOptionsPosition;
    }

    @NotNull
    public final String getAdSponsoredText() {
        String str;
        LinkedHashMap linkedHashMap = this.f46627y.f47301u;
        return (linkedHashMap == null || (str = (String) linkedHashMap.get("SPONSORED_BY")) == null) ? b.f42142b : str;
    }

    @Nullable
    public final Double getAdStarRating() {
        return this.f46627y.o();
    }

    @NotNull
    public final String getAdTitle() {
        String str;
        LinkedHashMap linkedHashMap = this.f46627y.f47301u;
        return (linkedHashMap == null || (str = (String) linkedHashMap.get("APP_NAME")) == null) ? b.f42142b : str;
    }

    @NotNull
    public final String getAppIcon() {
        String str;
        LinkedHashMap linkedHashMap = this.f46627y.f47301u;
        return (linkedHashMap == null || (str = (String) linkedHashMap.get("APP_ICON")) == null) ? b.f42142b : str;
    }

    public final float getMediaAspectRatio() {
        return this.f46627y.f47306z;
    }

    @Nullable
    /* renamed from: getMediaView, reason: from getter */
    public final MediaView getF46622t() {
        return this.f46622t;
    }

    @NotNull
    /* renamed from: getNativeDisplayDurationMetric$vungle_ads_release, reason: from getter */
    public final l2 getNativeDisplayDurationMetric() {
        return this.nativeDisplayDurationMetric;
    }

    @NotNull
    public final NativeVideoOptions getVideoOptions() {
        return this.f46627y.s();
    }

    public final boolean hasCallToAction() {
        String str;
        LinkedHashMap linkedHashMap = this.f46627y.f47301u;
        if (linkedHashMap == null || (str = (String) linkedHashMap.get("CTA_BUTTON_URL")) == null) {
            str = b.f42142b;
        }
        return str.length() > 0;
    }

    public final boolean hasVideoContent() {
        return this.f46627y.t();
    }

    public final void performCTA() {
        String str;
        o1 o1Var = this.f46627y;
        w wVar = o1Var.f47300t;
        if (wVar != null) {
            LinkedHashMap linkedHashMap = o1Var.f47301u;
            if (linkedHashMap == null || (str = (String) linkedHashMap.get("CTA_BUTTON_URL")) == null) {
                str = b.f42142b;
            }
            wVar.a("download", (String) null, str);
        }
    }

    public final void registerViewForInteraction(@NotNull FrameLayout rootView, @NotNull MediaView mediaView, @Nullable ImageView adIconView, @Nullable Collection<? extends View> clickableViews) {
        Intrinsics.g(rootView, "rootView");
        Intrinsics.g(mediaView, "mediaView");
        boolean z11 = u.f47714a;
        StringBuilder sbA = l.a("registerViewForInteraction ");
        sbA.append(hashCode());
        t.c("NativeAd", sbA.toString());
        AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
        k2 k2Var = new k2(Sdk.SDKMetric.SDKMetricType.PLAY_AD_API);
        StringBuilder sbA2 = l.a("ad_options_position: ");
        sbA2.append(adOptionsPositionMeta$vungle_ads_release());
        k2Var.a(sbA2.toString());
        AnalyticsClient.a(analyticsClient, k2Var, getLogEntry(), 4);
        this.f46628z++;
        this.nativeDisplayDurationMetric.e();
        getResponseToShowMetric().d();
        AnalyticsClient.a(analyticsClient, getResponseToShowMetric(), getLogEntry());
        getAdInternal$vungle_ads_release().g().e();
        getShowToFailMetric().e();
        getShowToCloseMetric().e();
        if (getAdInternal$vungle_ads_release().i()) {
            if (Intrinsics.b(this.f46623u, rootView)) {
                t.a("NativeAd", "no-op when re-play it on the same root view");
                return;
            }
            unregisterView();
        }
        this.B.set(false);
        VungleError vungleErrorA = getAdInternal$vungle_ads_release().a(true);
        if (vungleErrorA != null) {
            StringBuilder sbA3 = l.a("registerViewForInteraction can NOT play. ");
            sbA3.append(hashCode());
            sbA3.append(' ');
            sbA3.append(vungleErrorA);
            t.c("NativeAd", sbA3.toString());
            if (getAdInternal$vungle_ads_release().a(vungleErrorA.getCom.tiktok.appevents.edp.TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE java.lang.String())) {
                getAdInternal$vungle_ads_release().a(h.f46849g);
            }
            BaseAdListener adListener = getAdListener();
            if (adListener != null) {
                adListener.onAdFailedToPlay(this, vungleErrorA);
                return;
            }
            return;
        }
        if (!this.f46627y.m()) {
            VungleError vungleErrorLogError$vungle_ads_release = new NativeAssetError("privacy icon or AI label is required to display.").setLogEntry$vungle_ads_release(getLogEntry()).logError$vungle_ads_release();
            getAdInternal$vungle_ads_release().a(h.f46849g);
            BaseAdListener adListener2 = getAdListener();
            if (adListener2 != null) {
                adListener2.onAdFailedToPlay(this, vungleErrorLogError$vungle_ads_release);
                return;
            }
            return;
        }
        this.f46623u = rootView;
        this.f46622t = mediaView;
        this.f46621s = adIconView;
        this.f46624v = clickableViews;
        this.f46627y.a(rootView, this.C);
        if (this.f46625w == null) {
            this.f46625w = new com.vungle.ads.internal.ui.view.k(getContext());
        }
        if (clickableViews == null) {
            clickableViews = ul.b.P(mediaView);
        }
        Iterator<T> it = clickableViews.iterator();
        while (it.hasNext()) {
            ((View) it.next()).setOnClickListener(new ay.k(this, 11));
        }
        com.vungle.ads.internal.ui.view.k kVar = this.f46625w;
        if (kVar != null) {
            kVar.a(rootView, this.adOptionsPosition, this.f46627y);
        }
        this.f46627y.a(mediaView);
        mediaView.a(this.f46627y);
        this.f46627y.b(adIconView);
        this.f46627y.a(rootView, getAdConfig().getWatermark$vungle_ads_release());
        getAdInternal$vungle_ads_release().g().d();
        AnalyticsClient.a(AnalyticsClient.INSTANCE, getAdInternal$vungle_ads_release().g(), getLogEntry());
        getAdInternal$vungle_ads_release().h().e();
    }

    public final void setAdOptionsPosition(int i5) {
        this.adOptionsPosition = i5;
    }

    public final void unregisterView() {
        Object objA;
        boolean z11 = u.f47714a;
        StringBuilder sbA = l.a("unregisterView  ");
        sbA.append(hashCode());
        t.c("NativeAd", sbA.toString());
        if (this.B.getAndSet(true)) {
            return;
        }
        this.nativeDisplayDurationMetric.d();
        this.nativeDisplayDurationMetric.a(String.valueOf(this.f46628z));
        AnalyticsClient.a(AnalyticsClient.INSTANCE, this.nativeDisplayDurationMetric, getLogEntry(), 4);
        Collection collection = this.f46624v;
        if (collection != null) {
            Iterator it = collection.iterator();
            while (it.hasNext()) {
                ((View) it.next()).setOnClickListener(null);
            }
        }
        this.f46624v = null;
        this.f46623u = null;
        MediaView mediaView = this.f46622t;
        if (mediaView != null) {
            mediaView.a();
        }
        this.f46622t = null;
        com.vungle.ads.internal.ui.view.k kVar = this.f46625w;
        if (kVar != null) {
            kVar.a();
        }
        this.f46625w = null;
        this.f46627y.n();
        try {
            int i5 = Result.f71687b;
            ImageView imageView = this.f46621s;
            Drawable drawable = imageView != null ? imageView.getDrawable() : null;
            if (drawable instanceof BitmapDrawable) {
                Bitmap bitmap = ((BitmapDrawable) drawable).getBitmap();
                if (!bitmap.isRecycled()) {
                    bitmap.recycle();
                }
            }
            objA = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z12 = u.f47714a;
            StringBuilder sbA2 = l.a("error msg: ");
            sbA2.append(thA.getLocalizedMessage());
            t.c("NativeAd", sbA2.toString());
        }
        ImageView imageView2 = this.f46621s;
        if (imageView2 != null) {
            imageView2.setImageDrawable(null);
        }
        this.f46621s = null;
    }

    @Override // com.vungle.ads.BaseAd
    @NotNull
    public o1 constructAdInternal$vungle_ads_release(@NotNull Context context) {
        Intrinsics.g(context, "context");
        return new o1(context);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public NativeAd(@NotNull Context context, @NotNull String placementId) {
        this(context, placementId, new AdConfig());
        Intrinsics.g(context, "context");
        Intrinsics.g(placementId, "placementId");
    }
}

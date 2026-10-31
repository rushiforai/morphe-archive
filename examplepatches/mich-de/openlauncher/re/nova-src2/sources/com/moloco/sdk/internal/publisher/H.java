package com.moloco.sdk.internal.publisher;

import android.content.Context;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.C2930d;
import com.moloco.sdk.internal.services.InterfaceC2958f;
import com.moloco.sdk.publisher.AdFormatType;
import com.moloco.sdk.publisher.AdShowListener;
import com.moloco.sdk.publisher.InterstitialAd;
import com.moloco.sdk.publisher.InterstitialAdShowListener;
import com.moloco.sdk.publisher.MolocoAd;
import com.moloco.sdk.publisher.MolocoAdError;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class H {

    public static final class a implements InterstitialAdShowListener, AdShowListener {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ AdShowListener f36902a;

        public a(InterstitialAdShowListener interstitialAdShowListener) {
            this.f36902a = C2948j.a(interstitialAdShowListener);
        }

        @Override // com.moloco.sdk.publisher.AdShowListener
        public void onAdClicked(MolocoAd molocoAd) {
            Intrinsics.g(molocoAd, "molocoAd");
            this.f36902a.onAdClicked(molocoAd);
        }

        @Override // com.moloco.sdk.publisher.AdShowListener
        public void onAdHidden(MolocoAd molocoAd) {
            Intrinsics.g(molocoAd, "molocoAd");
            this.f36902a.onAdHidden(molocoAd);
        }

        @Override // com.moloco.sdk.publisher.AdShowListener
        public void onAdShowFailed(MolocoAdError molocoAdError) {
            Intrinsics.g(molocoAdError, "molocoAdError");
            this.f36902a.onAdShowFailed(molocoAdError);
        }

        @Override // com.moloco.sdk.publisher.AdShowListener
        public void onAdShowSuccess(MolocoAd molocoAd) {
            Intrinsics.g(molocoAd, "molocoAd");
            this.f36902a.onAdShowSuccess(molocoAd);
        }
    }

    @NotNull
    public static final InterstitialAd a(@NotNull Context context, @NotNull InterfaceC2958f appLifecycleTrackerService, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @NotNull String adUnitId, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r externalLinkHandler, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i persistentHttpRequest, @NotNull v<InterstitialAdShowListener> adDataHolder, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z watermark, @NotNull C2939a adCreateLoadTimeoutManager, @NotNull MetricsRecorder metricsRecorder) {
        Intrinsics.g(context, "context");
        Intrinsics.g(appLifecycleTrackerService, "appLifecycleTrackerService");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        Intrinsics.g(persistentHttpRequest, "persistentHttpRequest");
        Intrinsics.g(adDataHolder, "adDataHolder");
        Intrinsics.g(watermark, "watermark");
        Intrinsics.g(adCreateLoadTimeoutManager, "adCreateLoadTimeoutManager");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        return new G(new w(context, appLifecycleTrackerService, customUserEventBuilderService, adUnitId, persistentHttpRequest, externalLinkHandler, new com.instabridge.mobilesdk.internal.data.api.a(7), adDataHolder, AdFormatType.INTERSTITIAL, watermark, adCreateLoadTimeoutManager, metricsRecorder));
    }

    public static final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.i a(com.moloco.sdk.internal.ortb.model.B b11) {
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.i iVarA;
        return (b11 == null || (iVarA = C2930d.a(b11)) == null) ? C2930d.a() : iVarA;
    }

    @NotNull
    public static final InterstitialAdShowListener a(@Nullable InterstitialAdShowListener interstitialAdShowListener) {
        return new a(interstitialAdShowListener);
    }
}

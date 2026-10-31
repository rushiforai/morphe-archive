package hd;

import ads_mobile_sdk.vo1;
import android.content.Context;
import android.net.Uri;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.MediaView;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import eg.s;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class f extends InneractiveAdSpot.NativeAdRequestListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g f59617a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ s f59618b;

    public f(g gVar, s sVar) {
        this.f59617a = gVar;
        this.f59618b = sVar;
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot.RequestListener
    public final void onInneractiveFailedAdRequest(InneractiveAdSpot inneractiveAdSpot, InneractiveErrorCode inneractiveErrorCode) {
        g.f(this.f59617a, "onInneractiveFailedAdRequest error: " + inneractiveErrorCode, inneractiveErrorCode);
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot.NativeAdRequestListener
    public final void onInneractiveSuccessfulNativeAdRequest(InneractiveAdSpot inneractiveAdSpot, NativeAdContent nativeAdContent) {
        g gVar = this.f59617a;
        if (nativeAdContent == null) {
            g.f(gVar, "content is NOT NativeAdContent", InneractiveErrorCode.SDK_INTERNAL_ERROR);
            return;
        }
        Context context = this.f59618b.f52733b;
        Intrinsics.f(context, "getContext(...)");
        nativeAdContent.bindMediaView(new MediaView(context));
        gVar.f59620q = nativeAdContent;
        String adTitle = nativeAdContent.getAdTitle();
        if (adTitle != null) {
            gVar.f52748a = adTitle;
        }
        String adDescription = nativeAdContent.getAdDescription();
        if (adDescription != null) {
            gVar.f52750c = adDescription;
        }
        Uri appIcon = nativeAdContent.getAppIcon();
        if (appIcon != null) {
            gVar.f52751d = new c(appIcon);
        }
        String adCallToAction = nativeAdContent.getAdCallToAction();
        if (adCallToAction != null) {
            gVar.f52752e = adCallToAction;
        }
        MediaView mediaView = nativeAdContent.getMediaView();
        if (mediaView != null) {
            gVar.f52756i = mediaView;
        }
        nativeAdContent.getRating();
        Float mediaAspectRatio = nativeAdContent.getMediaAspectRatio();
        if (mediaAspectRatio != null) {
            gVar.f52760m = mediaAspectRatio.floatValue();
        }
        gVar.f52759l = true;
        gVar.f52758k = true;
        gVar.o = (vo1) gVar.n.onSuccess(gVar);
    }
}

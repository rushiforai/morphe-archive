package hd;

import ads_mobile_sdk.vo1;
import android.util.Log;
import android.view.View;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveAdSpotManager;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.MediaView;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.fyber.inneractive.sdk.external.NativeAdUnitController;
import com.fyber.inneractive.sdk.external.NativeAdVideoContentController;
import com.google.ads.mediation.fyber.FyberMediationAdapter;
import com.google.android.libraries.ads.mobile.sdk.nativead.NativeAdAssetNames;
import eg.s;
import eg.x;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class g extends x {
    public final eg.f n;
    public vo1 o;

    /* renamed from: p, reason: collision with root package name */
    public InneractiveAdSpot f59619p;

    /* renamed from: q, reason: collision with root package name */
    public NativeAdContent f59620q;

    public g(eg.f adLoadCallback) {
        Intrinsics.g(adLoadCallback, "adLoadCallback");
        this.n = adLoadCallback;
    }

    public static final void f(g gVar, String str, InneractiveErrorCode inneractiveErrorCode) {
        Log.e("DTExchangeNativeAdMapper", str);
        eg.f fVar = gVar.n;
        if (inneractiveErrorCode == null) {
            inneractiveErrorCode = InneractiveErrorCode.SDK_INTERNAL_ERROR;
        }
        fVar.onFailure(b.a(inneractiveErrorCode));
        InneractiveAdSpot inneractiveAdSpot = gVar.f59619p;
        if (inneractiveAdSpot != null) {
            inneractiveAdSpot.destroy();
        }
        gVar.f59619p = null;
    }

    @Override // eg.x
    public final void a() {
        InneractiveAdSpot inneractiveAdSpot = this.f59619p;
        if (inneractiveAdSpot != null) {
            inneractiveAdSpot.destroy();
        }
        this.f59619p = null;
        NativeAdContent nativeAdContent = this.f59620q;
        if (nativeAdContent != null) {
            nativeAdContent.destroy();
        }
        this.f59620q = null;
        this.o = null;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    /* JADX WARN: Removed duplicated region for block: B:34:0x007d  */
    @Override // eg.x
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void d(ni.o oVar, Map map) {
        String str;
        oVar.setTag(NativeAdContent.ViewTag.ROOT);
        NativeAdContent nativeAdContent = this.f59620q;
        MediaView mediaView = nativeAdContent != null ? nativeAdContent.getMediaView() : null;
        if (mediaView != null) {
            mediaView.setTag(NativeAdContent.ViewTag.MEDIA_VIEW);
        }
        for (Map.Entry entry : map.entrySet()) {
            String str2 = (String) entry.getKey();
            View view = (View) entry.getValue();
            int iHashCode = str2.hashCode();
            if (iHashCode != 1567014) {
                switch (iHashCode) {
                    case 1567006:
                        if (str2.equals(NativeAdAssetNames.ASSET_HEADLINE)) {
                            str = NativeAdContent.ViewTag.AD_TITLE;
                            break;
                        } else {
                            str = NativeAdContent.ViewTag.OTHER;
                            break;
                        }
                    case 1567007:
                        if (str2.equals(NativeAdAssetNames.ASSET_CALL_TO_ACTION)) {
                            str = NativeAdContent.ViewTag.CTA;
                            break;
                        }
                        break;
                    case 1567008:
                        if (str2.equals(NativeAdAssetNames.ASSET_ICON)) {
                            str = NativeAdContent.ViewTag.AD_ICON;
                            break;
                        }
                        break;
                    case 1567009:
                        if (str2.equals(NativeAdAssetNames.ASSET_BODY)) {
                            str = NativeAdContent.ViewTag.AD_DESCRIPTION;
                            break;
                        }
                        break;
                }
            } else if (str2.equals(NativeAdAssetNames.ASSET_STAR_RATING)) {
                str = NativeAdContent.ViewTag.RATING;
            }
            view.setTag(str);
        }
        NativeAdContent nativeAdContent2 = this.f59620q;
        if (nativeAdContent2 != null) {
            nativeAdContent2.registerViewsForInteraction(oVar, nativeAdContent2.getMediaView(), null, map.values());
        }
    }

    public final void g(s mediationNativeAdConfiguration) {
        Intrinsics.g(mediationNativeAdConfiguration, "mediationNativeAdConfiguration");
        InneractiveAdManager.setMediationName(FyberMediationAdapter.f31425c);
        InneractiveAdManager.setMediationVersion(u90.b.M().toString());
        String str = mediationNativeAdConfiguration.f52734c;
        Intrinsics.f(str, "getBidResponse(...)");
        String str2 = mediationNativeAdConfiguration.f52739h;
        Intrinsics.f(str2, "getWatermark(...)");
        InneractiveAdSpot inneractiveAdSpotCreateSpot = InneractiveAdSpotManager.get().createSpot();
        NativeAdUnitController nativeAdUnitController = new NativeAdUnitController();
        NativeAdVideoContentController nativeAdVideoContentController = new NativeAdVideoContentController();
        nativeAdVideoContentController.setEventsListener(new d(this));
        nativeAdUnitController.addContentController(nativeAdVideoContentController);
        nativeAdUnitController.setEventsListener(new e(this));
        inneractiveAdSpotCreateSpot.addUnitController(nativeAdUnitController);
        inneractiveAdSpotCreateSpot.setRequestListener(new f(this, mediationNativeAdConfiguration));
        bh.g.m0(mediationNativeAdConfiguration.f52736e);
        inneractiveAdSpotCreateSpot.loadAd(str, str2);
        this.f59619p = inneractiveAdSpotCreateSpot;
    }
}

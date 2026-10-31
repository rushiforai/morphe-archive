package com.google.ads.mediation.vungle;

import ads_mobile_sdk.xo1;
import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import b.c0;
import com.google.android.gms.ads.mediation.rtb.RtbAdapter;
import com.google.android.gms.internal.measurement.v6;
import com.vungle.ads.AdConfig;
import com.vungle.ads.BaseAd;
import com.vungle.ads.RewardedAd;
import com.vungle.ads.RewardedAdListener;
import com.vungle.ads.VungleAds;
import com.vungle.ads.VungleError;
import com.vungle.ads.VungleMediationLogger;
import com.vungle.mediation.BuildConfig;
import eg.f;
import eg.j;
import eg.n;
import eg.q;
import eg.s;
import eg.u;
import eg.v;
import eg.w;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import ld.d;
import nd.a;
import nd.b;
import nd.c;
import nd.e;
import nd.g;
import x7.l;

/* loaded from: classes.dex */
public class VungleMediationAdapter extends RtbAdapter implements u, RewardedAdListener {
    public static final int ERROR_CANNOT_GET_BID_TOKEN = 108;
    public static final int ERROR_CANNOT_PLAY_AD = 107;
    public static final String ERROR_DOMAIN = "com.google.ads.mediation.vungle";
    public static final int ERROR_INITIALIZATION_FAILURE = 105;
    public static final int ERROR_INVALID_SERVER_PARAMETERS = 101;
    public static final String TAG = "VungleMediationAdapter";
    public static final String VUNGLE_SDK_ERROR_DOMAIN = "com.vungle.ads";
    private AdConfig adConfig;
    private f mediationAdLoadCallback;
    private v mediationRewardedAdCallback;
    private String placementId;
    private RewardedAd rewardedAd;
    private a rtbAppOpenAd;
    private b rtbBannerAd;
    private c rtbInterstitialAd;
    private e rtbNativeAd;
    private g rtbRewardedAd;
    private g rtbRewardedInterstitialAd;
    private String userId;
    private final ld.a vungleFactory = new ld.a();
    private od.a waterfallAppOpenAd;
    private od.c waterfallInterstitialAd;

    public static bg.a getAdError(VungleError vungleError) {
        return new bg.a(vungleError.getCom.tiktok.appevents.edp.TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE java.lang.String(), vungleError.getErrorMessage(), "com.vungle.ads");
    }

    public static String getAdapterVersion() {
        return BuildConfig.ADAPTER_VERSION;
    }

    public static boolean runtimeGmaSdkListensToAdapterReportedImpressions() {
        u90.b.M();
        return true;
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void collectSignals(gg.a aVar, gg.b bVar) {
        VungleAds.INSTANCE.getBiddingToken(aVar.f57672a, new v6(bVar, 13));
    }

    @Override // eg.b
    public bg.f getSDKVersionInfo() {
        String sdkVersion = VungleAds.INSTANCE.getSdkVersion();
        String[] strArrSplit = sdkVersion.split("\\.");
        if (strArrSplit.length >= 3) {
            return new bg.f(Integer.parseInt(strArrSplit[0]), Integer.parseInt(strArrSplit[1]), Integer.parseInt(strArrSplit[2]));
        }
        Log.w(TAG, c0.l("Unexpected SDK version format: ", sdkVersion, ". Returning 0.0.0 for SDK version."));
        return new bg.f(0, 0, 0);
    }

    @Override // eg.b
    public bg.f getVersionInfo() throws NumberFormatException {
        String adapterVersion = getAdapterVersion();
        String[] strArrSplit = adapterVersion.split("\\.");
        if (strArrSplit.length < 4) {
            Log.w(TAG, c0.l("Unexpected adapter version format: ", adapterVersion, ". Returning 0.0.0 for adapter version."));
            return new bg.f(0, 0, 0);
        }
        return new bg.f(Integer.parseInt(strArrSplit[0]), Integer.parseInt(strArrSplit[1]), Integer.parseInt(strArrSplit[3]) + (Integer.parseInt(strArrSplit[2]) * 100));
    }

    @Override // eg.b
    public void initialize(Context context, eg.c cVar, List<n> list) {
        if (VungleAds.INSTANCE.isInitialized()) {
            ((l) cVar).onInitializationSucceeded();
            return;
        }
        HashSet hashSet = new HashSet();
        Iterator<n> it = list.iterator();
        while (it.hasNext()) {
            String string = it.next().f52725b.getString("appid");
            if (!TextUtils.isEmpty(string)) {
                hashSet.add(string);
            }
        }
        int size = hashSet.size();
        if (size <= 0) {
            if (cVar != null) {
                bg.a aVar = new bg.a(101, "Missing or Invalid App ID.", ERROR_DOMAIN);
                Log.w(TAG, aVar.toString());
                ((l) cVar).onInitializationFailed(aVar.toString());
                return;
            }
            return;
        }
        String str = (String) hashSet.iterator().next();
        if (size > 1) {
            String str2 = String.format("Multiple '%s' entries found: %s. Using '%s' to initialize the Vungle SDK.", "appid", hashSet, str);
            Log.w(TAG, str2);
            VungleMediationLogger.logError(null, str2);
        }
        ld.c.f74856c.a(str, context, new d(cVar));
    }

    @Override // eg.b
    public void loadAppOpenAd(j jVar, f fVar) {
        ld.c cVar = ld.c.f74856c;
        bg.e eVarL = u90.b.L();
        cVar.getClass();
        ld.c.b(eVarL);
        od.a aVar = new od.a(fVar, this.vungleFactory);
        this.waterfallAppOpenAd = aVar;
        aVar.c(jVar);
    }

    @Override // eg.b
    public void loadBannerAd(eg.l lVar, f fVar) {
        ld.c cVar = ld.c.f74856c;
        bg.e eVarL = u90.b.L();
        cVar.getClass();
        ld.c.b(eVarL);
        new od.b(fVar, this.vungleFactory).b(lVar);
    }

    @Override // eg.b
    public void loadInterstitialAd(q qVar, f fVar) {
        ld.c cVar = ld.c.f74856c;
        bg.e eVarL = u90.b.L();
        cVar.getClass();
        ld.c.b(eVarL);
        od.c cVar2 = new od.c(fVar, this.vungleFactory);
        this.waterfallInterstitialAd = cVar2;
        cVar2.c(qVar);
    }

    @Override // eg.b
    public void loadNativeAd(s sVar, f fVar) {
        ld.c cVar = ld.c.f74856c;
        bg.e eVarL = u90.b.L();
        cVar.getClass();
        ld.c.b(eVarL);
        e eVar = new e(fVar, this.vungleFactory);
        this.rtbNativeAd = eVar;
        eVar.c(sVar);
    }

    @Override // eg.b
    public void loadRewardedAd(w wVar, f fVar) {
        this.mediationAdLoadCallback = fVar;
        Bundle bundleG = wVar.g();
        Bundle bundleH = wVar.h();
        if (bundleG != null) {
            this.userId = bundleG.getString("userId");
        }
        String string = bundleH.getString("appid");
        if (TextUtils.isEmpty(string)) {
            bg.a aVar = new bg.a(101, "Failed to load waterfall rewarded ad from Liftoff Monetize. Missing or invalid App ID configured for this ad source instance in the AdMob or Ad Manager UI.", ERROR_DOMAIN);
            Log.w(TAG, aVar.toString());
            fVar.onFailure(aVar);
            return;
        }
        String string2 = bundleH.getString("placementID");
        if (TextUtils.isEmpty(string2)) {
            bg.a aVar2 = new bg.a(101, "Failed to load waterfall rewarded ad from Liftoff Monetize. Missing or Invalid Placement ID configured for this ad source instance in the AdMob or Ad Manager UI.", ERROR_DOMAIN);
            Log.w(TAG, aVar2.toString());
            fVar.onFailure(aVar2);
            return;
        }
        this.placementId = string2;
        this.vungleFactory.getClass();
        this.adConfig = new AdConfig();
        if (bundleG != null && bundleG.containsKey("adOrientation")) {
            this.adConfig.setAdOrientation(bundleG.getInt("adOrientation", 2));
        }
        ld.c cVar = ld.c.f74856c;
        bg.e eVarL = u90.b.L();
        cVar.getClass();
        ld.c.b(eVarL);
        Context contextF = wVar.f();
        cVar.a(string, contextF, new ld.e(this, contextF, string2));
    }

    @Override // eg.b
    public void loadRewardedInterstitialAd(w wVar, f fVar) {
        loadRewardedAd(wVar, fVar);
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void loadRtbAppOpenAd(j jVar, f fVar) {
        ld.c cVar = ld.c.f74856c;
        bg.e eVarL = u90.b.L();
        cVar.getClass();
        ld.c.b(eVarL);
        a aVar = new a(fVar, this.vungleFactory);
        this.rtbAppOpenAd = aVar;
        aVar.c(jVar);
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void loadRtbBannerAd(eg.l lVar, f fVar) {
        ld.c cVar = ld.c.f74856c;
        bg.e eVarL = u90.b.L();
        cVar.getClass();
        ld.c.b(eVarL);
        b bVar = new b(fVar, this.vungleFactory);
        this.rtbBannerAd = bVar;
        bVar.b(lVar);
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void loadRtbInterstitialAd(q qVar, f fVar) {
        ld.c cVar = ld.c.f74856c;
        bg.e eVarL = u90.b.L();
        cVar.getClass();
        ld.c.b(eVarL);
        c cVar2 = new c(fVar, this.vungleFactory);
        this.rtbInterstitialAd = cVar2;
        cVar2.c(qVar);
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void loadRtbNativeAd(s sVar, f fVar) {
        ld.c cVar = ld.c.f74856c;
        bg.e eVarL = u90.b.L();
        cVar.getClass();
        ld.c.b(eVarL);
        e eVar = new e(fVar, this.vungleFactory);
        this.rtbNativeAd = eVar;
        eVar.c(sVar);
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void loadRtbRewardedAd(w wVar, f fVar) {
        ld.c cVar = ld.c.f74856c;
        bg.e eVarL = u90.b.L();
        cVar.getClass();
        ld.c.b(eVarL);
        g gVar = new g(fVar, this.vungleFactory);
        this.rtbRewardedAd = gVar;
        gVar.a(wVar);
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void loadRtbRewardedInterstitialAd(w wVar, f fVar) {
        ld.c cVar = ld.c.f74856c;
        bg.e eVarL = u90.b.L();
        cVar.getClass();
        ld.c.b(eVarL);
        g gVar = new g(fVar, this.vungleFactory);
        this.rtbRewardedInterstitialAd = gVar;
        gVar.a(wVar);
    }

    @Override // com.vungle.ads.BaseAdListener
    public void onAdClicked(BaseAd baseAd) {
        v vVar = this.mediationRewardedAdCallback;
        if (vVar != null) {
            ((xo1) vVar).reportAdClicked();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public void onAdEnd(BaseAd baseAd) {
        v vVar = this.mediationRewardedAdCallback;
        if (vVar != null) {
            ((xo1) vVar).onAdClosed();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public void onAdFailedToLoad(BaseAd baseAd, VungleError vungleError) {
        bg.a adError = getAdError(vungleError);
        Log.w(TAG, "Failed to load waterfall rewarded ad from Liftoff Monetize with error: " + adError.toString());
        f fVar = this.mediationAdLoadCallback;
        if (fVar != null) {
            fVar.onFailure(adError);
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public void onAdFailedToPlay(BaseAd baseAd, VungleError vungleError) {
        bg.a adError = getAdError(vungleError);
        Log.w(TAG, "Failed to play waterfall rewarded ad from Liftoff Monetize with error: " + adError.toString());
        v vVar = this.mediationRewardedAdCallback;
        if (vVar != null) {
            ((xo1) vVar).f11791a.a(adError);
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public void onAdImpression(BaseAd baseAd) {
        ((xo1) this.mediationRewardedAdCallback).f11791a.a();
        ((xo1) this.mediationRewardedAdCallback).reportAdImpression();
    }

    @Override // com.vungle.ads.BaseAdListener
    public void onAdLeftApplication(BaseAd baseAd) {
    }

    @Override // com.vungle.ads.BaseAdListener
    public void onAdLoaded(BaseAd baseAd) {
        f fVar = this.mediationAdLoadCallback;
        if (fVar != null) {
            this.mediationRewardedAdCallback = (v) fVar.onSuccess(this);
        }
    }

    @Override // com.vungle.ads.RewardedAdListener
    public void onAdRewarded(BaseAd baseAd) {
        v vVar = this.mediationRewardedAdCallback;
        if (vVar != null) {
            ((xo1) vVar).f11791a.f();
            ((xo1) this.mediationRewardedAdCallback).onUserEarnedReward();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public void onAdStart(BaseAd baseAd) {
        v vVar = this.mediationRewardedAdCallback;
        if (vVar != null) {
            ((xo1) vVar).onAdOpened();
        }
    }

    @Override // eg.u
    public void showAd(Context context) {
        RewardedAd rewardedAd = this.rewardedAd;
        if (rewardedAd != null) {
            rewardedAd.play(context);
            return;
        }
        if (this.mediationRewardedAdCallback != null) {
            bg.a aVar = new bg.a(107, "Failed to show waterfall rewarded ad from Liftoff Monetize.", ERROR_DOMAIN);
            Log.w(TAG, aVar.toString());
            ((xo1) this.mediationRewardedAdCallback).f11791a.a(aVar);
        }
        VungleMediationLogger.logError(null, "Rewarded(WF) ad instance is null: " + this.placementId);
    }
}

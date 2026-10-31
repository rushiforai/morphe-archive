package com.google.ads.mediation.fyber;

import ai.x0;
import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import bg.d;
import bg.f;
import com.fyber.inneractive.sdk.external.BidTokenProvider;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.external.InneractiveMediationName;
import com.google.android.gms.ads.mediation.rtb.RtbAdapter;
import cw.l2;
import eg.c;
import eg.n;
import eg.q;
import eg.s;
import eg.w;
import gg.a;
import gg.b;
import hd.g;
import hd.h;
import hd.i;
import hd.k;
import hd.m;
import hd.o;
import hd.p;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import x7.l;

/* loaded from: classes.dex */
public class FyberMediationAdapter extends RtbAdapter {
    public static final String KEY_MUTE_VIDEO = "muteVideo";

    /* renamed from: c, reason: collision with root package name */
    public static final InneractiveMediationName f31425c = InneractiveMediationName.ADMOB;

    /* renamed from: a, reason: collision with root package name */
    public p f31426a;

    /* renamed from: b, reason: collision with root package name */
    public g f31427b;

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void collectSignals(a aVar, b bVar) {
        String bidderToken = BidTokenProvider.getBidderToken();
        if (TextUtils.isEmpty(bidderToken)) {
            bidderToken = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        ((x0) bVar).onSuccess(bidderToken);
    }

    @Override // eg.b
    public f getSDKVersionInfo() {
        String version = InneractiveAdManager.getVersion();
        String[] strArrSplit = version.split("\\.");
        if (strArrSplit.length >= 3) {
            return new f(Integer.parseInt(strArrSplit[0]), Integer.parseInt(strArrSplit[1]), Integer.parseInt(strArrSplit[2]));
        }
        Log.w("FyberMediationAdapter", "Unexpected SDK version format: " + version + ". Returning 0.0.0 for SDK version.");
        return new f(0, 0, 0);
    }

    @Override // eg.b
    public f getVersionInfo() throws NumberFormatException {
        String[] strArrSplit = "8.4.7.0".split("\\.");
        if (strArrSplit.length < 4) {
            Log.w("FyberMediationAdapter", "Unexpected adapter version format: 8.4.7.0. Returning 0.0.0 for adapter version.");
            return new f(0, 0, 0);
        }
        return new f(Integer.parseInt(strArrSplit[0]), Integer.parseInt(strArrSplit[1]), Integer.parseInt(strArrSplit[3]) + (Integer.parseInt(strArrSplit[2]) * 100));
    }

    @Override // eg.b
    public void initialize(Context context, c cVar, List<n> list) {
        if (InneractiveAdManager.wasInitialized()) {
            ((l) cVar).onInitializationSucceeded();
            return;
        }
        HashSet hashSet = new HashSet();
        Iterator<n> it = list.iterator();
        while (it.hasNext()) {
            String string = it.next().f52725b.getString("applicationId");
            if (!TextUtils.isEmpty(string)) {
                hashSet.add(string);
            }
        }
        if (hashSet.isEmpty()) {
            Log.w("FyberMediationAdapter", "DT Exchange SDK requires an appId to be configured on the AdMob UI.");
            ((l) cVar).onInitializationFailed("DT Exchange SDK requires an appId to be configured on the AdMob UI.");
            return;
        }
        String str = (String) hashSet.iterator().next();
        if (hashSet.size() > 1) {
            Log.w("FyberMediationAdapter", String.format("Multiple '%s' entries found: %s. Using '%s' to initialize the DT Exchange SDK.", "applicationId", hashSet, str));
        }
        if (l2.G() && ((d) u90.b.L().f17884c) == d.f17880a) {
            InneractiveAdManager.currentAudienceAppliesToCoppa();
        }
        InneractiveAdManager.initialize(context, str, new o(cVar));
    }

    @Override // eg.b
    public void loadBannerAd(eg.l lVar, eg.f fVar) {
        new k(fVar).a(lVar);
    }

    @Override // eg.b
    public void loadInterstitialAd(q qVar, eg.f fVar) {
        new m().a(qVar, fVar);
    }

    @Override // eg.b
    public void loadRewardedAd(w wVar, eg.f fVar) {
        String string = wVar.h().getString("applicationId");
        if (TextUtils.isEmpty(string)) {
            bg.a aVar = new bg.a(101, "App ID is null or empty.", "com.google.ads.mediation.dtexchange");
            Log.w("FyberMediationAdapter", "App ID is null or empty.");
            fVar.onFailure(aVar);
        } else {
            InneractiveAdManager.setMediationName(f31425c);
            InneractiveAdManager.setMediationVersion(u90.b.M().toString());
            InneractiveAdManager.initialize(wVar.f(), string, new hd.n(this, fVar, wVar));
        }
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void loadRtbBannerAd(eg.l lVar, eg.f fVar) {
        new h(fVar).a(lVar);
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void loadRtbInterstitialAd(q qVar, eg.f fVar) {
        new i(fVar).a(qVar);
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void loadRtbNativeAdMapper(s sVar, eg.f fVar) {
        g gVar = this.f31427b;
        if (gVar != null) {
            gVar.a();
            this.f31427b = null;
        }
        g gVar2 = new g(fVar);
        this.f31427b = gVar2;
        gVar2.g(sVar);
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void loadRtbRewardedAd(w wVar, eg.f fVar) {
        this.f31426a = new p(fVar);
        InneractiveAdManager.setMediationName(f31425c);
        InneractiveAdManager.setMediationVersion(u90.b.M().toString());
        this.f31426a.b(wVar);
    }
}

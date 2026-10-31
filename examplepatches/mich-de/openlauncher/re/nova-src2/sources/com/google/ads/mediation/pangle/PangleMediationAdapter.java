package com.google.ads.mediation.pangle;

import ai.x0;
import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import b.c0;
import bg.f;
import com.bytedance.sdk.openadsdk.api.PAGConstant;
import com.bytedance.sdk.openadsdk.api.bidding.PAGBiddingRequest;
import com.bytedance.sdk.openadsdk.api.init.PAGConfig;
import com.bytedance.sdk.openadsdk.api.init.PAGSdk;
import com.google.android.gms.ads.mediation.rtb.RtbAdapter;
import e10.z2;
import eg.j;
import eg.n;
import eg.q;
import eg.s;
import eg.w;
import gg.b;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import jd.a;
import jd.c;
import jd.d;
import jd.e;
import kd.h;
import kd.k;
import kd.m;
import x7.l;

/* loaded from: classes.dex */
public class PangleMediationAdapter extends RtbAdapter {
    public static final String TAG = "PangleMediationAdapter";

    /* renamed from: a, reason: collision with root package name */
    public final c f31429a;

    /* renamed from: b, reason: collision with root package name */
    public final e f31430b;

    /* renamed from: c, reason: collision with root package name */
    public final a f31431c;

    public PangleMediationAdapter() {
        if (c.f69475f == null) {
            c.f69475f = new c();
        }
        this.f31429a = c.f69475f;
        this.f31430b = new e();
        this.f31431c = new a();
    }

    public static int getPAConsent() {
        return PAGConfig.getPAConsent();
    }

    public static void setPAConsent(@PAGConstant.PAGPAConsentType int i5) {
        if (i5 == 1 || i5 == 0) {
            PAGConfig.setPAConsent(i5);
        } else {
            Log.w(TAG, "Invalid PA value. Pangle SDK only accepts 0 or 1.");
        }
    }

    @Override // com.google.android.gms.ads.mediation.rtb.RtbAdapter
    public void collectSignals(gg.a aVar, b bVar) {
        if (z2.i0()) {
            ((x0) bVar).onFailure(z2.I());
            return;
        }
        Bundle bundle = aVar.f57674c;
        e eVar = this.f31430b;
        if (bundle != null && bundle.containsKey("user_data")) {
            String string = bundle.getString("user_data", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            eVar.getClass();
            PAGConfig.setUserData(string);
        }
        PAGBiddingRequest pAGBiddingRequest = new PAGBiddingRequest();
        pAGBiddingRequest.setAdxId("207");
        Context context = aVar.f57672a;
        vm.c cVar = new vm.c(bVar, 15);
        eVar.getClass();
        PAGSdk.getBiddingToken(context, pAGBiddingRequest, cVar);
    }

    @Override // eg.b
    public f getSDKVersionInfo() throws NumberFormatException {
        this.f31430b.getClass();
        String sDKVersion = PAGSdk.getSDKVersion();
        String[] strArrSplit = sDKVersion.split("\\.");
        if (strArrSplit.length < 3) {
            Log.w(TAG, c0.l("Unexpected SDK version format: ", sDKVersion, ". Returning 0.0.0 for SDK version."));
            return new f(0, 0, 0);
        }
        int i5 = Integer.parseInt(strArrSplit[0]);
        int i11 = Integer.parseInt(strArrSplit[1]);
        int i12 = Integer.parseInt(strArrSplit[2]);
        if (strArrSplit.length >= 4) {
            i12 = (i12 * 100) + Integer.parseInt(strArrSplit[3]);
        }
        return new f(i5, i11, i12);
    }

    @Override // eg.b
    public f getVersionInfo() throws NumberFormatException {
        String[] strArrSplit = "8.2.0.4.0".split("\\.");
        if (strArrSplit.length < 4) {
            Log.w(TAG, "Unexpected adapter version format: 8.2.0.4.0. Returning 0.0.0 for adapter version.");
            return new f(0, 0, 0);
        }
        int i5 = Integer.parseInt(strArrSplit[0]);
        int i11 = Integer.parseInt(strArrSplit[1]);
        int i12 = Integer.parseInt(strArrSplit[3]) + (Integer.parseInt(strArrSplit[2]) * 100);
        if (strArrSplit.length >= 5) {
            i12 = (i12 * 100) + Integer.parseInt(strArrSplit[4]);
        }
        return new f(i5, i11, i12);
    }

    @Override // eg.b
    public void initialize(Context context, eg.c cVar, List<n> list) {
        if (z2.i0()) {
            ((l) cVar).onInitializationFailed("MobileAds.getRequestConfiguration() indicates the user is a child. Pangle SDK V71 or higher does not support child users.");
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
            bg.a aVar = new bg.a(101, "Missing or invalid App ID.", "com.google.ads.mediation.pangle");
            Log.w(TAG, aVar.toString());
            ((l) cVar).onInitializationFailed(aVar.toString());
            return;
        }
        String str = (String) hashSet.iterator().next();
        if (size > 1) {
            Log.w(TAG, String.format("Found multiple app IDs in %s. Using %s to initialize Pangle SDK.", hashSet, str));
        }
        this.f31429a.a(context, str, new d(cVar));
    }

    @Override // eg.b
    public void loadAppOpenAd(j jVar, eg.f fVar) {
        if (z2.i0()) {
            fVar.onFailure(z2.I());
            return;
        }
        a aVar = this.f31431c;
        aVar.getClass();
        new kd.c(fVar, this.f31429a, this.f31430b, aVar).a(jVar);
    }

    @Override // eg.b
    public void loadBannerAd(eg.l lVar, eg.f fVar) {
        if (z2.i0()) {
            fVar.onFailure(z2.I());
            return;
        }
        a aVar = this.f31431c;
        aVar.getClass();
        new kd.f(fVar, this.f31429a, this.f31430b, aVar).a(lVar);
    }

    @Override // eg.b
    public void loadInterstitialAd(q qVar, eg.f fVar) {
        if (z2.i0()) {
            fVar.onFailure(z2.I());
            return;
        }
        a aVar = this.f31431c;
        aVar.getClass();
        new h(fVar, this.f31429a, this.f31430b, aVar).a(qVar);
    }

    @Override // eg.b
    public void loadNativeAd(s sVar, eg.f fVar) {
        if (z2.i0()) {
            fVar.onFailure(z2.I());
            return;
        }
        a aVar = this.f31431c;
        aVar.getClass();
        new k(fVar, this.f31429a, this.f31430b, aVar).c(sVar);
    }

    @Override // eg.b
    public void loadRewardedAd(w wVar, eg.f fVar) {
        if (z2.i0()) {
            fVar.onFailure(z2.I());
            return;
        }
        a aVar = this.f31431c;
        aVar.getClass();
        new m(fVar, this.f31429a, this.f31430b, aVar).a(wVar);
    }
}

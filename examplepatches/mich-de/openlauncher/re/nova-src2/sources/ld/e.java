package ld;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.google.ads.mediation.vungle.VungleMediationAdapter;
import com.vungle.ads.AdConfig;
import com.vungle.ads.RewardedAd;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class e implements b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f74860a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f74861b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ VungleMediationAdapter f74862c;

    public e(VungleMediationAdapter vungleMediationAdapter, Context context, String str) {
        this.f74862c = vungleMediationAdapter;
        this.f74860a = context;
        this.f74861b = str;
    }

    @Override // ld.b
    public final void a(bg.a aVar) {
        Log.w(VungleMediationAdapter.TAG, aVar.toString());
        this.f74862c.mediationAdLoadCallback.onFailure(aVar);
    }

    @Override // ld.b
    public final void b() {
        VungleMediationAdapter vungleMediationAdapter = this.f74862c;
        a aVar = vungleMediationAdapter.vungleFactory;
        AdConfig adConfig = vungleMediationAdapter.adConfig;
        aVar.getClass();
        Context context = this.f74860a;
        Intrinsics.g(context, "context");
        String placementId = this.f74861b;
        Intrinsics.g(placementId, "placementId");
        Intrinsics.g(adConfig, "adConfig");
        vungleMediationAdapter.rewardedAd = new RewardedAd(context, placementId, adConfig);
        vungleMediationAdapter.rewardedAd.setAdListener(vungleMediationAdapter);
        vungleMediationAdapter.rewardedAd.setAdapterAdFormat("VungleMediationAdapter-rewarded");
        if (!TextUtils.isEmpty(vungleMediationAdapter.userId)) {
            vungleMediationAdapter.rewardedAd.setUserId(vungleMediationAdapter.userId);
        }
        vungleMediationAdapter.rewardedAd.load();
    }
}

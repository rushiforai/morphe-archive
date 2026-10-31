package nd;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.google.ads.mediation.vungle.VungleMediationAdapter;
import com.vungle.ads.AdConfig;
import com.vungle.ads.RewardedAd;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class f implements ld.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f78211a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f78212b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ AdConfig f78213c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f78214d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ String f78215e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ g f78216f;

    public f(g gVar, Context context, String str, AdConfig adConfig, String str2, String str3) {
        this.f78216f = gVar;
        this.f78211a = context;
        this.f78212b = str;
        this.f78213c = adConfig;
        this.f78214d = str2;
        this.f78215e = str3;
    }

    @Override // ld.b
    public final void a(bg.a aVar) {
        Log.w(VungleMediationAdapter.TAG, aVar.toString());
        this.f78216f.f78217a.onFailure(aVar);
    }

    @Override // ld.b
    public final void b() {
        g gVar = this.f78216f;
        gVar.f78221e.getClass();
        Context context = this.f78211a;
        Intrinsics.g(context, "context");
        String placementId = this.f78212b;
        Intrinsics.g(placementId, "placementId");
        RewardedAd rewardedAd = new RewardedAd(context, placementId, this.f78213c);
        gVar.f78219c = rewardedAd;
        rewardedAd.setAdListener(gVar);
        gVar.f78219c.setAdapterAdFormat("VungleRtbRewardedAd");
        String str = this.f78214d;
        if (!TextUtils.isEmpty(str)) {
            gVar.f78219c.setUserId(str);
        }
        gVar.f78219c.load(this.f78215e);
    }
}

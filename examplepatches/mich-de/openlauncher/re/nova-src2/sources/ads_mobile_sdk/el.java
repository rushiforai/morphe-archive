package ads_mobile_sdk;

import android.app.Activity;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class el extends c0.g2 implements ni.a {

    /* renamed from: b, reason: collision with root package name */
    public final od1 f2903b;

    /* renamed from: c, reason: collision with root package name */
    public final vw2 f2904c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public el(od1 internalBannerAd, vw2 adFrame) {
        super(internalBannerAd);
        Intrinsics.g(internalBannerAd, "internalBannerAd");
        Intrinsics.g(adFrame, "adFrame");
        this.f2903b = internalBannerAd;
        this.f2904c = adFrame;
    }

    public od1 b() {
        return this.f2903b;
    }

    public final vw2 getView(Activity activity) {
        Intrinsics.g(activity, "activity");
        b.b4.f15783a.getClass();
        ((g0) ((db0) gu0.a()).E.get()).a(activity, s.f9369e);
        return this.f2904c;
    }

    public void setAdEventCallback(mi.c cVar) {
        b().j().a$1(cVar);
    }
}

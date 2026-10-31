package ads_mobile_sdk;

import eg.d;

/* loaded from: classes.dex */
public final class ro1 implements d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ kh0 f9260a;

    public ro1(kh0 kh0Var) {
        this.f9260a = kh0Var;
    }

    @Override // eg.d
    public final void onAdOpened() {
        this.f9260a.c();
    }

    @Override // eg.d
    public final void reportAdClicked() {
        this.f9260a.d();
    }

    @Override // eg.d
    public final void reportAdImpression() {
        this.f9260a.e();
    }
}

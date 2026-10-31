package ads_mobile_sdk;

import eg.d;

/* loaded from: classes.dex */
public final class to1 implements d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ kh0 f10019a;

    public to1(kh0 kh0Var) {
        this.f10019a = kh0Var;
    }

    public final void onAdClosed() {
        this.f10019a.b();
    }

    @Override // eg.d
    public final void onAdOpened() {
        this.f10019a.c();
    }

    @Override // eg.d
    public final void reportAdClicked() {
        this.f10019a.d();
    }

    @Override // eg.d
    public final void reportAdImpression() {
        this.f10019a.e();
    }
}

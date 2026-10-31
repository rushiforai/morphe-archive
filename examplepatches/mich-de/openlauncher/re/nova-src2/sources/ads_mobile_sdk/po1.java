package ads_mobile_sdk;

import eg.d;

/* loaded from: classes2.dex */
public final class po1 implements d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ kh0 f8345a;

    public po1(kh0 kh0Var) {
        this.f8345a = kh0Var;
    }

    @Override // eg.d
    public final void onAdOpened() {
        this.f8345a.c();
    }

    @Override // eg.d
    public final void reportAdClicked() {
        this.f8345a.d();
    }

    @Override // eg.d
    public final void reportAdImpression() {
        this.f8345a.e();
    }
}

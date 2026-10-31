package ads_mobile_sdk;

import eg.d;

/* loaded from: classes.dex */
public final class vo1 implements d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ kh0 f10837a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f10838b;

    public /* synthetic */ vo1(kh0 kh0Var, int i5) {
        this.f10838b = i5;
        this.f10837a = kh0Var;
    }

    public final void onAdLeftApplication() {
        switch (this.f10838b) {
            case 0:
                this.f10837a.a();
                break;
            default:
                this.f10837a.a();
                break;
        }
    }

    @Override // eg.d
    public final void onAdOpened() {
        switch (this.f10838b) {
            case 0:
                this.f10837a.c();
                break;
            default:
                this.f10837a.c();
                break;
        }
    }

    public final void onVideoComplete() {
        switch (this.f10838b) {
            case 0:
                this.f10837a.f();
                break;
            default:
                this.f10837a.f();
                break;
        }
    }

    @Override // eg.d
    public final void reportAdClicked() {
        switch (this.f10838b) {
            case 0:
                this.f10837a.d();
                break;
            default:
                this.f10837a.d();
                break;
        }
    }

    @Override // eg.d
    public final void reportAdImpression() {
        switch (this.f10838b) {
            case 0:
                this.f10837a.e();
                break;
            default:
                this.f10837a.e();
                break;
        }
    }
}

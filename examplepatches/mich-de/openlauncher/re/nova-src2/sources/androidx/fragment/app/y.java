package androidx.fragment.app;

/* loaded from: classes2.dex */
public final class y implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14716a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h0 f14717b;

    public /* synthetic */ y(h0 h0Var, int i5) {
        this.f14716a = i5;
        this.f14717b = h0Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f14716a) {
            case 0:
                this.f14717b.startPostponedEnterTransition();
                break;
            default:
                this.f14717b.callStartTransitionListener(false);
                break;
        }
    }
}

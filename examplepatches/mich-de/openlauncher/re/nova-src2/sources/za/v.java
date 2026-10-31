package za;

/* loaded from: classes2.dex */
public final /* synthetic */ class v implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f98495a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l30.s f98496b;

    public /* synthetic */ v(l30.s sVar, int i5) {
        this.f98495a = i5;
        this.f98496b = sVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f98495a) {
            case 0:
                this.f98496b.K(true);
                break;
            default:
                l30.s sVar = this.f98496b;
                sVar.f74693d.u().removeView(sVar);
                Runnable runnable = sVar.f74694e;
                if (runnable != null) {
                    runnable.run();
                    break;
                }
                break;
        }
    }
}

package za;

/* loaded from: classes2.dex */
public final /* synthetic */ class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f98418a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g f98419b;

    public /* synthetic */ e(g gVar, int i5) {
        this.f98418a = i5;
        this.f98419b = gVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f98418a) {
            case 0:
                g gVar = this.f98419b;
                gVar.f98427c.u().removeView(gVar);
                break;
            default:
                this.f98419b.Q(true);
                break;
        }
    }
}

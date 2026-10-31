package gf;

/* loaded from: classes3.dex */
public final /* synthetic */ class h0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57507a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l0 f57508b;

    public /* synthetic */ h0(l0 l0Var, int i5) {
        this.f57507a = i5;
        this.f57508b = l0Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f57507a) {
            case 0:
                this.f57508b.x();
                break;
            case 1:
                l0 l0Var = this.f57508b;
                if (!l0Var.K) {
                    s sVar = l0Var.f57555p;
                    sVar.getClass();
                    sVar.a(l0Var);
                    break;
                }
                break;
            default:
                this.f57508b.E = true;
                break;
        }
    }
}

package gf;

/* loaded from: classes3.dex */
public final /* synthetic */ class y implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57660a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a0 f57661b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b0 f57662c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ m f57663d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ r f57664e;

    public /* synthetic */ y(a0 a0Var, b0 b0Var, m mVar, r rVar, int i5) {
        this.f57660a = i5;
        this.f57661b = a0Var;
        this.f57662c = b0Var;
        this.f57663d = mVar;
        this.f57664e = rVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f57660a) {
            case 0:
                a0 a0Var = this.f57661b;
                this.f57662c.e(a0Var.f57451a, a0Var.f57452b, this.f57663d, this.f57664e);
                break;
            case 1:
                a0 a0Var2 = this.f57661b;
                this.f57662c.h(a0Var2.f57451a, a0Var2.f57452b, this.f57663d, this.f57664e);
                break;
            default:
                a0 a0Var3 = this.f57661b;
                this.f57662c.J(a0Var3.f57451a, a0Var3.f57452b, this.f57663d, this.f57664e);
                break;
        }
    }
}

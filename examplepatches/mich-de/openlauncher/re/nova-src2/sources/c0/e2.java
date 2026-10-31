package c0;

/* loaded from: classes2.dex */
public final class e2 implements p1.k0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18774a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c2 f18775b;

    public /* synthetic */ e2(c2 c2Var, int i5) {
        this.f18774a = i5;
        this.f18775b = c2Var;
    }

    @Override // p1.k0
    public final void dispose() {
        switch (this.f18774a) {
            case 0:
                c2 c2Var = this.f18775b;
                c2Var.j();
                c2Var.f18730a.i();
                break;
            default:
                c2 c2Var2 = this.f18775b;
                c2Var2.j();
                c2Var2.f18730a.i();
                break;
        }
    }
}

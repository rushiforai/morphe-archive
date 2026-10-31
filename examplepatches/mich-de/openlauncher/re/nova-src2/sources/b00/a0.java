package b00;

/* loaded from: classes4.dex */
public final /* synthetic */ class a0 implements h6.y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16296a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f16297b;

    public /* synthetic */ a0(p1.e1 e1Var, int i5) {
        this.f16296a = i5;
        this.f16297b = e1Var;
    }

    @Override // h6.y
    public final void d(h6.a0 a0Var, h6.s sVar) {
        switch (this.f16296a) {
            case 0:
                if (sVar == h6.s.ON_RESUME) {
                    p1.e1 e1Var = this.f16297b;
                    e1Var.setValue(Integer.valueOf(((Number) e1Var.getValue()).intValue() + 1));
                    break;
                }
                break;
            default:
                this.f16297b.setValue(sVar);
                break;
        }
    }
}

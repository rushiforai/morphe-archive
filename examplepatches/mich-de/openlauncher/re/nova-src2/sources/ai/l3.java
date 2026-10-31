package ai;

/* loaded from: classes3.dex */
public final class l3 extends m {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f13114e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ p3 f13115f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l3(p3 p3Var, m1 m1Var, int i5) {
        super(m1Var);
        this.f13114e = i5;
        this.f13115f = p3Var;
    }

    @Override // ai.m
    public final void a() {
        switch (this.f13114e) {
            case 0:
                p3 p3Var = this.f13115f;
                p3Var.D();
                if (p3Var.U()) {
                    o0 o0Var = ((m1) p3Var.f13368a).f13138f;
                    m1.l(o0Var);
                    o0Var.n.a("Inactivity, disconnecting from the service");
                    p3Var.L();
                    break;
                }
                break;
            default:
                o0 o0Var2 = ((m1) this.f13115f.f13368a).f13138f;
                m1.l(o0Var2);
                o0Var2.f13193i.a("Tasks have been queued for a long time");
                break;
        }
    }
}

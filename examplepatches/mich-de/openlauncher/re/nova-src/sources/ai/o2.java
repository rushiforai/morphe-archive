package ai;

/* loaded from: classes3.dex */
public final class o2 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f13201a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a2 f13202b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f13203c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f13204d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ t2 f13205e;

    public /* synthetic */ o2(t2 t2Var, a2 a2Var, long j11, boolean z11, int i5) {
        this.f13201a = i5;
        this.f13202b = a2Var;
        this.f13203c = j11;
        this.f13204d = z11;
        this.f13205e = t2Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f13201a) {
            case 0:
                t2 t2Var = this.f13205e;
                a2 a2Var = this.f13202b;
                t2Var.d0(a2Var);
                t2Var.T(a2Var, this.f13203c, this.f13204d);
                break;
            default:
                t2 t2Var2 = this.f13205e;
                a2 a2Var2 = this.f13202b;
                t2Var2.d0(a2Var2);
                t2Var2.T(a2Var2, this.f13203c, this.f13204d);
                break;
        }
    }
}

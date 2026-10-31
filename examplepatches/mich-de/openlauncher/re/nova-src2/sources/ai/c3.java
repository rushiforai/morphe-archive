package ai;

/* loaded from: classes3.dex */
public final class c3 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ b3 f12884a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b3 f12885b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f12886c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f12887d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ f3 f12888e;

    public c3(f3 f3Var, b3 b3Var, b3 b3Var2, long j11, boolean z11) {
        this.f12884a = b3Var;
        this.f12885b = b3Var2;
        this.f12886c = j11;
        this.f12887d = z11;
        this.f12888e = f3Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f12888e.J(this.f12884a, this.f12885b, this.f12886c, this.f12887d, null);
    }
}

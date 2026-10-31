package w70;

/* loaded from: classes.dex */
public final class a2 implements z1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93849a;

    @Override // w70.z1
    public final m a(x70.a0 a0Var) {
        switch (this.f93849a) {
            case 0:
                return new n8.q(w1.f94061a, 3);
            default:
                return new p1(new d2(a0Var, null));
        }
    }

    public final String toString() {
        switch (this.f93849a) {
            case 0:
                return "SharingStarted.Eagerly";
            default:
                return "SharingStarted.Lazily";
        }
    }
}

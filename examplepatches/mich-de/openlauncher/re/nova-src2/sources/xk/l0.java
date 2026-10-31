package xk;

/* loaded from: classes.dex */
public final class l0 extends a {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f95961d = 0;

    /* renamed from: e, reason: collision with root package name */
    public final Iterable f95962e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l0(m0 m0Var, int i5) {
        super(i5, 0);
        this.f95962e = m0Var;
    }

    @Override // xk.a
    public final Object a(int i5) {
        switch (this.f95961d) {
            case 0:
                return ((m0) this.f95962e).f95965a[i5].iterator();
            default:
                return ((v0) this.f95962e).get(i5);
        }
    }

    public l0(v0 v0Var, int i5) {
        super(v0Var.size(), i5);
        this.f95962e = v0Var;
    }
}

package b3;

/* loaded from: classes.dex */
public final class k2 implements g2 {

    /* renamed from: a, reason: collision with root package name */
    public z2.s0 f17279a;

    /* renamed from: b, reason: collision with root package name */
    public final y0 f17280b;

    public k2(z2.s0 s0Var, y0 y0Var) {
        this.f17279a = s0Var;
        this.f17280b = y0Var;
    }

    @Override // b3.g2
    public final boolean isValidOwnerScope() {
        return this.f17280b.b0().isAttached();
    }
}

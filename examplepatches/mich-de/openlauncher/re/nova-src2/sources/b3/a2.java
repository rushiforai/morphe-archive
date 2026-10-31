package b3;

/* loaded from: classes.dex */
public final class a2 implements g2 {

    /* renamed from: a, reason: collision with root package name */
    public final z1 f17150a;

    public a2(z1 z1Var) {
        this.f17150a = z1Var;
    }

    @Override // b3.g2
    public final boolean isValidOwnerScope() {
        return this.f17150a.getNode().getIsAttached();
    }
}

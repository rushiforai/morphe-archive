package z2;

/* loaded from: classes.dex */
public final class v1 {

    /* renamed from: a, reason: collision with root package name */
    public final y1 f98160a;

    /* renamed from: b, reason: collision with root package name */
    public n0 f98161b;

    /* renamed from: c, reason: collision with root package name */
    public final u1 f98162c = new u1(this, 2);

    /* renamed from: d, reason: collision with root package name */
    public final u1 f98163d = new u1(this, 0);

    /* renamed from: e, reason: collision with root package name */
    public final u1 f98164e = new u1(this, 1);

    public v1(y1 y1Var) {
        this.f98160a = y1Var;
    }

    public final n0 a() {
        n0 n0Var = this.f98161b;
        if (n0Var != null) {
            return n0Var;
        }
        throw new IllegalArgumentException("SubcomposeLayoutState is not attached to SubcomposeLayout");
    }
}

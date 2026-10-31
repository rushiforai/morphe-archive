package h6;

/* loaded from: classes2.dex */
public final class p implements y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ u f59411a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a7.e f59412b;

    public p(a7.e eVar, u uVar) {
        this.f59411a = uVar;
        this.f59412b = eVar;
    }

    @Override // h6.y
    public final void d(a0 a0Var, s sVar) throws NoSuchMethodException, SecurityException {
        if (sVar == s.ON_START) {
            this.f59411a.c(this);
            this.f59412b.c();
        }
    }
}

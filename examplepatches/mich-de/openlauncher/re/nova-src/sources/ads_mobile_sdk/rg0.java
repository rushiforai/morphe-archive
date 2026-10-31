package ads_mobile_sdk;

/* loaded from: classes.dex */
public final class rg0 implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public b.m5 f9168a;

    public static void a(b.m5 m5Var, b.m5 m5Var2) {
        rg0 rg0Var = (rg0) m5Var;
        if (rg0Var.f9168a != null) {
            throw new IllegalStateException();
        }
        rg0Var.f9168a = m5Var2;
    }

    @Override // b.m5
    public final Object get() {
        b.m5 m5Var = this.f9168a;
        if (m5Var != null) {
            return m5Var.get();
        }
        throw new IllegalStateException();
    }
}

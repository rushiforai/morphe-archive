package xk;

/* loaded from: classes3.dex */
public final class a1 extends m1 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b1 f95858d;

    public a1(b1 b1Var) {
        this.f95858d = b1Var;
    }

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj instanceof e2) {
            j2 j2Var = (j2) ((e2) obj);
            if (j2Var.a() <= 0) {
                return false;
            }
            if (((y2) this.f95858d).f96064e.a(j2Var.f95943a) == j2Var.a()) {
                return true;
            }
        }
        return false;
    }

    @Override // xk.m1
    public final Object get(int i5) {
        k2 k2Var = ((y2) this.f95858d).f96064e;
        vk.b0.e(i5, k2Var.f95954c);
        return new j2(k2Var, i5);
    }

    @Override // xk.q0
    public final boolean h() {
        this.f95858d.getClass();
        return false;
    }

    @Override // xk.d1, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.f95858d.hashCode();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        y2 y2Var = (y2) this.f95858d;
        x2 x2Var = y2Var.f96066g;
        if (x2Var == null) {
            x2Var = new x2(y2Var);
            y2Var.f96066g = x2Var;
        }
        return x2Var.size();
    }
}

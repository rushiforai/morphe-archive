package xk;

import java.util.Set;

/* loaded from: classes.dex */
public final class y2 extends b1 {

    /* renamed from: h, reason: collision with root package name */
    public static final y2 f96063h;

    /* renamed from: e, reason: collision with root package name */
    public final transient k2 f96064e;

    /* renamed from: f, reason: collision with root package name */
    public final transient int f96065f;

    /* renamed from: g, reason: collision with root package name */
    public transient x2 f96066g;

    static {
        k2 k2Var = new k2();
        k2Var.d(3);
        f96063h = new y2(k2Var);
    }

    public y2(k2 k2Var) {
        this.f96064e = k2Var;
        long jB = 0;
        for (int i5 = 0; i5 < k2Var.f95954c; i5++) {
            jB += k2Var.b(i5);
        }
        this.f96065f = ul.b.a0(jB);
    }

    @Override // xk.f2
    public final Set a0() {
        x2 x2Var = this.f96066g;
        if (x2Var != null) {
            return x2Var;
        }
        x2 x2Var2 = new x2(this);
        this.f96066g = x2Var2;
        return x2Var2;
    }

    @Override // xk.q0
    public final boolean h() {
        throw null;
    }

    @Override // xk.f2
    public final int r0(Object obj) {
        return this.f96064e.a(obj);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        return this.f96065f;
    }
}

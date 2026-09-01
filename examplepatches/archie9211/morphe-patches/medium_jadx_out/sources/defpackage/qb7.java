package defpackage;

import kotlin.NoWhenBranchMatchedException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qb7 extends p4d implements x45 {
    public int b;
    public final /* synthetic */ ub7 c;
    public final /* synthetic */ int d;
    public final /* synthetic */ int e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ float g;
    public final /* synthetic */ ac7 h;
    public final /* synthetic */ bc7 i;
    public final /* synthetic */ float j;
    public final /* synthetic */ boolean k;
    public final /* synthetic */ boolean l;
    public final /* synthetic */ zb7 m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qb7(ub7 ub7Var, int i, int i2, boolean z, float f, ac7 ac7Var, bc7 bc7Var, float f2, boolean z2, boolean z3, zb7 zb7Var, n92 n92Var) {
        super(1, n92Var);
        this.c = ub7Var;
        this.d = i;
        this.e = i2;
        this.f = z;
        this.g = f;
        this.h = ac7Var;
        this.i = bc7Var;
        this.j = f2;
        this.k = z2;
        this.l = z3;
        this.m = zb7Var;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        return new qb7(this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, n92Var);
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        return ((qb7) create((n92) obj)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        ib2 ib2Var;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        c1e c1eVar = c1e.a;
        ub7 ub7Var = this.c;
        try {
            if (i == 0) {
                br7.v(obj);
                ub7Var.h(this.d);
                k49 k49Var = ub7Var.c;
                int i2 = this.e;
                k49Var.setValue(Integer.valueOf(i2));
                ub7Var.d.setValue(Boolean.valueOf(this.f));
                k49 k49Var2 = ub7Var.f;
                float f = this.g;
                k49Var2.setValue(Float.valueOf(f));
                ub7Var.e.setValue(this.h);
                k49 k49Var3 = ub7Var.i;
                bc7 bc7Var = this.i;
                k49Var3.setValue(bc7Var);
                ub7Var.j(this.j);
                ub7Var.g.setValue(Boolean.valueOf(this.k));
                if (!this.l) {
                    ub7Var.l.setValue(Long.MIN_VALUE);
                }
                if (bc7Var == null) {
                    ub7Var.i(false);
                    return c1eVar;
                }
                if (Float.isInfinite(f)) {
                    ub7Var.j(((Number) ub7Var.m.getValue()).floatValue());
                    ub7Var.i(false);
                    ub7Var.h(i2);
                    return c1eVar;
                }
                ub7Var.i(true);
                int i3 = pb7.a[this.m.ordinal()];
                if (i3 == 1) {
                    ib2Var = kh8.b;
                } else {
                    if (i3 != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    ib2Var = zx3.a;
                }
                ob7 ob7Var = new ob7(this.m, bo.S(getContext()), this.e, this.d, ub7Var, null);
                this.b = 1;
                if (vx0.m0(ib2Var, ob7Var, this) == tb2Var) {
                    return tb2Var;
                }
            } else {
                if (i != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
            }
            bo.N(getContext());
            ub7Var.i(false);
            return c1eVar;
        } catch (Throwable th) {
            ub7Var.i(false);
            throw th;
        }
    }
}

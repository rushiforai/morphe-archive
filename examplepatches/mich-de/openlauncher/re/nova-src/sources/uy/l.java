package uy;

import kl.q0;

/* loaded from: classes.dex */
public class l extends j {

    /* renamed from: j, reason: collision with root package name */
    public final b f91720j;

    /* renamed from: k, reason: collision with root package name */
    public ya.v f91721k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f91722l;

    public l(String str, d0 d0Var) {
        super(str);
        this.f91722l = false;
        this.f91751c = n0.f91729a;
        this.f91720j = d0Var.g();
        this.f91757i = d0Var.v();
        this.f91721k = null;
    }

    @Override // uy.s
    public final o b(q0 q0Var) {
        return new k(this, q0Var);
    }

    @Override // uy.s
    public final ya.v c() {
        if (this.f91722l) {
            ya.v vVar = this.f91721k;
            return vVar == null ? new h() : vVar;
        }
        ya.v vVar2 = this.f91721k;
        if (vVar2 == null) {
            return super.c();
        }
        ya.v vVarC = super.c();
        vVar2.getClass();
        return new b0(2, vVar2, vVarC);
    }

    @Override // uy.j
    public boolean f() {
        return !(this instanceof m);
    }
}

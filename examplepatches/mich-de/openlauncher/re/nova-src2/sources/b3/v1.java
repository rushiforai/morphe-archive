package b3;

/* loaded from: classes.dex */
public final class v1 implements z2.q0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17382a;

    /* renamed from: b, reason: collision with root package name */
    public final z2.s f17383b;

    /* renamed from: c, reason: collision with root package name */
    public final Enum f17384c;

    /* renamed from: d, reason: collision with root package name */
    public final Enum f17385d;

    public /* synthetic */ v1(z2.s sVar, Enum r22, Enum r32, int i5) {
        this.f17382a = i5;
        this.f17383b = sVar;
        this.f17384c = r22;
        this.f17385d = r32;
    }

    @Override // z2.s
    public final int E(int i5) {
        switch (this.f17382a) {
        }
        return this.f17383b.E(i5);
    }

    @Override // z2.s
    public final int F(int i5) {
        switch (this.f17382a) {
        }
        return this.f17383b.F(i5);
    }

    @Override // z2.q0
    public final z2.i1 H(long j11) {
        switch (this.f17382a) {
            case 0:
                x1 x1Var = (x1) this.f17384c;
                y1 y1Var = (y1) this.f17385d;
                y1 y1Var2 = y1.f17410a;
                z2.s sVar = this.f17383b;
                if (y1Var == y1Var2) {
                    return new w1(x1Var == x1.f17400b ? sVar.F(y3.a.g(j11)) : sVar.E(y3.a.g(j11)), y3.a.c(j11) ? y3.a.g(j11) : 32767, 0);
                }
                return new w1(y3.a.d(j11) ? y3.a.h(j11) : 32767, x1Var == x1.f17400b ? sVar.b(y3.a.h(j11)) : sVar.t(y3.a.h(j11)), 0);
            default:
                z2.u uVar = (z2.u) this.f17384c;
                z2.v vVar = (z2.v) this.f17385d;
                z2.v vVar2 = z2.v.f98157a;
                z2.s sVar2 = this.f17383b;
                if (vVar == vVar2) {
                    return new w1(uVar == z2.u.f98150b ? sVar2.F(y3.a.g(j11)) : sVar2.E(y3.a.g(j11)), y3.a.c(j11) ? y3.a.g(j11) : 32767, 1);
                }
                return new w1(y3.a.d(j11) ? y3.a.h(j11) : 32767, uVar == z2.u.f98150b ? sVar2.b(y3.a.h(j11)) : sVar2.t(y3.a.h(j11)), 1);
        }
    }

    @Override // z2.s
    public final int b(int i5) {
        switch (this.f17382a) {
        }
        return this.f17383b.b(i5);
    }

    @Override // z2.s
    public final Object k() {
        switch (this.f17382a) {
        }
        return this.f17383b.k();
    }

    @Override // z2.s
    public final int t(int i5) {
        switch (this.f17382a) {
        }
        return this.f17383b.t(i5);
    }
}

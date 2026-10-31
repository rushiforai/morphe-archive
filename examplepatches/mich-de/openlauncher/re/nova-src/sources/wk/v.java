package wk;

/* loaded from: classes3.dex */
public final class v extends x {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f94575e;

    /* renamed from: f, reason: collision with root package name */
    public volatile long f94576f;

    /* renamed from: g, reason: collision with root package name */
    public h0 f94577g;

    /* renamed from: h, reason: collision with root package name */
    public h0 f94578h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v(Object obj, int i5, h0 h0Var, int i11) {
        super(obj, i5, h0Var);
        this.f94575e = i11;
    }

    @Override // wk.g, wk.h0
    public void a(h0 h0Var) {
        switch (this.f94575e) {
            case 0:
                this.f94577g = h0Var;
                break;
            default:
                super.a(h0Var);
                break;
        }
    }

    @Override // wk.g, wk.h0
    public h0 b() {
        switch (this.f94575e) {
            case 0:
                return this.f94578h;
            default:
                return super.b();
        }
    }

    @Override // wk.g, wk.h0
    public h0 c() {
        switch (this.f94575e) {
            case 1:
                return this.f94577g;
            default:
                return super.c();
        }
    }

    @Override // wk.g, wk.h0
    public h0 g() {
        switch (this.f94575e) {
            case 0:
                return this.f94577g;
            default:
                return super.g();
        }
    }

    @Override // wk.g, wk.h0
    public void h(h0 h0Var) {
        switch (this.f94575e) {
            case 0:
                this.f94578h = h0Var;
                break;
            default:
                super.h(h0Var);
                break;
        }
    }

    @Override // wk.g, wk.h0
    public h0 i() {
        switch (this.f94575e) {
            case 1:
                return this.f94578h;
            default:
                return super.i();
        }
    }

    @Override // wk.g, wk.h0
    public void k(h0 h0Var) {
        switch (this.f94575e) {
            case 1:
                this.f94578h = h0Var;
                break;
            default:
                super.k(h0Var);
                break;
        }
    }

    @Override // wk.g, wk.h0
    public void l(h0 h0Var) {
        switch (this.f94575e) {
            case 1:
                this.f94577g = h0Var;
                break;
            default:
                super.l(h0Var);
                break;
        }
    }

    @Override // wk.g, wk.h0
    public long n() {
        switch (this.f94575e) {
            case 1:
                return this.f94576f;
            default:
                return super.n();
        }
    }

    @Override // wk.g, wk.h0
    public void o(long j11) {
        switch (this.f94575e) {
            case 0:
                this.f94576f = j11;
                break;
            default:
                super.o(j11);
                break;
        }
    }

    @Override // wk.g, wk.h0
    public long q() {
        switch (this.f94575e) {
            case 0:
                return this.f94576f;
            default:
                return super.q();
        }
    }

    @Override // wk.g, wk.h0
    public void r(long j11) {
        switch (this.f94575e) {
            case 1:
                this.f94576f = j11;
                break;
            default:
                super.r(j11);
                break;
        }
    }
}

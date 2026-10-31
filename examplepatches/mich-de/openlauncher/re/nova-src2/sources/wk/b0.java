package wk;

import java.lang.ref.ReferenceQueue;

/* loaded from: classes3.dex */
public final class b0 extends d0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f94496d;

    /* renamed from: e, reason: collision with root package name */
    public volatile long f94497e;

    /* renamed from: f, reason: collision with root package name */
    public h0 f94498f;

    /* renamed from: g, reason: collision with root package name */
    public h0 f94499g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b0(ReferenceQueue referenceQueue, Object obj, int i5, h0 h0Var, int i11) {
        super(referenceQueue, obj, i5, h0Var);
        this.f94496d = i11;
    }

    @Override // wk.d0, wk.h0
    public void a(h0 h0Var) {
        switch (this.f94496d) {
            case 0:
                this.f94498f = h0Var;
                break;
            default:
                super.a(h0Var);
                break;
        }
    }

    @Override // wk.d0, wk.h0
    public h0 b() {
        switch (this.f94496d) {
            case 0:
                return this.f94499g;
            default:
                return super.b();
        }
    }

    @Override // wk.d0, wk.h0
    public h0 c() {
        switch (this.f94496d) {
            case 1:
                return this.f94498f;
            default:
                return super.c();
        }
    }

    @Override // wk.d0, wk.h0
    public h0 g() {
        switch (this.f94496d) {
            case 0:
                return this.f94498f;
            default:
                return super.g();
        }
    }

    @Override // wk.d0, wk.h0
    public void h(h0 h0Var) {
        switch (this.f94496d) {
            case 0:
                this.f94499g = h0Var;
                break;
            default:
                super.h(h0Var);
                break;
        }
    }

    @Override // wk.d0, wk.h0
    public h0 i() {
        switch (this.f94496d) {
            case 1:
                return this.f94499g;
            default:
                return super.i();
        }
    }

    @Override // wk.d0, wk.h0
    public void k(h0 h0Var) {
        switch (this.f94496d) {
            case 1:
                this.f94499g = h0Var;
                break;
            default:
                super.k(h0Var);
                break;
        }
    }

    @Override // wk.d0, wk.h0
    public void l(h0 h0Var) {
        switch (this.f94496d) {
            case 1:
                this.f94498f = h0Var;
                break;
            default:
                super.l(h0Var);
                break;
        }
    }

    @Override // wk.d0, wk.h0
    public long n() {
        switch (this.f94496d) {
            case 1:
                return this.f94497e;
            default:
                return super.n();
        }
    }

    @Override // wk.d0, wk.h0
    public void o(long j11) {
        switch (this.f94496d) {
            case 0:
                this.f94497e = j11;
                break;
            default:
                super.o(j11);
                break;
        }
    }

    @Override // wk.d0, wk.h0
    public long q() {
        switch (this.f94496d) {
            case 0:
                return this.f94497e;
            default:
                return super.q();
        }
    }

    @Override // wk.d0, wk.h0
    public void r(long j11) {
        switch (this.f94496d) {
            case 1:
                this.f94497e = j11;
                break;
            default:
                super.r(j11);
                break;
        }
    }
}

package wk;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;

/* loaded from: classes3.dex */
public class d0 extends WeakReference implements h0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f94512a;

    /* renamed from: b, reason: collision with root package name */
    public final h0 f94513b;

    /* renamed from: c, reason: collision with root package name */
    public volatile z f94514c;

    public d0(ReferenceQueue referenceQueue, Object obj, int i5, h0 h0Var) {
        super(obj, referenceQueue);
        this.f94514c = g0.f94519r;
        this.f94512a = i5;
        this.f94513b = h0Var;
    }

    public void a(h0 h0Var) {
        throw new UnsupportedOperationException();
    }

    public h0 b() {
        throw new UnsupportedOperationException();
    }

    public h0 c() {
        throw new UnsupportedOperationException();
    }

    @Override // wk.h0
    public final z d() {
        return this.f94514c;
    }

    public h0 g() {
        throw new UnsupportedOperationException();
    }

    @Override // wk.h0
    public final Object getKey() {
        return get();
    }

    public void h(h0 h0Var) {
        throw new UnsupportedOperationException();
    }

    public h0 i() {
        throw new UnsupportedOperationException();
    }

    @Override // wk.h0
    public final int j() {
        return this.f94512a;
    }

    public void k(h0 h0Var) {
        throw new UnsupportedOperationException();
    }

    public void l(h0 h0Var) {
        throw new UnsupportedOperationException();
    }

    @Override // wk.h0
    public final void m(z zVar) {
        this.f94514c = zVar;
    }

    public long n() {
        throw new UnsupportedOperationException();
    }

    public void o(long j11) {
        throw new UnsupportedOperationException();
    }

    @Override // wk.h0
    public final h0 p() {
        return this.f94513b;
    }

    public long q() {
        throw new UnsupportedOperationException();
    }

    public void r(long j11) {
        throw new UnsupportedOperationException();
    }
}

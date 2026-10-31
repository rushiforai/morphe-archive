package eb0;

import io.sentry.e3;
import java.util.concurrent.Executor;

/* loaded from: classes5.dex */
public final class n implements d {

    /* renamed from: a, reason: collision with root package name */
    public final Executor f52590a;

    /* renamed from: b, reason: collision with root package name */
    public final d f52591b;

    public n(Executor executor, d dVar) {
        this.f52590a = executor;
        this.f52591b = dVar;
    }

    @Override // eb0.d
    public final x80.h0 S() {
        return this.f52591b.S();
    }

    @Override // eb0.d
    public final void cancel() {
        this.f52591b.cancel();
    }

    @Override // eb0.d
    public final boolean p() {
        return this.f52591b.p();
    }

    @Override // eb0.d
    public final void s(g gVar) {
        this.f52591b.s(new e3(this, gVar, false, 11));
    }

    @Override // eb0.d
    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public final d m293clone() {
        return new n(this.f52590a, this.f52591b.m293clone());
    }
}

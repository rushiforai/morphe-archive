package nb0;

import rx.exceptions.MissingBackpressureException;

/* loaded from: classes5.dex */
public final class k extends l {

    /* renamed from: c, reason: collision with root package name */
    public boolean f78136c;

    public k(ib0.h hVar) {
        super(hVar);
    }

    @Override // nb0.l, ib0.e
    public final void c(Object obj) {
        if (this.f78136c) {
            return;
        }
        super.c(obj);
    }

    @Override // nb0.l
    public final void g() {
        onError(new MissingBackpressureException("create: could not emit value due to lack of requests"));
    }

    @Override // nb0.h, ib0.e
    public final void onCompleted() {
        if (this.f78136c) {
            return;
        }
        this.f78136c = true;
        super.onCompleted();
    }

    @Override // nb0.h, ib0.e
    public final void onError(Throwable th2) {
        if (this.f78136c) {
            ub0.a.a(th2);
        } else {
            this.f78136c = true;
            super.onError(th2);
        }
    }
}

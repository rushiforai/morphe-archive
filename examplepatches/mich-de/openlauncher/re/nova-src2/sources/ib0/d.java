package ib0;

import g90.k;
import nb0.r;
import rx.exceptions.OnErrorFailedException;

/* loaded from: classes.dex */
public class d {

    /* renamed from: a, reason: collision with root package name */
    public final b f61508a;

    public d(b bVar) {
        this.f61508a = bVar;
    }

    public static d b(b bVar) {
        ub0.d.f90783d.b().getClass();
        return new d(bVar);
    }

    public final i a(mb0.b bVar) {
        r rVar = new r(bVar);
        b bVar2 = this.f61508a;
        if (bVar2 == null) {
            throw new IllegalStateException("onSubscribe function can not be null.");
        }
        tb0.a aVar = new tb0.a(rVar);
        try {
            ub0.d.f90783d.b().getClass();
            bVar2.mo5b(aVar);
            ub0.d.f90783d.b().getClass();
            return aVar;
        } catch (Throwable th2) {
            k.g0(th2);
            if (aVar.a()) {
                ub0.a.a(ub0.a.b(th2));
            } else {
                try {
                    aVar.onError(ub0.a.b(th2));
                } catch (Throwable th3) {
                    k.g0(th3);
                    OnErrorFailedException onErrorFailedException = new OnErrorFailedException("Error occurred attempting to subscribe [" + th2.getMessage() + "] and then again while trying to pass to onError.", th3);
                    ub0.a.b(onErrorFailedException);
                    throw onErrorFailedException;
                }
            }
            return xb0.e.f95758a;
        }
    }

    public final void d(h hVar) {
        try {
            hVar.e();
            b bVar = this.f61508a;
            ub0.d.f90783d.b().getClass();
            bVar.mo5b(hVar);
            ub0.d.f90783d.b().getClass();
        } catch (Throwable th2) {
            k.g0(th2);
            try {
                hVar.onError(ub0.a.b(th2));
            } catch (Throwable th3) {
                k.g0(th3);
                OnErrorFailedException onErrorFailedException = new OnErrorFailedException("Error occurred attempting to subscribe [" + th2.getMessage() + "] and then again while trying to pass to onError.", th3);
                ub0.a.b(onErrorFailedException);
                throw onErrorFailedException;
            }
        }
    }
}

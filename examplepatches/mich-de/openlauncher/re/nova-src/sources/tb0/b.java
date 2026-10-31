package tb0;

import e4.d;
import g90.k;
import ib0.e;
import ib0.h;
import rx.exceptions.OnErrorThrowable;

/* loaded from: classes5.dex */
public final class b implements e {

    /* renamed from: a, reason: collision with root package name */
    public final e f88947a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f88948b;

    /* renamed from: c, reason: collision with root package name */
    public volatile boolean f88949c;

    /* renamed from: d, reason: collision with root package name */
    public d f88950d;

    public b(h hVar) {
        this.f88947a = hVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:67:0x002f, code lost:
    
        continue;
     */
    @Override // ib0.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(Object obj) {
        if (this.f88949c) {
            return;
        }
        synchronized (this) {
            try {
                if (this.f88949c) {
                    return;
                }
                if (this.f88948b) {
                    d dVar = this.f88950d;
                    if (dVar == null) {
                        dVar = new d();
                        this.f88950d = dVar;
                    }
                    if (obj == null) {
                        obj = nb0.d.f78105b;
                    }
                    dVar.a(obj);
                    return;
                }
                this.f88948b = true;
                try {
                    this.f88947a.c(obj);
                    while (true) {
                        synchronized (this) {
                            try {
                                d dVar2 = this.f88950d;
                                if (dVar2 == null) {
                                    this.f88948b = false;
                                    return;
                                }
                                this.f88950d = null;
                                for (Object obj2 : dVar2.f52149a) {
                                    if (obj2 == null) {
                                        break;
                                    }
                                    try {
                                        if (nb0.d.a(this.f88947a, obj2)) {
                                            this.f88949c = true;
                                            return;
                                        }
                                    } catch (Throwable th2) {
                                        this.f88949c = true;
                                        k.g0(th2);
                                        e eVar = this.f88947a;
                                        OnErrorThrowable.a(obj, th2);
                                        eVar.onError(th2);
                                        return;
                                    }
                                }
                            } finally {
                            }
                        }
                    }
                } catch (Throwable th3) {
                    this.f88949c = true;
                    k.h0(th3, this.f88947a, obj);
                }
            } finally {
            }
        }
    }

    @Override // ib0.e
    public final void onCompleted() {
        if (this.f88949c) {
            return;
        }
        synchronized (this) {
            try {
                if (this.f88949c) {
                    return;
                }
                this.f88949c = true;
                if (!this.f88948b) {
                    this.f88948b = true;
                    this.f88947a.onCompleted();
                    return;
                }
                d dVar = this.f88950d;
                if (dVar == null) {
                    dVar = new d();
                    this.f88950d = dVar;
                }
                dVar.a(nb0.d.f78104a);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // ib0.e
    public final void onError(Throwable th2) {
        k.g0(th2);
        if (this.f88949c) {
            return;
        }
        synchronized (this) {
            try {
                if (this.f88949c) {
                    return;
                }
                this.f88949c = true;
                if (!this.f88948b) {
                    this.f88948b = true;
                    this.f88947a.onError(th2);
                    return;
                }
                d dVar = this.f88950d;
                if (dVar == null) {
                    dVar = new d();
                    this.f88950d = dVar;
                }
                dVar.a(new nb0.c(th2));
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }
}

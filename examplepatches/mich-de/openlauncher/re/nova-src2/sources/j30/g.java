package j30;

import bh.k;
import fl.l;

/* loaded from: classes4.dex */
public final class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final f f68886a;

    /* renamed from: b, reason: collision with root package name */
    public final a f68887b;

    /* renamed from: c, reason: collision with root package name */
    public e f68888c;

    /* renamed from: d, reason: collision with root package name */
    public k f68889d;

    /* renamed from: e, reason: collision with root package name */
    public volatile boolean f68890e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f68891f;

    /* renamed from: g, reason: collision with root package name */
    public Object f68892g;

    /* renamed from: h, reason: collision with root package name */
    public int f68893h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ l f68894i;

    public g(l lVar, f fVar, a aVar) {
        this.f68894i = lVar;
        this.f68886a = fVar;
        this.f68887b = aVar;
    }

    public final synchronized void a() {
        try {
            if (this.f68890e) {
                return;
            }
            this.f68890e = true;
            k kVar = this.f68889d;
            if (kVar != null) {
                synchronized (kVar) {
                    this.f68889d.notifyAll();
                }
            }
            e eVar = this.f68888c;
            if (eVar != null) {
                eVar.onCancel();
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized Object b() {
        while (!this.f68891f) {
            try {
                wait();
            } catch (Exception e3) {
                mc0.d.f76206a.p(e3, "ignore exception", new Object[0]);
            }
        }
        return this.f68892g;
    }

    public final synchronized void c(e eVar) {
        e eVar2;
        this.f68888c = eVar;
        if (this.f68890e && (eVar2 = this.f68888c) != null) {
            eVar2.onCancel();
        }
    }

    public final boolean d(int i5) {
        int i11 = this.f68893h;
        l lVar = this.f68894i;
        k kVar = i11 == 1 ? (k) lVar.f55376d : i11 == 2 ? (k) lVar.f55374b : null;
        if (kVar != null) {
            synchronized (kVar) {
                kVar.f17909a++;
                kVar.notifyAll();
            }
        }
        this.f68893h = 0;
        l lVar2 = this.f68894i;
        k kVar2 = i5 == 1 ? (k) lVar2.f55376d : i5 == 2 ? (k) lVar2.f55374b : null;
        if (kVar2 == null) {
            return true;
        }
        while (true) {
            synchronized (this) {
                try {
                    if (this.f68890e) {
                        this.f68889d = null;
                        return false;
                    }
                    this.f68889d = kVar2;
                    synchronized (kVar2) {
                        int i12 = kVar2.f17909a;
                        if (i12 > 0) {
                            kVar2.f17909a = i12 - 1;
                            synchronized (this) {
                                this.f68889d = null;
                            }
                            this.f68893h = i5;
                            return true;
                        }
                        try {
                            kVar2.wait();
                        } catch (InterruptedException unused) {
                        }
                    }
                } finally {
                }
            }
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        Object objA;
        if (d(1)) {
            try {
                objA = this.f68886a.a(this);
            } catch (Throwable th2) {
                mc0.d.f76206a.p(th2, "Exception in running a job", new Object[0]);
            }
        } else {
            objA = null;
        }
        synchronized (this) {
            d(0);
            this.f68892g = objA;
            this.f68891f = true;
            notifyAll();
        }
        a aVar = this.f68887b;
        if (aVar != null) {
            aVar.b(this);
        }
    }
}

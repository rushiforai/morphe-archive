package rk;

import kk.l;

/* loaded from: classes3.dex */
public final class f extends d {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f86019b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f86020c;

    public /* synthetic */ f(Object obj, int i5) {
        this.f86019b = i5;
        this.f86020c = obj;
    }

    @Override // rk.d
    public final void a() {
        switch (this.f86019b) {
            case 0:
                synchronized (((g) this.f86020c).f86026f) {
                    try {
                        if (((g) this.f86020c).f86031k.get() > 0 && ((g) this.f86020c).f86031k.decrementAndGet() > 0) {
                            ((g) this.f86020c).f86022b.h("Leaving the connection open for other ongoing calls.", new Object[0]);
                            return;
                        }
                        g gVar = (g) this.f86020c;
                        if (gVar.f86033m != null) {
                            gVar.f86022b.h("Unbind from service.", new Object[0]);
                            g gVar2 = (g) this.f86020c;
                            gVar2.f86021a.unbindService(gVar2.f86032l);
                            g gVar3 = (g) this.f86020c;
                            gVar3.f86027g = false;
                            gVar3.f86033m = null;
                            gVar3.f86032l = null;
                        }
                        ((g) this.f86020c).c();
                        return;
                    } finally {
                    }
                }
            default:
                g gVar4 = (g) ((l) this.f86020c).f71542b;
                gVar4.f86022b.h("unlinkToDeath", new Object[0]);
                gVar4.f86033m.asBinder().unlinkToDeath(gVar4.f86030j, 0);
                gVar4.f86033m = null;
                gVar4.f86027g = false;
                return;
        }
    }
}

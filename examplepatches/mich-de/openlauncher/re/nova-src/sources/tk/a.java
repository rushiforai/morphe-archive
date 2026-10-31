package tk;

/* loaded from: classes3.dex */
public final class a extends t {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f89398b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f89399c;

    public /* synthetic */ a(Object obj, int i5) {
        this.f89398b = i5;
        this.f89399c = obj;
    }

    @Override // tk.t
    public final void b() {
        switch (this.f89398b) {
            case 0:
                b bVar = (b) ((kk.l) this.f89399c).f71542b;
                bVar.f89401b.b("unlinkToDeath", new Object[0]);
                bVar.n.asBinder().unlinkToDeath(bVar.f89410k, 0);
                bVar.n = null;
                bVar.f89406g = false;
                return;
            default:
                synchronized (((b) this.f89399c).f89405f) {
                    try {
                        if (((b) this.f89399c).f89411l.get() > 0 && ((b) this.f89399c).f89411l.decrementAndGet() > 0) {
                            ((b) this.f89399c).f89401b.b("Leaving the connection open for other ongoing calls.", new Object[0]);
                            return;
                        }
                        b bVar2 = (b) this.f89399c;
                        if (bVar2.n != null) {
                            bVar2.f89401b.b("Unbind from service.", new Object[0]);
                            b bVar3 = (b) this.f89399c;
                            bVar3.f89400a.unbindService(bVar3.f89412m);
                            b bVar4 = (b) this.f89399c;
                            bVar4.f89406g = false;
                            bVar4.n = null;
                            bVar4.f89412m = null;
                        }
                        ((b) this.f89399c).d();
                        return;
                    } finally {
                    }
                }
        }
    }
}

package kk;

/* loaded from: classes3.dex */
public final class j extends h {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f71537b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f71538c;

    public /* synthetic */ j(Object obj, int i5) {
        this.f71537b = i5;
        this.f71538c = obj;
    }

    @Override // kk.h
    public final void a() {
        switch (this.f71537b) {
            case 0:
                synchronized (((m) this.f71538c).f71548f) {
                    try {
                        if (((m) this.f71538c).f71553k.get() > 0 && ((m) this.f71538c).f71553k.decrementAndGet() > 0) {
                            ((m) this.f71538c).f71544b.i("Leaving the connection open for other ongoing calls.", new Object[0]);
                            return;
                        }
                        m mVar = (m) this.f71538c;
                        if (mVar.f71555m != null) {
                            mVar.f71544b.i("Unbind from service.", new Object[0]);
                            m mVar2 = (m) this.f71538c;
                            mVar2.f71543a.unbindService(mVar2.f71554l);
                            m mVar3 = (m) this.f71538c;
                            mVar3.f71549g = false;
                            mVar3.f71555m = null;
                            mVar3.f71554l = null;
                        }
                        ((m) this.f71538c).d();
                        return;
                    } finally {
                    }
                }
            default:
                m mVar4 = (m) ((l) this.f71538c).f71542b;
                mVar4.f71544b.i("unlinkToDeath", new Object[0]);
                mVar4.f71555m.asBinder().unlinkToDeath(mVar4.f71552j, 0);
                mVar4.f71555m = null;
                mVar4.f71549g = false;
                return;
        }
    }
}

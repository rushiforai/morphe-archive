package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kgf extends kif {
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    public /* synthetic */ kgf(int i, Object obj) {
        this.b = i;
        this.c = obj;
    }

    @Override // defpackage.kif
    public final void b() {
        switch (this.b) {
            case 0:
                mgf mgfVar = (mgf) ((lgf) this.c).b;
                mgfVar.b.b("unlinkToDeath", new Object[0]);
                ((dif) mgfVar.n).e.unlinkToDeath(mgfVar.k, 0);
                mgfVar.n = null;
                mgfVar.g = false;
                return;
            default:
                synchronized (((mgf) this.c).f) {
                    try {
                        if (((mgf) this.c).l.get() > 0 && ((mgf) this.c).l.decrementAndGet() > 0) {
                            ((mgf) this.c).b.b("Leaving the connection open for other ongoing calls.", new Object[0]);
                            return;
                        }
                        mgf mgfVar2 = (mgf) this.c;
                        if (mgfVar2.n != null) {
                            mgfVar2.b.b("Unbind from service.", new Object[0]);
                            mgf mgfVar3 = (mgf) this.c;
                            mgfVar3.a.unbindService(mgfVar3.m);
                            mgfVar2 = (mgf) this.c;
                            mgfVar2.g = false;
                            mgfVar2.n = null;
                            mgfVar2.m = null;
                        }
                        mgfVar2.d();
                        return;
                    } finally {
                    }
                }
        }
    }
}

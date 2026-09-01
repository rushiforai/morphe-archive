package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hfg extends aag {
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    public /* synthetic */ hfg(int i, Object obj) {
        this.b = i;
        this.c = obj;
    }

    @Override // defpackage.aag
    public final void a() {
        switch (this.b) {
            case 0:
                synchronized (((bmg) this.c).f) {
                    try {
                        if (((bmg) this.c).k.get() > 0 && ((bmg) this.c).k.decrementAndGet() > 0) {
                            ((bmg) this.c).b.h("Leaving the connection open for other ongoing calls.", new Object[0]);
                            return;
                        }
                        bmg bmgVar = (bmg) this.c;
                        if (bmgVar.m != null) {
                            bmgVar.b.h("Unbind from service.", new Object[0]);
                            bmg bmgVar2 = (bmg) this.c;
                            bmgVar2.a.unbindService(bmgVar2.l);
                            bmgVar = (bmg) this.c;
                            bmgVar.g = false;
                            bmgVar.m = null;
                            bmgVar.l = null;
                        }
                        bmgVar.c();
                        return;
                    } finally {
                    }
                }
            default:
                bmg bmgVar3 = (bmg) ((lgf) this.c).b;
                bmgVar3.b.h("unlinkToDeath", new Object[0]);
                ((e0g) bmgVar3.m).e.unlinkToDeath(bmgVar3.j, 0);
                bmgVar3.m = null;
                bmgVar3.g = false;
                return;
        }
    }
}

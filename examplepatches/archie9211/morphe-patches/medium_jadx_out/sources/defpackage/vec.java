package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vec extends b2 {
    public Object c;
    public Object d;
    public g78 e;
    public g78 f;
    public xyb g;
    public final zzb h;
    public final o19 i;

    public vec() {
        super(5);
        this.h = new zzb(4, this);
        h9b h9bVar = new h9b(12, this);
        uic.b(uic.a);
        synchronized (uic.c) {
            uic.h = bu1.R0(uic.h, h9bVar);
        }
        this.i = new o19(7, h9bVar);
    }

    @Override // defpackage.b2
    public final void j0(xyb xybVar) {
        this.d = null;
        this.f = null;
    }

    @Override // defpackage.b2
    public final void k0() {
        synchronized (this.b) {
            try {
                this.c = this.d;
                if (this.f == null) {
                    this.e = null;
                } else {
                    g78 g78Var = this.e;
                    if (g78Var == null) {
                        g78 g78Var2 = iqb.a;
                        g78Var = new g78();
                        this.e = g78Var;
                    }
                    this.e = this.f;
                    this.f = g78Var;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.b2
    public final void l0() {
        this.i.b();
        this.d = null;
        this.f = null;
        synchronized (this.b) {
            this.g = null;
            this.c = null;
            this.e = null;
        }
    }

    @Override // defpackage.b2
    public final x45 r0(xyb xybVar) {
        xyb xybVar2 = this.g;
        if (xybVar2 != null && !xybVar2.equals(xybVar)) {
            xx9.b("Requested a SingleSubscriptionSnapshotFlowManager to manage multiple subscriptions");
        }
        this.g = xybVar;
        return this.h;
    }

    @Override // defpackage.b2
    public final void s0(wj1 wj1Var) {
        this.g = null;
        this.d = null;
        this.f = null;
        k0();
    }
}

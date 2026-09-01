package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ic7 implements upc {
    public final vx1 a = new vx1();
    public final k49 b = qo7.u(null);
    public final k49 c = qo7.u(null);
    public final j83 d;
    public final j83 e;

    public ic7() {
        bjc.b(new hc7(this, 2));
        this.d = bjc.b(new hc7(this, 0));
        bjc.b(new hc7(this, 1));
        this.e = bjc.b(new hc7(this, 3));
    }

    public final synchronized void c(Throwable th) {
        if (((Boolean) this.d.getValue()).booleanValue()) {
            return;
        }
        this.c.setValue(th);
        this.a.i0(th);
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return (bc7) this.b.getValue();
    }
}
